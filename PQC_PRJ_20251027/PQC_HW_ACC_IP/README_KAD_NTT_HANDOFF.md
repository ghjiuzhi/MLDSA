# README - KAD_NTT 接手说明

## 0. 文档目的

这份文档用于让新的线程/新的工程师快速接手 `PQC_PRJ_20251027` 中 `KAD_NTT` 的排查与修复工作。

当前项目 **不是完全跑不起来**，而是：

- 输入装载问题已经定位并修过
- 输出读回问题已经定位并修过一部分
- `compute tail drain` 问题已经定位并修过一部分
- 目前剩余主问题已经收敛到：
  **`twiddle ROM 初始化来源 / compute 链数值本身错误`**

也就是说，后续重点 **不是再从头查 AXIS 或 bank 基础结构**，而是：

1. 重建一个可信基线
2. 确认 `rom_tw_INTT_NTT` 的正确初始化内容
3. 用这个基线继续把最终数值对齐 golden

---

## 1. 项目目标

目标模块是 `PQC_PRJ_20251027` 中的 `KAD_NTT` 硬件模块。

它要完成的事情是：

- 接收 256 个输入系数
- 写入 4 个 bank RAM
- 做一次 `NTT`
- 再把 256 个结果输出

最终验收标准本来是：

- 输出顺序和 golden 一致
- 每个值也一致

但在调试过程中还额外区分了两个层次：

1. `顺序错误但 multiset 一致`
2. `数值本身就错`

现在已经确认：

- 当前结果 **不只是顺序错**
- 而是 **multiset 也不一致**
- 所以剩余问题是 `compute/twiddle` 级别的数值错误

---

## 2. 工作目录与关键路径

工程根目录：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP
```

关键 RTL 文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_Ctrl.v
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_read.v
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_write.v
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\top_NTT.v
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\Addr_Gen.v
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\ALU.v
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\rom_tw.v
```

关键 testbench：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sim_1\imports\sim\tb_KAD_NTT_Ctrl_compare.v
```

关键 IP / init 文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.gen\sources_1\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.xml
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.gen\sources_1\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.mif
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.ip_user_files\mem_init_files\rom_tw_INTT_NTT.mif
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.sim\sim_1\behav\xsim\rom_tw_INTT_NTT.mif
```

归档目录：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.sim\sim_1\behav\xsim\archived_txt_20260423
```

最重要的归档索引：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.sim\sim_1\behav\xsim\archived_txt_20260423\MANIFEST.txt
```

---

## 3. 模块结构总览

### 3.1 关系图

```text
tb_KAD_NTT_Ctrl_compare
        |
        | AXIS in
        v
+-------------------+
|   KAD_NTT_Ctrl    |
+-------------------+
   |       |      |
   |       |      +-------------------+
   |       |                          |
   v       v                          v
mem_read  top_NTT                  mem_write
   \        |                         /
    \       |                        /
     \      |                       /
      +-----+----------------------+
            |
         4-bank BRAM
```

### 3.2 各模块职责

- `KAD_NTT_Ctrl.v`
  - 顶层控制器
  - 切 `read / compute / write`
  - 复用 BRAM 端口
  - 管 AXIS 输入输出握手

- `KAD_NTT_mem_read.v`
  - 把 `Rm_tdata` 拆分后写入 4 个 bank

- `top_NTT.v`
  - 计算核心
  - 调 `Addr_Gen / ALU / rom_tw`

- `Addr_Gen.v`
  - 生成 `rd_addr / wr_addr / wr_en / switch`

- `ALU.v`
  - 做蝶形 / 乘法路径

- `rom_tw.v`
  - 生成 twiddle ROM 地址
  - 输出 `tw1/tw2/tw3`

- `KAD_NTT_mem_write.v`
  - 从 4-bank 读回并打包输出

- `tb_KAD_NTT_Ctrl_compare.v`
  - 喂数据
  - dump `read_banks / compute_banks / out / debug_trace`
  - 比对 golden

---

## 4. 当前已确认有效的修复

这部分很重要。
后续新线程不要轻易回滚它们，除非先归档再验证。

### 4.1 修复 1：输入握手 `Rm_tready`

