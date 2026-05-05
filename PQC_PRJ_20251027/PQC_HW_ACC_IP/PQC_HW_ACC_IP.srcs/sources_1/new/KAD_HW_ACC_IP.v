`timescale 1ns / 1ps

(* dont_touch="true" *)
module KAD_HW_ACC_IP#
(
	localparam C_S00_AXI_DATA_WIDTH	= 32,
	localparam C_S00_AXI_ADDR_WIDTH = 5
)
(
	// Ports of Axi Slave Bus Interface S00_AXI
	input	wire										s00_axi_aclk,
	input	wire										s00_axi_aresetn,
	input	wire	[C_S00_AXI_ADDR_WIDTH-1 : 0]		s00_axi_awaddr,
	input	wire	[2 : 0]								s00_axi_awprot,
	input	wire										s00_axi_awvalid,
	output	wire										s00_axi_awready,
	input	wire	[C_S00_AXI_DATA_WIDTH-1 : 0]		s00_axi_wdata,
	input	wire	[(C_S00_AXI_DATA_WIDTH/8)-1 : 0]	s00_axi_wstrb,
	input	wire										s00_axi_wvalid,
	output	wire										s00_axi_wready,
	output	wire	[1 : 0]								s00_axi_bresp,
	output	wire										s00_axi_bvalid,
	input	wire										s00_axi_bready,
	input	wire	[C_S00_AXI_ADDR_WIDTH-1 : 0]		s00_axi_araddr,
	input	wire	[2 : 0]								s00_axi_arprot,
	input	wire										s00_axi_arvalid,
	output	wire										s00_axi_arready,
	output	wire	[C_S00_AXI_DATA_WIDTH-1 : 0]		s00_axi_rdata,
	output	wire	[1 : 0]								s00_axi_rresp,
	output	wire										s00_axi_rvalid,
	input	wire										s00_axi_rready,
    
	input	wire			aresetn,
	input	wire			clk,
	
	//DMA write read_data to slave port
	input	wire			s_axis_tvalid,
	output	wire			s_axis_tready,
	input	wire	[63:0]	s_axis_tdata,
	input	wire	[7:0]	s_axis_tkeep,
	input	wire			s_axis_tlast,
    
	//Send computed data to DMA via master port
	output	wire			m_axis_tvalid,
	input	wire			m_axis_tready,
	output	wire	[63:0]	m_axis_tdata,
	output	wire	[7:0]	m_axis_tkeep,
	output	wire			m_axis_tlast
	
	);
	
	wire	[2:0]	start_module;
	wire			NTT_sel;
	wire	[3:0]	PWM_length;
	wire			PWA_PWS_sel;
	wire	[3:0]	PWA_PWS_length;
	wire	[1:0]	SHA3_mode;
	wire	[31:0]	SHA3_input_length;
	wire	[31:0]	SHA3_output_length;
	wire	[2:0]	Samp_mode;
	wire	[0:0]	Samp_eta;
	wire	[0:0]	PQC_mode;
		
	wire	[31:0]	read_FIFO_count;
	wire	[31:0]	write_FIFO_count;
    
	Top_HW_ACC_Ctrl HW_module(
		.aresetn			(aresetn),
		.clk				(clk),
		.start_module		(start_module),
		.NTT_sel			(NTT_sel),
		.PWM_length			(PWM_length),
		.PWA_PWS_sel		(PWA_PWS_sel),
		.PWA_PWS_length		(PWA_PWS_length),

		.SHA3_mode			(SHA3_mode),
		.SHA3_input_length	(SHA3_input_length),
		.SHA3_output_length	(SHA3_output_length),
		.Samp_mode			(Samp_mode),
		.Samp_eta			(Samp_eta),
		.PQC_mode			(PQC_mode),

		.s_axis_tvalid		(s_axis_tvalid),
		.s_axis_tready		(s_axis_tready),
		.s_axis_tdata		(s_axis_tdata),
		.s_axis_tkeep		(s_axis_tkeep),
		.s_axis_tlast		(s_axis_tlast),
		.m_axis_tvalid		(m_axis_tvalid),
		.m_axis_tready		(m_axis_tready),
		.m_axis_tdata		(m_axis_tdata),
		.m_axis_tkeep		(m_axis_tkeep),
		.m_axis_tlast		(m_axis_tlast),
		
		.read_FIFO_count	(read_FIFO_count),
		.write_FIFO_count	(write_FIFO_count)
	);
                            
	Control_Reg  Ctrl_module(
		.start_module		(start_module),
		.NTT_sel			(NTT_sel),
		.PWM_length			(PWM_length),
		.PWA_PWS_sel		(PWA_PWS_sel),
		.PWA_PWS_length		(PWA_PWS_length),
		
		.SHA3_mode			(SHA3_mode),
		.SHA3_input_length	(SHA3_input_length),
		.SHA3_output_length	(SHA3_output_length),
		.Samp_mode			(Samp_mode),
		.Samp_eta			(Samp_eta),
		.PQC_mode			(PQC_mode),
		
		.read_FIFO_count	(read_FIFO_count),
		.write_FIFO_count	(write_FIFO_count),
	
		.S_AXI_ACLK			(s00_axi_aclk),
		.S_AXI_ARESETN		(s00_axi_aresetn), 
		.S_AXI_AWADDR		(s00_axi_awaddr),
		.S_AXI_AWPROT		(s00_axi_awprot),
		.S_AXI_AWVALID		(s00_axi_awvalid),
		.S_AXI_AWREADY		(s00_axi_awready),
		.S_AXI_WDATA		(s00_axi_wdata),
		.S_AXI_WSTRB		(s00_axi_wstrb),
		.S_AXI_WVALID		(s00_axi_wvalid), 
		.S_AXI_WREADY		(s00_axi_wready),
		.S_AXI_BRESP		(s00_axi_bresp),
		.S_AXI_BVALID		(s00_axi_bvalid),
		.S_AXI_BREADY		(s00_axi_bready),
		.S_AXI_ARADDR		(s00_axi_araddr),
		.S_AXI_ARPROT		(s00_axi_arprot),
		.S_AXI_ARVALID		(s00_axi_arvalid),
		.S_AXI_ARREADY		(s00_axi_arready),
		.S_AXI_RDATA		(s00_axi_rdata),
		.S_AXI_RRESP		(s00_axi_rresp),
		.S_AXI_RVALID		(s00_axi_rvalid),
		.S_AXI_RREADY		(s00_axi_rready)
	);
    
endmodule
