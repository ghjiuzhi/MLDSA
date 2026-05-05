// Function: o_H = floor(i_N * Q / R) = (i_N * 8380417) >> 24
// Q = 8380417 = 2^23 - 2^13 + 1
// R = 2^24
// latency 1
`timescale 1ns / 1ps

module ALU_mult_Q_KAD (
	input	wire			i_clk,
    input	wire			i_rst_n,
	input	wire	[23:0]	i_N,
	input	wire			i_sel,
	output	wire	[23:0]	o_H
);

    wire [12:0] K_term0 = {2'b0, i_N[12:2]};  // i_N >> 2
    wire [12:0] K_term1 = {3'b0, i_N[12:3]};  // i_N >> 3
    wire [12:0] K_term2 = {5'b0, i_N[12:5]};  // i_N >> 5
    wire [6:0]  K_x0 = {2'b0, i_N[12:8]} + {2'b0, i_N[4:0]};
    wire [6:0]  K_x1 = K_x0 + {2'b0, i_N[2:0], 2'b0};
    wire [6:0]  K_X  = K_x1 + {2'b0, i_N[1:0], 3'b0};
    wire [1:0]  K_carry = K_X[6:5];                 // == old t1[6:5]
    wire [12:0] K_carry_ext = {11'b0, K_carry};     // extend to 13b

    wire [23:0] D_term1 = {1'b0,  i_N[23:1]};      // i_N >> 1
    wire [23:0] D_term2 = {11'b0, i_N[23:11]};     // i_N >> 11 (aligned to 24b)
    wire        D_carry1 = i_N[23] & i_N[0];
    wire [10:0] D_S_hi   = { (i_N[23] ^ i_N[0]), i_N[22:13] };
    wire [10:0] D_B_hi   = i_N[10:0];
    wire        D_borrow = (D_S_hi < D_B_hi);

    wire [23:0] D_adj = D_borrow ? (D_carry1 ? 24'd0 : 24'hFF_FFFF) : (D_carry1 ? 24'd1 : 24'd0);

    wire [23:0] s, c;
    
    reg		[23:0]	op1, op2, op3;
	reg		[12:0]	K_carry_ext_reg;
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n)
			K_carry_ext_reg		<= 13'd0;
		else
			K_carry_ext_reg		<= K_carry_ext;
	end
	
	always @(posedge i_clk or negedge i_rst_n) begin
		if (!i_rst_n) begin
			op1		<= 24'd0;
			op2		<= 24'd0;
			op3		<= 24'd0;
		end
		else begin
			if (i_sel) begin
				op1		<= {11'd0, K_term0};
				op2		<= {11'd0, K_term1};
				op3		<= {11'd0, K_term2};
			end
			else begin
				op1		<= D_term1;
				op2		<= ~D_term2;
				op3		<= D_adj;
			end
		end
	end
	
//    wire [23:0] op1 = i_sel ? {11'd0, K_term0} : D_term1;
//    wire [23:0] op2 = i_sel ? {11'd0, K_term1} : ~D_term2;
//    wire [23:0] op3 = i_sel ? {11'd0, K_term2} : D_adj;

    CSA_KAD #(
        .adder_width(24)
    ) inst_CSA_KAD_1 (
        .op1(op1),
        .op2(op2),
        .op3(op3),
        .s  (s),
        .c  (c)
    );

    wire [12:0] K_sum = s + (c << 1) + K_carry_ext_reg;
    wire [24:0] D_sum = {1'b0, s} + ({1'b0, c} << 1) + 25'd1;

    assign o_H = i_sel ? {11'd0, K_sum} : D_sum[23:0];

endmodule