文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_Ctrl.v
```

当前保留修复：

```verilog
assign Rm_tready = read_working & ~read_start & ~read_done;
```

#### 为什么改

原来 `Rm_tready` 没有驱动，导致：

- testbench 第一拍 `{2,1}` 发出后卡住
- `Rm_tvalid` 仍有效
- `mem_read` 反复把同一拍写进 bank
- `read_banks` 变成前半区全 `2`、后半区全 `1`

#### 修复后结果

- 输入 bank 装载恢复正常
- 不再是 `{2,1}` 灌满

关联归档：

- `orig_no_ready_*`
- `fixready_v1_*`
- `fixready_v2_*`
- `waitsrc_*`

### 4.2 修复 2：testbench 首拍等待 `dut.read_working`

文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sim_1\imports\sim\tb_KAD_NTT_Ctrl_compare.v
```

当前保留修复思路：

- 只有在 `dut.read_working` 后才开始送第一拍

#### 为什么改

只补 `Rm_tready` 还不够稳。
DUT 在 `read_start` 边界上对“提前挂 valid 的首拍”接收不稳定。

#### 修复后结果

- `read_banks` 变成输入 1..256 的合理重排
- 输入侧可认为已经修好

关联归档：

- `waitsrc_*`

### 4.3 修复 3：`KAD_NTT_mem_write` 的 `S2/S3/S4`

文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_write.v
```

当前保留的有效修复：

- `S2` 读 `bank1/bank3`
- `S3` 地址和数据源统一对齐到 `bank1/bank3`
- `S4` 读 `bank0/bank2`

#### 为什么改

原来 `mem_write` 存在真实结构性错误：

- 前半程长期只读 `bank0/bank2`
- `S3` 出现“地址切换到一组 bank，但数据还从另一组取”的错位
- 尾段也有重复消费错误 bank 的问题

#### 修复后结果

- 输出重复块显著减少
- 说明这部分是“真实 bug”，不是噪声

关联归档：

- `fixwriteS2_1_*`
- `fixwriteS3_1_*`
- `fixwriteS4_1_*`

### 4.4 修复 4：`top_NTT` 尾段 drain - `fixdrainsw3`

文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\top_NTT.v
```

当前保留修复：

```verilog
assign KAD_bank0_switch = KAD_Mode ? (switch_delay[12] & ~rd_done_delay[0]) : switch;
assign KAD_bank1_switch = KAD_Mode ? (switch_delay[13] & ~rd_done_delay[1]) : switch_d1;
assign KAD_bank2_switch = KAD_Mode ? (switch_delay[14] & ~rd_done_delay[2]) : switch_d2;
assign KAD_bank3_switch = KAD_Mode ? (switch_delay[15] & ~rd_done_delay[3]) : switch_d3;
```

#### 为什么改

原来 `rd_done` 之后 `switch` 还继续参与 bank 重映射，尾段排空会继续污染结果。

#### 修复后结果

- 输出 16 点重复块数量显著下降
- 从“很多对重复块”收敛到“只剩一对重复块”

关联归档：

- `tailbase1_*`
- `fixdrainsw1_*`
- `fixdrainsw2_*`
- `fixdrainsw3_*`
- `fixdrainsw4_*`
- `fixdrainsw5_*`

保留理由：

- `fixdrainsw3` 是当时最平衡、最稳定的一版

### 4.5 修复 5：控制器 BRAM0 B 口 mux 修复

