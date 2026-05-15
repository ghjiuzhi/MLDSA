# PQC_PRJ_20251027 KEM NTT bank/order 修复复现说明

本文档用于把 `PQC_PRJ_20251027` 的 KEM NTT 部分从原始问题状态复现到当前成功状态。目标读者可以不了解本工程，只要有本仓库、Vivado 2023.2 和本文档，就能手动复现：

1. `PQC_PRJ_20251027` 的 NTT 输入写 bank 顺序与 `ML_KAD_NTT_vvv` 的 KEM COE 对齐。
2. compute 前 bank 与 ML 初始化 COE 对齐。
3. compute 后 bank 与 `ML_KAD_NTT_vvv` KEM NTT final bank snapshot 对齐。
4. `Ws_tdata` 最终输出的 256 个系数，与 PQClean C golden 在“不关心顺序，只看 multiset/count”的意义下完全一致：没有重复、没有遗漏。

最终成功证据：

```text
E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\iter10_select_d2\iter10_final_summary.csv
```

最终 summary 内容应为：

```csv
"check","result","matches","total","evidence"
"input_write_vs_ml_kem_coe","PASS","256","256","..."
"precompute_banks_vs_ml_init_coe","PASS","256","256","..."
"compute_banks_vs_ml_snapshot_sync_read","PASS","256","256","..."
"output_multiset_vs_pqclean_unsigned_ignore_order","PASS","256","256","..."
"output_multiset_vs_ml_snapshot_ignore_order","PASS","256","256","..."
```

## 0. 路径和角色

本次只允许修改 `PQC_PRJ_20251027`。`PQC_PRJ_20051027_1` 是原始版参考，不应修改。

关键路径：

```text
工作根目录:
E:\Project\MLDSA

修改目标工程:
E:\Project\MLDSA\PQC_PRJ_20251027

原始参考工程，不修改:
E:\Project\MLDSA\PQC_PRJ_20051027_1

ML KEM NTT 参考工程:
E:\Project\MLDSA\ML_KAD_NTT_vvv

Vivado:
C:\Programs\Xilinx2023\Vivado\2023.2\bin

最终 artifact:
E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\iter10_select_d2
```

重要 golden：

```text
PQClean C NTT golden:
E:\Project\MLDSA\tools\golden_pqclean_ntt_1_256.txt

1003 golden:
E:\Project\MLDSA\PQC_PRJ_20251003\PQC_HW_ACC_IP\PQC_HW_ACC_IP.sim\sim_1\behav\xsim\golden_1003_ntt_1_256.txt
```

## 1. 最终修改文件清单

核心 RTL/IP 修改：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_read.v
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\top_NTT.v
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_write.v
PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sources_1\ip\bank64_KAD_NTT\bank64_KAD_NTT.xci
PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.gen\sources_1\ip\bank64_KAD_NTT\sim\bank64_KAD_NTT.v
PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sources_1\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.xci
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.xci
```

仿真 probe 修改：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sim_1\imports\sim\tb_KAD_NTT_Ctrl_compare.v
ML_KAD_NTT_vvv\project_1\scr\sim\tb_top_NTT.v
ML_KAD_NTT_vvv\project_1\project_1.srcs\sources_1\imports\scr\sim\tb_top_NTT.v
```

说明：`ML_KAD_NTT_vvv` 只加 probe，不改设计逻辑。

## 2. 原始问题现象

最初观察到三个层次的问题：

1. `PQC_PRJ_20051027_1` 原始版仿真卡住或输入握手不前进，bank 被 `{2,1}` 反复写入，不能作为正确 KEM NTT 流水线。
2. `PQC_PRJ_20251027` 修改版可以前进，但输入写 bank 的上下半区曾经反了：AXI 输入 `{2,1}` 中高 32 位和低 32 位写入低/高地址的关系与 ML KEM COE 不一致。
3. 后来 bank 内容与 ML 对齐后，最终 `Ws_tdata` 输出仍出现重复/遗漏。也就是说，compute 后 bank 正确不自动保证输出正确；还必须验证 `KAD_NTT_mem_write` 从 bank 读出的 256 个系数是否每个只读一次。

