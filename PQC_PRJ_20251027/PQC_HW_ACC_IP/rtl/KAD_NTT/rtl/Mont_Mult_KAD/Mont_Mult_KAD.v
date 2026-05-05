//Function: (a * b) mod Q
//latency 4
`timescale 1ns / 1ps

module Mont_Mult_KAD(
	input	wire			i_clk,
	input	wire			i_rst_n,
	input	wire	[22:0]	i_a,
	input	wire	[22:0]	i_b,
	input	wire			i_sel,	// = 1 : Kyber; = 0 : Dilithium
	output	wire	[22:0]	o_c
);

	reg		[22:0]	a_reg;
	reg		[22:0]	b_reg;
	reg		[45:0]	Z;
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n)
			Z	<= 46'd0;
		else
			Z	<= a_reg * b_reg;
	end
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n) begin
			a_reg	<= 23'd0;
			b_reg	<= 23'd0;
		end
		else begin
			a_reg	<= i_a;
			b_reg	<= i_b;
		end
	end

	//Function: o_c = Z (mod p)
	//latency 2
	Mont_Reduction_KAD inst_Mont_Reduction_KAD(
		.i_clk	(i_clk),
		.i_rst_n(i_rst_n),
		.in		(Z),
		.i_sel	(i_sel),
		.out	(o_c)
	);

endmodule