文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_Ctrl.v
```

#### 为什么改

后来发现 controller 在 bank0 B-port 复用上存在错误绑定，影响 `out_vs_compute` 对齐。

#### 修复后结果

- `out_vs_compute` 的 missing/extra 总数从 `38/38` 降到 `10/10`
- 这是一个真实有效的结构性修复

关联归档：

- `fixctrlb0b1_1_*`

---

## 5. 当前已经确认无效 / 不应保留的修改方向

后续不要重复踩坑，除非有新证据。

### 5.1 纯 `switch` 单拍对齐类实验

这些大多已证伪：

- `fixswopen1_*`
- `fixswitchsync1_*`
- `fixswpair1_*`
- `fixaluoutsw1_*`
- `fixalusin1_*`
- `fixalubranchdelay1_*`

结论：

- 最后残余问题 **不是简单某个 switch tap 偏 1 拍**

### 5.2 纯 `S3/S4 rd_addr` 组包改法

这些大多会直接劣化或打成 `X`：

- `fixs4addr1_*`
- `fixs3addr1_*`
- `fixs4linear1_*`

结论：

- `KAD` 的 `S3/S4` 地址生成规则不是随便换序就能修好的
- 强行线性化或 swap 会直接破坏结构

### 5.3 mem_write 预取 / flat 顺序实验

这些已验证无效：

- `fixwriteprefetch1_*`
- `fixwriteprefetch2_*`
- `fixwriteprefetch3_*`
- `fixwriteflat1_*`

结论：

- 当前剩余问题 **不在简单输出平铺或预取策略**

### 5.4 旧工程 20251003 的最后一级 bank 映射直接照搬

实验：

- `fixoldmap1_*`

结论：

- 会严重退化
- 说明 `1027 KAD` 不是简单复制 `1003` 最后一级映射就能修好

---

## 6. 目前最重要的新结论

### 6.1 不是“顺序错”，而是“数值本身错”

已经明确验证过：

- 当前输出和 golden 比，**multiset 不一致**
- 所以不是“每个数都对，只是位置乱了”
- 而是 `compute/twiddle` 本身把值算坏了

这是后续工作最重要的判断前提。

### 6.2 剩余主问题已经从“bank/顺序”收敛到“twiddle/compute”

证据链大概是：

1. 输入装载修好
2. 输出读写结构 bug 修好一部分
3. tail drain 修好一部分
4. `compute_banks` 里原来有明显的 `period16_same`
5. 更换 `rom_tw_INTT_NTT.mif` 后，`compute_banks` 的周期重复会立刻变化甚至消失
6. 这证明剩余主问题和 `rom_tw` 初始化强相关

换句话说：

> 后续重点不是继续盲改 `mem_write` 或 `AXIS`，而是 `rom_tw_INTT_NTT` 初始化来源 / twiddle 链。

---

## 7. 当前对 `rom_tw` 的判断

### 7.1 最可疑点

文件：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.gen\sources_1\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.xml
```

其中 `Coe_File` 指向了：

```text
../../../../rtl/KAD_NTT/coe/DSA/DSA_Bank_group_0.coe
```

这是非常可疑的。

因为：

- 文件名更像 bank 初始化，不像 twiddle 表
- ROM 配置是 69-bit 宽
- 但 KAD 模式只取低 36 bit 里的 `tw1/tw2/tw3`
- 从功能上看，这个初始化来源不像最终正确源

### 7.2 已做过的 MIF 实验

关键归档：

- `fixmif1_*`
- `fixmif2_*`
- `fixmif3_*`

#### 已知结论

- `fixmif1` 和 `fixmif3` 在当前 `KAD+NTT` 下表现一样
- 原因是 `rom_tw.v` 当前地址范围只用到前 128 项
- 而 `20251027 KEM_mont_row.coe` 和某些参考表在前 128 项是一样的，差异在 128 以后
- 所以 line 128 以后差异对当前 NTT 模式没影响

#### 更重要的结论

一旦替换 `mif`：

- `compute_banks` 的 `period16_same` 可以消失
- `out_equal16pairs` 可以降到 0
- 但最终仍然 `256/256 mismatch`

这说明：

- `ROM 内容确实强相关`
- 但目前替进去的表不是最终正确解

---

## 8. 当前代码状态判断

### 可以认为应当保留的

- `Rm_tready` 修复
- testbench 等 `dut.read_working` 发首拍
- `mem_write` 的 `S2/S3/S4`
- `top_NTT` 的 `fixdrainsw3`
- controller 的 `bank0 B-port mux` 修复

### 不能认为是最终可交付的

- 当前三份 `rom_tw_INTT_NTT.mif`
- 当前 `rom_tw_INTT_NTT.xml` 的初始化来源配置

### 需要警惕的

- 工作区之前做过很多实验，可能混过若干临时痕迹
- 真正要继续深入，建议先重建“干净可信基线”

---

## 9. 建议的新线程接手顺序

### Step 1：先读归档，不要马上改代码