这也是本文档最重要的结论：**“compute bank 256/256 PASS”证明的是 bank 内容，不等价于“输出 256 个数无重复遗漏”。最终必须增加 output multiset 检查。**

## 3. Probe 和输出文件含义

### 3.1 PQC 侧 probe

在：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sim_1\imports\sim\tb_KAD_NTT_Ctrl_compare.v
```

加入以下类别的输出。

输入写 bank CSV：

```text
pqc1027_ntt_bank_write_map.csv
```

列：

```csv
time,bank,port,addr,data,counter,counter_1,rev_counter,CS,NS,Rm_tdata
```

作用：记录 NTT 输入阶段每个原始系数写到了哪个 bank、哪个 port、哪个 addr。

输出读 bank CSV：

```text
pqc1027_ntt_bank_readout_map.csv
```

列：

```csv
time,CS,cnt_128_ntt,cnt_30,cnt_31,cnt_2,Ws_valid,Ws_data,data1,data2
```

作用：记录 `KAD_NTT_mem_write` 输出阶段每拍的状态计数器和 `Ws_tdata`。

bank snapshot / output txt：

```text
dut_ntt_1027_read_banks.txt
dut_ntt_1027_s4_entry_banks.txt
dut_ntt_1027_compute_banks.txt
dut_ntt_1027_out.txt
dut_ntt_debug_trace.txt
```

其中最关键的是：

```text
dut_ntt_1027_compute_banks.txt
dut_ntt_1027_out.txt
```

`dut_ntt_1027_compute_banks.txt` 用来证明 compute 后 bank 内容与 ML final snapshot 相同。

`dut_ntt_1027_out.txt` 用来证明输出的 256 个系数与 PQClean C golden 作为 multiset 相同。

### 3.2 ML 侧 probe

在：

```text
E:\Project\MLDSA\ML_KAD_NTT_vvv\project_1\scr\sim\tb_top_NTT.v
```

加入 probe，生成：

```text
ml_kem_ntt_bank_read_trace.csv
ml_kem_ntt_bank_writeback_trace.csv
ml_kem_ntt_final_bank_snapshot.csv
```

最终使用的是：

```text
E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\ml_kad_ntt_vvv_kem_probe_snapshot4_sync_read\ml_kem_ntt_final_bank_snapshot.csv
```

注意：ML bank snapshot 必须用同步读方式抓取。之前如果直接在同一拍 force address 后立刻读取，可能抓到旧值或竞态值。最终方法是在 done 后 force `enable=0, Multi_Mode=1`，每个地址执行：

```verilog
@(negedge clk);
force rd_en = 1;
force rd_addr = dump_addr;
@(posedge clk);
#1;
// dump bank0_out..bank3_out
```

## 4. 手动仿真复现步骤

推荐使用 manual xsim，因为直接从 Vivado GUI/project launch 有时会因为增量仿真或 project 状态卡住。

manual 工作目录：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\manual_xsim_iter1
```

该目录需要包含：

```text
tb_KAD_NTT_Ctrl_compare_vlog_abs.prj
tb_KAD_NTT_Ctrl_compare_vhdl_abs.prj
run_all.tcl
glbl.v
```

`run_all.tcl` 内容最简单可为：

```tcl
run all
quit
```

在 PowerShell 中执行：

```powershell
cd E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\manual_xsim_iter1

& 'C:\Programs\Xilinx2023\Vivado\2023.2\bin\xvlog.bat' --relax -prj tb_KAD_NTT_Ctrl_compare_vlog_abs.prj -log xvlog_manual_iter10_select_d2.log

& 'C:\Programs\Xilinx2023\Vivado\2023.2\bin\xvhdl.bat' --relax -prj tb_KAD_NTT_Ctrl_compare_vhdl_abs.prj -log xvhdl_manual_iter10_select_d2.log

& 'C:\Programs\Xilinx2023\Vivado\2023.2\bin\xelab.bat' --debug typical --relax --mt 2 -L xil_defaultlib -L blk_mem_gen_v8_4_7 -L xbip_utils_v3_0_11 -L mult_gen_v12_0_19 -L c_reg_fd_v12_0_7 -L c_addsub_v12_0_18 -L c_gate_bit_v12_0_7 -L c_mux_bit_v12_0_7 -L c_shift_ram_v12_0_15 -L xpm -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_KAD_NTT_Ctrl_compare_behav xil_defaultlib.tb_KAD_NTT_Ctrl_compare xil_defaultlib.glbl -log elaborate_manual_iter10_select_d2.log

& 'C:\Programs\Xilinx2023\Vivado\2023.2\bin\xsim.bat' tb_KAD_NTT_Ctrl_compare_behav -tclbatch run_all.tcl -log simulate_manual_iter10_select_d2.log
```

