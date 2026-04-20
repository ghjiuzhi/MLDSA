// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Apr 14 16:56:56 2026
// Host        : gxy running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Project/MLDSA/RO_TRNG/fpga1/xc7z020clg400/xc7z020clg400.gen/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-2
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 94624)
`pragma protect data_block
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
rOG20w==
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
