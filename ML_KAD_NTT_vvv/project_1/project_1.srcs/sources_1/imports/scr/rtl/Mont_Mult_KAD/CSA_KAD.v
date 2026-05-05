module CSA_KAD #(
	parameter adder_width = 14
)(
	input	[adder_width-1:0]	op1,
	input	[adder_width-1:0]	op2,
	input	[adder_width-1:0]	op3,
	output	[adder_width-1:0]	s,
	output	[adder_width-1:0]	c
);

	genvar i;

	generate
		for(i = 0; i < adder_width; i = i + 1)
			begin:	CSA_loop
				full_adder_KAD	inst_full_adder_KAD(
					.a		(op1[i]),
					.b		(op2[i]),
					.cin	(op3[i]),
					.s		(s[i]),
					.cout	(c[i])
				);
			end
	endgenerate

endmodule
