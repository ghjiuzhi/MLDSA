`timescale 1ns / 1ps

module Addr_Gen (
	input				clk,
	input				rst_n,
	input				enable,
	input				KAD_Mode,	//=1 ML_KEM, =0 ML_DSA
	input				Multi_Mode,	//=1 NTT, =0 INTT
	output				switch,
	output				wr0_en,
	output		[5:0]	wr0_addr,
	output				wr1_en,
	output		[5:0]	wr1_addr,
	output				wr2_en,
	output		[5:0]	wr2_addr,
	output				wr3_en,
	output		[5:0]	wr3_addr,
	output				rd_en,
	output	reg			rd_done,
	output	reg	[5:0]	rd_addr
);

parameter
	IDLE	= 5'b00000,
	S1		= 5'b00001,
	S2		= 5'b00010,
	S3		= 5'b00100,
	S4		= 5'b01000,
	LAST	= 5'b10000;

genvar	i;
reg		[4:0]	CS;
reg		[4:0]	NS;

reg				start_flag;
reg				start_flag_delay [0:16];
reg				ALU_switch;
reg				ALU_switch_delay [0:12];
reg		[5:0]	KAD_cnt64;
reg		[5:0]	KAD_l1_and_l4_cnt64;
reg		[1:0]	DSA_l2_cnt4_last;
reg		[3:0]	DSA_l2_cnt16_first;
reg		[3:0]	DSA_l3_cnt16_last;
reg		[1:0]	DSA_l3_cnt4_first;

reg		[1:0]	KEM_l2_cnt4_last;
reg		[2:0]	KEM_l2_cnt8_first;
reg				KEM_l2_cnt2_top;
reg		[2:0]	KEM_l2_intt_cnt8_last;
reg		[1:0]	KEM_l2_intt_cnt4_first;
reg				KEM_l2_intt_cnt2_top;
reg		[3:0]	KEM_l3_cnt16_last;
reg				KEM_l3_cnt2_first;
reg				KEM_l3_cnt2_top;
reg				KEM_l4_cnt2_top;
reg				KEM_l4_cnt2_last;
reg		[3:0]	KEM_l4_cnt16_first;

reg		[5:0]	rd_addr_delay [0:16];

// KEM and DSA counter for FSM
// 0 to 63 counter
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KAD_cnt64 <= 6'd0;
    else if(start_flag)
        KAD_cnt64 <= KAD_cnt64 + 1'b1;
end

// KEM and DSA counter for the first stage
// 0 to 63 counter
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		KAD_l1_and_l4_cnt64 <= 6'b0;
	else if (enable)
		KAD_l1_and_l4_cnt64 <= KAD_l1_and_l4_cnt64 + 1'b1;
	else
		KAD_l1_and_l4_cnt64 <= 6'b0;
end

// DSA counter for the second stage
// 0 to 15 counter
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l2_cnt16_first <= 4'b0;
    else if(enable)
        DSA_l2_cnt16_first <= DSA_l2_cnt16_first + 1'b1;
	else
        DSA_l2_cnt16_first <= 4'b0;
end

// 0 to 3 counter
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l2_cnt4_last <= 2'b0;
    else if(!enable)
        DSA_l2_cnt4_last <= 2'b0;
    else if (DSA_l2_cnt16_first == 4'd15)
        DSA_l2_cnt4_last <= DSA_l2_cnt4_last + 1'b1;
end

// KEM counter for the second stage
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_cnt8_first <= 4'b0;
    else if(enable)
        KEM_l2_cnt8_first <= KEM_l2_cnt8_first + 1'b1;
	else
        KEM_l2_cnt8_first <= 4'b0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_cnt4_last <= 2'b0;
    else if(!enable)
        KEM_l2_cnt4_last <= 2'b0;
    else if(KEM_l2_cnt8_first=='d7)
        KEM_l2_cnt4_last <= KEM_l2_cnt4_last + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_cnt2_top <= 1'b0;
    else if(!enable)
        KEM_l2_cnt2_top <= 1'b0;
    else if({KEM_l2_cnt8_first,KEM_l2_cnt4_last}=='d31)
        KEM_l2_cnt2_top <= KEM_l2_cnt2_top + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_intt_cnt4_first <= 2'b0;
    else if(enable)
        KEM_l2_intt_cnt4_first <= KEM_l2_intt_cnt4_first + 1'b1;
	else
        KEM_l2_intt_cnt4_first <= 2'b0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_intt_cnt8_last <= 3'b0;
    else if(!enable)
        KEM_l2_intt_cnt8_last <= 3'b0;
    else if(KEM_l2_intt_cnt4_first=='d3)
        KEM_l2_intt_cnt8_last <= KEM_l2_intt_cnt8_last + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_intt_cnt2_top <= 1'b0;
    else if(!enable)
        KEM_l2_intt_cnt2_top <= 1'b0;
    else if({KEM_l2_intt_cnt4_first,KEM_l2_intt_cnt8_last}=='d31)
        KEM_l2_intt_cnt2_top <= KEM_l2_intt_cnt2_top + 1'b1;
end

// DSA counter for the third stage
// 0 to 3 counter
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l3_cnt4_first <= 2'b0;
    else if (enable)
        DSA_l3_cnt4_first <= DSA_l3_cnt4_first + 1'b1;
	else
        DSA_l3_cnt4_first <= 2'b0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l3_cnt16_last <= 4'b0;
    else if(!enable)
        DSA_l3_cnt16_last <= 4'b0;
    else if (DSA_l3_cnt4_first == 2'd3)
        DSA_l3_cnt16_last <= DSA_l3_cnt16_last + 1'b1;
end

// KEM counter for the third stage
always @(posedge clk or negedge rst_n) begin                                                                  
    if(!rst_n)
        KEM_l3_cnt2_first <= 1'b0;
    else if(enable)
        KEM_l3_cnt2_first <= KEM_l3_cnt2_first + 1'b1;
	else
        KEM_l3_cnt2_first <= 1'b0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l3_cnt16_last <= 4'b0;
    else if(!enable)
        KEM_l3_cnt16_last <= 4'b0;
    else if(KEM_l3_cnt2_first=='d1)
        KEM_l3_cnt16_last <= KEM_l3_cnt16_last + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l3_cnt2_top <= 1'b0;
    else if(!enable)
        KEM_l3_cnt2_top <= 1'b0;
    else if({KEM_l3_cnt2_first, KEM_l3_cnt16_last}=='d31)
        KEM_l3_cnt2_top <= KEM_l3_cnt2_top + 1'b1;
end

// KEM counter for the fourth stage
always @(posedge clk or negedge rst_n) begin                                                                  
    if(!rst_n)
        KEM_l4_cnt16_first <= 4'b0;
    else if(enable)
        KEM_l4_cnt16_first <= KEM_l4_cnt16_first + 1'b1;
	else
        KEM_l4_cnt16_first <= 4'b0;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l4_cnt2_last <= 1'b0;
    else if(KEM_l4_cnt16_first=='d15)
        KEM_l4_cnt2_last <= KEM_l4_cnt2_last + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l4_cnt2_top <= 1'b0;
    else if(!enable)
        KEM_l4_cnt2_top <= 1'b0;
    else if({KEM_l4_cnt16_first, KEM_l4_cnt2_last}=='d31)
        KEM_l4_cnt2_top <= KEM_l4_cnt2_top + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        CS <= IDLE;
    else
        CS <= NS;
end

always @ (CS or enable or KAD_cnt64) begin
    NS = IDLE;
    case(CS)
        IDLE: begin
            if (enable)
                NS = S1;
            else
                NS = IDLE;
        end
        S1: begin
            if (KAD_cnt64 == 6'd63)
                NS = S2;
            else
                NS = S1;
        end
        S2: begin
            if (KAD_cnt64 == 6'd63)
                NS = S3;
            else
                NS = S2;
        end
        S3: begin
            if (KAD_cnt64 == 6'd63)
                NS = S4;
            else
                NS = S3;
        end
        S4: begin
            if (KAD_cnt64 == 6'd63)
                NS = LAST;
            else
                NS = S4;
        end
        LAST: begin
            if (!enable)
                NS = IDLE;
            else
                NS = LAST;
        end
    endcase
end

always @(posedge clk or negedge rst_n) begin                                                   
	if (!rst_n) begin
		rd_addr		<= 6'b0;
		start_flag	<= 1'b0;
		rd_done		<= 1'b0;
		ALU_switch	<= 1'b0;
	end
	else begin
		case(NS)
			IDLE: begin
				rd_addr		<= 6'b0;
				start_flag	<= 1'b0;
				rd_done		<= 1'b0;
				ALU_switch	<= 1'b0;
			end
			S1: begin
				start_flag	<= 1'b1;
				rd_done		<= 1'b0;
				ALU_switch	<= 1'b0;
				if (Multi_Mode)	// KEM and DSA using same rd_addr
					rd_addr	<= KAD_l1_and_l4_cnt64;
				else begin
					if (KAD_Mode)
						rd_addr <= {KEM_l2_intt_cnt2_top,KEM_l2_intt_cnt4_first,KEM_l2_intt_cnt8_last};
					else
						rd_addr	<= {DSA_l3_cnt4_first, DSA_l3_cnt16_last};
				end
			end
			S2: begin
				start_flag	<= 1'b1;
				rd_done		<= 1'b0;
				ALU_switch	<= 1'b0;
				if (KAD_Mode) begin
            		if(Multi_Mode)
                		rd_addr <= {KEM_l2_cnt2_top,KEM_l2_cnt8_first,KEM_l2_cnt4_last};
            		else
                		rd_addr <= {KEM_l4_cnt2_top,KEM_l4_cnt16_first,KEM_l4_cnt2_last};
                end
                else begin
					rd_addr <= {DSA_l2_cnt16_first,DSA_l2_cnt4_last};
                end
			end
			S3: begin
				start_flag	<= 1'b1;
				rd_done		<= 1'b0;
				ALU_switch	<= 1'b0;
				if (Multi_Mode) begin
					if (KAD_Mode)
						rd_addr <= {KEM_l3_cnt2_top,KEM_l3_cnt2_first,KEM_l3_cnt16_last};
					else
						rd_addr <= {DSA_l3_cnt4_first, DSA_l3_cnt16_last};
				end
				else
					rd_addr <= KAD_l1_and_l4_cnt64;
			end
			S4: begin
				start_flag	<= 1'b1;
				rd_done		<= 1'b0;
				ALU_switch	<= 1'b1;
				if(Multi_Mode)
					if (KAD_Mode)
						rd_addr <= {KEM_l4_cnt2_top,KEM_l4_cnt16_first,KEM_l4_cnt2_last};
					else
						rd_addr	<= KAD_l1_and_l4_cnt64;
				else
					rd_addr	<= KAD_l1_and_l4_cnt64;
			end
			LAST: begin
				rd_addr		<= 6'b0;
				start_flag	<= 1'b0;
				rd_done		<= 1'b1;
				ALU_switch	<= 1'b0;
			end
		endcase
	end
end

assign rd_en = start_flag;

generate
    for(i=0; i<17; i=i+1)
		begin: delay_start_flag
			if(i==0)
				always @ (posedge clk) begin
					start_flag_delay[i] <= start_flag;  
				end                                     
			else
				always @ (posedge clk) begin
					start_flag_delay[i] <= start_flag_delay[i-1];
				end
		end
endgenerate

//����дʹ����??
assign wr0_en = start_flag_delay[13];   //�������rd_addr_delay??��������??ôʱ��д��д��ַ??
assign wr1_en = start_flag_delay[14];
assign wr2_en = start_flag_delay[15];
assign wr3_en = start_flag_delay[16];

//������ַ���ĸ�д��ַ
generate
    for(i=0; i<17; i=i+1)
		begin: gen_bank_waddr
			if(i==0)
				always @ (posedge clk) begin
					rd_addr_delay[i] <= rd_addr;
				end
			else
				always @ (posedge clk) begin
					rd_addr_delay[i] <= rd_addr_delay[i-1];
				end
			end
endgenerate

assign wr0_addr = rd_addr_delay[13]; 
assign wr1_addr = rd_addr_delay[14]; 
assign wr2_addr = rd_addr_delay[15]; 
assign wr3_addr = rd_addr_delay[16]; 

//����ALU�����ʽ�л��ź�
generate
    for(i=0; i<13; i=i+1)
		begin: delay_ALU_switch
			if(i==0)
				always @ (posedge clk) begin
					ALU_switch_delay[i] <= ALU_switch;
				end
			else
				always @ (posedge clk) begin
					ALU_switch_delay[i] <= ALU_switch_delay[i-1];
				end
		end
endgenerate

assign switch = KAD_Mode ? ALU_switch : ALU_switch_delay[12];

endmodule
