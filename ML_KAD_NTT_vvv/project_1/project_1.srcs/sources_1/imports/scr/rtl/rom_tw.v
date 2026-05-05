`timescale 1ns / 1ps

module rom_tw (
	input			clk,
	input			rst_n,
	input			enable,
	input			KAD_Mode,	//=1 ML_KEM, =0 ML_DSA
	input			Multi_Mode,
	output	[22:0]	tw1,
	output	[22:0]	tw2,
	output	[22:0]	tw3
);

parameter
    IDLE = 5'b00000,
    S1   = 5'b00001,
    S2   = 5'b00010,
    S3   = 5'b00100,
    S4   = 5'b01000,
    LAST = 5'b10000;

genvar i;

reg		[4:0]	CS;
reg		[4:0]	NS;
reg				start_flag;

reg		[8:0]	rom_tw_cnt;
wire	[68:0]	tw;

reg		[5:0]	KAD_cnt64;
reg		[5:0]	DSA_l1_l4_cnt64;
reg		[1:0]	DSA_l2_cnt4_last;
reg		[3:0]	DSA_l2_cnt16_first;
reg		[3:0]	DSA_l3_cnt16_last;
reg		[1:0]	DSA_l3_cnt4_first;

reg		[2:0]	KEM_l2_intt_cnt8_last;
reg		[1:0]	KEM_l2_intt_cnt4_first;
reg		[1:0]	KEM_l2_cnt4_last;
reg		[2:0]	KEM_l2_cnt8_first;
reg		[3:0]	KEM_l3_cnt16_last;
reg				KEM_l3_cnt2_first;
reg		[4:0]	KEM_l4_cnt32;
reg				KEM_l4_cnt2_last;
reg		[3:0]	KEM_l4_cnt16_first;


always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KAD_cnt64 <= 6'b0;
    else if(start_flag)
        KAD_cnt64 <= KAD_cnt64 + 1'b1;
end

// DSA counter for the second stage
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l2_cnt16_first <= 4'b0;
    else if(enable)
        DSA_l2_cnt16_first <= DSA_l2_cnt16_first + 1'b1;
	else
        DSA_l2_cnt16_first <= 4'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l2_cnt4_last <= 2'b0;
    else if(!enable)
        DSA_l2_cnt4_last <= 2'b0;
    else if(DSA_l2_cnt16_first=='d15)
        DSA_l2_cnt4_last <= DSA_l2_cnt4_last + 1'b1;
end

// DSA counter for the third stage
always @ (posedge clk or negedge rst_n) begin                                                                  
    if(!rst_n)
        DSA_l3_cnt4_first <= 2'b0;
    else if(enable)
        DSA_l3_cnt4_first <= DSA_l3_cnt4_first + 1'b1;
	else
        DSA_l3_cnt4_first <= 2'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l3_cnt16_last <= 4'b0;
    else if(!enable)
        DSA_l3_cnt16_last <= 4'b0;
    else if(DSA_l3_cnt4_first=='d3)
        DSA_l3_cnt16_last <= DSA_l3_cnt16_last + 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        DSA_l1_l4_cnt64 <= 6'b0;
    else if(enable)
        DSA_l1_l4_cnt64 <= DSA_l1_l4_cnt64 + 1'b1;
    else
        DSA_l1_l4_cnt64 <= 6'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_intt_cnt4_first <= 2'b0;
    else if(enable)
        KEM_l2_intt_cnt4_first <= KEM_l2_intt_cnt4_first + 1'b1;
	else
        KEM_l2_intt_cnt4_first <= 2'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_intt_cnt8_last <= 3'b0;
    else if(!enable)
        KEM_l2_intt_cnt8_last <= 3'b0;
    else if(KEM_l2_intt_cnt4_first=='d3)
        KEM_l2_intt_cnt8_last <= KEM_l2_intt_cnt8_last + 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_cnt8_first <= 3'b0;
    else if(enable)
        KEM_l2_cnt8_first <= KEM_l2_cnt8_first + 1'b1;
	else
        KEM_l2_cnt8_first <= 3'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l2_cnt4_last <= 2'b0;
    else if(!enable)
        KEM_l2_cnt4_last <= 2'b0;
    else if(KEM_l2_cnt8_first=='d7)
        KEM_l2_cnt4_last <= KEM_l2_cnt4_last + 1'b1;
end

always @ (posedge clk or negedge rst_n) begin                                                                  
    if(!rst_n)
        KEM_l3_cnt2_first <= 1'b0;
    else if(enable)
        KEM_l3_cnt2_first <= KEM_l3_cnt2_first + 1'b1;
	else
        KEM_l3_cnt2_first <= 1'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l3_cnt16_last <= 4'b0;
    else if(!enable)
        KEM_l3_cnt16_last <= 4'b0;
    else if(KEM_l3_cnt2_first=='d1)
        KEM_l3_cnt16_last <= KEM_l3_cnt16_last + 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l4_cnt32 <= 5'b0;
    else if(enable)
        KEM_l4_cnt32 <= KEM_l4_cnt32 + 1'b1;
	else
        KEM_l4_cnt32 <= 5'b0;
end

always @ (posedge clk or negedge rst_n) begin                                                                  
    if(!rst_n)
        KEM_l4_cnt16_first <= 4'b0;
    else if(enable)
        KEM_l4_cnt16_first <= KEM_l4_cnt16_first + 1'b1;
	else
        KEM_l4_cnt16_first <= 4'b0;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        KEM_l4_cnt2_last <= 1'b0;
    else if(!enable)
        KEM_l4_cnt2_last <= 1'b0;
    else if(KEM_l4_cnt16_first=='d15)
        KEM_l4_cnt2_last <= KEM_l4_cnt2_last + 1'b1;
end

always @ (posedge clk or negedge rst_n) begin
    if(!rst_n)
        CS <= IDLE;
    else
        CS <= NS;
end

always @ (CS or enable or KAD_cnt64) begin                                  
    NS = IDLE;

    case(CS)
        IDLE: begin
            if(enable)
                NS = S1;
            else
                NS = IDLE;
        end
        S1: begin
            if(KAD_cnt64=='d63)
                NS = S2;            
            else
                NS = S1;
        end
        S2: begin
            if(KAD_cnt64=='d63)
                NS = S3;
            else
                NS = S2;
        end
        S3: begin
            if(KAD_cnt64=='d63)
                NS = S4;
            else
                NS = S3;
        end
        S4: begin
            if(KAD_cnt64=='d63)
                NS = LAST;
            else
                NS = S4;
        end
        LAST: begin
            if(!enable)
                NS = IDLE;
            else
                NS = LAST;
        end
    endcase
end

//这个模块就是为了生成旋转因子的，核心的逻辑在于读地址生成。
//NTT:第一层依次取，第二层隔四个取，第三层隔16个取，第三层依次取。
//INTT：第一层隔16个取，第二层隔4个取，三四层都是依次取。
always @ (posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        start_flag <= 1'b0;
        rom_tw_cnt <= 9'b0;                                                                                              
    end
    else begin
		case(NS)
			IDLE: begin
				start_flag <= 1'b0;
				rom_tw_cnt <= 9'b0;
			end
			S1: begin
				start_flag <= 1'b1;
				if(Multi_Mode)
					if (KAD_Mode)
						rom_tw_cnt <= {3'b0, KEM_l4_cnt32};
					else
						rom_tw_cnt <= {2'b0, DSA_l1_l4_cnt64};
				else
					if (KAD_Mode)
						rom_tw_cnt <= 8'd128 + {KEM_l2_intt_cnt4_first, KEM_l2_intt_cnt8_last};
					else
						rom_tw_cnt <= 256 + {DSA_l3_cnt4_first, DSA_l3_cnt16_last};
			end
			S2: begin
				start_flag <= 1'b1;
				if(Multi_Mode)
					if (KAD_Mode)
						rom_tw_cnt <= 8'd32 + {KEM_l2_cnt8_first, KEM_l2_cnt4_last};
					else
						rom_tw_cnt <= 9'd64 + {DSA_l2_cnt16_first, DSA_l2_cnt4_last};
				else
					if (KAD_Mode)
						rom_tw_cnt <= 8'd160 + {KEM_l4_cnt16_first, KEM_l4_cnt2_last};
					else
						rom_tw_cnt <= 9'd320 + {DSA_l2_cnt16_first, DSA_l2_cnt4_last};
			end
			S3: begin
				start_flag <= 1'b1;
				if(Multi_Mode)
					if (KAD_Mode)
						rom_tw_cnt <= 8'd64 + {KEM_l3_cnt2_first, KEM_l3_cnt16_last};
					else
						rom_tw_cnt <= 9'd128 + {DSA_l3_cnt4_first, DSA_l3_cnt16_last};
				else
					if (KAD_Mode)
						rom_tw_cnt <= 8'd192 + KEM_l4_cnt32;
					else
						rom_tw_cnt <= 9'd384 + DSA_l1_l4_cnt64;
			end
			S4: begin
				start_flag <= 1'b1;
				if(Multi_Mode)
					if (KAD_Mode)
						rom_tw_cnt <= 8'd96 + KEM_l4_cnt32;
					else
						rom_tw_cnt <= 9'd192 + DSA_l1_l4_cnt64;
				else
					if (KAD_Mode)
						rom_tw_cnt <= 8'd224 + KEM_l4_cnt32;
					else
						rom_tw_cnt <= 9'd448 + DSA_l1_l4_cnt64;
			end
			LAST: begin
				start_flag <= 1'b0;
				rom_tw_cnt <= 9'b0;
			end
		endcase
	end
end

assign tw1 = KAD_Mode ? {11'd0, tw[35:24]} : tw[68:46];
assign tw2 = KAD_Mode ? {11'd0, tw[23:12]} : tw[45:23];
assign tw3 = KAD_Mode ? {11'd0, tw[11:0]} : tw[22:0];

reg		enable_delay_1;
always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) 
		enable_delay_1 <= 0;
	else
		enable_delay_1 <= enable;
end

rom_tw_INTT_NTT inst_tw_ntt_intt (
  .clka(clk),    // input wire clka
  .ena(enable_delay_1),      // input wire ena
  .addra(rom_tw_cnt),  // input wire [8 : 0] addra
  .douta(tw)  // output wire [47 : 0] douta
);

endmodule