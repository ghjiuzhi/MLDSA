# PQC_PRJ_20251027 NTT 仿真波形分析与 Bank 写入/读出顺序理解指南

## 1. 背景与目标

你希望让 `PQC_PRJ_20251027` 的 NTT（KEM 模式）在 **写入 bank** 和 **读出 bank** 的顺序上，与 `ML_KAD_NTT_vvv` 里 KEM 对应的 COE 初始化的写入/读出顺序保持一致。

为此，第一步需要彻底搞清楚 `PQC_PRJ_20251027` 当前 NTT 模块的 bank 写入和读出机制。

---

## 2. 两个项目的架构差异

### ML_KAD_NTT_vvv（参考基线）
- `top_NTT.v` 是**自包含的顶层**，内部直接例化 4 个 `bank64_0/1/2/3`（Vivado Block RAM IP），数据由 COE 文件预初始化
- Testbench (`tb_top_NTT.v`) 直接驱动 `enable` / `KAD_Mode` / `Multi_Mode`
- **没有** `KAD_NTT_Ctrl` / `mem_read` / `mem_write`，因为数据已在 COE 中，不走 AXI Stream
- Bank 的**初始内容由 COE 文件决定**（例如 `KEM_Bank_group_0.coe` → bank0）

### PQC_PRJ_20251027（当前工程）
- 有完整的 AXI Stream 接口：`KAD_NTT_Ctrl` → `mem_read` → `top_NTT` → `mem_write`
- `top_NTT.v` **不再自己例化 BRAM**，而是通过端口信号连到 `KAD_NTT_Ctrl.v` 中统一例化的 4 个 BRAM
- **写入 Bank**：由 `KAD_NTT_mem_read.v` 从 AXI Stream 接收数据后写入
- **读出 Bank**：由 `KAD_NTT_mem_write.v` 从 BRAM 读出后打包到 AXI Stream 输出
- BRAM 端口在 `KAD_NTT_Ctrl.v` 中通过 MUX 在 read/compute/write 三阶段间切换

---

## 3. 数据流三阶段详解

整个 NTT 运算分三个阶段，由 `KAD_NTT_Ctrl.v` 状态机控制：

```
阶段1: read_working  → mem_read 写数据到 BRAM (AXI → Bank)
阶段2: compu_working → top_NTT 执行 NTT 蝶形计算 (Bank ↔ ALU)
阶段3: write_working → mem_write 从 BRAM 读数据出 (Bank → AXI)
```

---

## 4. 阶段1：写入 Bank（mem_read）—— 你需要观测的信号

### 4.1 核心逻辑（NTT 模式，`Multi_Mode=1`）

