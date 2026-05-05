`timescale 1ns / 1ps

(* dont_touch="true" *)
module SHA3_Sample_Ctrl(
	input	wire			aresetn,
	input	wire			clk,
    
	input	wire			SHA3_Samp_start,
	
	input	wire	[1:0]	SHA3_mode,			// 2'd0:SHA3-256, 2'd1:SHA3-512, 2'd2:SHAKE128, 2'd3:SHAKE256
	input	wire	[31:0]	SHA3_input_length,	// SHA3 input length
	input	wire	[31:0]	SHA3_output_length,	// SHA3 output length
	output	wire			SHA3_done,
	input	wire	[2:0]	Samp_mode,			// 3'd0: None, 3'd1:Dilithium_uni_samp, 3'd2:Dilithium_rej_samp, 3'd3:Dilithium_gamma_samp, 3'd4:Dilithium_Ball_samp, 3'd5:Kyber_uni_samp, 3'd6:Kyber_cbd_samp
	input	wire			Samp_eta,
    
	input	wire			Rm_tvalid,
	output	wire			Rm_tready,
	input	wire	[63:0]	Rm_tdata,
	input	wire	[7:0]	Rm_tkeep,
	input	wire			Rm_tlast,
    
	output	wire			Ws_tvalid,
	input	wire			Ws_tready,
	output	wire	[63:0]	Ws_tdata,
	output	wire	[7:0]	Ws_tkeep,
	output	wire			Ws_tlast

);
    
	wire	[63:0]		SHA3_datain;
	wire				SHA3_datain_vld;
	wire				SHA3_last;
	wire				squeeze; 
	wire				SHA3_hold;
	wire	[2:0]		SHA3_byte_num;
	wire				SHA3_squeeze;
	wire	[1343:0]	SHA3_dataout;
	wire				SHA3_dataout_vld;
	wire				i_last = 0;
	wire				SHA3_start;
    
//	SHA3_FIFO_read SHA3_read(
//		.clk				(clk),
//		.module_start		(SHA3_Samp_start),
//		.SHA3_mode			(SHA3_mode),
//		.SHA3_input_length	(SHA3_input_length),
//		.Read_FIFO_tvalid	(Rm_tvalid),
//		.Read_FIFO_tready	(Rm_tready),
//		.Read_FIFO_tdata	(Rm_tdata),
//		.Read_FIFO_tkeep	(Rm_tkeep),
//		.Read_FIFO_tlast	(Rm_tlast), 
//		.i_last				(i_last),
//		.SHA3_start			(SHA3_start),
//		.shake_in			(SHA3_datain),
//		.in_ready			(SHA3_datain_vld),
//		.is_last			(SHA3_last),
//		.byte_num			(SHA3_byte_num)
//	);
	
	SHA3_FIFO_read SHA3_read(
		.clk				(clk),
		.aresetn			(aresetn),
		.module_start		(SHA3_Samp_start),
		.SHA3_mode			(SHA3_mode),
		.SHA3_input_length	(SHA3_input_length),
		.Read_FIFO_tvalid	(Rm_tvalid),
		.Read_FIFO_tready	(Rm_tready),
		.Read_FIFO_tdata	(Rm_tdata),
		.Read_FIFO_tkeep	(Rm_tkeep),
		.Read_FIFO_tlast	(Rm_tlast), 
		.i_last				(i_last),
		.SHA3_start			(SHA3_start),

		.shake_in			(SHA3_datain),
		.in_ready			(SHA3_datain_vld),
		.Keccak_last		(SHA3_last),
		.byte_num			(SHA3_byte_num)
	);
	
	reg		[2:0]		SHA3_mode_in;
	
	always @(*) begin
		case (SHA3_mode)
			4'd0: SHA3_mode_in	<= 3'd1;	// SHA3-256
			4'd1: SHA3_mode_in	<= 3'd3;	// SHA3-512
			4'd2: SHA3_mode_in	<= 3'd4;	// SHAKE128
			4'd3: SHA3_mode_in	<= 3'd5;	// SHAKE256
			default:;
		endcase
	end

//	SHA3_Hash SHA3_module(
//		.clk_in			(clk),
//		.reset_in		(SHA3_Samp_start),
//		.mode_in		(SHA3_mode_in),
//		.data_in		(SHA3_datain),
//		.dvld_in		(SHA3_datain_vld),
//		.dlast_in		(SHA3_last),
//		.byte_num_in	(SHA3_byte_num),
//		.squeeze		(SHA3_squeeze),
//        .sha_hold       (SHA3_hold),
//		.result_out		(SHA3_dataout),
//		.rvld_out		(SHA3_dataout_vld)
//    );
    
    keccak_top u_keccak_top (
		.clk_i				(clk),
		.rst_ni				(aresetn),
		.mode_i				(SHA3_mode_in),
		.start_i			(SHA3_start),
		.din_i				(SHA3_datain),
		.din_valid_i		(SHA3_datain_vld),
		.last_din_i			(SHA3_last),
		.last_din_byte_i	(4'd8),
		.dout_ready_i		(1'b1),
		.dout_squeeze_i		(SHA3_squeeze),
		.din_ready_o		(),
		.dout_o				(SHA3_dataout),
		.dout_valid_o		(SHA3_dataout_vld)
	);

	SHA3_FIFO_write SHA3_Sample_write(
		.clk				(clk),
		.SHA3_Samp_start	(SHA3_Samp_start),
		.SHA3_output_length	(SHA3_output_length),
		.m_axis_tvalid		(Ws_tvalid),
		.m_axis_tready		(Ws_tready),
		.m_axis_tdata		(Ws_tdata),
		.m_axis_tkeep		(Ws_tkeep),
		.m_axis_tlast		(Ws_tlast),
		.is_last			(SHA3_last),
		.out				(SHA3_dataout),
		.out_ready			(SHA3_dataout_vld),
		.sha_hold			(SHA3_hold),
		.squeeze			(SHA3_squeeze),
		.module_end			(SHA3_done),
		.SHA3_mode			(SHA3_mode),
		.Samp_mode			(Samp_mode),
		.Samp_eta			(Samp_eta)
	);
                                 
endmodule
