// ML_KAD NTT support ML_KEM and ML_DSA NTT
`timescale 1ns / 1ps

(*DONT_TOUCH= "TRUE"*)
module top_NTT (
	input				clk,
	input				rst_n,
	input				enable,
	input				KAD_Mode,	//=1 ML_KEM, =0 ML_DSA
	input				Multi_Mode,	//=1 NTT, =0 INTT
	//output	[13:0]	out0,
	//output	[13:0]	out1,
	//output	[13:0]	out2,
	//output	[13:0]	out3,
	output				done_flag
);

genvar i;

reg				enable_delay [0:16];
reg				done_flag_tmp;

wire			rd_en;
wire			rd_done;
reg				rd_done_delay [0:15];
wire	[5:0]	rd_addr;
wire			wr0_en;
wire	[5:0]	wr0_addr;
wire			wr1_en;
wire	[5:0]	wr1_addr;
wire			wr2_en;
wire	[5:0]	wr2_addr;
wire			wr3_en;
wire	[5:0]	wr3_addr;

wire	[22:0]	bank0_out;
wire	[22:0]	bank1_out;
wire	[22:0]	bank2_out;
wire	[22:0]	bank3_out;
reg		[22:0]	bank0_in;
reg		[22:0]	bank1_in;
reg		[22:0]	bank2_in;
reg		[22:0]	bank3_in;

reg		[1:0]	bank0_cnt4;
reg		[1:0]	bank1_cnt4;
reg		[1:0]	bank2_cnt4;
reg		[1:0]	bank3_cnt4;

wire			switch;
reg				switch_d1;
reg				switch_d2;
reg				switch_d3;
wire	[22:0]	ALU_in0;
wire	[22:0]	ALU_in1;
wire	[22:0]	ALU_in2;
wire	[22:0]	ALU_in3;
wire	[22:0]	ALU_out0;
wire	[22:0]	ALU_out1;
wire	[22:0]	ALU_out2;
wire	[22:0]	ALU_out3;

reg				switch_delay [0:15];
generate
    for(i=0; i<16; i=i+1)
    begin: switch_delay_reg
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

generate
	for(i=0; i<17; i=i+1)
		begin: delay_enable
			if(i==0)
				always @ (posedge clk) begin
					enable_delay[i] <= enable;
				end
			else
				always @ (posedge clk) begin
					enable_delay[i] <= enable_delay[i-1];
				end
		end
endgenerate

generate
	for(i=0; i<16; i=i+1)
		begin: delay_rd_done
			if(i==0)
				always @ (posedge clk) begin
					rd_done_delay[i] <= rd_done;
				end
			else
				always @ (posedge clk) begin
					rd_done_delay[i] <= rd_done_delay[i-1];
				end
		end
endgenerate

//NTT
assign ALU_in0 = bank0_out;
assign ALU_in1 = (Multi_Mode) ? (KAD_Mode && switch_delay[0] ? bank1_out : bank2_out) : bank1_out;
assign ALU_in2 = (Multi_Mode) ? (KAD_Mode && switch_delay[0] ? bank2_out : bank1_out) : bank2_out;
assign ALU_in3 = bank3_out;
//在最后一级ALU的输出方式也会发生改变T
//ALU_out0 -> bank0_in    ALU_out1 -> bank2_in    ALU_out2 -> bank1_in    ALU_out3 -> bank3_in

//定义多级switch的延迟信号，因为最后一级会改变从ALU到不同bank的输出方式，而这个发生这个转变的顺序是不同的，用延迟信号来控制
always @ (posedge clk) begin
	switch_d1 <= switch;	
	switch_d2 <= switch_d1;
	switch_d3 <= switch_d2;
end

//����ALU���������bank�ļ�����
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        bank0_cnt4 <= 2'b0;
    else if(enable_delay[13])
        bank0_cnt4 <= bank0_cnt4 + 1'b1;
    else
        bank0_cnt4 <= 2'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        bank1_cnt4 <= 2'b0;
    else if(enable_delay[14])
        bank1_cnt4 <= bank1_cnt4 + 1'b1;
    else
        bank1_cnt4 <= 2'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        bank2_cnt4 <= 2'b0;
    else if(enable_delay[15])
        bank2_cnt4 <= bank2_cnt4 + 1'b1;
    else
        bank2_cnt4 <= 2'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        bank3_cnt4 <= 2'b0;
    else if(enable_delay[16])
        bank3_cnt4 <= bank3_cnt4 + 1'b1;
    else
        bank3_cnt4 <= 2'b0;
end

wire		KAD_bank0_switch;
wire		KAD_bank1_switch;
wire		KAD_bank2_switch;
wire		KAD_bank3_switch;
assign KAD_bank0_switch = KAD_Mode ? switch_delay[12] : switch;
assign KAD_bank1_switch = KAD_Mode ? switch_delay[13] : switch_d1;
assign KAD_bank2_switch = KAD_Mode ? switch_delay[14] : switch_d2;
assign KAD_bank3_switch = KAD_Mode ? switch_delay[15] : switch_d3;

//����ALU_out��bank_in�������ʽ
always @ (posedge clk or negedge rst_n) begin
	if(!rst_n)
		bank0_in <= 23'b0;                       //����ǰ������{ALU_out0��ALU_out0��ALU_out0��ALU_out0}
	else begin
		if(KAD_bank0_switch)	//�Ƿ�Ϊ���һ��
			bank0_in <= ALU_out0;
		else		//ǰ����ѭ����ֵ
			case(bank0_cnt4)
				2'b00: bank0_in <= ALU_out0;    //����ʵ��bankд����ˮ�߻��������Ӧ��ALU_out�������0��1��2��3���������
				2'b01: bank0_in <= ALU_out1;    //������Ƶ�ģ��NTT��INTT��ALU_OUT��BANK����������߼���һ�µĲ��÷����
				2'b10: bank0_in <= ALU_out2;
				2'b11: bank0_in <= ALU_out3;
			endcase
	end
end

always @ (posedge clk or negedge rst_n) begin
	if(!rst_n)
		bank1_in <= 23'b0;
	else begin
		if(KAD_bank1_switch)//�Ƿ�Ϊ���һ��
			bank1_in <= ALU_out1;
		else//ǰ����ѭ����ֵ
			case(bank1_cnt4)
				2'b00: bank1_in <= ALU_out0;
				2'b01: bank1_in <= ALU_out1;
				2'b10: bank1_in <= ALU_out2;
				2'b11: bank1_in <= ALU_out3;
			endcase
	end
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        bank2_in <= 23'b0;
    else begin
        if(KAD_bank2_switch)//�Ƿ�Ϊ���һ��
            bank2_in <= ALU_out2;
        else//ǰ����ѭ����ֵ
            case(bank2_cnt4)
                2'b00: bank2_in <= ALU_out0;
                2'b01: bank2_in <= ALU_out1;
                2'b10: bank2_in <= ALU_out2;
                2'b11: bank2_in <= ALU_out3;
            endcase
    end
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        bank3_in <= 23'b0;
    else begin
        if(KAD_bank3_switch)
            bank3_in <= ALU_out3;
        else
            case(bank3_cnt4)
                2'b00: bank3_in <= ALU_out0;
                2'b01: bank3_in <= ALU_out1;
                2'b10: bank3_in <= ALU_out2;
                2'b11: bank3_in <= ALU_out3;
            endcase
    end
end

//�������
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        done_flag_tmp <= 1'b0;
    else
        done_flag_tmp <= rd_done_delay[15];      
end

assign done_flag = done_flag_tmp;                   
(*DONT_TOUCH= "TRUE"*)
Addr_Gen inst_address (
	.clk		(clk),
	.rst_n		(rst_n),
	.enable		(enable),
	.KAD_Mode	(KAD_Mode),
	.Multi_Mode	(Multi_Mode),
	.switch		(switch),
	.wr0_en		(wr0_en),
	.wr0_addr	(wr0_addr),
	.wr1_en		(wr1_en),
	.wr1_addr	(wr1_addr),
	.wr2_en		(wr2_en),
	.wr2_addr	(wr2_addr),
	.wr3_en		(wr3_en),
	.wr3_addr	(wr3_addr),
	.rd_en		(rd_en),
	.rd_done	(rd_done),
	.rd_addr	(rd_addr)
);
(*DONT_TOUCH= "TRUE"*)
bank64_0 inst_bank0 (
  .clka(clk),    // input wire clka
  .ena(wr0_en),      // input wire ena
  .wea(wr0_en),      // input wire [0 : 0] wea
  .addra(wr0_addr),  // input wire [7 : 0] addra
  .dina(bank0_in),    // input wire [13 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(rd_en),      // input wire enb
  .addrb(rd_addr),  // input wire [7 : 0] addrb
  .doutb(bank0_out)  // output wire [13 : 0] doutb
);
(*DONT_TOUCH= "TRUE"*)
bank64_1 inst_bank1 (
  .clka(clk),    // input wire clka
  .ena(wr1_en),      // input wire ena
  .wea(wr1_en),      // input wire [0 : 0] wea
  .addra(wr1_addr),  // input wire [7 : 0] addra
  .dina(bank1_in),    // input wire [13 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(rd_en),      // input wire enb
  .addrb(rd_addr),  // input wire [7 : 0] addrb
  .doutb(bank1_out)  // output wire [13 : 0] doutb
);
(*DONT_TOUCH= "TRUE"*)
bank64_2 inst_bank2 (
  .clka(clk),    // input wire clka
  .ena(wr2_en),      // input wire ena
  .wea(wr2_en),      // input wire [0 : 0] wea
  .addra(wr2_addr),  // input wire [7 : 0] addra
  .dina(bank2_in),    // input wire [13 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(rd_en),      // input wire enb
  .addrb(rd_addr),  // input wire [7 : 0] addrb
  .doutb(bank2_out)  // output wire [13 : 0] doutb
);
(*DONT_TOUCH= "TRUE"*)
bank64_3 inst_bank3 (
  .clka(clk),    // input wire clka
  .ena(wr3_en),      // input wire ena
  .wea(wr3_en),      // input wire [0 : 0] wea
  .addra(wr3_addr),  // input wire [7 : 0] addra
  .dina(bank3_in),    // input wire [13 : 0] dina
  .clkb(clk),    // input wire clkb
  .enb(rd_en),      // input wire enb
  .addrb(rd_addr),  // input wire [7 : 0] addrb
  .doutb(bank3_out)  // output wire [13 : 0] doutb
);

(*DONT_TOUCH= "TRUE"*)
ALU inst_ALU(
	.clk			(clk),
	.rst_n			(rst_n),
	.enable			(enable),
	.enable_rom_cnt	(enable),
	.KAD_Mode		(KAD_Mode),
	.Multi_Mode		(Multi_Mode),
	.switch			(switch),
	.in0			(ALU_in0),
	.in1			(ALU_in1),
	.in2			(ALU_in2),
	.in3			(ALU_in3),
	.out0			(ALU_out0),
	.out1			(ALU_out1),
	.out2			(ALU_out2),
	.out3			(ALU_out3)
);

endmodule