成功仿真末尾应看到类似：

```text
Read-bank snapshot written to dut_ntt_1027_read_banks.txt
S4-entry bank snapshot written to dut_ntt_1027_s4_entry_banks.txt
Compute-bank snapshot written to dut_ntt_1027_compute_banks.txt
DUT output written to dut_ntt_1027_out.txt
Simulation finished
$finish called at time : 5695 ns
```

仿真中可能出现如下 warning：

```text
WARNING: file golden_1003_ntt_1_256.txt could not be opened
WARNING: file golden_pqclean_ntt_1_256.txt could not be opened
```

这不影响本文档的外部 PowerShell 比较。原因是 testbench 内部相对路径没有加载到 golden；我们后续使用绝对路径重新比较。

## 5. 归档和比较脚本

仿真输出位于：

```text
E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\manual_xsim_iter1
```

可复制到：

```text
E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\iter10_select_d2
```

最小复制命令：

```powershell
$work='E:\Project\MLDSA\PQC_PRJ_20251027\PQC_HW_ACC_IP\manual_xsim_iter1'
$dst='E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\iter10_select_d2'
New-Item -ItemType Directory -Force -Path $dst | Out-Null

foreach($f in @(
  'pqc1027_ntt_bank_write_map.csv',
  'pqc1027_ntt_bank_readout_map.csv',
  'dut_ntt_1027_compute_banks.txt',
  'dut_ntt_1027_read_banks.txt',
  'dut_ntt_1027_s4_entry_banks.txt',
  'dut_ntt_1027_out.txt',
  'dut_ntt_debug_trace.txt',
  'xvlog_manual_iter10_select_d2.log',
  'xvhdl_manual_iter10_select_d2.log',
  'elaborate_manual_iter10_select_d2.log',
  'simulate_manual_iter10_select_d2.log'
)){
  $p=Join-Path $work $f
  if(Test-Path -LiteralPath $p){
    Copy-Item -LiteralPath $p -Destination (Join-Path $dst $f) -Force
  }
}
```

### 5.1 multiset 比较逻辑

PQClean C golden 是 signed 表示。PQC RTL 输出是 unsigned mod `q=3329`。比较时必须先把两边都转成 `0..3328`：

```powershell
function Uns($x){
  $q=3329
  (($x % $q)+$q)%$q
}
```

然后不看顺序，统计每个值出现次数。若所有值出现次数相同，则 PASS；否则输出 delta 表。

比较脚本核心：

```powershell
function Read-Nums($path) {
  Get-Content -LiteralPath $path | ForEach-Object {
    $s=$_.Trim()
    if($s -ne '' -and $s -notmatch '^bank'){
      foreach($tok in ($s -split '[,\s]+')){
        if($tok -match '^-?\d+$'){ [int64]$tok }
      }
    }
  }
}

function Uns($x){
  $q=3329
  (($x % $q)+$q)%$q
}

function BagCompare($name,$cand,$ref,$outCsv,$summaryCsv){
  $aa=@($cand | ForEach-Object { Uns $_ })
  $bb=@($ref  | ForEach-Object { Uns $_ })
  $keys=@($aa+$bb | Sort-Object -Unique)
  $delta=foreach($k in $keys){
    $ca=@($aa | Where-Object {$_ -eq $k}).Count
    $cb=@($bb | Where-Object {$_ -eq $k}).Count
    if($ca -ne $cb){
      [pscustomobject]@{
        value=$k
        candidate_count=$ca
        reference_count=$cb
        delta=($ca-$cb)
      }
    }
  }
  $delta | Export-Csv -NoTypeInformation -Encoding UTF8 -LiteralPath $outCsv
  [pscustomobject]@{
    comparison=$name
    status=if(@($delta).Count -eq 0){'PASS'}else{'FAIL'}
    candidate_count=$aa.Count
    reference_count=$bb.Count
    unequal_value_rows=@($delta).Count
    delta_csv=$outCsv
  } | Export-Csv -NoTypeInformation -Encoding UTF8 -LiteralPath $summaryCsv
}
```

