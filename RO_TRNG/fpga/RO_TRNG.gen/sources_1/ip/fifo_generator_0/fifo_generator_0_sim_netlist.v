// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Jan 16 15:51:02 2025
// Host        : DESKTOP-V7OP3RO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Project/RO_TRNG/fpga/RO_TRNG.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku5p-ffvb676-1-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_9,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module fifo_generator_0
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
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1021" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1020" *) 
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
  fifo_generator_0_fifo_generator_v13_2_9 U0
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

(* DEST_SYNC_FF = "2" *) (* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_gray" *) 
(* REG_OUTPUT = "1" *) (* SIM_ASSERT_CHK = "0" *) (* SIM_LOSSLESS_GRAY_CHK = "0" *) 
(* VERSION = "0" *) (* WIDTH = "10" *) (* XPM_MODULE = "TRUE" *) 
(* is_du_within_envelope = "true" *) (* keep_hierarchy = "true" *) (* xpm_cdc = "GRAY" *) 
module fifo_generator_0_xpm_cdc_gray
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
module fifo_generator_0_xpm_cdc_gray__parameterized1
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 89648)
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
