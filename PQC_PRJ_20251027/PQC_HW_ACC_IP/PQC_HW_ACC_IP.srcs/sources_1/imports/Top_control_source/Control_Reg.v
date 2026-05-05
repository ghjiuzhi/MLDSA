`timescale 1 ns / 1 ps

(* dont_touch="true" *)
module Control_Reg#
	(
		parameter integer C_S_AXI_DATA_WIDTH	= 32,	// Width of S_AXI data bus
		parameter integer C_S_AXI_ADDR_WIDTH	= 5		// Width of S_AXI address bus
	)
	(
		output	wire	[2:0]	start_module,
		output	wire			NTT_sel,
		output	wire	[3:0]	PWM_length,
		output	wire			PWA_PWS_sel,
		output	wire	[3:0]	PWA_PWS_length,
		
		output	wire	[1:0]	SHA3_mode,			// 2'd0:SHA3-256, 2'd1:SHA3-512, 2'd2:SHAKE128, 2'd3:SHAKE256
		output	wire	[31:0]	SHA3_input_length,	// SHA3 input length
		output	wire	[31:0]	SHA3_output_length,	// SHA3 output length
		output	wire	[2:0]	Samp_mode,			// 3'd0: None, 3'd1:Dilithium_uni_samp, 3'd2:Dilithium_rej_samp, 3'd3:Dilithium_gamma_samp, 3'd4:Dilithium_Ball_samp, 3'd5:Kyber_uni_samp, 3'd6:Kyber_cbd_samp
		output	wire	[0:0]	Samp_eta,
		output	wire			PQC_mode,			// '=0': Dilithium; '=1': Kyber
		        
		input	wire	[31:0]	read_FIFO_count,
		input	wire	[31:0]	write_FIFO_count,
    
		input	wire									S_AXI_ACLK,
		input	wire									S_AXI_ARESETN,
		input	wire	[C_S_AXI_ADDR_WIDTH-1 : 0]		S_AXI_AWADDR,
		input	wire	[2 : 0]							S_AXI_AWPROT,
		input	wire									S_AXI_AWVALID,
		output	wire									S_AXI_AWREADY,
		input	wire	[C_S_AXI_DATA_WIDTH-1 : 0]		S_AXI_WDATA,
		input	wire	[(C_S_AXI_DATA_WIDTH/8)-1 : 0]	S_AXI_WSTRB,
		input	wire									S_AXI_WVALID,
		output	wire									S_AXI_WREADY,
		output	wire	[1 : 0]							S_AXI_BRESP,
		output	wire									S_AXI_BVALID,
		input	wire									S_AXI_BREADY,
		input	wire	[C_S_AXI_ADDR_WIDTH-1 : 0]		S_AXI_ARADDR,
		input	wire	[2 : 0]							S_AXI_ARPROT,
		input	wire									S_AXI_ARVALID,
		output	wire									S_AXI_ARREADY,
		output	wire	[C_S_AXI_DATA_WIDTH-1 : 0]		S_AXI_RDATA,
		output	wire	[1 : 0]							S_AXI_RRESP,
		output	wire									S_AXI_RVALID,
		input	wire									S_AXI_RREADY
	);

	reg		[C_S_AXI_ADDR_WIDTH-1 : 0]	axi_awaddr;
	reg									axi_awready;
	reg									axi_wready;
	reg 	[1 : 0]						axi_bresp;
	reg									axi_bvalid;
	reg		[C_S_AXI_ADDR_WIDTH-1 : 0]	axi_araddr;
	reg									axi_arready;
	reg		[C_S_AXI_DATA_WIDTH-1 : 0]	axi_rdata;
	reg		[1 : 0]						axi_rresp;
	reg									axi_rvalid;

	localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
	localparam integer OPT_MEM_ADDR_BITS = 2;

	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg1;
	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg2;
	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg3;
	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg4;
	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg5;
	
	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg6;
	reg		[C_S_AXI_DATA_WIDTH-1:0]	slv_reg7;
	
	wire								slv_reg_rden;
	wire								slv_reg_wren;
	reg		[C_S_AXI_DATA_WIDTH-1:0]	reg_data_out;
	integer								byte_index;
	reg									aw_en;

	assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY		= axi_wready;
	assign S_AXI_BRESP		= axi_bresp;
	assign S_AXI_BVALID		= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA		= axi_rdata;
	assign S_AXI_RRESP		= axi_rresp;
	assign S_AXI_RVALID		= axi_rvalid;

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
			axi_awready <= 1'b0;
			aw_en <= 1'b1;
		end
		else begin 
			if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en) begin
			    axi_awready <= 1'b1;
			    aw_en <= 1'b0;
			end
			else if (S_AXI_BREADY && axi_bvalid) begin
				aw_en <= 1'b1;
				axi_awready <= 1'b0;
			end
			else begin
				axi_awready <= 1'b0;
			end
		end
	end

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
			axi_awaddr <= 0;
		end
		else begin
			if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID && aw_en) begin
				axi_awaddr <= S_AXI_AWADDR;
			end
		end
	end

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
			axi_wready <= 1'b0;
		end
		else begin
			if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID && aw_en ) begin
				axi_wready <= 1'b1;
			end
			else begin
				axi_wready <= 1'b0;
			end
		end
	end   

	assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
			slv_reg1 <= 0;
			slv_reg2 <= 0;
			slv_reg3 <= 0;
			slv_reg4 <= 0;
			slv_reg5 <= 0;
			slv_reg6 <= 0;
			slv_reg7 <= 0;
	    end 
		else begin
			if (slv_reg_wren) begin
			 	case ( axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] )
			 		5'h1:
			 			for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
			 				if ( S_AXI_WSTRB[byte_index] == 1 ) begin
			 					slv_reg1[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
			 				end
			 		5'h2:
			 			for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
			 				if ( S_AXI_WSTRB[byte_index] == 1 ) begin
			 					slv_reg2[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
			 				end
			 		5'h3:
			 			for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
			 				if ( S_AXI_WSTRB[byte_index] == 1 ) begin
			 					slv_reg3[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
			 				end
			 		5'h4:
			 			for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
			 				if ( S_AXI_WSTRB[byte_index] == 1 ) begin
			 					slv_reg4[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
			 				end
			 		5'h5:
			 			for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
			 				if ( S_AXI_WSTRB[byte_index] == 1 ) begin
			 					slv_reg5[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
			 				end
			 		5'h6:
			 			for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
			 				if ( S_AXI_WSTRB[byte_index] == 1 ) begin
			 					slv_reg6[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
			 				end
			 		5'h7:
			 			for ( byte_index = 0; byte_index <= (C_S_AXI_DATA_WIDTH/8)-1; byte_index = byte_index+1 )
			 				if ( S_AXI_WSTRB[byte_index] == 1 ) begin
			 					slv_reg7[(byte_index*8) +: 8] <= S_AXI_WDATA[(byte_index*8) +: 8];
			 				end  
			 		default : begin
			 			slv_reg1 <= slv_reg1;
			 			slv_reg2 <= slv_reg2;
			 			slv_reg3 <= slv_reg3;
			 			slv_reg4 <= slv_reg4;
			 			slv_reg5 <= slv_reg5;
			 			slv_reg6 <= slv_reg6;
			 			slv_reg7 <= slv_reg7;
					end
			 	endcase
			end
		end
	end    

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
		    axi_bvalid  <= 0;
		    axi_bresp   <= 2'b0;
		  end
		else begin
		    if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID) begin
				axi_bvalid <= 1'b1;
				axi_bresp  <= 2'b0;
			end
		    else begin
				if (S_AXI_BREADY && axi_bvalid) begin
					axi_bvalid <= 1'b0; 
				end
			end
		end
	end

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
			axi_arready <= 1'b0;
			axi_araddr  <= 32'b0;
		end
		else begin
			if (~axi_arready && S_AXI_ARVALID) begin
				axi_arready <= 1'b1;
				axi_araddr  <= S_AXI_ARADDR;
			end
			else begin
				axi_arready <= 1'b0;
			end
		end
	end

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
			axi_rvalid <= 0;
			axi_rresp  <= 0;
		end
		else begin
			if (axi_arready && S_AXI_ARVALID && ~axi_rvalid) begin
				axi_rvalid <= 1'b1;
				axi_rresp  <= 2'b0;
			end
			else if (axi_rvalid && S_AXI_RREADY) begin
				axi_rvalid <= 1'b0;
			end
		end
	end

	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	always @(*)	begin
		case ( axi_araddr[ADDR_LSB + OPT_MEM_ADDR_BITS : ADDR_LSB] )
			4'h0: reg_data_out <= slv_reg0;
			4'h1: reg_data_out <= slv_reg1;
			4'h2: reg_data_out <= slv_reg2;
			4'h3: reg_data_out <= slv_reg3;
			4'h4: reg_data_out <= slv_reg4;
			4'h5: reg_data_out <= slv_reg5;
			4'h6: reg_data_out <= slv_reg6;
			4'h7: reg_data_out <= slv_reg7;
			default : reg_data_out <= 0;
		endcase
	end

	always @( posedge S_AXI_ACLK ) begin
		if ( S_AXI_ARESETN == 1'b0 ) begin
			axi_rdata  <= 0;
		end
		else begin
			if (slv_reg_rden) begin
				axi_rdata <= reg_data_out;
			end
		end
	end

//	always @( posedge S_AXI_ACLK ) begin
//		slv_reg4	<= read_FIFO_count;
//		slv_reg5	<= write_FIFO_count;
//	end
	
    assign start_module			= (slv_reg_wren && (axi_awaddr[ADDR_LSB+OPT_MEM_ADDR_BITS:ADDR_LSB] == 'd0)) ? S_AXI_WDATA[2:0] : 1'b0 ;	//slv_reg0，仅一个时钟周期有效
    assign NTT_sel				= slv_reg1[0];		// 0:NTT,1:INTT
    assign PWM_length			= slv_reg1[4:1];	// PWM vector size
    assign PWA_PWS_sel			= slv_reg1[5];		// PWA or PWS
    assign PWA_PWS_length		= slv_reg1[9:6];	// PWA or PWS vector size
    assign SHA3_input_length	= slv_reg3;			// SHA3 input length
    assign SHA3_output_length	= slv_reg4;			// SHA3 output length
    assign SHA3_mode			= slv_reg6[1:0];	// 2'd0:SHA3-256, 2'd1:SHA3-512, 2'd2:SHAKE128, 2'd3:SHAKE256
	assign PQC_mode				= slv_reg6[2];		// '=0': Dilithium; '=1': Kyber
    assign Samp_mode			= slv_reg6[5:3];	// 3'd0: None, 3'd1:Dilithium_uni_samp, 3'd2:Dilithium_rej_samp, 3'd3:Dilithium_gamma_samp, 3'd4:Dilithium_Ball_samp, 3'd5:Kyber_uni_samp, 3'd6:Kyber_cbd_samp
	assign Samp_eta				= slv_reg7[0];		// Samp_eta

endmodule