运行：

```powershell
$dst='E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\iter10_select_d2'
$outVals=@(Read-Nums (Join-Path $dst 'dut_ntt_1027_out.txt'))
$pqVals=@(Read-Nums 'E:\Project\MLDSA\tools\golden_pqclean_ntt_1_256.txt')

BagCompare `
  'iter10_raw1027_out_vs_pqclean_unsigned_ignore_order' `
  $outVals `
  $pqVals `
  (Join-Path $dst 'iter10_bag_delta_raw1027_out_vs_pqclean_unsigned.csv') `
  (Join-Path $dst 'iter10_bag_summary_raw1027_out_vs_pqclean_unsigned.csv')
```

成功结果：

```csv
"comparison","status","candidate_count","reference_count","unequal_value_rows","delta_csv"
"iter10_raw1027_out_vs_pqclean_unsigned_ignore_order","PASS","256","256","0","..."
```

## 6. 每次修改的思考脉络

### 6.1 第一步：先证明输入写 bank 是否对齐

问题：AXI 输入 `{2,1}` 写到 bank 时，低地址/高地址与 ML KEM COE 不一致。

判断方法：

1. 从 `pqc1027_ntt_bank_write_map.csv` 提取 data=1..256 的 bank/port/addr。
2. 与 `ML_KAD_NTT_vvv` 的 KEM COE bank layout 比较。

发现：

```text
bank 顺序接近正确，但 data_1/data_2 对 porta/portb 的写入半区反了。
```

修改：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_read.v
```

在 NTT 输入写入分支中交换 `data_1` 和 `data_2` 到 porta/portb 的关系。典型最终形态：

```verilog
coef_dina_bram2 <= data_2;
coef_dinb_bram2 <= data_1;
coef_dina_bram1 <= data_2;
coef_dinb_bram1 <= data_1;
coef_dina_bram3 <= data_2;
coef_dinb_bram3 <= data_1;
```

注意：INTT 分支不要跟着改。最终文件中 INTT 相关位置仍保持：

```verilog
coef_dina_bram0 <= data_1;
coef_dinb_bram0 <= data_2;
```

判断成功：

```text
iter5_compare_pqc_write_vs_ml_kem_coe_summary.csv
PASS 256/256
```

### 6.2 第二步：修正 top_NTT 最后一级 bank 写回映射

问题：输入写 bank 对齐后，compute 后 bank 仍不能与 ML final snapshot 完全对齐。

思路：`ML_KAD_NTT_vvv` 的 top_NTT 对 KEM 最后一级有特殊 bank switch 延迟与 ALU 输出映射。`PQC_PRJ_20251027` 需要复刻该行为。

修改：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\top_NTT.v
```

关键最终形态：

```verilog
assign KAD_bank0_switch = KAD_Mode ? switch_delay[12] : switch;
assign KAD_bank1_switch = KAD_Mode ? switch_delay[13] : switch_d1;
assign KAD_bank2_switch = KAD_Mode ? switch_delay[14] : switch_d2;
assign KAD_bank3_switch = KAD_Mode ? switch_delay[15] : switch_d3;
```

并保持 KEM switch 时：

```verilog
bank1_in <= ALU_out1;
bank2_in <= ALU_out2;
```

普通轮转 case 保持：

```verilog
2'b00: bankX_in <= ALU_out0;
2'b01: bankX_in <= ALU_out1;
2'b10: bankX_in <= ALU_out2;
2'b11: bankX_in <= ALU_out3;
```

判断方法：

```text
dut_ntt_1027_compute_banks.txt
vs
ml_kem_ntt_final_bank_snapshot.csv
```

### 6.3 第三步：修正 bank64_KAD_NTT IP 仿真延迟

问题：即使 top_NTT 逻辑看起来匹配，compute bank 仍可能出现大量错位。原因不是数学公式，而是 BRAM 行为：PQC 工程的 bank64 IP output register / read mode 与 ML reference 使用方式不一致，导致仿真读写延迟多一拍或读写同址行为不一致。

修改：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sources_1\ip\bank64_KAD_NTT\bank64_KAD_NTT.xci
```

