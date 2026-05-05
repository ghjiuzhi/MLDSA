`timescale 1ns / 1ps
//实现一个蝶形运算,
//核心内容就是对于NTT：先乘以旋转因子(latency 4),经过PE1(latency 1),经过模乘(latency 4),经过PE2(latency 1),依次输出
//对于INTT：先经过PE1(latency 1),经过模乘(latency 4),经过PE2(latency 1),乘以旋转因子(latency 4)，依次输出
//latency 10
module ALU (
	input			clk,
	input			rst_n,
	input			enable,
	input			enable_rom_cnt,
	input			KAD_Mode,		//=1 ML_KEM, =0 ML_DSA
	input			Multi_Mode,		//=1 NTT, =0 INTT
	input			switch,
	input	[22:0]	in0,
	input	[22:0]	in1,
	input	[22:0]	in2,
	input	[22:0]	in3,
	output	[22:0]	out0,
	output	[22:0]	out1,
	output	[22:0]	out2,
	output	[22:0]	out3
);

genvar i;
wire			enable_rom;
reg				enable_rom_cnt_delay [0:7];

wire	[22:0]	tw1;
wire	[22:0]	tw2;
wire	[22:0]	tw3;

wire	[22:0]	mul_row_in_1;
wire	[22:0]	mul_row_in_2;
wire	[22:0]	mul_row_in_3;

reg		[22:0]	p0_d1;
reg		[22:0]	p0_d2;
reg		[22:0]	p0_d3;
reg		[22:0]	p0_d4;
reg		[22:0]	p0_d5;
reg		[22:0]	p0_d6;
wire	[22:0]	p1;
reg		[22:0]	p1_d1;
wire	[22:0]	p2;
reg		[22:0]	p2_d1;
reg		[22:0]	p2_d2;
wire	[22:0]	p3;
reg		[22:0]	p3_d1;
reg		[22:0]	p3_d2;
reg		[22:0]	p3_d3;

wire	[22:0]	PE1_in_0;
wire	[22:0]	PE1_in_1;
wire	[22:0]	PE1_in_2;
wire	[22:0]	PE1_in_3;
wire	[22:0]	PE1_out_0;
reg		[22:0]	PE1_out_0_d1;
reg		[22:0]	PE1_out_0_d2;
reg		[22:0]	PE1_out_0_d3;
reg		[22:0]	PE1_out_0_d4;
reg		[11:0]	PE1_out_0_d5;
reg		[11:0]	PE1_out_0_d6;
reg		[11:0]	PE1_out_0_d7;
reg		[11:0]	PE1_out_0_d8;
reg		[11:0]	PE1_out_0_d9;
reg		[11:0]	PE1_out_0_d10;
wire	[22:0]	PE1_out_1;
reg		[22:0]	PE1_out_1_d1;
reg		[22:0]	PE1_out_1_d2;
reg		[22:0]	PE1_out_1_d3;
reg		[22:0]	PE1_out_1_d4;
reg		[11:0]	PE1_out_1_d5;
reg		[11:0]	PE1_out_1_d6;
reg		[11:0]	PE1_out_1_d7;
reg		[11:0]	PE1_out_1_d8;
reg		[11:0]	PE1_out_1_d9;
reg		[11:0]	PE1_out_1_d10;
reg		[11:0]	PE1_out_1_d11;
wire	[22:0]	PE1_out_2;
reg		[22:0]	PE1_out_2_d1;
reg		[22:0]	PE1_out_2_d2;
reg		[22:0]	PE1_out_2_d3;
reg		[22:0]	PE1_out_2_d4;
reg		[22:0]	PE1_out_2_d5;
reg		[22:0]	PE1_out_2_d6;
reg		[22:0]	PE1_out_2_d7;
wire	[22:0]	PE1_out_3_mid;
reg		[11:0]	PE1_out_3_mid_d1;
reg		[11:0]	PE1_out_3_mid_d2;
reg		[11:0]	PE1_out_3_mid_d3;
reg		[11:0]	PE1_out_3_mid_d4;
reg		[11:0]	PE1_out_3_mid_d5;
reg		[11:0]	PE1_out_3_mid_d6;
reg		[11:0]	PE1_out_3_mid_d7;
reg		[11:0]	PE1_out_3_mid_d8;
reg		[11:0]	PE1_out_3_mid_d9;
wire	[22:0]	PE1_out_3;

wire	[22:0]	PE2_out_0;
wire	[22:0]	PE2_out_1;
reg		[22:0]	PE2_out_1_d1;
wire	[22:0]	PE2_out_2;
reg		[22:0]	PE2_out_2_d1;
reg		[22:0]	PE2_out_2_d2;
wire	[22:0]	PE2_out_3;
reg		[22:0]	PE2_out_3_d1;
reg		[22:0]	PE2_out_3_d2;
reg		[22:0]	PE2_out_3_d3;

reg		[11:0]	in0_d1;
reg		[11:0]	in0_d2;
reg		[11:0]	in0_d3;
reg		[11:0]	in0_d4;
reg		[11:0]	in0_d5;
reg		[11:0]	in2_d1;
reg		[11:0]	in2_d2;
reg		[11:0]	in2_d3;
reg		[11:0]	in2_d4;
reg		[11:0]	in2_d5;

reg				switch_delay [0:16];

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		in0_d1 <= 0;
		in0_d2 <= 0;
		in0_d3 <= 0;
		in0_d4 <= 0;
		in0_d5 <= 0;
		in2_d1 <= 0;
		in2_d2 <= 0;
		in2_d3 <= 0;
		in2_d4 <= 0;
		in2_d5 <= 0;
	end
	else begin
		in0_d1 <= in0[11:0];
		in0_d2 <= in0_d1;
		in0_d3 <= in0_d2;
		in0_d4 <= in0_d3;
		in0_d5 <= in0_d4;
		in2_d1 <= in2[11:0];
		in2_d2 <= in2_d1;
		in2_d3 <= in2_d2;
		in2_d4 <= in2_d3;
		in2_d5 <= in2_d4;
	end
end

//-----------------------------------------------------------------------//
//控制NTT和INTT过程中旋转因子的生成时间
generate
    for(i=0; i<8; i=i+1)
		begin: gen_rom
			if(i==0)
				always @ (posedge clk or negedge rst_n) begin
					if(!rst_n)
						enable_rom_cnt_delay[i] <= 0;
					else
						enable_rom_cnt_delay[i] <= enable_rom_cnt;
				end
			else
				always @ (posedge clk or negedge rst_n) begin
					if(!rst_n)
						enable_rom_cnt_delay[i] <= 0;
					else
						enable_rom_cnt_delay[i] <= enable_rom_cnt_delay[i-1];
				end
			end
endgenerate

assign enable_rom = (Multi_Mode)?  enable_rom_cnt : enable_rom_cnt_delay[7];

rom_tw inst_rom_tw(
	.clk		(clk),
	.rst_n		(rst_n),
	.enable		(enable_rom),
	.KAD_Mode	(KAD_Mode),
	.Multi_Mode	(Multi_Mode),
	.tw1		(tw1),
	.tw2		(tw2),
	.tw3		(tw3)
);

//把in1 in2 in3都乘对应的旋转因子然后取模
assign mul_row_in_1 = (Multi_Mode) ? in1 : PE2_out_1;
assign mul_row_in_2 = (Multi_Mode) ? in2 : ((KAD_Mode && switch_delay[8]) ? PE1_out_2_d6 : PE2_out_2);
assign mul_row_in_3 = (Multi_Mode) ? in3 : ((KAD_Mode && switch_delay[8]) ? {11'd0, PE1_out_3_mid_d6} : PE2_out_3);

//latency 4
Mont_Mult_KAD u1_Mont_Mult_KAD(
	.i_clk		(clk),
	.i_rst_n	(rst_n),
	.i_a		(mul_row_in_1),
	.i_b		(tw1),
	.i_sel		(KAD_Mode),
	.o_c		(p1)
);

//latency 4
Mont_Mult_KAD u2_Mont_Mult_KAD(
	.i_clk		(clk),
	.i_rst_n	(rst_n),
	.i_a		(mul_row_in_2),
	.i_b		(tw2),
	.i_sel		(KAD_Mode),
	.o_c		(p2)
);

//latency 4
Mont_Mult_KAD u3_Mont_Mult_KAD(
	.i_clk		(clk),
	.i_rst_n	(rst_n),
	.i_a		(mul_row_in_3),
	.i_b		(tw3),
	.i_sel		(KAD_Mode),
	.o_c		(p3)
);

always @ (posedge clk) begin
    if(Multi_Mode)
        p0_d1 <= in0;
    else
        p0_d1 <= PE2_out_0;
end

always @ (posedge clk) begin
    p0_d2 <= p0_d1;
    p0_d3 <= p0_d2;
    p0_d4 <= p0_d3;
    p0_d5 <= p0_d4;
    p0_d6 <= p0_d5;
end


generate
    for(i=0; i<17; i=i+1)
    begin: switch_delay_code
    if(i==0)
        always @ (posedge clk) begin
            switch_delay[i] <= switch;
        end
    else
        always @ (posedge clk) begin
            switch_delay[i] <= switch_delay[i-1];
        end
    end
endgenerate

//-------------------------------------------------------//
//蝶形运算的加减法
/*
inst1_PE
P0 + P2 = a(0)
P0 - P2 = a(2)

inst2_PE
P1 + P3 = a(1)
P1 - P3 = a(3)
*/
assign PE1_in_0 = KAD_Mode ? (Multi_Mode ? p0_d4 : in0) : (Multi_Mode ? p0_d4 : in0);
assign PE1_in_1 = KAD_Mode ? (Multi_Mode ? (switch_delay[4] ? {11'd0, in2_d4} : p1) : (switch_delay[0] ? in2 : in1)) : (Multi_Mode ? p1 : in1);
assign PE1_in_2 = KAD_Mode ? (Multi_Mode ? (switch_delay[4] ? p1 : p2) : (switch_delay[0] ? in1 : in2)) : (Multi_Mode ? p2 : in2);
assign PE1_in_3 = (Multi_Mode) ? p3 : in3;
//latency 2
ALU_PE inst1_ALU_PE(
    .clk(clk),
    .rst_n(rst_n),
    .KAD_Mode(KAD_Mode),
    .Multi_Mode(Multi_Mode),
    .in1(PE1_in_0),
    .in2(PE1_in_2),
    .out1(PE1_out_0),
    .out2(PE1_out_2)
);

//latency 2
ALU_PE inst2_ALU_PE(
    .clk(clk),
    .rst_n(rst_n),
    .KAD_Mode(KAD_Mode),
    .Multi_Mode(Multi_Mode),
    .in1(PE1_in_1),
    .in2(PE1_in_3),
    .out1(PE1_out_1),
    .out2(PE1_out_3_mid)
);

//a3_tmp * r4_coe % p = a3
wire [22:0] r4_coe;
assign r4_coe = KAD_Mode ? (Multi_Mode ? 23'd2402 : 23'd927) : (Multi_Mode ? 23'd294725 : 23'd8085692); //??????????2/N??????????????????????????????????????????

//latency 4
Mont_Mult_KAD u4_Mont_Mult_KAD(
	.i_clk		(clk),
	.i_rst_n	(rst_n),
	.i_a		(PE1_out_3_mid),
	.i_b		(r4_coe),
	.i_sel		(KAD_Mode),
	.o_c		(PE1_out_3)
);

always @(posedge clk) begin
	PE1_out_0_d1 <= PE1_out_0;
	PE1_out_0_d2 <= PE1_out_0_d1;
	PE1_out_0_d3 <= PE1_out_0_d2;
	PE1_out_0_d4 <= PE1_out_0_d3;
	PE1_out_0_d5 <= PE1_out_0_d4[11:0];
	PE1_out_0_d6 <= PE1_out_0_d5;
	PE1_out_0_d7 <= PE1_out_0_d6;
	PE1_out_0_d8 <= PE1_out_0_d7;
	PE1_out_0_d9 <= PE1_out_0_d8;
	PE1_out_0_d10 <= PE1_out_0_d9;
	
	PE1_out_1_d1 <= PE1_out_1;
	PE1_out_1_d2 <= PE1_out_1_d1;
	PE1_out_1_d3 <= PE1_out_1_d2;
	PE1_out_1_d4 <= PE1_out_1_d3;
	PE1_out_1_d5 <= PE1_out_1_d4[11:0];
	PE1_out_1_d6 <= PE1_out_1_d5;
	PE1_out_1_d7 <= PE1_out_1_d6;
	PE1_out_1_d8 <= PE1_out_1_d7;
	PE1_out_1_d9 <= PE1_out_1_d8;
	PE1_out_1_d10 <= PE1_out_1_d9;
	PE1_out_1_d11 <= PE1_out_1_d10;
	
	PE1_out_2_d1 <= PE1_out_2;
	PE1_out_2_d2 <= PE1_out_2_d1;
	PE1_out_2_d3 <= PE1_out_2_d2;
	PE1_out_2_d4 <= PE1_out_2_d3;
	PE1_out_2_d5 <= PE1_out_2_d4;
	PE1_out_2_d6 <= PE1_out_2_d5;
	PE1_out_2_d7 <= PE1_out_2_d6;
	
	PE1_out_3_mid_d1 <= PE1_out_3_mid[11:0];
	PE1_out_3_mid_d2 <= PE1_out_3_mid_d1;
	PE1_out_3_mid_d3 <= PE1_out_3_mid_d2;
	PE1_out_3_mid_d4 <= PE1_out_3_mid_d3;
	PE1_out_3_mid_d5 <= PE1_out_3_mid_d4;
	PE1_out_3_mid_d6 <= PE1_out_3_mid_d5;
	PE1_out_3_mid_d7 <= PE1_out_3_mid_d6;
	PE1_out_3_mid_d8 <= PE1_out_3_mid_d7;
	PE1_out_3_mid_d9 <= PE1_out_3_mid_d8;
end

//蝶形运算的第二部分
/*
inst3_PE
a(0) + a(1) = X(0)
a(0) - a(1) = X(2)

inst4_PE
a(2) + a(3) = X(1)
a(2) - a(3) = X(3)
*/

//latency 2
ALU_PE inst3_ALU_PE(
	.clk		(clk),
	.rst_n		(rst_n),
	.KAD_Mode	(KAD_Mode),
	.Multi_Mode	(Multi_Mode),
	.in1		(PE1_out_0_d4),
	.in2		(PE1_out_1_d4),
	.out1		(PE2_out_0),
	.out2		(PE2_out_2)
);

//latency 2
ALU_PE inst4_ALU_PE(
	.clk		(clk),
	.rst_n		(rst_n),
	.KAD_Mode	(KAD_Mode),
	.Multi_Mode	(Multi_Mode),
	.in1		(PE1_out_2_d4),
	.in2		(PE1_out_3),
	.out1		(PE2_out_1),
	.out2		(PE2_out_3)
);

//latency 3
//现在我们认为x0, x2, x1, x3是一起输出的
//以此输出x0, x2, x1, x3
always @(posedge clk) begin
	p1_d1			<= p1;
	p2_d1			<= p2;
	p2_d2			<= p2_d1;
	p3_d1			<= p3;
	p3_d2			<= p3_d1;
	p3_d3			<= p3_d2;
	PE2_out_1_d1	<= PE2_out_1;
	PE2_out_2_d1	<= PE2_out_2;
	PE2_out_2_d2	<= PE2_out_2_d1;
	PE2_out_3_d1	<= PE2_out_3;
	PE2_out_3_d2	<= PE2_out_3_d1;
	PE2_out_3_d3	<= PE2_out_3_d2;
end

assign out0 = KAD_Mode ? (Multi_Mode ? (switch_delay[12] ? {11'd0, PE1_out_0_d6} : PE2_out_0) : (switch_delay[12] ? {11'd0, PE1_out_0_d10} : p0_d4)) : (Multi_Mode ?  PE2_out_0 : p0_d4);
assign out1 = KAD_Mode ? (Multi_Mode ? (switch_delay[13] ? PE1_out_2_d7 : PE2_out_1_d1) : (switch_delay[13] ? {11'd0, PE1_out_1_d11} : p1_d1)) : (Multi_Mode) ?  PE2_out_1_d1 : p1_d1;
assign out2 = KAD_Mode ? (Multi_Mode ? (switch_delay[14] ? {11'd0, PE1_out_1_d8} : PE2_out_2_d2) : p2_d2) : (Multi_Mode) ?  PE2_out_2_d2 : p2_d2;
assign out3 = KAD_Mode ? (Multi_Mode ? (switch_delay[15] ? {11'd0, PE1_out_3_mid_d9} : PE2_out_3_d3) : p3_d3) : (Multi_Mode) ?  PE2_out_3_d3 : p3_d3;

endmodule
