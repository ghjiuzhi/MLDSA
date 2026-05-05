//Function: T_L * J mod R
//latency 0
module ALU_mult_J_KAD (
    input	wire	[23:0]	i_T_L,
	input	wire			i_sel,
    output	wire	[23:0]	o_N
);

// K_J = Q^(-1) mod R = 13'b1_0011_0000_0001 = 4865
// D_J = Q^(-1) mod R = 24'b1000_0000_0010_0000_0000_0001 = 8396801

	wire	[10:0]	s1;
	wire	[10:0]	c1;
	wire	[11:0]	t1;
	wire	[11:0]	CSA_op1;
	wire	[11:0]	CSA_op2;
	wire	[11:0]	CSA_op3;
	
	assign CSA_op1 = i_sel ? {6'd0, i_T_L[12:8]} : i_T_L[23:13];
	assign CSA_op2 = i_sel ? {6'd0, i_T_L[4:0]} : i_T_L[10:0];
	assign CSA_op3 = i_sel ? {6'd0, i_T_L[3:0], 1'b0} : {i_T_L[0],10'd0};

	CSA_KAD #(
		.adder_width(11)
	) inst_CSA_KAD_0(
		.op1	(CSA_op1),
		.op2	(CSA_op2),
		.op3	(CSA_op3),
		.s		(s1),
		.c		(c1)
	);
	
	assign t1 = i_sel ? s1 + (c1 << 1) + {i_T_L[0],4'b0} : {1'b0, s1} + ({1'b0, c1} << 1);
	assign o_N = i_sel ? {11'd0, t1[4:0], i_T_L[7:0]} : {t1[10:0], i_T_L[12:0]};

endmodule