关键配置：

```text
Operating_Mode_B = READ_FIRST
Register_PortA_Output_of_Memory_Primitives = false
Register_PortB_Output_of_Memory_Primitives = false
C_HAS_MEM_OUTPUT_REGS_A = 0
C_HAS_MEM_OUTPUT_REGS_B = 0
```

同时修改仿真模型：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.gen\sources_1\ip\bank64_KAD_NTT\sim\bank64_KAD_NTT.v
```

关键最终形态：

```verilog
.C_WRITE_MODE_B("READ_FIRST"),
.C_HAS_MEM_OUTPUT_REGS_A(0),
.C_HAS_MEM_OUTPUT_REGS_B(0),
```

判断成功：

```text
iter5_compare_compute_banks_vs_ml_snapshot4_sync_read_summary.csv
PASS 256/256
```

### 6.4 第四步：确认 twiddle ROM 使用 KEM COE

问题：如果 `rom_tw_INTT_NTT` 仍指向非 KEM COE，compute bank 可能局部或整体与 ML KEM 不一致。

修改：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\PQC_HW_ACC_IP.srcs\sources_1\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.xci
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\ip\rom_tw_INTT_NTT\rom_tw_INTT_NTT.xci
```

关键最终形态之一：

```json
"Coe_File": [ { "value": "../../../../rtl/KAD_NTT/coe/KEM/KEM_mont_row_2.coe", ... } ]
```

同时把 ML KEM 的 `rom_tw_INTT_NTT.mif` 复制到 `PQC_PRJ_20251027\PQC_HW_ACC_IP` 下所有相关 `rom_tw_INTT_NTT.mif` 副本，避免仿真模型仍加载旧 MIF。

判断成功仍是 compute bank：

```text
compute_banks_vs_ml_snapshot_sync_read
PASS 256/256
```

### 6.5 第五步：发现 compute bank PASS 不代表输出 PASS

到 iter5 时，已有：

```text
input_write_vs_ml_kem_coe              PASS 256/256
precompute_banks_vs_ml_init_coe        PASS 256/256
compute_banks_vs_ml_snapshot_sync_read PASS 256/256
readout_sequence_vs_dut_out            PASS 256/256
```

但进一步与 PQClean C golden 做 multiset 比较时发现：

```text
FAIL
缺失: 287, 544, 742, 3105
重复: 795, 868 各多 2 次
```

这说明：

```text
bank 内容正确；
但是 KAD_NTT_mem_write 从 bank 读出到 Ws_tdata 的过程发生了重复读/漏读。
```

定位方法：

1. 在 `dut_ntt_1027_compute_banks.txt` 中查找异常值位置。
2. 在 `dut_ntt_1027_out.txt` 中查找异常值出现位置。
3. 对照 `pqc1027_ntt_bank_readout_map.csv` 的 `CS/cnt_128_ntt/cnt_30/cnt_31/cnt_2`。

当时定位到：

```text
缺失值在:
287  -> bank3 addr62
544  -> bank1 addr62
742  -> bank1 addr30
3105 -> bank3 addr30

重复值在:
795 -> bank1 addr0
868 -> bank3 addr0
```

结论：`KAD_NTT_mem_write` 的 NTT readout state 边界读 bank 调度错位，重复读了 bank1/bank3 addr0，同时漏了 bank1/bank3 addr30/62。

### 6.6 第六步：重写 KEM NTT 输出读 bank 调度