[KAD_NTT_mem_read.v](file:///e:/Project/MLDSA/PQC_PRJ_20251027/PQC_HW_ACC_IP/rtl/KAD_NTT/rtl/KAD_NTT_mem_read.v) 的 NTT 写入 bank 顺序是：

| 状态 | counter 范围 | 写入的 Bank |
|------|-------------|------------|
| S1   | 0~62 (每拍+2) | **bank0** (porta 和 portb) |
| S2   | 64~126      | **bank2** |
| S3   | 128~190     | **bank1** |
| S4   | 192~254     | **bank3** |

> [!IMPORTANT]
> 注意写入顺序是 **bank0 → bank2 → bank1 → bank3**，不是 0→1→2→3！

### 4.2 地址生成

```verilog
counter 每拍 +2（每拍消耗一个 64-bit AXI word，含 2 个系数）
rev_counter = bit_reverse(counter)  // 8-bit 位翻转
bram_id   = rev_counter[1:0]       // 不过实际没用，因为用状态机分段
bram_addr = rev_counter[7:2]       // 6-bit 地址

porta: bram_addr
portb: bram_addr + 32
```

### 4.3 在 Vivado 仿真中应观测的信号

```
dut/u_KAD_NTT_mem_read/CS              -- 状态机（判断当前写哪个 bank）
dut/u_KAD_NTT_mem_read/counter          -- 主计数器
dut/u_KAD_NTT_mem_read/rev_counter      -- 位翻转后的计数器
dut/u_KAD_NTT_mem_read/bram_addr        -- 当前写入 BRAM 地址

dut/u_KAD_NTT_mem_read/coef_ena_bram0   -- bank0 porta 使能
dut/u_KAD_NTT_mem_read/coef_addra_bram0 -- bank0 porta 地址
dut/u_KAD_NTT_mem_read/coef_dina_bram0  -- bank0 porta 数据
dut/u_KAD_NTT_mem_read/coef_enb_bram0   -- bank0 portb 使能
dut/u_KAD_NTT_mem_read/coef_addrb_bram0 -- bank0 portb 地址
dut/u_KAD_NTT_mem_read/coef_dinb_bram0  -- bank0 portb 数据

（bank1/2/3 类似，把 bram0 改成 bram1/2/3）

dut/u_KAD_NTT_mem_read/data_1           -- 当前周期写入的系数1（来自 AXI 高32位）
dut/u_KAD_NTT_mem_read/data_2           -- 当前周期写入的系数2（来自 AXI 低32位）
dut/u_KAD_NTT_mem_read/rd_en            -- 有效数据拍标志
dut/u_KAD_NTT_mem_read/module_done      -- 写入完成标志
```

---

## 5. 阶段2：Compute（top_NTT）—— 蝶形计算期间的 Bank 交互

### 5.1 核心信号

在 compute 阶段，`top_NTT` 通过 `Addr_Gen` 生成地址、`ALU` 做蝶形运算、`rom_tw` 提供 twiddle 因子。

```
dut/u_top_NTT/enable                    -- 计算使能
dut/u_top_NTT/inst_address/rd_addr      -- BRAM 读地址
dut/u_top_NTT/inst_address/wr0_addr     -- bank0 写地址
dut/u_top_NTT/inst_address/wr1_addr     -- bank1 写地址
dut/u_top_NTT/inst_address/wr2_addr     -- bank2 写地址
dut/u_top_NTT/inst_address/wr3_addr     -- bank3 写地址
dut/u_top_NTT/inst_address/switch       -- 最后一级蝶形标志
dut/u_top_NTT/inst_address/rd_done      -- 读地址生成完成

dut/u_top_NTT/ALU_in0 ~ ALU_in3        -- ALU 输入
dut/u_top_NTT/ALU_out0 ~ ALU_out3      -- ALU 输出
dut/u_top_NTT/bank0_in ~ bank3_in      -- 经 switch 映射后写入 bank 的数据
dut/u_top_NTT/bank0_out ~ bank3_out    -- 从 bank 读出的数据

dut/u_top_NTT/KAD_bank0_switch ~ KAD_bank3_switch  -- 最后一级 switch 控制
dut/u_top_NTT/done_flag                 -- 计算完成
```

### 5.2 KEM NTT 最后一级 ALU→Bank 映射

在最后一级蝶形（`switch=1`）时：
- `bank0_in ← ALU_out0`
- `bank1_in ← ALU_out2`  ← **注意：PQC_PRJ 是 out2，ML_KAD_NTT_vvv 是 out1**
- `bank2_in ← ALU_out1`  ← **注意：PQC_PRJ 是 out1，ML_KAD_NTT_vvv 是 out2**
- `bank3_in ← ALU_out3`

> [!WARNING]
> 这是两个项目之间的**关键差异之一**！PQC_PRJ 中 bank1 和 bank2 的最后一级映射做了交换（`out2→bank1`, `out1→bank2`），而 ML_KAD_NTT_vvv 是 `out1→bank1`, `out2→bank2`。这会直接影响 compute 结束后 bank 中的数据分布。

### 5.3 另一个差异：rd_done drain

PQC_PRJ 在 `KAD_bank*_switch` 中加了 `& ~rd_done_delay[N]`（fixdrainsw3 修复），而 ML_KAD_NTT_vvv 没有。

---

## 6. 阶段3：读出 Bank（mem_write）—— 你需要观测的信号

### 6.1 NTT 模式的读出顺序

[KAD_NTT_mem_write.v](file:///e:/Project/MLDSA/PQC_PRJ_20251027/PQC_HW_ACC_IP/rtl/KAD_NTT/rtl/KAD_NTT_mem_write.v) 的 NTT 读出 bank 顺序是：

| 状态 | 读取的 Bank |
|------|------------|
| S1   | bank0/bank2（交替，由 `cnt_2` 控制） |
| S2   | bank1/bank3（交替） |
| S3   | bank1/bank3（交替） |
| S4   | bank0/bank2（交替） |

### 6.2 应观测的信号

```
dut/u_KAD_NTT_mem_write/CS              -- 状态机
dut/u_KAD_NTT_mem_write/cnt_30          -- 主计数器
dut/u_KAD_NTT_mem_write/cnt_31          -- 辅助计数器
dut/u_KAD_NTT_mem_write/cnt_2           -- bank 交替选择（0=第一个 bank, 1=第二个 bank）

dut/u_KAD_NTT_mem_write/coef_ena_bram0 ~ bram3  -- 各 bank 读使能
dut/u_KAD_NTT_mem_write/coef_addra_bram0 ~ bram3  -- 读地址
dut/u_KAD_NTT_mem_write/coef_douta_bram0 ~ bram3  -- 读出数据

dut/u_KAD_NTT_mem_write/data1           -- 组包前的系数1
dut/u_KAD_NTT_mem_write/data2           -- 组包前的系数2
dut/u_KAD_NTT_mem_write/module_done_ntt -- NTT 写出完成

Ws_tvalid / Ws_tdata                    -- AXI 输出
```

---

## 7. 与 ML_KAD_NTT_vvv 的 COE 写入/读出对比

### 7.1 ML_KAD_NTT_vvv 的 Bank 初始内容

ML_KAD_NTT_vvv 里 KEM NTT 用的初始化文件是：
- `KEM_Bank_group_0.coe` → bank0（64 个值，例如：1,33,17,49,9,41,...）
- `KEM_Bank_group_1.coe` → bank1
- `KEM_Bank_group_2.coe` → bank2
- `KEM_Bank_group_3.coe` → bank3

这些 COE 直接将 256 个系数按照**特定的 bit-reverse 映射**分到了 4 个 bank 中，每个 bank 64 个地址。

### 7.2 PQC_PRJ 的 mem_read 需要等效地把 AXI 输入映射到同样的 bank 分布

目前 PQC_PRJ 的 `mem_read` 是通过 `bit_reverse(counter)` 来确定地址的，但 bank 的分配是用状态机硬编码的（S1→bank0, S2→bank2, S3→bank1, S4→bank3）。

> [!IMPORTANT]
> **核心验证任务**：你需要确认 `mem_read` 在完成 256 个系数写入后，4 个 bank 中的数据分布是否与 ML_KAD_NTT_vvv 的 COE 初始化一致。

---

## 8. 一步步仿真操作指南

### Step 1：打开 Vivado 工程

1. 打开 `E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.xpr`
2. 确认仿真顶层为 `tb_KAD_NTT_Ctrl_compare`

### Step 2：设置仿真参数

1. 确保 testbench 中 `KAD_Mode = 1`（KEM 模式）、`Multi_Mode = 1`（NTT 模式）
2. 确认输入数据是 1~256 的顺序输入（或与 ML_KAD_NTT_vvv COE 对应的输入）

### Step 3：运行仿真并添加关键信号

按以下顺序添加波形信号组：

#### 3a. 全局控制信号
```
clk, aresetn, start
dut/read_working, dut/compu_working, dut/write_working
dut/read_start, dut/read_done
dut/compute_start, dut/compute_done
dut/write_start, dut/write_done
```

#### 3b. 阶段1 - 输入写Bank信号
```
dut/u_KAD_NTT_mem_read/CS
dut/u_KAD_NTT_mem_read/counter
dut/u_KAD_NTT_mem_read/rev_counter
dut/u_KAD_NTT_mem_read/bram_addr
dut/u_KAD_NTT_mem_read/data_1
dut/u_KAD_NTT_mem_read/data_2
dut/u_KAD_NTT_mem_read/rd_en

-- bank0 写入
dut/u_KAD_NTT_mem_read/coef_ena_bram0
dut/u_KAD_NTT_mem_read/coef_addra_bram0
dut/u_KAD_NTT_mem_read/coef_dina_bram0
dut/u_KAD_NTT_mem_read/coef_addrb_bram0
dut/u_KAD_NTT_mem_read/coef_dinb_bram0

-- bank1/2/3 同理
```

#### 3c. 阶段2 - Compute 信号
```
dut/u_top_NTT/enable
dut/u_top_NTT/inst_address/switch
dut/u_top_NTT/inst_address/rd_addr
dut/u_top_NTT/inst_address/rd_done
dut/u_top_NTT/ALU_in0 ~ ALU_in3
dut/u_top_NTT/ALU_out0 ~ ALU_out3
dut/u_top_NTT/bank0_in ~ bank3_in
dut/u_top_NTT/KAD_bank0_switch ~ KAD_bank3_switch
```

#### 3d. 阶段3 - 输出读Bank信号
```
dut/u_KAD_NTT_mem_write/CS
dut/u_KAD_NTT_mem_write/cnt_30
dut/u_KAD_NTT_mem_write/cnt_2
dut/u_KAD_NTT_mem_write/data1
dut/u_KAD_NTT_mem_write/data2

-- bank 使能和地址
dut/u_KAD_NTT_mem_write/coef_ena_bram0 ~ bram3
dut/u_KAD_NTT_mem_write/coef_addra_bram0 ~ bram3
```

### Step 4：分析波形

1. **找到 `read_working` 的起止时间**，在这个窗口内观察 mem_read 的 bank 写入模式
2. **记录每个 counter 值对应写入了哪个 bank 的哪个地址**
3. **找到 `compu_working` 的起止时间**，观察 NTT 蝶形计算
4. **找到 `write_working` 的起止时间**，观察 mem_write 的 bank 读出模式
5. 将写入模式与 ML_KAD_NTT_vvv 的 COE 文件做逐项对比

### Step 5：对比 ML_KAD_NTT_vvv

1. 也打开 `E:\Project\MLDSA\ML_KAD_NTT_vvv\project_1\project_1.xpr`
2. 用 `tb_top_NTT` 仿真，`KAD_Mode=1`, `Multi_Mode=1`
3. 观测 `inst_bank0~3` 的读写地址和数据
4. 对比两边 compute 阶段结束后 bank 中的数据分布

---

## 9. 已知的关键差异汇总

| 特性 | ML_KAD_NTT_vvv | PQC_PRJ_20251027 |
|------|----------------|------------------|
| Bank 数据来源 | COE 文件预加载 | AXI Stream → mem_read 写入 |
| top_NTT 是否自带 BRAM | ✅ 是 | ❌ 否，BRAM 在 Ctrl 中 |
| 最后一级 bank1_in | `ALU_out1` | `ALU_out2` |
| 最后一级 bank2_in | `ALU_out2` | `ALU_out1` |
| KAD_bank_switch drain | 无 | 有 (`& ~rd_done_delay`) |
| mem_read 写入顺序 | N/A (COE) | bank0→bank2→bank1→bank3 |
| mem_write 读出顺序 | N/A | S1:b0/b2 → S2:b1/b3 → S3:b1/b3 → S4:b0/b2 |

---

## 10. 下一步行动建议

> [!IMPORTANT]
> **在改代码之前**，你需要先通过仿真验证以下两点：
> 1. `mem_read` 阶段结束后，4 个 bank 中的数据是否与 ML_KAD_NTT_vvv 的 COE 一致
> 2. `compute` 阶段结束后，4 个 bank 中的数据是否与 ML_KAD_NTT_vvv compute 完成后一致

如果阶段1就不一致，那问题出在 `mem_read`；如果阶段1一致但阶段2不一致，那问题可能在 `top_NTT`（bank1/bank2 swap 或 twiddle ROM）。

## Open Questions

> [!IMPORTANT]
> 1. 你现在能正常打开 Vivado 并运行仿真吗？需要我帮你确认 testbench 配置是否正确？
> 2. 你是想让两个项目的 **compute（top_NTT 蝶形计算内部）** 的 bank 读写也完全一致，还是只需要 **mem_read 写入** 和 **mem_write 读出** 的顺序一致？
> 3. ML_KAD_NTT_vvv 的 KEM NTT 仿真结果你已经确认是正确的（golden 基线）吗？
