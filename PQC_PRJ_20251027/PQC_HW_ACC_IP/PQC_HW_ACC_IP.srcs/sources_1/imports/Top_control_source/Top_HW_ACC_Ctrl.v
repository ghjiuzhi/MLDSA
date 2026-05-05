`timescale 1ns / 1ps

(* dont_touch="true" *)
module Top_HW_ACC_Ctrl
(
	input	wire			aresetn,
	input	wire			clk,
    
	input	wire	[2:0]	start_module,
	input	wire			NTT_sel,
	input	wire	[3:0]	PWM_length,
	input	wire			PWA_PWS_sel,
	input	wire	[3:0]	PWA_PWS_length,
   
	input	wire	[1:0]	SHA3_mode,			// 2'd0:SHA3-256, 2'd1:SHA3-512, 2'd2:SHAKE128, 2'd3:SHAKE256
	input	wire	[31:0]	SHA3_input_length,	// SHA3 input length
	input	wire	[31:0]	SHA3_output_length,	// SHA3 output length
	input	wire	[2:0]	Samp_mode,			// 3'd0: None, 3'd1:Dilithium_uni_samp, 3'd2:Dilithium_rej_samp, 3'd3:Dilithium_gamma_samp, 3'd4:Dilithium_Ball_samp, 3'd5:Kyber_uni_samp, 3'd6:Kyber_cbd_samp
	input	wire			Samp_eta,
	input	wire			PQC_mode,			// '=0': Dilithium; '=1': Kyber
		
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
	output	wire			m_axis_tlast,
    
	output	wire	[31:0]	read_FIFO_count,
	output	wire	[31:0]	write_FIFO_count
    );
        
    wire			Rm_tvalid;
    wire			Rm_tready;
    wire	[63:0]	Rm_tdata;
    wire	[7:0]	Rm_tkeep;
    wire			Rm_tlast;

    wire			Ws_tvalid;
    wire			Ws_tready;
    wire	[63:0]	Ws_tdata;
    wire	[7:0]	Ws_tkeep;
    wire			Ws_tlast;
    
    reg		[2:0]	cur_state;
    reg		[2:0]	nex_state;

    wire			KAD_NTT_done;
    reg				KAD_NTT_start;
	wire			NTT_working;

    wire			PWM_done;
    reg				PWM_start;
    wire			PWM_working;
    
    wire			PWA_PWS_done;
    reg				PWA_PWS_start;
    wire			PWA_PWS_working;
    
    wire			SHA3_done;
    reg				SHA3_Samp_start;
    wire			SHA3_Sample_working;
    
    assign NTT_working = (cur_state == 3'b001);
    assign PWM_working = (cur_state == 3'b010);
    assign PWA_PWS_working = (cur_state == 3'b011);
    assign SHA3_Sample_working = (cur_state == 3'b100);
    
    wire			Rm_tvalid_001;
    wire			Rm_tready_001;
    wire	[63:0]	Rm_tdata_001;
    wire	[7:0]	Rm_tkeep_001;
    wire			Rm_tlast_001;
    
    assign Rm_tvalid_001 = (NTT_working) ? Rm_tvalid : 1'b0;
    assign Rm_tdata_001  = (NTT_working) ? Rm_tdata  : 1'b0;
    assign Rm_tkeep_001  = (NTT_working) ? Rm_tkeep  : 1'b0;
    assign Rm_tlast_001  = (NTT_working) ? Rm_tlast  : 1'b0;
    
    wire			Ws_tvalid_001;
    wire			Ws_tready_001;
    wire	[63:0]	Ws_tdata_001;
    wire	[7:0]	Ws_tkeep_001;
    wire			Ws_tlast_001;
    
    assign Ws_tready_001 = (NTT_working) ? Ws_tready : 1'b0;

    //FIFO interface for matrix_mul
    wire			Rm_tvalid_010;
    wire			Rm_tready_010;
    wire	[63:0]	Rm_tdata_010;
    wire	[7:0]	Rm_tkeep_010;
    wire			Rm_tlast_010;
    
    assign Rm_tvalid_010 = (PWM_working) ? Rm_tvalid : 1'b0;
    assign Rm_tdata_010  = (PWM_working) ? Rm_tdata  : 1'b0;
    assign Rm_tkeep_010  = (PWM_working) ? Rm_tkeep  : 1'b0;
    assign Rm_tlast_010  = (PWM_working) ? Rm_tlast  : 1'b0;
    
    wire			Ws_tvalid_010;
    wire			Ws_tready_010;
    wire	[63:0]	Ws_tdata_010;
    wire	[7:0]	Ws_tkeep_010;
    wire			Ws_tlast_010;
    
    assign Ws_tready_010 = (PWM_working) ? Ws_tready : 1'b0;
    
    //FIFO interface for poly_add
    wire			Rm_tvalid_011;
    wire			Rm_tready_011;
    wire	[63:0]	Rm_tdata_011;
    wire	[7:0]	Rm_tkeep_011;
    wire			Rm_tlast_011;
    
    assign Rm_tvalid_011 = (PWA_PWS_working) ? Rm_tvalid : 1'b0;
    assign Rm_tdata_011  = (PWA_PWS_working) ? Rm_tdata  : 1'b0;
    assign Rm_tkeep_011  = (PWA_PWS_working) ? Rm_tkeep  : 1'b0;
    assign Rm_tlast_011  = (PWA_PWS_working) ? Rm_tlast  : 1'b0;
    
    wire			Ws_tvalid_011;
    wire			Ws_tready_011;
    wire	[63:0]	Ws_tdata_011;
    wire	[7:0]	Ws_tkeep_011;
    wire			Ws_tlast_011;
    
    assign Ws_tready_011 = (PWA_PWS_working) ? Ws_tready : 1'b0;
    
    //FIFO interface for SHA3
    wire			Rm_tvalid_100;
    wire			Rm_tready_100;
    wire	[63:0]	Rm_tdata_100;
    wire	[7:0]	Rm_tkeep_100;
    wire			Rm_tlast_100;
    
    assign Rm_tvalid_100 = (SHA3_Sample_working) ? Rm_tvalid : 1'b0;
    assign Rm_tdata_100  = (SHA3_Sample_working) ? Rm_tdata  : 1'b0;
    assign Rm_tkeep_100  = (SHA3_Sample_working) ? Rm_tkeep  : 1'b0;
    assign Rm_tlast_100  = (SHA3_Sample_working) ? Rm_tlast  : 1'b0;
    
    wire			Ws_tvalid_100;
    wire			Ws_tready_100;
    wire	[63:0]	Ws_tdata_100;
    wire	[7:0]	Ws_tkeep_100;
    wire			Ws_tlast_100;
    
    assign Ws_tready_100 = (SHA3_Sample_working) ? Ws_tready : 1'b0;
    
    assign Rm_tready = (NTT_working) ? Rm_tready_001 : (PWM_working) ? Rm_tready_010 : (PWA_PWS_working) ? Rm_tready_011: Rm_tready_100;
    assign Ws_tvalid = (NTT_working) ? Ws_tvalid_001 : (PWM_working) ? Ws_tvalid_010 : (PWA_PWS_working) ? Ws_tvalid_011: Ws_tvalid_100;
    assign Ws_tdata  = (NTT_working) ? Ws_tdata_001  : (PWM_working) ? Ws_tdata_010  : (PWA_PWS_working) ? Ws_tdata_011 : Ws_tdata_100;
    assign Ws_tkeep  = (NTT_working) ? Ws_tkeep_001  : (PWM_working) ? Ws_tkeep_010  : (PWA_PWS_working) ? Ws_tkeep_011 : Ws_tkeep_100;
    assign Ws_tlast  = (NTT_working) ? Ws_tlast_001  : (PWM_working) ? Ws_tlast_010  : (PWA_PWS_working) ? Ws_tlast_011 : Ws_tlast_100;
    
	wire			coef_ena;
	wire			coef_wea;
	wire	[7:0]	coef_addra;
	wire	[22:0]	coef_dina;
	wire	[22:0]	coef_douta;
	wire			coef_enb;
	wire			coef_web;
	wire	[7:0]	coef_addrb;
	wire	[22:0]	coef_dinb;
	wire	[22:0]	coef_doutb;
	
	wire			temp_ena;
	wire			temp_wea;
	wire	[7:0]	temp_addra;
	wire	[22:0]	temp_dina;
	wire	[22:0]	temp_douta;
	wire			temp_enb;
	wire			temp_web;
	wire	[7:0]	temp_addrb;
	wire	[22:0]	temp_dinb;
	wire	[22:0]	temp_doutb;
	
	wire			coef_ena_NTT;
	wire			coef_wea_NTT;
	wire	[7:0]	coef_addra_NTT;
	wire	[22:0]	coef_dina_NTT;
	wire	[22:0]	coef_douta_NTT;
	wire			coef_enb_NTT;
	wire			coef_web_NTT;
	wire	[7:0]	coef_addrb_NTT;
	wire	[22:0]	coef_dinb_NTT;
	wire	[22:0]	coef_doutb_NTT;
	
	wire			temp_ena_NTT;
	wire			temp_wea_NTT;
	wire	[7:0]	temp_addra_NTT;
	wire	[22:0]	temp_dina_NTT;
	wire	[22:0]	temp_douta_NTT;
	wire			temp_enb_NTT;
	wire			temp_web_NTT;
	wire	[7:0]	temp_addrb_NTT;
	wire	[22:0]	temp_dinb_NTT;
	wire	[22:0]	temp_doutb_NTT;
	
	wire			coef_ena_add;
	wire			coef_wea_add;
	wire	[7:0]	coef_addra_add;
	wire	[22:0]	coef_dina_add;
	wire	[22:0]	coef_douta_add;
	wire			coef_enb_add;
	wire			coef_web_add;
	wire	[7:0]	coef_addrb_add;
	wire	[22:0]	coef_dinb_add;
	wire	[22:0]	coef_doutb_add;
	
	wire			temp_ena_add;
	wire			temp_wea_add;
	wire	[7:0]	temp_addra_add;
	wire	[22:0]	temp_dina_add;
	wire	[22:0]	temp_douta_add;
	wire			temp_enb_add;
	wire			temp_web_add;
	wire	[7:0]	temp_addrb_add;
	wire	[22:0]	temp_dinb_add;
	wire	[22:0]	temp_doutb_add;
	
	wire			coef_ena_PWM;
	wire			coef_wea_PWM;
	wire	[7:0]	coef_addra_PWM;
	wire	[22:0]	coef_dina_PWM;
	wire	[22:0]	coef_douta_PWM;
	wire			coef_enb_PWM;
	wire			coef_web_PWM;
	wire	[7:0]	coef_addrb_PWM;
	wire	[22:0]	coef_dinb_PWM;
	wire	[22:0]	coef_doutb_PWM;
    
    assign coef_ena   = (NTT_working && !PQC_mode) ? coef_ena_NTT   : (PWM_working) ? coef_ena_PWM : coef_ena_add;
    assign coef_wea   = (NTT_working && !PQC_mode) ? coef_wea_NTT   : (PWM_working) ? coef_wea_PWM : coef_wea_add;
    assign coef_addra = (NTT_working && !PQC_mode) ? coef_addra_NTT : (PWM_working) ? coef_addra_PWM : coef_addra_add;
    assign coef_dina  = (NTT_working && !PQC_mode) ? coef_dina_NTT  : (PWM_working) ? coef_dina_PWM : coef_dina_add;
    assign coef_douta_NTT = (NTT_working && !PQC_mode) ? coef_douta : 1'b0;
    assign coef_douta_add = (PWA_PWS_working) ? coef_douta : 1'b0;
    assign coef_douta_PWM = (PWM_working) ? coef_douta : 1'b0;
    
    assign coef_enb   = (NTT_working && !PQC_mode) ? coef_enb_NTT   : (PWM_working) ? coef_enb_PWM : coef_enb_add;
    assign coef_web   = (NTT_working && !PQC_mode) ? coef_web_NTT   : (PWM_working) ? coef_web_PWM : coef_web_add;
    assign coef_addrb = (NTT_working && !PQC_mode) ? coef_addrb_NTT : (PWM_working) ? coef_addrb_PWM : coef_addrb_add;
    assign coef_dinb  = (NTT_working && !PQC_mode) ? coef_dinb_NTT  : (PWM_working) ? coef_dinb_PWM : coef_dinb_add;
    assign coef_doutb_NTT = (NTT_working && !PQC_mode) ? coef_doutb : 1'b0;
    assign coef_doutb_add = (PWA_PWS_working) ? coef_doutb : 1'b0;
    assign coef_doutb_PWM = (PWM_working) ? coef_doutb : 1'b0;
    
    assign temp_ena   = (NTT_working && !PQC_mode) ? temp_ena_NTT   : temp_ena_add;
    assign temp_wea   = (NTT_working && !PQC_mode) ? temp_wea_NTT   : temp_wea_add;
    assign temp_addra = (NTT_working && !PQC_mode) ? temp_addra_NTT : temp_addra_add;
    assign temp_dina  = (NTT_working && !PQC_mode) ? temp_dina_NTT  : temp_dina_add;
    assign temp_douta_NTT = (NTT_working && !PQC_mode) ? temp_douta : 1'b0;
    assign temp_douta_add = (PWA_PWS_working) ? temp_douta : 1'b0;
    
    assign temp_enb   = (NTT_working && !PQC_mode) ? temp_enb_NTT   : temp_enb_add;
    assign temp_web   = (NTT_working && !PQC_mode) ? temp_web_NTT   : temp_web_add;
    assign temp_addrb = (NTT_working && !PQC_mode) ? temp_addrb_NTT : temp_addrb_add;
    assign temp_dinb  = (NTT_working && !PQC_mode) ? temp_dinb_NTT  : temp_dinb_add;
    assign temp_doutb_NTT = (NTT_working && !PQC_mode) ? temp_doutb : 1'b0;
    assign temp_doutb_add = (PWA_PWS_working) ? temp_doutb : 1'b0;

	always @(posedge clk) begin
		cur_state <= nex_state;
		
		if (start_module == 3'b001)
			KAD_NTT_start	<= 1'b1;
		else
			KAD_NTT_start	<= 1'b0;
				
		if (start_module == 3'b010)
			PWM_start <= 1'b1;
		else
			PWM_start <= 1'b0;
		    
		if (start_module == 3'b011)
			PWA_PWS_start <= 1'b1;
		else
			PWA_PWS_start <= 1'b0;
		
		if (start_module == 3'b100)
			SHA3_Samp_start <= 1'b1;
		else
			SHA3_Samp_start <= 1'b0;
	end
    
	always @(*) begin
		case(cur_state)
			3'b000:
				if(start_module == 3'b001)
					nex_state <= 3'b001;
				else if(start_module == 3'b010)
					nex_state <=  3'b010;
				else if(start_module == 3'b011)
					nex_state <=  3'b011;
				else if(start_module == 3'b100)
					nex_state <=  3'b100;
				else
					nex_state <= 3'b000;
				    
			3'b001: begin
				if(KAD_NTT_done)
					nex_state <= 3'b000;
				else
					nex_state <= 3'b001;
			end
			
			3'b010:
				if(PWM_done)
					nex_state <= 3'b000;
				else
					nex_state <= 3'b010;
				
			3'b011:
				if(PWA_PWS_done)
					nex_state <= 3'b000;
				else
					nex_state <= 3'b011;
				
			3'b100:
				if(SHA3_done)
					nex_state <= 3'b000;
				else
					nex_state <= 3'b100;
			default:
					nex_state <= 3'b000;     
		endcase
	end
    
	AXI_Data_FIFO Read_FIFO(
		.s_axis_aresetn		(aresetn),
		.s_axis_aclk		(clk),
		.s_axis_tvalid		(s_axis_tvalid),
		.s_axis_tready		(s_axis_tready),
		.s_axis_tdata		(s_axis_tdata),
		.s_axis_tkeep		(s_axis_tkeep),
		.s_axis_tlast		(s_axis_tlast),
		.m_axis_tvalid		(Rm_tvalid),
		.m_axis_tready		(Rm_tready),
		.m_axis_tdata		(Rm_tdata),
		.m_axis_tkeep		(Rm_tkeep),
		.m_axis_tlast		(Rm_tlast),
		.axis_rd_data_count	(read_FIFO_count)
	);
        
	coefficient_mem u_coefficient_mem_1 (
		.clka(clk),    // input wire clka
		.ena(coef_ena),      // input wire ena
		.wea(coef_wea),      // input wire [0 : 0] wea
		.addra(coef_addra),  // input wire [7 : 0] addra
		.dina(coef_dina),    // input wire [22 : 0] dina
		.douta(coef_douta),  // output wire [22 : 0] douta
		.clkb(clk),    // input wire clkb
		.enb(coef_enb),      // input wire enb
		.web(coef_web),      // input wire [0 : 0] web
		.addrb(coef_addrb),  // input wire [7 : 0] addrb
		.dinb(coef_dinb),    // input wire [22 : 0] dinb
		.doutb(coef_doutb)  // output wire [22 : 0] doutb
	);
	
	coefficient_mem u_coefficient_mem_2 (
		.clka(clk),    // input wire clka
		.ena(temp_ena),      // input wire ena
		.wea(temp_wea),      // input wire [0 : 0] wea
		.addra(temp_addra),  // input wire [7 : 0] addra
		.dina(temp_dina),    // input wire [22 : 0] dina
		.douta(temp_douta),  // output wire [22 : 0] douta
		.clkb(clk),    // input wire clkb
		.enb(temp_enb),      // input wire enb
		.web(temp_web),      // input wire [0 : 0] web
		.addrb(temp_addrb),  // input wire [7 : 0] addrb
		.dinb(temp_dinb),    // input wire [22 : 0] dinb
		.doutb(temp_doutb)  // output wire [22 : 0] doutb
	);
    
	PWM_Ctrl PWM_Top (
		.clk				(clk),
		.aresetn			(aresetn),
		.PWM_start			(PWM_start),
		.PWM_length			(PWM_length),
		.PQC_mode			(PQC_mode),
		.Rm_tvalid			(Rm_tvalid_010),
		.Rm_tready			(Rm_tready_010),
		.Rm_tdata			(Rm_tdata_010),
		.Rm_tkeep			(Rm_tkeep_010),
		.Rm_tlast			(Rm_tlast_010),
		.Ws_tvalid			(Ws_tvalid_010),
		.Ws_tready			(Ws_tready_010),
		.Ws_tdata			(Ws_tdata_010),
		.Ws_tkeep			(Ws_tkeep_010),
		.Ws_tlast			(Ws_tlast_010),
		.coef_ena			(coef_ena_PWM),
		.coef_wea			(coef_wea_PWM),
		.coef_addra			(coef_addra_PWM),
		.coef_dina			(coef_dina_PWM),
		.coef_douta			(coef_douta_PWM),
		.coef_enb			(coef_enb_PWM),
		.coef_web			(coef_web_PWM),
		.coef_addrb			(coef_addrb_PWM),
		.coef_dinb			(coef_dinb_PWM),
		.coef_doutb			(coef_doutb_PWM),
		.PWM_done			(PWM_done)
	);
	
	PWA_PWS_Ctrl PWA_PWS_Top (
		.clk				(clk),
		.aresetn			(aresetn),
		.PQC_mode			(PQC_mode),
		.PWA_PWS_start		(PWA_PWS_start),
		.PWA_PWS_sel		(PWA_PWS_sel),
		.PWA_PWS_length		(PWA_PWS_length),
		.Read_FIFO_tvalid	(Rm_tvalid_011),
		.Read_FIFO_tready	(Rm_tready_011),
		.Read_FIFO_tdata	(Rm_tdata_011),
		.Read_FIFO_tkeep	(Rm_tkeep_011),
		.Read_FIFO_tlast	(Rm_tlast_011),
		.Write_FIFO_tvalid	(Ws_tvalid_011),
		.Write_FIFO_tready	(Ws_tready_011),
		.Write_FIFO_tdata	(Ws_tdata_011),
		.Write_FIFO_tkeep	(Ws_tkeep_011),
		.Write_FIFO_tlast	(Ws_tlast_011),
		.coef_ena			(coef_ena_add),
		.coef_wea			(coef_wea_add),
		.coef_addra			(coef_addra_add),
		.coef_dina			(coef_dina_add),
		.coef_douta			(coef_douta_add),
		.coef_enb			(coef_enb_add),
		.coef_web			(coef_web_add),
		.coef_addrb			(coef_addrb_add),
		.coef_dinb			(coef_dinb_add),
		.coef_doutb			(coef_doutb_add),
		.temp_ena			(temp_ena_add),
		.temp_wea			(temp_wea_add),
		.temp_addra			(temp_addra_add),
		.temp_dina			(temp_dina_add),
		.temp_douta			(temp_douta_add),
		.temp_enb			(temp_enb_add),
		.temp_web			(temp_web_add),
		.temp_addrb			(temp_addrb_add),
		.temp_dinb			(temp_dinb_add),
		.temp_doutb			(temp_doutb_add),
		.PWA_PWS_done		(PWA_PWS_done)
	);
                   
	SHA3_Sample_Ctrl SHA3_Sample_Top(
		.clk				(clk),
		.aresetn			(aresetn),
		.SHA3_Samp_start	(SHA3_Samp_start),
		.Rm_tvalid			(Rm_tvalid_100),
		.Rm_tready			(Rm_tready_100),
		.Rm_tdata			(Rm_tdata_100),
		.Rm_tkeep			(Rm_tkeep_100),
		.Rm_tlast			(Rm_tlast_100),
		.Ws_tvalid			(Ws_tvalid_100),
		.Ws_tready			(Ws_tready_100),
		.Ws_tdata			(Ws_tdata_100),
		.Ws_tkeep			(Ws_tkeep_100),
		.Ws_tlast			(Ws_tlast_100),
		.SHA3_mode			(SHA3_mode),
		.SHA3_input_length	(SHA3_input_length),
		.SHA3_output_length	(SHA3_output_length),
		.SHA3_done			(SHA3_done),
		.Samp_mode			(Samp_mode),
		.Samp_eta			(Samp_eta)
	);

	AXI_Data_FIFO Write_FIFO (
		.s_axis_aclk		(clk),                // input wire s_axis_aclk
		.s_axis_aresetn		(aresetn),          // input wire s_axis_aresetn
		.s_axis_tvalid		(Ws_tvalid),            // input wire s_axis_tvalid
		.s_axis_tready		(Ws_tready),            // output wire s_axis_tready
		.s_axis_tdata		(Ws_tdata),              // input wire [63 : 0] s_axis_tdata
		.s_axis_tkeep		(Ws_tkeep),              // input wire [7 : 0] s_axis_tkeep
		.s_axis_tlast		(Ws_tlast),              // input wire s_axis_tlast
		.m_axis_tvalid		(m_axis_tvalid),            // output wire m_axis_tvalid
		.m_axis_tready		(m_axis_tready),            // input wire m_axis_tready
		.m_axis_tdata		(m_axis_tdata),              // output wire [63 : 0] m_axis_tdata
		.m_axis_tkeep		(m_axis_tkeep),              // output wire [7 : 0] m_axis_tkeep
		.m_axis_tlast		(m_axis_tlast),              // output wire m_axis_tlast
		.axis_rd_data_count	(write_FIFO_count)  // output wire [31 : 0] axis_rd_data_count
	);

	KAD_NTT_Ctrl u_KAD_NTT_Ctrl(
		.clk			(clk			),
		.aresetn		(aresetn		),
		.start			(KAD_NTT_start	),
		.KAD_Mode		(PQC_mode		),
		.Multi_Mode		(!NTT_sel		),
		.Rm_tvalid		(Rm_tvalid_001	),
		.Rm_tready		(Rm_tready_001	),
		.Rm_tdata		(Rm_tdata_001	),
		.Rm_tkeep		(Rm_tkeep_001	),
		.Rm_tlast		(Rm_tlast_001	),
		.Ws_tvalid		(Ws_tvalid_001	),
		.Ws_tready		(Ws_tready_001	),
		.Ws_tdata		(Ws_tdata_001	),
		.Ws_tkeep		(Ws_tkeep_001	),
		.Ws_tlast		(Ws_tlast_001	),
		.write_done		(KAD_NTT_done	)
    );
	
endmodule