修改：

```text
PQC_PRJ_20251027\PQC_HW_ACC_IP\rtl\KAD_NTT\rtl\KAD_NTT_mem_write.v
```

思路：只对 `KAD_Mode && Multi_Mode` 走新的输出读 bank 调度；非 KEM 和 INTT 保持原逻辑。

新增 bank 选择流水寄存器：

```verilog
reg [1:0] ntt_out_bank_d1;
reg [1:0] ntt_out_bank_d2;
reg [1:0] ntt_out_bank_d3;
```

KEM NTT 输出分支最终形态：

```verilog
if (KAD_Mode) begin
    coef_ena_bram0   <= (cnt_128_ntt < 8'd131) ;
    coef_enb_bram0   <= (cnt_128_ntt < 8'd131) ;
    coef_ena_bram1   <= (cnt_128_ntt < 8'd131) ;
    coef_enb_bram1   <= (cnt_128_ntt < 8'd131) ;
    coef_ena_bram2   <= (cnt_128_ntt < 8'd131) ;
    coef_enb_bram2   <= (cnt_128_ntt < 8'd131) ;
    coef_ena_bram3   <= (cnt_128_ntt < 8'd131) ;
    coef_enb_bram3   <= (cnt_128_ntt < 8'd131) ;

    coef_wea_bram0   <= 1'b0 ;
    coef_web_bram0   <= 1'b0 ;
    coef_wea_bram1   <= 1'b0 ;
    coef_web_bram1   <= 1'b0 ;
    coef_wea_bram2   <= 1'b0 ;
    coef_web_bram2   <= 1'b0 ;
    coef_wea_bram3   <= 1'b0 ;
    coef_web_bram3   <= 1'b0 ;

    coef_addra_bram0 <= cnt_128_ntt[6:2] ;
    coef_addrb_bram0 <= cnt_128_ntt[6:2] + 6'd32 ;
    coef_addra_bram1 <= cnt_128_ntt[6:2] ;
    coef_addrb_bram1 <= cnt_128_ntt[6:2] + 6'd32 ;
    coef_addra_bram2 <= cnt_128_ntt[6:2] ;
    coef_addrb_bram2 <= cnt_128_ntt[6:2] + 6'd32 ;
    coef_addra_bram3 <= cnt_128_ntt[6:2] ;
    coef_addrb_bram3 <= cnt_128_ntt[6:2] + 6'd32 ;

    ntt_out_bank_d1  <= cnt_128_ntt[1:0] ;
    ntt_out_bank_d2  <= ntt_out_bank_d1 ;
    ntt_out_bank_d3  <= ntt_out_bank_d2 ;

    case (ntt_out_bank_d2)
        2'd0: begin data1 <= coef_douta_bram0; data2 <= coef_doutb_bram0; end
        2'd1: begin data1 <= coef_douta_bram1; data2 <= coef_doutb_bram1; end
        2'd2: begin data1 <= coef_douta_bram2; data2 <= coef_doutb_bram2; end
        2'd3: begin data1 <= coef_douta_bram3; data2 <= coef_doutb_bram3; end
    endcase
end
else begin
    // 原非 KEM Multi_Mode 逻辑
end
```

为什么是 `ntt_out_bank_d2` 而不是 `d3`：

1. 使用 `d3` 时，iter6 结果只剩一个边界错位：第一对 bank0 被重复，bank3 第一对漏读。
2. 尝试平移 valid 窗口到 `cnt=4..131` 会输出 0/X，说明不是 valid 简单平移问题。
3. 尝试把 request index 提前一拍，会变成 bank1 第一对重复，bank0 第一对漏读，说明请求序号不该平移。
4. 回到原 request index，只把 bank select 从 `d3` 改为 `d2`，iter10 输出 multiset 与 PQClean unsigned 完全 PASS。

判断成功：

```text
iter10_bag_summary_raw1027_out_vs_pqclean_unsigned.csv
PASS, candidate_count=256, reference_count=256, unequal_value_rows=0
```

## 7. 关键迭代结果表

