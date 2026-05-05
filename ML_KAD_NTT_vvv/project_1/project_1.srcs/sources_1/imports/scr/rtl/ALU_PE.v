//latency 2
//NTT mode: out1 = in1 + in2 mod Q; out2 = in1 - in2 mod Q
//INTT mode: out1 = (in1 + in2)/2 mod Q; out2 = (in1 - in2)/2 mod Q
module ALU_PE (
	input			clk,
	input			rst_n,
	input			KAD_Mode,		//=1 ML_KEM, =0 ML_DSA
	input			Multi_Mode,		//=1 NTT, =0 INTT
	input	[22:0]	in1,
	input	[22:0]	in2,
	output	[22:0]	out1,
	output	[22:0]	out2
);

genvar i;                          
parameter KEM_Q = 23'd3329;
parameter DSA_Q = 23'd8380417;
parameter KEM_half_Q = 22'd1665;
parameter DSA_half_Q = 22'd4190209;

reg		[22:0]	in1_reg;
reg		[22:0]	in2_reg;

wire	[23:0]	out1_tmp1;
wire	[23:0]	out1_tmp1_lag;
wire	[23:0]	out1_tmp2;
wire			sign1;
reg		[22:0]	out1_tmp0;
wire	[22:0]	out1_tmp;
wire	[22:0]	NTT_out1;
wire	[22:0]	INTT_out1;

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		in1_reg <= 23'd0;
		in2_reg <= 23'd0;
	end
	else begin
		in1_reg <= in1;
		in2_reg <= in2;
	end
end

PE_add_23bit inst_PE_add_14bit (
	.A	(in1_reg),			// input wire [22 : 0] A
	.B	(in2_reg),			// input wire [22 : 0] B
	.S	(out1_tmp1)		// output wire [23 : 0] S
);

assign out1_tmp1_lag = out1_tmp1;

wire	[22:0]	KAD_Q;
assign	KAD_Q = KAD_Mode ? KEM_Q : DSA_Q;

PE_sub_24bit inst_PE_sub_24bit (
  .A(out1_tmp1_lag),	// input wire [23 : 0] A
  .B(KAD_Q),          // input wire [22 : 0] B
  .C_OUT(sign1),  // output wire C_OUT
  .S(out1_tmp2)          // output wire [23 : 0] S
);

//A+B-p < 0, sign1 = 0, select A+B,   out1_tmp1
//A+B-p > 0, sign1 = 1, select A+B-p, out1_tmp2
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        out1_tmp0 <= 'b0;
    else if(sign1)
        out1_tmp0 <= out1_tmp2[22:0];
    else
        out1_tmp0 <= out1_tmp1_lag[22:0];
end

assign NTT_out1 = out1_tmp0;

//x / 2
//if x[0]==1, (x >> 1) + (p + 1)/2; else, x >> 1

wire	[21:0]	KAD_half_Q;
assign	KAD_half_Q = KAD_Mode ? KEM_half_Q : DSA_half_Q;

PE_add_halfp inst1_PE_add_halfp (
	.A(out1_tmp0[22:1]),
	.B(KAD_half_Q),  // input wire [21 : 0] B	
	.S(out1_tmp)
);

assign INTT_out1 = (out1_tmp0[0] == 1) ? out1_tmp : {1'b0,out1_tmp0[22:1]};

assign out1 = (Multi_Mode == 1) ? NTT_out1 : INTT_out1;

//-----------------------------------------------------------------------------//
//(A-B)%p
wire	[22:0]	out2_tmp1;
wire	[22:0]	out2_tmp1_lag;
wire	[22:0]	out2_tmp2;
wire			sign2;
wire			sign2_lag;
reg		[22:0]	out2_tmp0;
wire	[22:0]	out2_tmp;
wire	[22:0]	NTT_out2;
wire	[22:0]	INTT_out2;

PE_sub_23bit inst_PE_sub_23bit (
	.A(in1_reg),          	// input wire [22 : 0] A
	.B(in2_reg),          	// input wire [22 : 0] B
	.C_OUT(sign2),  	// output wire C_OUT
	.S(out2_tmp1)		// output wire [22 : 0] S
);

//always @ (posedge clk or negedge rst_n)
//begin
//    if(!rst_n)
//        sign2_lag <= 'b0;
//    else
//        sign2_lag <= sign2;
//end

assign sign2_lag = sign2;

//always @ (posedge clk or negedge rst_n)
//begin
//    if(!rst_n)
//        out2_tmp1_lag <= 'b0;
//    else
//        out2_tmp1_lag <= out2_tmp1;
//end

assign out2_tmp1_lag = out2_tmp1;

PE_add_23bit inst_PE_add_23bit (
	.A	(out2_tmp1_lag),			// input wire [22 : 0] A
	.B	(KAD_Q),			// input wire [22 : 0] B
	.S	(out2_tmp2)		// output wire [23 : 0] S
);

//A-B < 0, sign2 = 0, select A-B+p, out2_tmp2
//A-B > 0, sign2 = 1, select A-B,   out2_tmp1
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        out2_tmp0 <= 'b0;
    else if(sign2_lag)
        out2_tmp0 <= out2_tmp1_lag;
    else
        out2_tmp0 <= out2_tmp2;
end

assign NTT_out2 = out2_tmp0;

//x / 2
//if x[0]==1, (x >> 1) + (p + 1)/2; else, x >> 1
PE_add_halfp inst2_PE_add_halfp (
	.A(out2_tmp0[22:1]),    
	.B(KAD_half_Q),  // input wire [21 : 0] B	
	.S(out2_tmp)    
);

assign INTT_out2 = (out2_tmp0[0] == 1) ? out2_tmp : {1'b0,out2_tmp0[22:1]};

assign out2 = (Multi_Mode == 1) ? NTT_out2 : INTT_out2;

endmodule
