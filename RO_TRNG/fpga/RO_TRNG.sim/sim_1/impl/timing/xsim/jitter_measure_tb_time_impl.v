// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Apr 22 13:44:19 2025
// Host        : DESKTOP-V7OP3RO running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               E:/Project/RO_TRNG/fpga/RO_TRNG.sim/sim_1/impl/timing/xsim/jitter_measure_tb_time_impl.v
// Design      : jitter_measure
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xcku5p-ffvb676-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module IBUF_UNIQ_BASE_
   (O,
    I);
  output O;
  input I;

  wire I;
  wire O;
  wire OUT;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;
  wire NLW_INBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_INBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_INBUF_INST_OSC_UNCONNECTED;

  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
  INBUF INBUF_INST
       (.O(OUT),
        .OSC(NLW_INBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_INBUF_INST_OSC_EN_UNCONNECTED),
        .PAD(I),
        .VREF(NLW_INBUF_INST_VREF_UNCONNECTED));
endmodule

module IBUFDS_UNIQ_BASE_
   (O,
    I,
    IB);
  output O;
  input I;
  input IB;

  wire I;
  wire IB;
  wire O;
  wire OUT;
  wire NLW_DIFFINBUF_INST_O_B_UNCONNECTED;
  wire NLW_DIFFINBUF_INST_VREF_UNCONNECTED;
  wire [3:0]NLW_DIFFINBUF_INST_OSC_UNCONNECTED;
  wire [1:0]NLW_DIFFINBUF_INST_OSC_EN_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED;
  wire NLW_IBUFCTRL_INST_T_UNCONNECTED;

  DIFFINBUF #(
    .DIFF_TERM("FALSE"),
    .ISTANDARD("DEFAULT")) 
    DIFFINBUF_INST
       (.DIFF_IN_N(IB),
        .DIFF_IN_P(I),
        .O(OUT),
        .OSC(NLW_DIFFINBUF_INST_OSC_UNCONNECTED[3:0]),
        .OSC_EN(NLW_DIFFINBUF_INST_OSC_EN_UNCONNECTED[1:0]),
        .O_B(NLW_DIFFINBUF_INST_O_B_UNCONNECTED),
        .VREF(NLW_DIFFINBUF_INST_VREF_UNCONNECTED));
  IBUFCTRL IBUFCTRL_INST
       (.I(OUT),
        .IBUFDISABLE(NLW_IBUFCTRL_INST_IBUFDISABLE_UNCONNECTED),
        .INTERMDISABLE(NLW_IBUFCTRL_INST_INTERMDISABLE_UNCONNECTED),
        .O(O),
        .T(NLW_IBUFCTRL_INST_T_UNCONNECTED));
endmodule