先看：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.sim\sim_1\behav\xsim\archived_txt_20260423\MANIFEST.txt
```

重点关注这些前缀：

- `waitsrc_*`
- `fixwriteS2_1_*`
- `fixwriteS3_1_*`
- `fixwriteS4_1_*`
- `tailbase1_*`
- `fixdrainsw3_*`
- `fixctrlb0b1_1_*`
- `fixmif1_*`
- `fixmif3_*`
- `rebase3_probe_clean_*`

这几组基本能串起当前整个定位历史。

### Step 2：先确认“当前源码到底是不是可信基线”

建议先核查当前代码是否至少包含以下 5 个修复：

1. `KAD_NTT_Ctrl.v`
   - `Rm_tready`
2. `tb_KAD_NTT_Ctrl_compare.v`
   - `wait for dut.read_working`
3. `KAD_NTT_mem_write.v`
   - `S2/S3/S4` bank 修复
4. `top_NTT.v`
   - `fixdrainsw3`
5. `KAD_NTT_Ctrl.v`
   - `bank0 B-port mux` 修复

如果当前源码和这 5 条不一致，不要直接继续做新实验。

### Step 3：重建一个“干净可重复”的 baseline

建议做法：

- 以当前可信 RTL 为基础
- 清掉仿真缓存
- 重新跑一轮
- 把新的 `read_banks / compute_banks / out / debug_trace` 存成新前缀归档

重点不是立刻修 bug，而是确认：

- 当前代码 + 当前 MIF 到底能重复出哪一组结果

### Step 4：重点转向 `rom_tw_INTT_NTT`

新线程最值得做的事不是继续乱改 `ALU/Addr_Gen`，而是回答这几个问题：

1. `rom_tw_INTT_NTT.xml` 为什么指向 `DSA_Bank_group_0.coe`
2. `1027` 版本真正应该使用哪一份 twiddle init
3. `KEM_mont_row.coe`
4. `KEM_mont_row_2.coe`
5. `tools\NTT_ML-KEM\...` 里的文件到底哪个才是当前 `KAD NTT` 应用的正确源
6. 69-bit ROM 的实际 bit packing 是什么
7. 为什么 `rom_tw.v` 在 KAD 模式只取低 36 bit

---

## 10. 推荐查看顺序

### 第一批

- [KAD_NTT_Ctrl.v](E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_Ctrl.v)
- [KAD_NTT_mem_write.v](E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_write.v)
- [top_NTT.v](E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\top_NTT.v)
- [tb_KAD_NTT_Ctrl_compare.v](E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sim_1\imports\sim\tb_KAD_NTT_Ctrl_compare.v)

### 第二批

- [rom_tw.v](E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\rom_tw.v)
- [rom_tw_INTT_NTT.xml](E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.gen\sources_1\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.xml)
- 三份 `rom_tw_INTT_NTT.mif`

### 第三批

- `archived_txt_20260423\MANIFEST.txt`
- `rebase3_probe_clean_summary.txt`
- `fixmif1_summary.txt`
- `fixmif3_summary.txt`

---

## 11. 新实验必须遵守的规则

为了避免后面再把线索搞乱，新线程建议遵守以下规则：

1. 每做一次实验，必须保存：
   - `read_banks`
   - `compute_banks`
   - `out`
   - `debug_trace`
   - 需要时保存 `xvlog/xelab/xsim log`
2. 每次实验必须使用新前缀，例如：
   - `newfix1_*`
   - `romprobe2_*`
3. 每次都更新：
   - [MANIFEST.txt](E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.sim\sim_1\behav\xsim\archived_txt_20260423\MANIFEST.txt)
4. 不要覆盖旧的 `txt`
5. 不要把失败实验直接留在代码里
6. 每次实验后要明确回答：
   - 是改善了 `read_banks`
   - 还是改善了 `compute_banks`
   - 还是只是改变了 `out` 排布
   - multiset 是否更接近 golden

---

## 12. 当前最简结论

如果新线程只记住一件事，请记这句：

> 当前 `KAD_NTT` 不是“完全没跑起来”，而是已经修掉了输入握手、输出 bank 读写和 compute 尾段 drain 三层明显错误；剩下的主问题已经收敛到 `rom_tw_INTT_NTT` 初始化来源 / twiddle 数值链，本质上是 `compute` 把值算坏了，而不是单纯乱序。

---

## 13. 建议新线程的第一条任务

建议新线程上来第一件事就做这个：

1. 先确认当前源码是否仍保留 5 条有效修复
2. 重新跑一轮 baseline
3. 重新归档成一个新前缀
4. 然后只围绕 `rom_tw_INTT_NTT.xml + mif + coe` 做检查
5. 暂时不要再去大改 `ALU` / `Addr_Gen` / `mem_write`
