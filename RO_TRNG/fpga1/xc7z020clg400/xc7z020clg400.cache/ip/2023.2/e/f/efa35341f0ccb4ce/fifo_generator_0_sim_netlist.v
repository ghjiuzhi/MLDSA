// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Apr 14 16:56:55 2026
// Host        : gxy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (wr_clk,
    rd_clk,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 write_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME write_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input wr_clk;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 read_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME read_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input rd_clk;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [0:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [7:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;

  wire [0:0]din;
  wire [7:0]dout;
  wire empty;
  wire full;
  wire rd_clk;
  wire rd_en;
  wire wr_clk;
  wire wr_en;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_rd_rst_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire NLW_U0_wr_rst_busy_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
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
  wire [6:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
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
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "1" *) 
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
  (* C_FAMILY = "zynq" *) 
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
  (* C_IMPLEMENTATION_TYPE = "2" *) 
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
  (* C_PRELOAD_LATENCY = "0" *) 
  (* C_PRELOAD_REGS = "1" *) 
  (* C_PRIM_FIFO_TYPE = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "4" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "5" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1022" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "7" *) 
  (* C_RD_DEPTH = "128" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "7" *) 
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_fifo_generator_v13_2_9 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(NLW_U0_data_count_UNCONNECTED[9:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
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
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(rd_clk),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[6:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(NLW_U0_rd_rst_busy_UNCONNECTED),
        .rst(1'b0),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(wr_clk),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[9:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(NLW_U0_wr_rst_busy_UNCONNECTED));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* REG_OUTPUT = "1" *) 
(* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) (* VERSION = "0" *) 
(* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [9:0]src_in_bin;
  input dest_clk;
  output [9:0]dest_out_bin;

  wire [9:0]async_path;
  wire [8:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [9:0]\dest_graysync_ff[1] ;
  wire [9:0]dest_out_bin;
  wire [8:0]gray_enc;
  wire src_clk;
  wire [9:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[7]),
        .Q(\dest_graysync_ff[0] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[8]),
        .Q(\dest_graysync_ff[0] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[9]),
        .Q(\dest_graysync_ff[0] [9]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [7]),
        .Q(\dest_graysync_ff[1] [7]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [8]),
        .Q(\dest_graysync_ff[1] [8]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [9]),
        .Q(\dest_graysync_ff[1] [9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(\dest_graysync_ff[1] [2]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [3]),
        .I4(\dest_graysync_ff[1] [1]),
        .O(binval[0]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(binval[4]),
        .I3(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(binval[4]),
        .I2(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(binval[4]),
        .O(binval[3]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [8]),
        .I3(\dest_graysync_ff[1] [9]),
        .I4(\dest_graysync_ff[1] [7]),
        .I5(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [7]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [8]),
        .I4(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[6]_i_1 
       (.I0(\dest_graysync_ff[1] [6]),
        .I1(\dest_graysync_ff[1] [8]),
        .I2(\dest_graysync_ff[1] [9]),
        .I3(\dest_graysync_ff[1] [7]),
        .O(binval[6]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[7]_i_1 
       (.I0(\dest_graysync_ff[1] [7]),
        .I1(\dest_graysync_ff[1] [9]),
        .I2(\dest_graysync_ff[1] [8]),
        .O(binval[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[8]_i_1 
       (.I0(\dest_graysync_ff[1] [8]),
        .I1(\dest_graysync_ff[1] [9]),
        .O(binval[8]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[7] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[7]),
        .Q(dest_out_bin[7]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[8] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[8]),
        .Q(dest_out_bin[8]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[9] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [9]),
        .Q(dest_out_bin[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[6]_i_1 
       (.I0(src_in_bin[7]),
        .I1(src_in_bin[6]),
        .O(gray_enc[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[7]_i_1 
       (.I0(src_in_bin[8]),
        .I1(src_in_bin[7]),
        .O(gray_enc[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[8]_i_1 
       (.I0(src_in_bin[9]),
        .I1(src_in_bin[8]),
        .O(gray_enc[8]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[6]),
        .Q(async_path[6]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[7] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[7]),
        .Q(async_path[7]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[8] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[8]),
        .Q(async_path[8]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[9] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[9]),
        .Q(async_path[9]),
        .R(1'b0));
endmodule

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "7" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_gray__parameterized1
   (src_clk,
    src_in_bin,
    dest_clk,
    dest_out_bin);
  input src_clk;
  input [6:0]src_in_bin;
  input dest_clk;
  output [6:0]dest_out_bin;

  wire [6:0]async_path;
  wire [5:0]binval;
  wire dest_clk;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[0] ;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "GRAY" *) wire [6:0]\dest_graysync_ff[1] ;
  wire [6:0]dest_out_bin;
  wire [5:0]gray_enc;
  wire src_clk;
  wire [6:0]src_in_bin;

  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[0]),
        .Q(\dest_graysync_ff[0] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[1]),
        .Q(\dest_graysync_ff[0] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[2]),
        .Q(\dest_graysync_ff[0] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[3]),
        .Q(\dest_graysync_ff[0] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[4]),
        .Q(\dest_graysync_ff[0] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[5]),
        .Q(\dest_graysync_ff[0] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[0][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(async_path[6]),
        .Q(\dest_graysync_ff[0] [6]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [0]),
        .Q(\dest_graysync_ff[1] [0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [1]),
        .Q(\dest_graysync_ff[1] [1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [2]),
        .Q(\dest_graysync_ff[1] [2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [3]),
        .Q(\dest_graysync_ff[1] [3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [4]),
        .Q(\dest_graysync_ff[1] [4]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [5]),
        .Q(\dest_graysync_ff[1] [5]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "GRAY" *) 
  FDRE \dest_graysync_ff_reg[1][6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[0] [6]),
        .Q(\dest_graysync_ff[1] [6]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[0]_i_1 
       (.I0(\dest_graysync_ff[1] [0]),
        .I1(binval[1]),
        .O(binval[0]));
  LUT6 #(
    .INIT(64'h6996966996696996)) 
    \dest_out_bin_ff[1]_i_1 
       (.I0(\dest_graysync_ff[1] [1]),
        .I1(\dest_graysync_ff[1] [3]),
        .I2(\dest_graysync_ff[1] [5]),
        .I3(\dest_graysync_ff[1] [6]),
        .I4(\dest_graysync_ff[1] [4]),
        .I5(\dest_graysync_ff[1] [2]),
        .O(binval[1]));
  LUT5 #(
    .INIT(32'h96696996)) 
    \dest_out_bin_ff[2]_i_1 
       (.I0(\dest_graysync_ff[1] [2]),
        .I1(\dest_graysync_ff[1] [4]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [5]),
        .I4(\dest_graysync_ff[1] [3]),
        .O(binval[2]));
  LUT4 #(
    .INIT(16'h6996)) 
    \dest_out_bin_ff[3]_i_1 
       (.I0(\dest_graysync_ff[1] [3]),
        .I1(\dest_graysync_ff[1] [5]),
        .I2(\dest_graysync_ff[1] [6]),
        .I3(\dest_graysync_ff[1] [4]),
        .O(binval[3]));
  LUT3 #(
    .INIT(8'h96)) 
    \dest_out_bin_ff[4]_i_1 
       (.I0(\dest_graysync_ff[1] [4]),
        .I1(\dest_graysync_ff[1] [6]),
        .I2(\dest_graysync_ff[1] [5]),
        .O(binval[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \dest_out_bin_ff[5]_i_1 
       (.I0(\dest_graysync_ff[1] [5]),
        .I1(\dest_graysync_ff[1] [6]),
        .O(binval[5]));
  FDRE \dest_out_bin_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[0]),
        .Q(dest_out_bin[0]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[1]),
        .Q(dest_out_bin[1]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[2]),
        .Q(dest_out_bin[2]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[3]),
        .Q(dest_out_bin[3]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[4]),
        .Q(dest_out_bin[4]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[5] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(binval[5]),
        .Q(dest_out_bin[5]),
        .R(1'b0));
  FDRE \dest_out_bin_ff_reg[6] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(\dest_graysync_ff[1] [6]),
        .Q(dest_out_bin[6]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[0]_i_1 
       (.I0(src_in_bin[1]),
        .I1(src_in_bin[0]),
        .O(gray_enc[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[1]_i_1 
       (.I0(src_in_bin[2]),
        .I1(src_in_bin[1]),
        .O(gray_enc[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[2]_i_1 
       (.I0(src_in_bin[3]),
        .I1(src_in_bin[2]),
        .O(gray_enc[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[3]_i_1 
       (.I0(src_in_bin[4]),
        .I1(src_in_bin[3]),
        .O(gray_enc[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[4]_i_1 
       (.I0(src_in_bin[5]),
        .I1(src_in_bin[4]),
        .O(gray_enc[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \src_gray_ff[5]_i_1 
       (.I0(src_in_bin[6]),
        .I1(src_in_bin[5]),
        .O(gray_enc[5]));
  FDRE \src_gray_ff_reg[0] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[0]),
        .Q(async_path[0]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[1] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[1]),
        .Q(async_path[1]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[2] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[2]),
        .Q(async_path[2]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[3] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[3]),
        .Q(async_path[3]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[4] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[4]),
        .Q(async_path[4]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[5] 
       (.C(src_clk),
        .CE(1'b1),
        .D(gray_enc[5]),
        .Q(async_path[5]),
        .R(1'b0));
  FDRE \src_gray_ff_reg[6] 
       (.C(src_clk),
        .CE(1'b1),
        .D(src_in_bin[6]),
        .Q(async_path[6]),
        .R(1'b0));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 94864)
`pragma protect data_block
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
ze2vx3hjeUwjiIfouQiu9Q==
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