module CU
   (in0,
    \bbstub_peripheral_aresetn[0] ,
    cu_fifo_vld,
    ro_en,
    Q,
    out,
    en,
    D);
  output in0;
  output \bbstub_peripheral_aresetn[0] ;
  output cu_fifo_vld;
  output ro_en;
  output [7:0]Q;
  input out;
  input en;
  input [7:0]D;

  wire [7:0]D;
  wire [7:0]Q;
  wire cu_fifo_vld;
  wire [31:1]data0;
  wire en;
  wire en_i_1_n_0;
  wire en_i_2_n_0;
  wire in0;
  wire out;
  wire ro_en;
  wire rst_n;
  wire [31:0]state;
  wire \state[31]_i_10_n_0 ;
  wire \state[31]_i_2_n_0 ;
  wire \state[31]_i_3_n_0 ;
  wire \state[31]_i_5_n_0 ;
  wire \state[31]_i_6_n_0 ;
  wire \state[31]_i_7_n_0 ;
  wire \state[31]_i_8_n_0 ;
  wire \state[31]_i_9_n_0 ;
  wire \state_reg[16]_i_2_n_0 ;
  wire \state_reg[24]_i_2_n_0 ;
  wire \state_reg[8]_i_2_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[10] ;
  wire \state_reg_n_0_[11] ;
  wire \state_reg_n_0_[12] ;
  wire \state_reg_n_0_[13] ;
  wire \state_reg_n_0_[14] ;
  wire \state_reg_n_0_[15] ;
  wire \state_reg_n_0_[16] ;
  wire \state_reg_n_0_[17] ;
  wire \state_reg_n_0_[18] ;
  wire \state_reg_n_0_[19] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[20] ;
  wire \state_reg_n_0_[21] ;
  wire \state_reg_n_0_[22] ;
  wire \state_reg_n_0_[23] ;
  wire \state_reg_n_0_[24] ;
  wire \state_reg_n_0_[25] ;
  wire \state_reg_n_0_[26] ;
  wire \state_reg_n_0_[27] ;
  wire \state_reg_n_0_[28] ;
  wire \state_reg_n_0_[29] ;
  wire \state_reg_n_0_[2] ;
  wire \state_reg_n_0_[30] ;
  wire \state_reg_n_0_[31] ;
  wire \state_reg_n_0_[3] ;
  wire \state_reg_n_0_[4] ;
  wire \state_reg_n_0_[5] ;
  wire \state_reg_n_0_[6] ;
  wire \state_reg_n_0_[7] ;
  wire \state_reg_n_0_[8] ;
  wire \state_reg_n_0_[9] ;
  wire vld;
  wire [6:0]\NLW_state_reg[16]_i_2_CO_UNCONNECTED ;
  wire [6:0]\NLW_state_reg[24]_i_2_CO_UNCONNECTED ;
  wire [7:0]\NLW_state_reg[31]_i_4_CO_UNCONNECTED ;
  wire [7:7]\NLW_state_reg[31]_i_4_DI_UNCONNECTED ;
  wire [7:7]\NLW_state_reg[31]_i_4_O_UNCONNECTED ;
  wire [7:7]\NLW_state_reg[31]_i_4_S_UNCONNECTED ;
  wire [6:0]\NLW_state_reg[8]_i_2_CO_UNCONNECTED ;

  assign \bbstub_peripheral_aresetn[0]  = en;
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[0] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[0]),
        .Q(Q[0]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[1] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[1]),
        .Q(Q[1]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[2] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[2]),
        .Q(Q[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[3] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[3]),
        .Q(Q[3]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[4] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[4]),
        .Q(Q[4]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[5] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[5]),
        .Q(Q[5]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[6] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[6]),
        .Q(Q[6]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_reg[7] 
       (.C(out),
        .CE(vld),
        .CLR(en),
        .D(D[7]),
        .Q(Q[7]));
  LUT6 #(
    .INIT(64'hF5FFF7FF00000300)) 
    en_i_1
       (.I0(en_i_2_n_0),
        .I1(\state[31]_i_3_n_0 ),
        .I2(\state[31]_i_2_n_0 ),
        .I3(\state_reg_n_0_[0] ),
        .I4(\state_reg_n_0_[5] ),
        .I5(ro_en),
        .O(en_i_1_n_0));
  LUT5 #(
    .INIT(32'h00800000)) 
    en_i_2
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state_reg_n_0_[3] ),
        .I3(\state_reg_n_0_[5] ),
        .I4(\state_reg_n_0_[4] ),
        .O(en_i_2_n_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    en_reg
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(en_i_1_n_0),
        .Q(ro_en));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    rst_n_i_1
       (.I0(\state_reg_n_0_[5] ),
        .I1(\state[31]_i_3_n_0 ),
        .I2(\state[31]_i_2_n_0 ),
        .I3(\state_reg_n_0_[0] ),
        .O(rst_n));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    rst_n_reg
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(rst_n),
        .Q(in0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h00FD)) 
    \state[0]_i_1 
       (.I0(\state_reg_n_0_[5] ),
        .I1(\state[31]_i_3_n_0 ),
        .I2(\state[31]_i_2_n_0 ),
        .I3(\state_reg_n_0_[0] ),
        .O(state[0]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[10]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[10]),
        .O(state[10]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[11]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[11]),
        .O(state[11]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[12]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[12]),
        .O(state[12]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[13]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[13]),
        .O(state[13]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[14]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[14]),
        .O(state[14]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[15]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[15]),
        .O(state[15]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[16]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[16]),
        .O(state[16]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[17]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[17]),
        .O(state[17]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[18]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[18]),
        .O(state[18]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[19]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[19]),
        .O(state[19]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[1]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[1]),
        .O(state[1]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[20]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[20]),
        .O(state[20]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[21]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[21]),
        .O(state[21]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[22]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[22]),
        .O(state[22]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[23]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[23]),
        .O(state[23]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[24]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[24]),
        .O(state[24]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[25]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[25]),
        .O(state[25]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[26]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[26]),
        .O(state[26]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[27]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[27]),
        .O(state[27]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[28]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[28]),
        .O(state[28]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[29]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[29]),
        .O(state[29]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[2]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[2]),
        .O(state[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[30]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[30]),
        .O(state[30]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[31]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[31]),
        .O(state[31]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state[31]_i_10 
       (.I0(\state_reg_n_0_[30] ),
        .I1(\state_reg_n_0_[31] ),
        .I2(\state_reg_n_0_[28] ),
        .I3(\state_reg_n_0_[29] ),
        .I4(\state_reg_n_0_[7] ),
        .I5(\state_reg_n_0_[6] ),
        .O(\state[31]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \state[31]_i_2 
       (.I0(\state[31]_i_5_n_0 ),
        .I1(\state[31]_i_6_n_0 ),
        .I2(\state[31]_i_7_n_0 ),
        .I3(\state[31]_i_8_n_0 ),
        .I4(\state[31]_i_9_n_0 ),
        .I5(\state[31]_i_10_n_0 ),
        .O(\state[31]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[31]_i_3 
       (.I0(\state_reg_n_0_[2] ),
        .I1(\state_reg_n_0_[1] ),
        .I2(\state_reg_n_0_[4] ),
        .I3(\state_reg_n_0_[3] ),
        .O(\state[31]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[31]_i_5 
       (.I0(\state_reg_n_0_[21] ),
        .I1(\state_reg_n_0_[20] ),
        .I2(\state_reg_n_0_[23] ),
        .I3(\state_reg_n_0_[22] ),
        .O(\state[31]_i_5_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[31]_i_6 
       (.I0(\state_reg_n_0_[25] ),
        .I1(\state_reg_n_0_[24] ),
        .I2(\state_reg_n_0_[27] ),
        .I3(\state_reg_n_0_[26] ),
        .O(\state[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[31]_i_7 
       (.I0(\state_reg_n_0_[13] ),
        .I1(\state_reg_n_0_[12] ),
        .I2(\state_reg_n_0_[15] ),
        .I3(\state_reg_n_0_[14] ),
        .O(\state[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[31]_i_8 
       (.I0(\state_reg_n_0_[17] ),
        .I1(\state_reg_n_0_[16] ),
        .I2(\state_reg_n_0_[19] ),
        .I3(\state_reg_n_0_[18] ),
        .O(\state[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \state[31]_i_9 
       (.I0(\state_reg_n_0_[9] ),
        .I1(\state_reg_n_0_[8] ),
        .I2(\state_reg_n_0_[11] ),
        .I3(\state_reg_n_0_[10] ),
        .O(\state[31]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[3]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[3]),
        .O(state[3]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[4]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[4]),
        .O(state[4]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[5]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[5]),
        .O(state[5]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[6]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[6]),
        .O(state[6]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[7]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[7]),
        .O(state[7]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[8]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[8]),
        .O(state[8]));
  LUT5 #(
    .INIT(32'hFEFF0000)) 
    \state[9]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .I4(data0[9]),
        .O(state[9]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[0] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[0]),
        .Q(\state_reg_n_0_[0] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[10] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[10]),
        .Q(\state_reg_n_0_[10] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[11] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[11]),
        .Q(\state_reg_n_0_[11] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[12] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[12]),
        .Q(\state_reg_n_0_[12] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[13] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[13]),
        .Q(\state_reg_n_0_[13] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[14] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[14]),
        .Q(\state_reg_n_0_[14] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[15] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[15]),
        .Q(\state_reg_n_0_[15] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[16] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[16]),
        .Q(\state_reg_n_0_[16] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \state_reg[16]_i_2 
       (.CI(\state_reg[8]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\state_reg[16]_i_2_n_0 ,\NLW_state_reg[16]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:9]),
        .S({\state_reg_n_0_[16] ,\state_reg_n_0_[15] ,\state_reg_n_0_[14] ,\state_reg_n_0_[13] ,\state_reg_n_0_[12] ,\state_reg_n_0_[11] ,\state_reg_n_0_[10] ,\state_reg_n_0_[9] }));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[17] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[17]),
        .Q(\state_reg_n_0_[17] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[18] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[18]),
        .Q(\state_reg_n_0_[18] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[19] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[19]),
        .Q(\state_reg_n_0_[19] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[1] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[1]),
        .Q(\state_reg_n_0_[1] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[20] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[20]),
        .Q(\state_reg_n_0_[20] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[21] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[21]),
        .Q(\state_reg_n_0_[21] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[22] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[22]),
        .Q(\state_reg_n_0_[22] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[23] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[23]),
        .Q(\state_reg_n_0_[23] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[24] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[24]),
        .Q(\state_reg_n_0_[24] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \state_reg[24]_i_2 
       (.CI(\state_reg[16]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO({\state_reg[24]_i_2_n_0 ,\NLW_state_reg[24]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:17]),
        .S({\state_reg_n_0_[24] ,\state_reg_n_0_[23] ,\state_reg_n_0_[22] ,\state_reg_n_0_[21] ,\state_reg_n_0_[20] ,\state_reg_n_0_[19] ,\state_reg_n_0_[18] ,\state_reg_n_0_[17] }));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[25] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[25]),
        .Q(\state_reg_n_0_[25] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[26] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[26]),
        .Q(\state_reg_n_0_[26] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[27] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[27]),
        .Q(\state_reg_n_0_[27] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[28] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[28]),
        .Q(\state_reg_n_0_[28] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[29] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[29]),
        .Q(\state_reg_n_0_[29] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[2] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[2]),
        .Q(\state_reg_n_0_[2] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[30] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[30]),
        .Q(\state_reg_n_0_[30] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[31] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[31]),
        .Q(\state_reg_n_0_[31] ));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \state_reg[31]_i_4 
       (.CI(\state_reg[24]_i_2_n_0 ),
        .CI_TOP(1'b0),
        .CO(\NLW_state_reg[31]_i_4_CO_UNCONNECTED [7:0]),
        .DI({\NLW_state_reg[31]_i_4_DI_UNCONNECTED [7],1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_state_reg[31]_i_4_O_UNCONNECTED [7],data0[31:25]}),
        .S({\NLW_state_reg[31]_i_4_S_UNCONNECTED [7],\state_reg_n_0_[31] ,\state_reg_n_0_[30] ,\state_reg_n_0_[29] ,\state_reg_n_0_[28] ,\state_reg_n_0_[27] ,\state_reg_n_0_[26] ,\state_reg_n_0_[25] }));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[3] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[3]),
        .Q(\state_reg_n_0_[3] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[4] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[4]),
        .Q(\state_reg_n_0_[4] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[5] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[5]),
        .Q(\state_reg_n_0_[5] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[6] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[6]),
        .Q(\state_reg_n_0_[6] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[7] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[7]),
        .Q(\state_reg_n_0_[7] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[8] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[8]),
        .Q(\state_reg_n_0_[8] ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY8 #(
    .CARRY_TYPE("SINGLE_CY8")) 
    \state_reg[8]_i_2 
       (.CI(\state_reg_n_0_[0] ),
        .CI_TOP(1'b0),
        .CO({\state_reg[8]_i_2_n_0 ,\NLW_state_reg[8]_i_2_CO_UNCONNECTED [6:0]}),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:1]),
        .S({\state_reg_n_0_[8] ,\state_reg_n_0_[7] ,\state_reg_n_0_[6] ,\state_reg_n_0_[5] ,\state_reg_n_0_[4] ,\state_reg_n_0_[3] ,\state_reg_n_0_[2] ,\state_reg_n_0_[1] }));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \state_reg[9] 
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(state[9]),
        .Q(\state_reg_n_0_[9] ));
  LUT4 #(
    .INIT(16'h0100)) 
    vld_i_1
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state[31]_i_2_n_0 ),
        .I2(\state[31]_i_3_n_0 ),
        .I3(\state_reg_n_0_[5] ),
        .O(vld));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    vld_reg
       (.C(out),
        .CE(1'b1),
        .CLR(en),
        .D(vld),
        .Q(cu_fifo_vld));
endmodule

module LUT6_and2_1
   (in0,
    en,
    clk_o);
  output [0:0]in0;
  input en;
  input clk_o;

  wire clk_o;
  wire en;
  wire [0:0]in0;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT6 #(
    .INIT(64'h0000000000000008)) 
    u_LUT6
       (.I0(en),
        .I1(clk_o),
        .I2(1'b0),
        .I3(1'b0),
        .I4(1'b0),
        .I5(1'b0),
        .O(in0));
endmodule

module LUT6_not1
   (in0,
    out);
  output [0:0]in0;
  input [0:0]out;

  wire [0:0]in0;
  wire [0:0]out;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* DONT_TOUCH *) 
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    u_LUT6
       (.I0(out),
        .I1(1'b0),
        .I2(1'b0),
        .I3(1'b0),
        .I4(1'b0),
        .I5(1'b0),
        .O(in0));
endmodule

module RO
   (clk_o,
    en);
  output clk_o;
  input en;

  wire en;
  (* DONT_TOUCH *) wire [1:0]ro_chain;

  assign clk_o = ro_chain[1];
  LUT6_and2_1 \RO_AND.u_LUT6_and2_1 
       (.clk_o(ro_chain[1]),
        .en(en),
        .in0(ro_chain[0]));
  LUT6_not1 \RO_STAGE_LOOP[0].u_LUT6_not1 
       (.in0(ro_chain[1]),
        .out(ro_chain[0]));
endmodule

module clk_wiz_0
   (clk_out1,
    clk_out2,
    reset,
    locked,
    clk_in1_p,
    clk_in1_n);
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;

  wire clk_in1_n;
  wire clk_in1_p;
  wire clk_out1;
  wire clk_out2;
  wire locked;
  wire reset;

  clk_wiz_0_clk_wiz inst
       (.clk_in1_n(clk_in1_n),
        .clk_in1_p(clk_in1_p),
        .clk_out1(clk_out1),
        .clk_out2(clk_out2),
        .locked(locked),
        .reset(reset));
endmodule

module clk_wiz_0_clk_wiz
   (clk_out1,
    clk_out2,
    reset,
    locked,
    clk_in1_p,
    clk_in1_n);
  output clk_out1;
  output clk_out2;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;

  wire clk_in1_clk_wiz_0;
  wire clk_in1_n;
  wire clk_in1_p;
  (* MAX_PROG_DELAY = "0" *) wire clk_out1;
  wire clk_out1_clk_wiz_0;
  (* MAX_PROG_DELAY = "0" *) wire clk_out2;
  wire locked;
  wire reset;
  wire NLW_plle4_adv_inst_CLKFBOUT_UNCONNECTED;
  wire NLW_plle4_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_plle4_adv_inst_CLKOUT1_UNCONNECTED;
  wire NLW_plle4_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_plle4_adv_inst_CLKOUTPHY_UNCONNECTED;
  wire NLW_plle4_adv_inst_DRDY_UNCONNECTED;
  wire [15:0]NLW_plle4_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  BUFGCE_DIV #(
    .BUFGCE_DIVIDE(2),
    .CE_TYPE("SYNC"),
    .HARDSYNC_CLR("FALSE"),
    .IS_CE_INVERTED(1'b0),
    .IS_CLR_INVERTED(1'b0),
    .IS_I_INVERTED(1'b0),
    .SIM_DEVICE("ULTRASCALE"),
    .STARTUP_SYNC("FALSE")) 
    BUFGCE_DIV_CLK2_inst
       (.CE(1'b1),
        .CLR(1'b0),
        .I(clk_out1_clk_wiz_0),
        .O(clk_out2));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* DIFF_TERM = 0 *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* IOSTANDARD = "DEFAULT" *) 
  IBUFDS_UNIQ_BASE_ clkin1_ibufds
       (.I(clk_in1_p),
        .IB(clk_in1_n),
        .O(clk_in1_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "BUFG_OPT" *) 
  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS"),
    .STARTUP_SYNC("FALSE")) 
    clkout1_buf
       (.CE(1'b1),
        .I(clk_out1_clk_wiz_0),
        .O(clk_out1));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* OPT_MODIFIED = "MLO RETARGET BUFG_OPT" *) 
  PLLE4_ADV #(
    .CLKFBOUT_MULT(8),
    .CLKFBOUT_PHASE(0.000000),
    .CLKIN_PERIOD(10.000000),
    .CLKOUT0_DIVIDE(4),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUTPHY_MODE("VCO_2X"),
    .COMPENSATION("INTERNAL"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKFBIN_INVERTED(1'b0),
    .IS_CLKIN_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b1),
    .REF_JITTER(0.010000),
    .STARTUP_WAIT("FALSE")) 
    plle4_adv_inst
       (.CLKFBIN(1'b0),
        .CLKFBOUT(NLW_plle4_adv_inst_CLKFBOUT_UNCONNECTED),
        .CLKIN(clk_in1_clk_wiz_0),
        .CLKOUT0(clk_out1_clk_wiz_0),
        .CLKOUT0B(NLW_plle4_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_plle4_adv_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_plle4_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUTPHY(NLW_plle4_adv_inst_CLKOUTPHY_UNCONNECTED),
        .CLKOUTPHYEN(1'b0),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_plle4_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_plle4_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(locked),
        .PWRDWN(1'b0),
        .RST(reset));
endmodule

module counter
   (out,
    sel,
    clk,
    \cnt_o_reg[7]_0 );
  output [7:0]out;
  input sel;
  input clk;
  input \cnt_o_reg[7]_0 ;

  wire clk;
  wire \cnt_o[7]_i_3_n_0 ;
  wire \cnt_o_reg[7]_0 ;
  wire [7:0]out;
  wire [7:0]p_0_in;
  wire sel;

  LUT1 #(
    .INIT(2'h1)) 
    \cnt_o[0]_i_1 
       (.I0(out[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_o[1]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_o[2]_i_1 
       (.I0(out[0]),
        .I1(out[1]),
        .I2(out[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_o[3]_i_1 
       (.I0(out[1]),
        .I1(out[0]),
        .I2(out[2]),
        .I3(out[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt_o[4]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(out[1]),
        .I3(out[3]),
        .I4(out[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt_o[5]_i_1 
       (.I0(out[3]),
        .I1(out[1]),
        .I2(out[0]),
        .I3(out[2]),
        .I4(out[4]),
        .I5(out[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_o[6]_i_1 
       (.I0(\cnt_o[7]_i_3_n_0 ),
        .I1(out[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_o[7]_i_1 
       (.I0(\cnt_o[7]_i_3_n_0 ),
        .I1(out[6]),
        .I2(out[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \cnt_o[7]_i_3 
       (.I0(out[5]),
        .I1(out[3]),
        .I2(out[1]),
        .I3(out[0]),
        .I4(out[2]),
        .I5(out[4]),
        .O(\cnt_o[7]_i_3_n_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[0] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[0]),
        .Q(out[0]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[1] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[1]),
        .Q(out[1]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[2] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[2]),
        .Q(out[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[3] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[3]),
        .Q(out[3]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[4] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[4]),
        .Q(out[4]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[5] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[5]),
        .Q(out[5]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[6] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[6]),
        .Q(out[6]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cnt_o_reg[7] 
       (.C(clk),
        .CE(sel),
        .CLR(\cnt_o_reg[7]_0 ),
        .D(p_0_in[7]),
        .Q(out[7]));
endmodule

(* CHECK_LICENSE_TYPE = "fifo_generator_1,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
module fifo_generator_1
   (clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [7:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire clk;
  wire [7:0]din;
  wire [7:0]dout;
  wire empty;
  wire rd_en;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_injectdbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_injectsbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_injectdbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_injectsbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_injectdbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_injectsbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_injectdbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_injectsbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_injectdbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_injectsbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_injectdbiterr_UNCONNECTED;
  wire NLW_U0_axis_injectsbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_backup_UNCONNECTED;
  wire NLW_U0_backup_marker_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_full_UNCONNECTED;
  wire NLW_U0_injectdbiterr_UNCONNECTED;
  wire NLW_U0_injectsbiterr_UNCONNECTED;
  wire NLW_U0_int_clk_UNCONNECTED;
  wire NLW_U0_m_aclk_UNCONNECTED;
  wire NLW_U0_m_aclk_en_UNCONNECTED;
  wire NLW_U0_m_axi_arready_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awready_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_bvalid_UNCONNECTED;
  wire NLW_U0_m_axi_rlast_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_rvalid_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wready_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tready_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_clk_UNCONNECTED;
  wire NLW_U0_rd_rst_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_rst_UNCONNECTED;
  wire NLW_U0_s_aclk_UNCONNECTED;
  wire NLW_U0_s_aclk_en_UNCONNECTED;
  wire NLW_U0_s_aresetn_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_arvalid_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_awvalid_UNCONNECTED;
  wire NLW_U0_s_axi_bready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rready_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wlast_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axi_wvalid_UNCONNECTED;
  wire NLW_U0_s_axis_tlast_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_s_axis_tvalid_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_sleep_UNCONNECTED;
  wire NLW_U0_srst_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_clk_UNCONNECTED;
  wire NLW_U0_wr_rst_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [3:0]NLW_U0_axi_ar_prog_empty_thresh_UNCONNECTED;
  wire [3:0]NLW_U0_axi_ar_prog_full_thresh_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [3:0]NLW_U0_axi_aw_prog_empty_thresh_UNCONNECTED;
  wire [3:0]NLW_U0_axi_aw_prog_full_thresh_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [3:0]NLW_U0_axi_b_prog_empty_thresh_UNCONNECTED;
  wire [3:0]NLW_U0_axi_b_prog_full_thresh_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axi_r_prog_empty_thresh_UNCONNECTED;
  wire [9:0]NLW_U0_axi_r_prog_full_thresh_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axi_w_prog_empty_thresh_UNCONNECTED;
  wire [9:0]NLW_U0_axi_w_prog_full_thresh_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_axis_prog_empty_thresh_UNCONNECTED;
  wire [9:0]NLW_U0_axis_prog_full_thresh_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [9:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_ruser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_prog_empty_thresh_UNCONNECTED;
  wire [9:0]NLW_U0_prog_empty_thresh_assert_UNCONNECTED;
  wire [9:0]NLW_U0_prog_empty_thresh_negate_UNCONNECTED;
  wire [9:0]NLW_U0_prog_full_thresh_UNCONNECTED;
  wire [9:0]NLW_U0_prog_full_thresh_assert_UNCONNECTED;
  wire [9:0]NLW_U0_prog_full_thresh_negate_UNCONNECTED;
  wire [9:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_awuser_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_s_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_s_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_s_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_s_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_s_axis_tuser_UNCONNECTED;
  wire [9:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "8" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "8" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "0" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x72" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_generator_1_fifo_generator_v13_2_9 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(NLW_U0_axi_ar_injectdbiterr_UNCONNECTED),
        .axi_ar_injectsbiterr(NLW_U0_axi_ar_injectsbiterr_UNCONNECTED),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh(NLW_U0_axi_ar_prog_empty_thresh_UNCONNECTED[3:0]),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh(NLW_U0_axi_ar_prog_full_thresh_UNCONNECTED[3:0]),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(NLW_U0_axi_aw_injectdbiterr_UNCONNECTED),
        .axi_aw_injectsbiterr(NLW_U0_axi_aw_injectsbiterr_UNCONNECTED),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh(NLW_U0_axi_aw_prog_empty_thresh_UNCONNECTED[3:0]),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh(NLW_U0_axi_aw_prog_full_thresh_UNCONNECTED[3:0]),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(NLW_U0_axi_b_injectdbiterr_UNCONNECTED),
        .axi_b_injectsbiterr(NLW_U0_axi_b_injectsbiterr_UNCONNECTED),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh(NLW_U0_axi_b_prog_empty_thresh_UNCONNECTED[3:0]),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh(NLW_U0_axi_b_prog_full_thresh_UNCONNECTED[3:0]),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(NLW_U0_axi_r_injectdbiterr_UNCONNECTED),
        .axi_r_injectsbiterr(NLW_U0_axi_r_injectsbiterr_UNCONNECTED),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh(NLW_U0_axi_r_prog_empty_thresh_UNCONNECTED[9:0]),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh(NLW_U0_axi_r_prog_full_thresh_UNCONNECTED[9:0]),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(NLW_U0_axi_w_injectdbiterr_UNCONNECTED),
        .axi_w_injectsbiterr(NLW_U0_axi_w_injectsbiterr_UNCONNECTED),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh(NLW_U0_axi_w_prog_empty_thresh_UNCONNECTED[9:0]),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh(NLW_U0_axi_w_prog_full_thresh_UNCONNECTED[9:0]),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(NLW_U0_axis_injectdbiterr_UNCONNECTED),
        .axis_injectsbiterr(NLW_U0_axis_injectsbiterr_UNCONNECTED),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh(NLW_U0_axis_prog_empty_thresh_UNCONNECTED[9:0]),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh(NLW_U0_axis_prog_full_thresh_UNCONNECTED[9:0]),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(NLW_U0_backup_UNCONNECTED),
        .backup_marker(NLW_U0_backup_marker_UNCONNECTED),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(NLW_U0_full_UNCONNECTED),
        .injectdbiterr(NLW_U0_injectdbiterr_UNCONNECTED),
        .injectsbiterr(NLW_U0_injectsbiterr_UNCONNECTED),
        .int_clk(NLW_U0_int_clk_UNCONNECTED),
        .m_aclk(NLW_U0_m_aclk_UNCONNECTED),
        .m_aclk_en(NLW_U0_m_aclk_en_UNCONNECTED),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(NLW_U0_m_axi_arready_UNCONNECTED),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(NLW_U0_m_axi_awready_UNCONNECTED),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(NLW_U0_m_axi_bid_UNCONNECTED[0]),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp(NLW_U0_m_axi_bresp_UNCONNECTED[1:0]),
        .m_axi_buser(NLW_U0_m_axi_buser_UNCONNECTED[0]),
        .m_axi_bvalid(NLW_U0_m_axi_bvalid_UNCONNECTED),
        .m_axi_rdata(NLW_U0_m_axi_rdata_UNCONNECTED[63:0]),
        .m_axi_rid(NLW_U0_m_axi_rid_UNCONNECTED[0]),
        .m_axi_rlast(NLW_U0_m_axi_rlast_UNCONNECTED),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp(NLW_U0_m_axi_rresp_UNCONNECTED[1:0]),
        .m_axi_ruser(NLW_U0_m_axi_ruser_UNCONNECTED[0]),
        .m_axi_rvalid(NLW_U0_m_axi_rvalid_UNCONNECTED),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(NLW_U0_m_axi_wready_UNCONNECTED),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(NLW_U0_m_axis_tready_UNCONNECTED),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh(NLW_U0_prog_empty_thresh_UNCONNECTED[9:0]),
        .prog_empty_thresh_assert(NLW_U0_prog_empty_thresh_assert_UNCONNECTED[9:0]),
        .prog_empty_thresh_negate(NLW_U0_prog_empty_thresh_negate_UNCONNECTED[9:0]),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh(NLW_U0_prog_full_thresh_UNCONNECTED[9:0]),
        .prog_full_thresh_assert(NLW_U0_prog_full_thresh_assert_UNCONNECTED[9:0]),
        .prog_full_thresh_negate(NLW_U0_prog_full_thresh_negate_UNCONNECTED[9:0]),
        .rd_clk(NLW_U0_rd_clk_UNCONNECTED),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[9:0]),
        .rd_en(rd_en),
        .rd_rst(NLW_U0_rd_rst_UNCONNECTED),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(NLW_U0_rst_UNCONNECTED),
        .s_aclk(NLW_U0_s_aclk_UNCONNECTED),
        .s_aclk_en(NLW_U0_s_aclk_en_UNCONNECTED),
        .s_aresetn(NLW_U0_s_aresetn_UNCONNECTED),
        .s_axi_araddr(NLW_U0_s_axi_araddr_UNCONNECTED[31:0]),
        .s_axi_arburst(NLW_U0_s_axi_arburst_UNCONNECTED[1:0]),
        .s_axi_arcache(NLW_U0_s_axi_arcache_UNCONNECTED[3:0]),
        .s_axi_arid(NLW_U0_s_axi_arid_UNCONNECTED[0]),
        .s_axi_arlen(NLW_U0_s_axi_arlen_UNCONNECTED[7:0]),
        .s_axi_arlock(NLW_U0_s_axi_arlock_UNCONNECTED[0]),
        .s_axi_arprot(NLW_U0_s_axi_arprot_UNCONNECTED[2:0]),
        .s_axi_arqos(NLW_U0_s_axi_arqos_UNCONNECTED[3:0]),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion(NLW_U0_s_axi_arregion_UNCONNECTED[3:0]),
        .s_axi_arsize(NLW_U0_s_axi_arsize_UNCONNECTED[2:0]),
        .s_axi_aruser(NLW_U0_s_axi_aruser_UNCONNECTED[0]),
        .s_axi_arvalid(NLW_U0_s_axi_arvalid_UNCONNECTED),
        .s_axi_awaddr(NLW_U0_s_axi_awaddr_UNCONNECTED[31:0]),
        .s_axi_awburst(NLW_U0_s_axi_awburst_UNCONNECTED[1:0]),
        .s_axi_awcache(NLW_U0_s_axi_awcache_UNCONNECTED[3:0]),
        .s_axi_awid(NLW_U0_s_axi_awid_UNCONNECTED[0]),
        .s_axi_awlen(NLW_U0_s_axi_awlen_UNCONNECTED[7:0]),
        .s_axi_awlock(NLW_U0_s_axi_awlock_UNCONNECTED[0]),
        .s_axi_awprot(NLW_U0_s_axi_awprot_UNCONNECTED[2:0]),
        .s_axi_awqos(NLW_U0_s_axi_awqos_UNCONNECTED[3:0]),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion(NLW_U0_s_axi_awregion_UNCONNECTED[3:0]),
        .s_axi_awsize(NLW_U0_s_axi_awsize_UNCONNECTED[2:0]),
        .s_axi_awuser(NLW_U0_s_axi_awuser_UNCONNECTED[0]),
        .s_axi_awvalid(NLW_U0_s_axi_awvalid_UNCONNECTED),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(NLW_U0_s_axi_bready_UNCONNECTED),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(NLW_U0_s_axi_rready_UNCONNECTED),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata(NLW_U0_s_axi_wdata_UNCONNECTED[63:0]),
        .s_axi_wid(NLW_U0_s_axi_wid_UNCONNECTED[0]),
        .s_axi_wlast(NLW_U0_s_axi_wlast_UNCONNECTED),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(NLW_U0_s_axi_wstrb_UNCONNECTED[7:0]),
        .s_axi_wuser(NLW_U0_s_axi_wuser_UNCONNECTED[0]),
        .s_axi_wvalid(NLW_U0_s_axi_wvalid_UNCONNECTED),
        .s_axis_tdata(NLW_U0_s_axis_tdata_UNCONNECTED[7:0]),
        .s_axis_tdest(NLW_U0_s_axis_tdest_UNCONNECTED[0]),
        .s_axis_tid(NLW_U0_s_axis_tid_UNCONNECTED[0]),
        .s_axis_tkeep(NLW_U0_s_axis_tkeep_UNCONNECTED[0]),
        .s_axis_tlast(NLW_U0_s_axis_tlast_UNCONNECTED),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(NLW_U0_s_axis_tstrb_UNCONNECTED[0]),
        .s_axis_tuser(NLW_U0_s_axis_tuser_UNCONNECTED[3:0]),
        .s_axis_tvalid(NLW_U0_s_axis_tvalid_UNCONNECTED),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(NLW_U0_sleep_UNCONNECTED),
        .srst(NLW_U0_srst_UNCONNECTED),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(NLW_U0_wr_clk_UNCONNECTED),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(NLW_U0_wr_rst_UNCONNECTED),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* ECO_CHECKSUM = "b0decd3" *) (* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "0" *) 
(* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module jitter_measure
   (clk_100M_p,
    clk_100M_n,
    por_n_i,
    UART_TX_o);
  input clk_100M_p;
  input clk_100M_n;
  input por_n_i;
  output UART_TX_o;

  wire UART_TX_o;
  wire UART_TX_o_OBUF;
  (* IBUF_LOW_PWR *) wire clk_100M_n;
  (* IBUF_LOW_PWR *) wire clk_100M_p;
  (* DONT_TOUCH *) wire clk_100m;
  (* DONT_TOUCH *) wire clk_200m;
  (* DONT_TOUCH *) wire [7:0]counter_cu_cnt;
  (* DONT_TOUCH *) wire counter_rst_n;
  (* DONT_TOUCH *) wire [7:0]cu_fifo_cnt;
  (* DONT_TOUCH *) wire cu_fifo_vld;
  (* DONT_TOUCH *) wire empty;
  (* DONT_TOUCH *) wire locked;
  wire por_n_i;
  wire por_n_i_IBUF;
  (* DONT_TOUCH *) wire ro_clk;
  (* DONT_TOUCH *) wire ro_en;
  (* DONT_TOUCH *) wire rst_n_100m;
  (* DONT_TOUCH *) wire [7:0]tx_data;
  (* DONT_TOUCH *) wire tx_data_ready;
  wire u_CU_n_1;
  wire NLW_u_fifo_generator_1_full_UNCONNECTED;
  wire NLW_u_proc_sys_reset_0_mb_debug_sys_rst_UNCONNECTED;
  wire NLW_u_proc_sys_reset_0_mb_reset_UNCONNECTED;
  wire [0:0]NLW_u_proc_sys_reset_0_bus_struct_reset_UNCONNECTED;
  wire [0:0]NLW_u_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED;
  wire [0:0]NLW_u_proc_sys_reset_0_peripheral_reset_UNCONNECTED;

initial begin
 $sdf_annotate("jitter_measure_tb_time_impl.sdf",,,,"tool_control");
end
  OBUF UART_TX_o_OBUF_inst
       (.I(UART_TX_o_OBUF),
        .O(UART_TX_o));
  IBUF_UNIQ_BASE_ por_n_i_IBUF_inst
       (.I(por_n_i),
        .O(por_n_i_IBUF));
  CU u_CU
       (.D(counter_cu_cnt),
        .Q(cu_fifo_cnt),
        .\bbstub_peripheral_aresetn[0] (u_CU_n_1),
        .cu_fifo_vld(cu_fifo_vld),
        .en(rst_n_100m),
        .in0(counter_rst_n),
        .out(clk_200m),
        .ro_en(ro_en));
  RO u_RO
       (.clk_o(ro_clk),
        .en(rst_n_100m));
  (* IMPORTED_FROM = "e:/Project/RO_TRNG/fpga/RO_TRNG.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  clk_wiz_0 u_clk_wiz_0
       (.clk_in1_n(clk_100M_n),
        .clk_in1_p(clk_100M_p),
        .clk_out1(clk_200m),
        .clk_out2(clk_100m),
        .locked(locked),
        .reset(por_n_i_IBUF));
  counter u_counter
       (.clk(ro_clk),
        .\cnt_o_reg[7]_0 (counter_rst_n),
        .out(counter_cu_cnt),
        .sel(ro_en));
  (* IMPORTED_FROM = "e:/Project/RO_TRNG/fpga/RO_TRNG.gen/sources_1/ip/fifo_generator_1/fifo_generator_1.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
  fifo_generator_1 u_fifo_generator_1
       (.clk(clk_200m),
        .din(cu_fifo_cnt),
        .dout(tx_data),
        .empty(empty),
        .full(NLW_u_fifo_generator_1_full_UNCONNECTED),
        .rd_en(tx_data_ready),
        .wr_en(cu_fifo_vld));
  (* IMPORTED_FROM = "e:/Project/RO_TRNG/fpga/RO_TRNG.gen/sources_1/ip/proc_sys_reset_0/proc_sys_reset_0.dcp" *) 
  (* IMPORTED_TYPE = "CHECKPOINT" *) 
  (* IS_IMPORTED *) 
  (* x_core_info = "proc_sys_reset,Vivado 2023.2" *) 
  proc_sys_reset_0 u_proc_sys_reset_0
       (.aux_reset_in(1'b0),
        .bus_struct_reset(NLW_u_proc_sys_reset_0_bus_struct_reset_UNCONNECTED[0]),
        .dcm_locked(locked),
        .ext_reset_in(por_n_i_IBUF),
        .interconnect_aresetn(NLW_u_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED[0]),
        .mb_debug_sys_rst(NLW_u_proc_sys_reset_0_mb_debug_sys_rst_UNCONNECTED),
        .mb_reset(NLW_u_proc_sys_reset_0_mb_reset_UNCONNECTED),
        .peripheral_aresetn(rst_n_100m),
        .peripheral_reset(NLW_u_proc_sys_reset_0_peripheral_reset_UNCONNECTED[0]),
        .slowest_sync_clk(clk_100m));
  uart_tx u_uart_tx
       (.CLK(clk_200m),
        .D(tx_data),
        .UART_TX_o_OBUF(UART_TX_o_OBUF),
        .in0(tx_data_ready),
        .out(empty),
        .tx_reg_reg_0(u_CU_n_1));
endmodule

(* CHECK_LICENSE_TYPE = "proc_sys_reset_0,proc_sys_reset,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "proc_sys_reset,Vivado 2023.2" *) 
module proc_sys_reset_0
   (slowest_sync_clk,
    ext_reset_in,
    aux_reset_in,
    mb_debug_sys_rst,
    dcm_locked,
    mb_reset,
    bus_struct_reset,
    peripheral_reset,
    interconnect_aresetn,
    peripheral_aresetn);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clock CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clock, ASSOCIATED_RESET mb_reset:bus_struct_reset:interconnect_aresetn:peripheral_aresetn:peripheral_reset, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input slowest_sync_clk;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 ext_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME ext_reset, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input ext_reset_in;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 aux_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME aux_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aux_reset_in;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 dbg_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME dbg_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input mb_debug_sys_rst;
  input dcm_locked;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 mb_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME mb_rst, POLARITY ACTIVE_HIGH, TYPE PROCESSOR, INSERT_VIP 0" *) output mb_reset;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 bus_struct_reset RST" *) (* x_interface_parameter = "XIL_INTERFACENAME bus_struct_reset, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT, INSERT_VIP 0" *) output [0:0]bus_struct_reset;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 peripheral_high_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME peripheral_high_rst, POLARITY ACTIVE_HIGH, TYPE PERIPHERAL, INSERT_VIP 0" *) output [0:0]peripheral_reset;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 interconnect_low_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME interconnect_low_rst, POLARITY ACTIVE_LOW, TYPE INTERCONNECT, INSERT_VIP 0" *) output [0:0]interconnect_aresetn;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 peripheral_low_rst RST" *) (* x_interface_parameter = "XIL_INTERFACENAME peripheral_low_rst, POLARITY ACTIVE_LOW, TYPE PERIPHERAL, INSERT_VIP 0" *) output [0:0]peripheral_aresetn;

  wire aux_reset_in;
  wire dcm_locked;
  wire ext_reset_in;
  wire [0:0]peripheral_aresetn;
  wire slowest_sync_clk;
  wire NLW_U0_mb_debug_sys_rst_UNCONNECTED;
  wire NLW_U0_mb_reset_UNCONNECTED;
  wire [0:0]NLW_U0_bus_struct_reset_UNCONNECTED;
  wire [0:0]NLW_U0_interconnect_aresetn_UNCONNECTED;
  wire [0:0]NLW_U0_peripheral_reset_UNCONNECTED;

  (* C_AUX_RESET_HIGH = "1'b1" *) 
  (* C_AUX_RST_WIDTH = "4" *) 
  (* C_EXT_RESET_HIGH = "1'b1" *) 
  (* C_EXT_RST_WIDTH = "4" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_NUM_BUS_RST = "1" *) 
  (* C_NUM_INTERCONNECT_ARESETN = "1" *) 
  (* C_NUM_PERP_ARESETN = "1" *) 
  (* C_NUM_PERP_RST = "1" *) 
  proc_sys_reset_0_proc_sys_reset U0
       (.aux_reset_in(aux_reset_in),
        .bus_struct_reset(NLW_U0_bus_struct_reset_UNCONNECTED[0]),
        .dcm_locked(dcm_locked),
        .ext_reset_in(ext_reset_in),
        .interconnect_aresetn(NLW_U0_interconnect_aresetn_UNCONNECTED[0]),
        .mb_debug_sys_rst(NLW_U0_mb_debug_sys_rst_UNCONNECTED),
        .mb_reset(NLW_U0_mb_reset_UNCONNECTED),
        .peripheral_aresetn(peripheral_aresetn),
        .peripheral_reset(NLW_U0_peripheral_reset_UNCONNECTED[0]),
        .slowest_sync_clk(slowest_sync_clk));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module proc_sys_reset_0_cdc_sync
   (lpf_asr_reg,
    scndry_out,
    lpf_asr,
    p_1_in,
    p_2_in,
    asr_lpf,
    aux_reset_in,
    slowest_sync_clk);
  output lpf_asr_reg;
  output scndry_out;
  input lpf_asr;
  input p_1_in;
  input p_2_in;
  input [0:0]asr_lpf;
  input aux_reset_in;
  input slowest_sync_clk;

  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ;
  wire Q;
  wire [0:0]asr_lpf;
  wire aux_reset_in;
  wire lpf_asr;
  wire lpf_asr_reg;
  wire p_1_in;
  wire p_2_in;
  wire scndry_out;
  wire slowest_sync_clk;

  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(aux_reset_in),
        .Q(Q),
        .R(1'b0));
  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(Q),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ),
        .R(1'b0));
  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ),
        .R(1'b0));
  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ),
        .Q(scndry_out),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEAAAAAA8)) 
    lpf_asr_i_1
       (.I0(lpf_asr),
        .I1(p_1_in),
        .I2(p_2_in),
        .I3(scndry_out),
        .I4(asr_lpf),
        .O(lpf_asr_reg));
endmodule

(* ORIG_REF_NAME = "cdc_sync" *) 
module proc_sys_reset_0_cdc_sync_0
   (lpf_exr_reg,
    scndry_out,
    lpf_exr,
    p_1_in4_in,
    p_2_in3_in,
    exr_lpf,
    ext_reset_in,
    mb_debug_sys_rst,
    slowest_sync_clk);
  output lpf_exr_reg;
  output scndry_out;
  input lpf_exr;
  input p_1_in4_in;
  input p_2_in3_in;
  input [0:0]exr_lpf;
  input ext_reset_in;
  input mb_debug_sys_rst;
  input slowest_sync_clk;

  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ;
  wire \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ;
  wire Q;
  wire exr_d1;
  wire [0:0]exr_lpf;
  wire ext_reset_in;
  wire lpf_exr;
  wire lpf_exr_reg;
  wire p_1_in4_in;
  wire p_2_in3_in;
  wire scndry_out;
  wire slowest_sync_clk;

  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(exr_d1),
        .Q(Q),
        .R(1'b0));
  (* OPT_MODIFIED = "RETARGET" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_IN_cdc_to_i_1 
       (.I0(ext_reset_in),
        .O(exr_d1));
  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d2 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(Q),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ),
        .R(1'b0));
  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d3 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d2 ),
        .Q(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ),
        .R(1'b0));
  initial assign \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 .notifier = 1'bx;
(* ASYNC_REG *) 
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "FDR" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  FDRE #(
    .INIT(1'b0),
    .XON("FALSE")) 
    \GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.CROSS_PLEVEL_IN2SCNDRY_s_level_out_d4 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\GENERATE_LEVEL_P_S_CDC.SINGLE_BIT.s_level_out_d3 ),
        .Q(scndry_out),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEAAAAAA8)) 
    lpf_exr_i_1
       (.I0(lpf_exr),
        .I1(p_1_in4_in),
        .I2(p_2_in3_in),
        .I3(scndry_out),
        .I4(exr_lpf),
        .O(lpf_exr_reg));
endmodule

(* ORIG_REF_NAME = "lpf" *) 
module proc_sys_reset_0_lpf
   (lpf_int,
    slowest_sync_clk,
    dcm_locked,
    ext_reset_in,
    mb_debug_sys_rst,
    aux_reset_in);
  output lpf_int;
  input slowest_sync_clk;
  input dcm_locked;
  input ext_reset_in;
  input mb_debug_sys_rst;
  input aux_reset_in;

  wire \ACTIVE_HIGH_AUX.ACT_HI_AUX_n_0 ;
  wire \ACTIVE_HIGH_EXT.ACT_HI_EXT_n_0 ;
  wire Q;
  wire [0:0]asr_lpf;
  wire aux_reset_in;
  wire dcm_locked;
  wire [0:0]exr_lpf;
  wire ext_reset_in;
  wire lpf_asr;
  wire lpf_exr;
  wire lpf_int;
  wire lpf_int0__0;
  wire p_1_in;
  wire p_1_in4_in;
  wire p_2_in;
  wire p_2_in3_in;
  wire p_3_in1_in;
  wire p_3_in6_in;
  wire slowest_sync_clk;
  wire \NLW_ACTIVE_HIGH_EXT.ACT_HI_EXT_mb_debug_sys_rst_UNCONNECTED ;

  proc_sys_reset_0_cdc_sync \ACTIVE_HIGH_AUX.ACT_HI_AUX 
       (.asr_lpf(asr_lpf),
        .aux_reset_in(aux_reset_in),
        .lpf_asr(lpf_asr),
        .lpf_asr_reg(\ACTIVE_HIGH_AUX.ACT_HI_AUX_n_0 ),
        .p_1_in(p_1_in),
        .p_2_in(p_2_in),
        .scndry_out(p_3_in1_in),
        .slowest_sync_clk(slowest_sync_clk));
  proc_sys_reset_0_cdc_sync_0 \ACTIVE_HIGH_EXT.ACT_HI_EXT 
       (.exr_lpf(exr_lpf),
        .ext_reset_in(ext_reset_in),
        .lpf_exr(lpf_exr),
        .lpf_exr_reg(\ACTIVE_HIGH_EXT.ACT_HI_EXT_n_0 ),
        .mb_debug_sys_rst(\NLW_ACTIVE_HIGH_EXT.ACT_HI_EXT_mb_debug_sys_rst_UNCONNECTED ),
        .p_1_in4_in(p_1_in4_in),
        .p_2_in3_in(p_2_in3_in),
        .scndry_out(p_3_in6_in),
        .slowest_sync_clk(slowest_sync_clk));
  FDRE #(
    .INIT(1'b0)) 
    \AUX_LPF[1].asr_lpf_reg[1] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_3_in1_in),
        .Q(p_2_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUX_LPF[2].asr_lpf_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_2_in),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUX_LPF[3].asr_lpf_reg[3] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_1_in),
        .Q(asr_lpf),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXT_LPF[1].exr_lpf_reg[1] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_3_in6_in),
        .Q(p_2_in3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXT_LPF[2].exr_lpf_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_2_in3_in),
        .Q(p_1_in4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \EXT_LPF[3].exr_lpf_reg[3] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_1_in4_in),
        .Q(exr_lpf),
        .R(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* XILINX_LEGACY_PRIM = "SRL16" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* srl_name = "U0/\\EXT_LPF/POR_SRL_I " *) 
  SRL16E #(
    .INIT(16'hFFFF)) 
    POR_SRL_I
       (.A0(1'b1),
        .A1(1'b1),
        .A2(1'b1),
        .A3(1'b1),
        .CE(1'b1),
        .CLK(slowest_sync_clk),
        .D(1'b0),
        .Q(Q));
  FDRE #(
    .INIT(1'b0)) 
    lpf_asr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\ACTIVE_HIGH_AUX.ACT_HI_AUX_n_0 ),
        .Q(lpf_asr),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    lpf_exr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\ACTIVE_HIGH_EXT.ACT_HI_EXT_n_0 ),
        .Q(lpf_exr),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFFD)) 
    lpf_int0
       (.I0(dcm_locked),
        .I1(lpf_exr),
        .I2(lpf_asr),
        .I3(Q),
        .O(lpf_int0__0));
  FDRE #(
    .INIT(1'b0)) 
    lpf_int_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(lpf_int0__0),
        .Q(lpf_int),
        .R(1'b0));
endmodule

(* C_AUX_RESET_HIGH = "1'b1" *) (* C_AUX_RST_WIDTH = "4" *) (* C_EXT_RESET_HIGH = "1'b1" *) 
(* C_EXT_RST_WIDTH = "4" *) (* C_FAMILY = "kintexuplus" *) (* C_NUM_BUS_RST = "1" *) 
(* C_NUM_INTERCONNECT_ARESETN = "1" *) (* C_NUM_PERP_ARESETN = "1" *) (* C_NUM_PERP_RST = "1" *) 
(* ORIG_REF_NAME = "proc_sys_reset" *) 
module proc_sys_reset_0_proc_sys_reset
   (slowest_sync_clk,
    ext_reset_in,
    aux_reset_in,
    mb_debug_sys_rst,
    dcm_locked,
    mb_reset,
    bus_struct_reset,
    peripheral_reset,
    interconnect_aresetn,
    peripheral_aresetn);
  input slowest_sync_clk;
  input ext_reset_in;
  input aux_reset_in;
  input mb_debug_sys_rst;
  input dcm_locked;
  output mb_reset;
  output [0:0]bus_struct_reset;
  output [0:0]peripheral_reset;
  output [0:0]interconnect_aresetn;
  output [0:0]peripheral_aresetn;

  wire SEQ_n_4;
  wire aux_reset_in;
  wire dcm_locked;
  wire ext_reset_in;
  wire lpf_int;
  wire [0:0]peripheral_aresetn;
  wire slowest_sync_clk;
  wire NLW_EXT_LPF_mb_debug_sys_rst_UNCONNECTED;
  wire NLW_SEQ_Bsr_out_UNCONNECTED;
  wire NLW_SEQ_MB_out_UNCONNECTED;
  wire NLW_SEQ_Pr_out_UNCONNECTED;
  wire NLW_SEQ_bsr_reg_0_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(SEQ_n_4),
        .Q(peripheral_aresetn),
        .R(1'b0));
  proc_sys_reset_0_lpf EXT_LPF
       (.aux_reset_in(aux_reset_in),
        .dcm_locked(dcm_locked),
        .ext_reset_in(ext_reset_in),
        .lpf_int(lpf_int),
        .mb_debug_sys_rst(NLW_EXT_LPF_mb_debug_sys_rst_UNCONNECTED),
        .slowest_sync_clk(slowest_sync_clk));
  proc_sys_reset_0_sequence_psr SEQ
       (.Bsr_out(NLW_SEQ_Bsr_out_UNCONNECTED),
        .MB_out(NLW_SEQ_MB_out_UNCONNECTED),
        .Pr_out(NLW_SEQ_Pr_out_UNCONNECTED),
        .bsr_reg_0(NLW_SEQ_bsr_reg_0_UNCONNECTED),
        .lpf_int(lpf_int),
        .pr_reg_0(SEQ_n_4),
        .slowest_sync_clk(slowest_sync_clk));
endmodule

(* ORIG_REF_NAME = "sequence_psr" *) 
module proc_sys_reset_0_sequence_psr
   (MB_out,
    Bsr_out,
    Pr_out,
    bsr_reg_0,
    pr_reg_0,
    lpf_int,
    slowest_sync_clk);
  output MB_out;
  output Bsr_out;
  output Pr_out;
  output bsr_reg_0;
  output pr_reg_0;
  input lpf_int;
  input slowest_sync_clk;

  wire Core_i_1_n_0;
  wire \^MB_out ;
  wire \^Pr_out ;
  wire \core_dec[0]_i_1_n_0 ;
  wire \core_dec[2]_i_1_n_0 ;
  wire \core_dec_reg_n_0_[0] ;
  wire \core_dec_reg_n_0_[1] ;
  wire from_sys_i_1_n_0;
  wire lpf_int;
  wire p_0_in;
  wire [2:0]p_3_out;
  wire pr_dec0__0;
  wire \pr_dec_reg_n_0_[0] ;
  wire \pr_dec_reg_n_0_[2] ;
  wire pr_i_1_n_0;
  wire pr_reg_0;
  wire seq_clr;
  wire [5:0]seq_cnt;
  wire seq_cnt_en;
  wire slowest_sync_clk;

  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N_i_1 
       (.I0(\^Pr_out ),
        .O(pr_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h2)) 
    Core_i_1
       (.I0(\^MB_out ),
        .I1(p_0_in),
        .O(Core_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    Core_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(Core_i_1_n_0),
        .Q(\^MB_out ),
        .S(lpf_int));
  proc_sys_reset_0_upcnt_n SEQ_COUNTER
       (.Q(seq_cnt),
        .seq_clr(seq_clr),
        .seq_cnt_en(seq_cnt_en),
        .slowest_sync_clk(slowest_sync_clk));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h9000)) 
    \core_dec[0]_i_1 
       (.I0(seq_cnt_en),
        .I1(seq_cnt[4]),
        .I2(seq_cnt[3]),
        .I3(seq_cnt[5]),
        .O(\core_dec[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \core_dec[2]_i_1 
       (.I0(\core_dec_reg_n_0_[1] ),
        .I1(\core_dec_reg_n_0_[0] ),
        .O(\core_dec[2]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \core_dec_reg[0] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\core_dec[0]_i_1_n_0 ),
        .Q(\core_dec_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \core_dec_reg[1] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(pr_dec0__0),
        .Q(\core_dec_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \core_dec_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(\core_dec[2]_i_1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h8)) 
    from_sys_i_1
       (.I0(\^MB_out ),
        .I1(seq_cnt_en),
        .O(from_sys_i_1_n_0));
  FDSE #(
    .INIT(1'b0)) 
    from_sys_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(from_sys_i_1_n_0),
        .Q(seq_cnt_en),
        .S(lpf_int));
  LUT4 #(
    .INIT(16'h0018)) 
    pr_dec0
       (.I0(seq_cnt_en),
        .I1(seq_cnt[0]),
        .I2(seq_cnt[2]),
        .I3(seq_cnt[1]),
        .O(pr_dec0__0));
  LUT4 #(
    .INIT(16'h0480)) 
    \pr_dec[0]_i_1 
       (.I0(seq_cnt_en),
        .I1(seq_cnt[3]),
        .I2(seq_cnt[5]),
        .I3(seq_cnt[4]),
        .O(p_3_out[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \pr_dec[2]_i_1 
       (.I0(\core_dec_reg_n_0_[1] ),
        .I1(\pr_dec_reg_n_0_[0] ),
        .O(p_3_out[2]));
  FDRE #(
    .INIT(1'b0)) 
    \pr_dec_reg[0] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_3_out[0]),
        .Q(\pr_dec_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \pr_dec_reg[2] 
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(p_3_out[2]),
        .Q(\pr_dec_reg_n_0_[2] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h2)) 
    pr_i_1
       (.I0(\^Pr_out ),
        .I1(\pr_dec_reg_n_0_[2] ),
        .O(pr_i_1_n_0));
  FDSE #(
    .INIT(1'b1)) 
    pr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(pr_i_1_n_0),
        .Q(\^Pr_out ),
        .S(lpf_int));
  FDRE #(
    .INIT(1'b0)) 
    seq_clr_reg
       (.C(slowest_sync_clk),
        .CE(1'b1),
        .D(1'b1),
        .Q(seq_clr),
        .R(lpf_int));
endmodule

(* ORIG_REF_NAME = "upcnt_n" *) 
module proc_sys_reset_0_upcnt_n
   (Q,
    seq_clr,
    seq_cnt_en,
    slowest_sync_clk);
  output [5:0]Q;
  input seq_clr;
  input seq_cnt_en;
  input slowest_sync_clk;

  wire [5:0]Q;
  wire [5:0]q_int0;
  wire seq_clr;
  wire seq_cnt_en;
  wire slowest_sync_clk;

  LUT1 #(
    .INIT(2'h1)) 
    \q_int[0]_i_1 
       (.I0(Q[0]),
        .O(q_int0[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \q_int[1]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(q_int0[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \q_int[2]_i_1 
       (.I0(Q[0]),
        .I1(Q[1]),
        .I2(Q[2]),
        .O(q_int0[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \q_int[3]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[3]),
        .O(q_int0[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \q_int[4]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[3]),
        .I4(Q[4]),
        .O(q_int0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \q_int[5]_i_2 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .I4(Q[4]),
        .I5(Q[5]),
        .O(q_int0[5]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .INIT(1'b1),
    .IS_R_INVERTED(1'b1)) 
    \q_int_reg[0] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[0]),
        .Q(Q[0]),
        .R(seq_clr));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .INIT(1'b1),
    .IS_R_INVERTED(1'b1)) 
    \q_int_reg[1] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[1]),
        .Q(Q[1]),
        .R(seq_clr));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .INIT(1'b1),
    .IS_R_INVERTED(1'b1)) 
    \q_int_reg[2] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[2]),
        .Q(Q[2]),
        .R(seq_clr));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .INIT(1'b1),
    .IS_R_INVERTED(1'b1)) 
    \q_int_reg[3] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[3]),
        .Q(Q[3]),
        .R(seq_clr));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .INIT(1'b1),
    .IS_R_INVERTED(1'b1)) 
    \q_int_reg[4] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[4]),
        .Q(Q[4]),
        .R(seq_clr));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .INIT(1'b1),
    .IS_R_INVERTED(1'b1)) 
    \q_int_reg[5] 
       (.C(slowest_sync_clk),
        .CE(seq_cnt_en),
        .D(q_int0[5]),
        .Q(Q[5]),
        .R(seq_clr));
endmodule

module uart_tx
   (UART_TX_o_OBUF,
    in0,
    CLK,
    tx_reg_reg_0,
    out,
    D);
  output UART_TX_o_OBUF;
  output in0;
  input CLK;
  input tx_reg_reg_0;
  input out;
  input [7:0]D;

  wire CLK;
  wire [7:0]D;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_3_n_0 ;
  wire \FSM_onehot_state[3]_i_4_n_0 ;
  wire \FSM_onehot_state[3]_i_5_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[2] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire UART_TX_o_OBUF;
  wire bit_cnt;
  wire \bit_cnt[0]_i_1_n_0 ;
  wire \bit_cnt[1]_i_1_n_0 ;
  wire \bit_cnt[2]_i_2_n_0 ;
  wire \bit_cnt_reg_n_0_[0] ;
  wire \bit_cnt_reg_n_0_[1] ;
  wire \bit_cnt_reg_n_0_[2] ;
  wire [15:0]cycle_cnt;
  wire \cycle_cnt[0]_i_1_n_0 ;
  wire \cycle_cnt[10]_i_10_n_0 ;
  wire \cycle_cnt[10]_i_1_n_0 ;
  wire \cycle_cnt[10]_i_2_n_0 ;
  wire \cycle_cnt[10]_i_3_n_0 ;
  wire \cycle_cnt[10]_i_4_n_0 ;
  wire \cycle_cnt[10]_i_5_n_0 ;
  wire \cycle_cnt[10]_i_6_n_0 ;
  wire \cycle_cnt[10]_i_7_n_0 ;
  wire \cycle_cnt[10]_i_8_n_0 ;
  wire \cycle_cnt[10]_i_9_n_0 ;
  wire \cycle_cnt[11]_i_1_n_0 ;
  wire \cycle_cnt[11]_i_2_n_0 ;
  wire \cycle_cnt[11]_i_3_n_0 ;
  wire \cycle_cnt[12]_i_1_n_0 ;
  wire \cycle_cnt[13]_i_1_n_0 ;
  wire \cycle_cnt[14]_i_1_n_0 ;
  wire \cycle_cnt[15]_i_1_n_0 ;
  wire \cycle_cnt[15]_i_2_n_0 ;
  wire \cycle_cnt[15]_i_3_n_0 ;
  wire \cycle_cnt[15]_i_4_n_0 ;
  wire \cycle_cnt[1]_i_1_n_0 ;
  wire \cycle_cnt[2]_i_1_n_0 ;
  wire \cycle_cnt[3]_i_1_n_0 ;
  wire \cycle_cnt[3]_i_2_n_0 ;
  wire \cycle_cnt[3]_i_3_n_0 ;
  wire \cycle_cnt[4]_i_1_n_0 ;
  wire \cycle_cnt[5]_i_1_n_0 ;
  wire \cycle_cnt[5]_i_2_n_0 ;
  wire \cycle_cnt[6]_i_1_n_0 ;
  wire \cycle_cnt[6]_i_2_n_0 ;
  wire \cycle_cnt[6]_i_3_n_0 ;
  wire \cycle_cnt[6]_i_4_n_0 ;
  wire \cycle_cnt[7]_i_1_n_0 ;
  wire \cycle_cnt[7]_i_2_n_0 ;
  wire \cycle_cnt[7]_i_3_n_0 ;
  wire \cycle_cnt[7]_i_4_n_0 ;
  wire \cycle_cnt[7]_i_5_n_0 ;
  wire \cycle_cnt[7]_i_6_n_0 ;
  wire \cycle_cnt[7]_i_7_n_0 ;
  wire \cycle_cnt[8]_i_1_n_0 ;
  wire \cycle_cnt[9]_i_1_n_0 ;
  wire \cycle_cnt[9]_i_2_n_0 ;
  wire in0;
  wire out;
  wire [7:0]tx_data_latch;
  wire tx_data_latch0;
  wire tx_data_ready_i_1_n_0;
  wire tx_reg;
  wire tx_reg_i_2_n_0;
  wire tx_reg_i_3_n_0;
  wire tx_reg_i_4_n_0;
  wire tx_reg_i_5_n_0;
  wire tx_reg_reg_0;

  LUT4 #(
    .INIT(16'hAE0C)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_state[3]_i_3_n_0 ),
        .I3(out),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h88F8)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(out),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF00FFFFFF007F00)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\bit_cnt_reg_n_0_[1] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .I2(\bit_cnt_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_state[3]_i_3_n_0 ),
        .I5(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hACA0A0A0A0A0A0A0)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(\FSM_onehot_state[3]_i_3_n_0 ),
        .I3(\bit_cnt_reg_n_0_[1] ),
        .I4(\bit_cnt_reg_n_0_[0] ),
        .I5(\bit_cnt_reg_n_0_[2] ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFEFFF)) 
    \FSM_onehot_state[3]_i_3 
       (.I0(\FSM_onehot_state[3]_i_4_n_0 ),
        .I1(\FSM_onehot_state[3]_i_5_n_0 ),
        .I2(cycle_cnt[10]),
        .I3(cycle_cnt[9]),
        .I4(\cycle_cnt[11]_i_2_n_0 ),
        .I5(cycle_cnt[3]),
        .O(\FSM_onehot_state[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_state[3]_i_4 
       (.I0(cycle_cnt[12]),
        .I1(cycle_cnt[15]),
        .I2(cycle_cnt[13]),
        .I3(cycle_cnt[14]),
        .O(\FSM_onehot_state[3]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_state[3]_i_5 
       (.I0(cycle_cnt[4]),
        .I1(cycle_cnt[8]),
        .I2(cycle_cnt[5]),
        .I3(cycle_cnt[11]),
        .O(\FSM_onehot_state[3]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "S_START:0010,S_SEND_BYTE:0100,S_STOP:1000,S_IDLE:0001" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  FDPE #(
    .INIT(1'b1),
    .IS_PRE_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(tx_reg_reg_0),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "S_START:0010,S_SEND_BYTE:0100,S_STOP:1000,S_IDLE:0001" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "S_START:0010,S_SEND_BYTE:0100,S_STOP:1000,S_IDLE:0001" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ));
  (* FSM_ENCODED_STATES = "S_START:0010,S_SEND_BYTE:0100,S_STOP:1000,S_IDLE:0001" *) 
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \FSM_onehot_state_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ));
  LUT2 #(
    .INIT(4'h2)) 
    \bit_cnt[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[0] ),
        .O(\bit_cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h48)) 
    \bit_cnt[1]_i_1 
       (.I0(\bit_cnt_reg_n_0_[1] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[0] ),
        .O(\bit_cnt[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \bit_cnt[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_state[3]_i_3_n_0 ),
        .O(bit_cnt));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \bit_cnt[2]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[0] ),
        .I3(\bit_cnt_reg_n_0_[1] ),
        .O(\bit_cnt[2]_i_2_n_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \bit_cnt_reg[0] 
       (.C(CLK),
        .CE(bit_cnt),
        .CLR(tx_reg_reg_0),
        .D(\bit_cnt[0]_i_1_n_0 ),
        .Q(\bit_cnt_reg_n_0_[0] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \bit_cnt_reg[1] 
       (.C(CLK),
        .CE(bit_cnt),
        .CLR(tx_reg_reg_0),
        .D(\bit_cnt[1]_i_1_n_0 ),
        .Q(\bit_cnt_reg_n_0_[1] ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \bit_cnt_reg[2] 
       (.C(CLK),
        .CE(bit_cnt),
        .CLR(tx_reg_reg_0),
        .D(\bit_cnt[2]_i_2_n_0 ),
        .Q(\bit_cnt_reg_n_0_[2] ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h5545)) 
    \cycle_cnt[0]_i_1 
       (.I0(cycle_cnt[0]),
        .I1(out),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\cycle_cnt[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFB00)) 
    \cycle_cnt[10]_i_1 
       (.I0(\cycle_cnt[10]_i_2_n_0 ),
        .I1(\cycle_cnt[10]_i_3_n_0 ),
        .I2(\cycle_cnt[10]_i_4_n_0 ),
        .I3(cycle_cnt[10]),
        .I4(\cycle_cnt[10]_i_5_n_0 ),
        .I5(\cycle_cnt[10]_i_6_n_0 ),
        .O(\cycle_cnt[10]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    \cycle_cnt[10]_i_10 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\cycle_cnt[10]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'hCCCCEEEECCCCFFFC)) 
    \cycle_cnt[10]_i_2 
       (.I0(\cycle_cnt[15]_i_4_n_0 ),
        .I1(\cycle_cnt[10]_i_7_n_0 ),
        .I2(\FSM_onehot_state[3]_i_5_n_0 ),
        .I3(\FSM_onehot_state[3]_i_4_n_0 ),
        .I4(\cycle_cnt[15]_i_3_n_0 ),
        .I5(cycle_cnt[3]),
        .O(\cycle_cnt[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEAAAAAAAAAAAAAAA)) 
    \cycle_cnt[10]_i_3 
       (.I0(\cycle_cnt[15]_i_3_n_0 ),
        .I1(cycle_cnt[6]),
        .I2(cycle_cnt[2]),
        .I3(cycle_cnt[1]),
        .I4(cycle_cnt[0]),
        .I5(cycle_cnt[7]),
        .O(\cycle_cnt[10]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h5545)) 
    \cycle_cnt[10]_i_4 
       (.I0(cycle_cnt[9]),
        .I1(out),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\cycle_cnt[10]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000010000)) 
    \cycle_cnt[10]_i_5 
       (.I0(\FSM_onehot_state[3]_i_4_n_0 ),
        .I1(\FSM_onehot_state[3]_i_5_n_0 ),
        .I2(\cycle_cnt[10]_i_8_n_0 ),
        .I3(\cycle_cnt[10]_i_9_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .I5(\cycle_cnt[10]_i_10_n_0 ),
        .O(\cycle_cnt[10]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \cycle_cnt[10]_i_6 
       (.I0(\cycle_cnt[15]_i_3_n_0 ),
        .I1(cycle_cnt[3]),
        .I2(\cycle_cnt[11]_i_2_n_0 ),
        .I3(cycle_cnt[10]),
        .I4(cycle_cnt[9]),
        .I5(\cycle_cnt[15]_i_4_n_0 ),
        .O(\cycle_cnt[10]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000045)) 
    \cycle_cnt[10]_i_7 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(out),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(cycle_cnt[3]),
        .O(\cycle_cnt[10]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \cycle_cnt[10]_i_8 
       (.I0(cycle_cnt[10]),
        .I1(cycle_cnt[9]),
        .O(\cycle_cnt[10]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFFFFFFFFFF)) 
    \cycle_cnt[10]_i_9 
       (.I0(cycle_cnt[3]),
        .I1(cycle_cnt[6]),
        .I2(cycle_cnt[2]),
        .I3(cycle_cnt[1]),
        .I4(cycle_cnt[0]),
        .I5(cycle_cnt[7]),
        .O(\cycle_cnt[10]_i_9_n_0 ));
  LUT5 #(
    .INIT(32'h55510004)) 
    \cycle_cnt[11]_i_1 
       (.I0(\cycle_cnt[15]_i_3_n_0 ),
        .I1(cycle_cnt[3]),
        .I2(\cycle_cnt[11]_i_2_n_0 ),
        .I3(\cycle_cnt[11]_i_3_n_0 ),
        .I4(cycle_cnt[11]),
        .O(\cycle_cnt[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \cycle_cnt[11]_i_2 
       (.I0(cycle_cnt[7]),
        .I1(cycle_cnt[0]),
        .I2(cycle_cnt[1]),
        .I3(cycle_cnt[2]),
        .I4(cycle_cnt[6]),
        .O(\cycle_cnt[11]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \cycle_cnt[11]_i_3 
       (.I0(cycle_cnt[9]),
        .I1(cycle_cnt[10]),
        .I2(cycle_cnt[8]),
        .I3(cycle_cnt[5]),
        .I4(cycle_cnt[4]),
        .O(\cycle_cnt[11]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h99999099)) 
    \cycle_cnt[12]_i_1 
       (.I0(\cycle_cnt[15]_i_2_n_0 ),
        .I1(cycle_cnt[12]),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(out),
        .O(\cycle_cnt[12]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hD2D2D2D2D200D2D2)) 
    \cycle_cnt[13]_i_1 
       (.I0(cycle_cnt[12]),
        .I1(\cycle_cnt[15]_i_2_n_0 ),
        .I2(cycle_cnt[13]),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(out),
        .O(\cycle_cnt[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000DF20)) 
    \cycle_cnt[14]_i_1 
       (.I0(cycle_cnt[13]),
        .I1(\cycle_cnt[15]_i_2_n_0 ),
        .I2(cycle_cnt[12]),
        .I3(cycle_cnt[14]),
        .I4(\cycle_cnt[15]_i_3_n_0 ),
        .O(\cycle_cnt[14]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000DFFF2000)) 
    \cycle_cnt[15]_i_1 
       (.I0(cycle_cnt[13]),
        .I1(\cycle_cnt[15]_i_2_n_0 ),
        .I2(cycle_cnt[12]),
        .I3(cycle_cnt[14]),
        .I4(cycle_cnt[15]),
        .I5(\cycle_cnt[15]_i_3_n_0 ),
        .O(\cycle_cnt[15]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFFFFFFFFFF)) 
    \cycle_cnt[15]_i_2 
       (.I0(\cycle_cnt[11]_i_2_n_0 ),
        .I1(cycle_cnt[3]),
        .I2(cycle_cnt[9]),
        .I3(cycle_cnt[10]),
        .I4(\cycle_cnt[15]_i_4_n_0 ),
        .I5(cycle_cnt[11]),
        .O(\cycle_cnt[15]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \cycle_cnt[15]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(out),
        .O(\cycle_cnt[15]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \cycle_cnt[15]_i_4 
       (.I0(cycle_cnt[4]),
        .I1(cycle_cnt[5]),
        .I2(cycle_cnt[8]),
        .O(\cycle_cnt[15]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h66666066)) 
    \cycle_cnt[1]_i_1 
       (.I0(cycle_cnt[0]),
        .I1(cycle_cnt[1]),
        .I2(out),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\cycle_cnt[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FBFB00FB00FB00)) 
    \cycle_cnt[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(out),
        .I3(cycle_cnt[2]),
        .I4(cycle_cnt[1]),
        .I5(cycle_cnt[0]),
        .O(\cycle_cnt[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAAFEAAFEFFFEAAFE)) 
    \cycle_cnt[3]_i_1 
       (.I0(\cycle_cnt[10]_i_5_n_0 ),
        .I1(\cycle_cnt[3]_i_2_n_0 ),
        .I2(\cycle_cnt[6]_i_3_n_0 ),
        .I3(\cycle_cnt[5]_i_2_n_0 ),
        .I4(cycle_cnt[3]),
        .I5(\cycle_cnt[15]_i_3_n_0 ),
        .O(\cycle_cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h000001000F0F0F00)) 
    \cycle_cnt[3]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(cycle_cnt[3]),
        .I3(\cycle_cnt[3]_i_3_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .I5(cycle_cnt[6]),
        .O(\cycle_cnt[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \cycle_cnt[3]_i_3 
       (.I0(out),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\cycle_cnt[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000006AAAAAAA)) 
    \cycle_cnt[4]_i_1 
       (.I0(cycle_cnt[4]),
        .I1(cycle_cnt[2]),
        .I2(cycle_cnt[1]),
        .I3(cycle_cnt[0]),
        .I4(cycle_cnt[3]),
        .I5(\cycle_cnt[15]_i_3_n_0 ),
        .O(\cycle_cnt[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h22122222)) 
    \cycle_cnt[5]_i_1 
       (.I0(cycle_cnt[5]),
        .I1(\cycle_cnt[15]_i_3_n_0 ),
        .I2(cycle_cnt[3]),
        .I3(\cycle_cnt[5]_i_2_n_0 ),
        .I4(cycle_cnt[4]),
        .O(\cycle_cnt[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \cycle_cnt[5]_i_2 
       (.I0(cycle_cnt[0]),
        .I1(cycle_cnt[1]),
        .I2(cycle_cnt[2]),
        .O(\cycle_cnt[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEFFAFAFAEA)) 
    \cycle_cnt[6]_i_1 
       (.I0(\cycle_cnt[10]_i_5_n_0 ),
        .I1(\cycle_cnt[6]_i_2_n_0 ),
        .I2(cycle_cnt[6]),
        .I3(\cycle_cnt[7]_i_3_n_0 ),
        .I4(\cycle_cnt[6]_i_3_n_0 ),
        .I5(\cycle_cnt[6]_i_4_n_0 ),
        .O(\cycle_cnt[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F7F7F7F7F007F7F)) 
    \cycle_cnt[6]_i_2 
       (.I0(cycle_cnt[2]),
        .I1(cycle_cnt[1]),
        .I2(cycle_cnt[0]),
        .I3(out),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\cycle_cnt[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00000000FFFFFF7F)) 
    \cycle_cnt[6]_i_3 
       (.I0(cycle_cnt[7]),
        .I1(cycle_cnt[9]),
        .I2(cycle_cnt[10]),
        .I3(\FSM_onehot_state[3]_i_5_n_0 ),
        .I4(\FSM_onehot_state[3]_i_4_n_0 ),
        .I5(\cycle_cnt[7]_i_5_n_0 ),
        .O(\cycle_cnt[6]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \cycle_cnt[6]_i_4 
       (.I0(cycle_cnt[5]),
        .I1(cycle_cnt[4]),
        .I2(cycle_cnt[2]),
        .I3(cycle_cnt[1]),
        .I4(cycle_cnt[0]),
        .I5(\cycle_cnt[7]_i_7_n_0 ),
        .O(\cycle_cnt[6]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hFBFBFFFBAAAAAAAA)) 
    \cycle_cnt[7]_i_1 
       (.I0(\cycle_cnt[10]_i_5_n_0 ),
        .I1(\cycle_cnt[7]_i_2_n_0 ),
        .I2(\cycle_cnt[7]_i_3_n_0 ),
        .I3(\cycle_cnt[7]_i_4_n_0 ),
        .I4(\cycle_cnt[7]_i_5_n_0 ),
        .I5(\cycle_cnt[7]_i_6_n_0 ),
        .O(\cycle_cnt[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    \cycle_cnt[7]_i_2 
       (.I0(cycle_cnt[7]),
        .I1(cycle_cnt[6]),
        .I2(cycle_cnt[2]),
        .I3(cycle_cnt[1]),
        .I4(cycle_cnt[0]),
        .I5(\cycle_cnt[15]_i_3_n_0 ),
        .O(\cycle_cnt[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hAABABABA)) 
    \cycle_cnt[7]_i_3 
       (.I0(\cycle_cnt[10]_i_7_n_0 ),
        .I1(\cycle_cnt[15]_i_3_n_0 ),
        .I2(cycle_cnt[3]),
        .I3(cycle_cnt[5]),
        .I4(cycle_cnt[4]),
        .O(\cycle_cnt[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \cycle_cnt[7]_i_4 
       (.I0(\cycle_cnt[10]_i_8_n_0 ),
        .I1(\FSM_onehot_state[3]_i_5_n_0 ),
        .I2(cycle_cnt[12]),
        .I3(cycle_cnt[15]),
        .I4(cycle_cnt[13]),
        .I5(cycle_cnt[14]),
        .O(\cycle_cnt[7]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'hAABA)) 
    \cycle_cnt[7]_i_5 
       (.I0(cycle_cnt[3]),
        .I1(out),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\cycle_cnt[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAEAAA)) 
    \cycle_cnt[7]_i_6 
       (.I0(cycle_cnt[7]),
        .I1(cycle_cnt[6]),
        .I2(cycle_cnt[5]),
        .I3(cycle_cnt[4]),
        .I4(\cycle_cnt[5]_i_2_n_0 ),
        .I5(\cycle_cnt[7]_i_7_n_0 ),
        .O(\cycle_cnt[7]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h04FF)) 
    \cycle_cnt[7]_i_7 
       (.I0(out),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(cycle_cnt[3]),
        .O(\cycle_cnt[7]_i_7_n_0 ));
  LUT6 #(
    .INIT(64'h00000000B4F0F0F0)) 
    \cycle_cnt[8]_i_1 
       (.I0(\cycle_cnt[11]_i_2_n_0 ),
        .I1(cycle_cnt[3]),
        .I2(cycle_cnt[8]),
        .I3(cycle_cnt[5]),
        .I4(cycle_cnt[4]),
        .I5(\cycle_cnt[15]_i_3_n_0 ),
        .O(\cycle_cnt[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFF200)) 
    \cycle_cnt[9]_i_1 
       (.I0(\cycle_cnt[11]_i_2_n_0 ),
        .I1(\cycle_cnt[15]_i_3_n_0 ),
        .I2(\cycle_cnt[10]_i_2_n_0 ),
        .I3(cycle_cnt[9]),
        .I4(\cycle_cnt[9]_i_2_n_0 ),
        .I5(\cycle_cnt[10]_i_5_n_0 ),
        .O(\cycle_cnt[9]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000110F00)) 
    \cycle_cnt[9]_i_2 
       (.I0(\cycle_cnt[11]_i_2_n_0 ),
        .I1(\cycle_cnt[15]_i_4_n_0 ),
        .I2(cycle_cnt[10]),
        .I3(cycle_cnt[9]),
        .I4(cycle_cnt[3]),
        .I5(\cycle_cnt[15]_i_3_n_0 ),
        .O(\cycle_cnt[9]_i_2_n_0 ));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[0]_i_1_n_0 ),
        .Q(cycle_cnt[0]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[10]_i_1_n_0 ),
        .Q(cycle_cnt[10]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[11]_i_1_n_0 ),
        .Q(cycle_cnt[11]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[12]_i_1_n_0 ),
        .Q(cycle_cnt[12]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[13]_i_1_n_0 ),
        .Q(cycle_cnt[13]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[14]_i_1_n_0 ),
        .Q(cycle_cnt[14]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[15]_i_1_n_0 ),
        .Q(cycle_cnt[15]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[1]_i_1_n_0 ),
        .Q(cycle_cnt[1]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[2]_i_1_n_0 ),
        .Q(cycle_cnt[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[3]_i_1_n_0 ),
        .Q(cycle_cnt[3]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[4]_i_1_n_0 ),
        .Q(cycle_cnt[4]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[5]_i_1_n_0 ),
        .Q(cycle_cnt[5]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[6]_i_1_n_0 ),
        .Q(cycle_cnt[6]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[7]_i_1_n_0 ),
        .Q(cycle_cnt[7]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[8]_i_1_n_0 ),
        .Q(cycle_cnt[8]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \cycle_cnt_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(\cycle_cnt[9]_i_1_n_0 ),
        .Q(cycle_cnt[9]));
  LUT2 #(
    .INIT(4'h2)) 
    \tx_data_latch[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(out),
        .O(tx_data_latch0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[0] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[0]),
        .Q(tx_data_latch[0]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[1] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[1]),
        .Q(tx_data_latch[1]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[2] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[2]),
        .Q(tx_data_latch[2]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[3] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[3]),
        .Q(tx_data_latch[3]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[4] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[4]),
        .Q(tx_data_latch[4]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[5] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[5]),
        .Q(tx_data_latch[5]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[6] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[6]),
        .Q(tx_data_latch[6]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    \tx_data_latch_reg[7] 
       (.C(CLK),
        .CE(tx_data_latch0),
        .CLR(tx_reg_reg_0),
        .D(D[7]),
        .Q(tx_data_latch[7]));
  LUT5 #(
    .INIT(32'hBBBB8B88)) 
    tx_data_ready_i_1
       (.I0(out),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state[3]_i_3_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[3] ),
        .I4(in0),
        .O(tx_data_ready_i_1_n_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDCE #(
    .INIT(1'b0),
    .IS_CLR_INVERTED(1'b1)) 
    tx_data_ready_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(tx_reg_reg_0),
        .D(tx_data_ready_i_1_n_0),
        .Q(in0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    tx_reg_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(tx_reg_i_2_n_0),
        .I3(tx_reg_i_3_n_0),
        .I4(tx_reg_i_4_n_0),
        .I5(tx_reg_i_5_n_0),
        .O(tx_reg));
  LUT6 #(
    .INIT(64'h000000000000E200)) 
    tx_reg_i_2
       (.I0(tx_data_latch[0]),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(tx_data_latch[4]),
        .I3(\FSM_onehot_state_reg_n_0_[2] ),
        .I4(\bit_cnt_reg_n_0_[0] ),
        .I5(\bit_cnt_reg_n_0_[1] ),
        .O(tx_reg_i_2_n_0));
  LUT6 #(
    .INIT(64'h0808080000000800)) 
    tx_reg_i_3
       (.I0(\bit_cnt_reg_n_0_[1] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[0] ),
        .I3(tx_data_latch[2]),
        .I4(\bit_cnt_reg_n_0_[2] ),
        .I5(tx_data_latch[6]),
        .O(tx_reg_i_3_n_0));
  LUT6 #(
    .INIT(64'h0808080000000800)) 
    tx_reg_i_4
       (.I0(\bit_cnt_reg_n_0_[0] ),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(\bit_cnt_reg_n_0_[1] ),
        .I3(tx_data_latch[1]),
        .I4(\bit_cnt_reg_n_0_[2] ),
        .I5(tx_data_latch[5]),
        .O(tx_reg_i_4_n_0));
  LUT6 #(
    .INIT(64'hE200000000000000)) 
    tx_reg_i_5
       (.I0(tx_data_latch[3]),
        .I1(\bit_cnt_reg_n_0_[2] ),
        .I2(tx_data_latch[7]),
        .I3(\bit_cnt_reg_n_0_[1] ),
        .I4(\bit_cnt_reg_n_0_[0] ),
        .I5(\FSM_onehot_state_reg_n_0_[2] ),
        .O(tx_reg_i_5_n_0));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDPE #(
    .INIT(1'b1),
    .IS_PRE_INVERTED(1'b1)) 
    tx_reg_reg
       (.C(CLK),
        .CE(1'b1),
        .D(tx_reg),
        .PRE(tx_reg_reg_0),
        .Q(UART_TX_o_OBUF));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 67584)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