| 迭代 | 修改/验证点 | 结果 | 结论 |
|---|---|---|---|
| iter5 | 输入写 bank、precompute、compute bank 对 ML | PASS 256/256 | bank 内容已对齐 ML |
| iter5 | output vs PQClean multiset | FAIL | compute bank PASS 不等于输出 PASS |
| iter6 | KEM NTT 输出读调度用 `d3` | FAIL，只差 4 行 | 读出接近正确，但边界错位 |
| iter7 | valid 窗口移到 `4..131` | FAIL，仿真过早结束 | `module_done` idle 下误触发 |
| iter8 | module_done 加 NTT_working gating | FAIL，输出 0/X | valid 平移不是正确方向 |
| iter9 | request index 提前一拍 | FAIL，只差 4 行 | 过头，bank1 重复/bank0 缺失 |
| iter10 | request index 不动，select 用 `d2` | PASS | 最终输出无重复遗漏 |

## 8. 如何判断最终是否成功

不要只看波形，也不要只看单一 txt。最终需要同时满足以下检查：

```text
1. input_write_vs_ml_kem_coe PASS 256/256
2. precompute_banks_vs_ml_init_coe PASS 256/256
3. compute_banks_vs_ml_snapshot_sync_read PASS 256/256
4. output_multiset_vs_pqclean_unsigned_ignore_order PASS 256/256
5. output_multiset_vs_ml_snapshot_ignore_order PASS 256/256
```

最终证据文件：

```text
E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\iter10_select_d2\iter10_final_summary.csv
```

最终输出：

```text
E:\Project\MLDSA\simulation_artifacts\pqc1027_bank_maps\iter10_select_d2\dut_ntt_1027_out.txt
```

最终 `dut_ntt_1027_out.txt` 前 16 个为：

```text
3261
2845
1165
795
1687
482
2857
868
847
1356
2767
31
2349
2149
726
1896
```

注意：该输出顺序不必与 PQClean C golden 逐行一致。本文最终要求是“不看顺序，每个数都对齐，没有重复，没有遗漏”。若要进一步要求逐行顺序一致，需要另行定义软件期望的输出排列并调整 readout order。

## 9. 给 Claude 审阅时建议重点检查

建议 Claude 重点审阅下面几个问题：

1. `KAD_NTT_mem_write.v` 中 `KAD_Mode && Multi_Mode` 新分支是否会影响 ML_DSA 或 INTT。
2. `Ws_tvalid` 与 `module_done` 是否仍保持原时序，不会减少或增加输出拍数。
3. `case (ntt_out_bank_d2)` 是否与 `bank64_KAD_NTT` 当前 `READ_FIRST`、无 output register 的仿真延迟匹配。
4. `bank64_KAD_NTT` 的 XCI 与 generated sim wrapper 是否一致，否则重新 generate IP 后可能覆盖 sim wrapper。
5. `rom_tw_INTT_NTT` 是否稳定指向 KEM COE/MIF。
6. `dut_ntt_1027_compute_banks.txt` 与 `ml_kem_ntt_final_bank_snapshot.csv` 的比较是按 `(bank,addr)` 精确比较，而不是只看集合。
7. `dut_ntt_1027_out.txt` 与 PQClean 的比较是 signed-to-unsigned 后的 multiset 比较，不是逐行顺序比较。

## 10. 当前结论

当前 `PQC_PRJ_20251027` 已达到本轮目标：

```text
NTT 输入写 bank: 与 ML_KAD_NTT_vvv KEM COE 对齐，256/256 PASS。
compute 前 bank: 与 ML init COE 对齐，256/256 PASS。
compute 后 bank: 与 ML KEM final snapshot 对齐，256/256 PASS。
最终输出集合: 与 PQClean C golden unsigned multiset 对齐，256/256 PASS，没有重复，没有遗漏。
```

仍未声称完成的是：

```text
最终输出逐行顺序与 PQClean C golden 完全一致。
```

当前只证明“不看顺序”的 multiset 完全一致。如果下一步需要逐行顺序一致，应以 `dut_ntt_1027_out.txt` 与 PQClean unsigned 的 index mapping 为输入，继续设计输出 permutation。

