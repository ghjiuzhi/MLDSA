//latency 2
`timescale 1ns / 1ps

module Mont_Reduction_KAD(
    input	wire			i_clk,
    input	wire			i_rst_n,
    input	wire	[45:0]	in,
	input	wire			i_sel,	// = 1 : Kyber; = 0 : Dilithium
    output	wire	[22:0]	out
);
	//K_R = 2^13
	//K_J = 9'd4865
	//D_R = 2^24
	//D_J = 23'd8396801
	parameter K_Q = 12'd3329;
	parameter D_Q = 23'd8380417;
	
	genvar i;
	
	wire	[23:0]	T_L;
	wire	[21:0]	T_H;
	reg		[23:0]	T_H_reg;
	wire	[23:0]	N;
	reg		[23:0]	N_reg;
	wire	[23:0]	H;
	reg		[23:0]  H_reg;
	reg		[23:0]	out1;
	reg		[23:0]	out2;
	reg				sub_sign;

	assign T_L = i_sel ? {11'd0, in[12:0]} : in[23:0];
	assign T_H = i_sel ? {11'd0, in[23:13]} : in[45:24];
	
	//T_L * J mod R
	//latency 0
	ALU_mult_J_KAD inst_mult_J_KAD (
		.i_T_L	(T_L),
		.i_sel	(i_sel),
		.o_N	(N)
	);
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n)
			N_reg		<= 24'd0;
		else
			N_reg		<= N;
	end
	
	//latency 1
	ALU_mult_Q_KAD  inst_mult_Q_KAD(
		.i_clk	(i_clk),
		.i_rst_n(i_rst_n),
		.i_N	(N),
		.i_sel	(i_sel),
		.o_H	(H)
	);
		
	//Function: T_H-H (mod p)
	//T_H-H < 0, sub_sign = 0, select T_H-H+p
	//T_H-H > 0, sub_sign = 1, select T_H-H
	//latency 1
	always @ (posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n) begin
			sub_sign	<= 1'd0;
			out1		<= 24'd0;
		end
		else begin
			if (T_H_reg >= H) begin
				sub_sign	<= 1'd1;
			end
			else begin
				sub_sign	<= 1'd0;
			end
			out1		<= T_H_reg - H;
		end
	end
	
	//Function: T_H-H+p
	//latency 1
	always @ (posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n) begin
			H_reg		<= 24'd0;
			T_H_reg		<= 24'd0;
			out2		<= 24'd0;
		end
		else begin
			if (i_sel) begin
				H_reg		<= H;
				T_H_reg		<= {13'd0, T_H[10:0]};
				out2		<= T_H_reg + K_Q - H;
			end
			else begin
				H_reg		<= H;
				T_H_reg		<= {2'd0, T_H};
				out2		<= T_H_reg + D_Q - H;
			end
		end
	end
	
//	wire		[22:0]	out_reg;
	
	// Determine the sign bit
	assign out = sub_sign ? out1[22:0] : out2[22:0];
	
//	always @(posedge i_clk or negedge i_rst_n) begin
//		if (!i_rst_n) begin
////			out_reg1	<= 1'b0;
//			out			<= 1'b0;
//		end
//		else begin
//			out			<= out_reg;
////			out			<= out_reg1;
//		end
//	end
	
endmodule