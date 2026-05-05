`timescale 1ns / 1ps
//barrett reduce

// latency = 4
// k = 24, m = 5039

module Kyber_mul_and_reduce(
	input	wire			clk,
	input	wire	[11:0]	opt1,
	input	wire	[11:0]	opt2,
	output	reg		[11:0]	result
	);
	
	wire	[23:0]	mul_res_0;
	wire	[36:0]	mul_res_1;
	wire	[24:0]	mul_res_2;
	reg		[23:0]	Kyber_mul_res_0_reg0;
	reg		[23:0]	Kyber_mul_res_0_reg1;
	wire	[12:0]	t;
	wire	[23:0]	A;
	assign t = mul_res_1[36:24];
	assign A = Kyber_mul_res_0_reg1 - mul_res_2;
	
	always @(posedge clk) begin
		Kyber_mul_res_0_reg0	<= mul_res_0;
		Kyber_mul_res_0_reg1	<= Kyber_mul_res_0_reg0;
		if (A > 3329) begin
			result	<= A - 3329;
		end
		else begin
			result	<= A;
		end
	end
	
	Kyber_mult_gen_0 multiplier_inst_0 (
		.CLK	(clk),  // input wire CLK
		.A		(opt1),      // input wire [11 : 0] A
		.B		(opt2),      // input wire [11 : 0] B
		.P		(mul_res_0)      // output wire [23 : 0] P
	);

	Kyber_mult_gen_1 multiplier_inst_1 (
		.CLK	(clk),  // input wire CLK
		.A		(mul_res_0),      // input wire [23 : 0] A
		.P		(mul_res_1)      // output wire [36 : 0] P
	);
	
	Kyber_mult_gen_2 multiplier_inst_2 (
		.CLK	(clk),  // input wire CLK
		.A		(t),      // input wire [12 : 0] A
		.P		(mul_res_2)      // output wire [24 : 0] P
	);
	
endmodule
