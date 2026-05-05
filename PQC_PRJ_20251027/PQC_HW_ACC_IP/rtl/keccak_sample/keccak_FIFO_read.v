`timescale 1ns / 1ps

(* dont_touch="true" *)
module keccak_FIFO_read(
	input	wire			clk,
	input	wire			module_start,	// SHA3模块开始信号，1个时钟
	input	wire	[1:0]	SHA3_mode,			// 2'd0:SHA3-256, 2'd1:SHA3-512, 2'd2:SHAKE128, 2'd3:SHAKE256
	input	wire	[31:0]	SHA3_input_length,	// SHA3 input length
	
	input	wire			Read_FIFO_tvalid,
	output	wire			Read_FIFO_tready,
	input	wire	[63:0]	Read_FIFO_tdata,
	input	wire	[7:0]	Read_FIFO_tkeep,
	input	wire			Read_FIFO_tlast,
	
	input	wire			i_last,
	output	reg				SHA3_start,
	output	reg		[63:0]	shake_in,
	output	reg				in_ready,	// SHA3数据有效信号
	output	reg				is_last,	// SHA3输入last信号
	output	reg		[3:0]	byte_num
    
    );
       
    reg		[1:0]	cur_state;
    reg		[1:0]	nex_state;
    wire			rd_en;
    reg		[31:0]	read_counter;
    reg		[4:0]	hold_counter;
    wire			temp_last;
    wire	[3:0]	temp_num;
    wire			add_empty;		// 表示输入数据为8字节整数倍，正常为常1
    wire			empty_state;	// 拉高1个时钟
    
    assign Read_FIFO_tready = rd_en;
    assign rd_en = (cur_state == 2'd1) & (Read_FIFO_tvalid) & (~i_last);
    assign temp_num = (temp_last) ? (read_counter[3:0]) : 0;
    assign temp_last = (read_counter < 4'd9) && (cur_state != 1'b0) && rd_en;
    assign add_empty = (SHA3_input_length[2:0] == 3'b0);
    assign empty_state = (read_counter == 4'd8) && add_empty;	// read_counter初始值加8，判断到为8即传输完成
        
	always @(posedge clk) begin
		cur_state	<= nex_state;
//		shake_in	<= empty_state ? 1'b0 : {	Read_FIFO_tdata[7:0],Read_FIFO_tdata[15:8],
//										Read_FIFO_tdata[23:16],Read_FIFO_tdata[31:24],
//										Read_FIFO_tdata[39:32],Read_FIFO_tdata[47:40],
//										Read_FIFO_tdata[55:48],Read_FIFO_tdata[63:56]};
		
		shake_in	<= {	Read_FIFO_tdata[7:0],Read_FIFO_tdata[15:8],
												Read_FIFO_tdata[23:16],Read_FIFO_tdata[31:24],
												Read_FIFO_tdata[39:32],Read_FIFO_tdata[47:40],
												Read_FIFO_tdata[55:48],Read_FIFO_tdata[63:56]};
												
//		is_last		<= Read_FIFO_tlast;
		is_last		<= temp_last;
		in_ready	<= rd_en;
		byte_num	<= temp_num;
		
		SHA3_start	<= module_start;
		
		if (i_last == 1'b1) 
		    hold_counter <= 1'b0;
		else
		    hold_counter <= hold_counter + 1'b1;
		
		if (module_start) begin	// start up，reset read_counter，rd_en为1时每次减8，直到置零
			if (add_empty)
//				read_counter <= SHA3_input_length + 4'd8;
				read_counter <= SHA3_input_length;
			else
				read_counter <= SHA3_input_length;
		end
		else begin
			read_counter <= (read_counter - (rd_en << 3) );
		end
	end
    
	always @(*) begin
		case (cur_state)
			2'd0: begin	// waiting state
				if (module_start == 1'b1)
					nex_state <= 2'd1;
				else
					nex_state <= 2'd0;
			end
			2'd1: begin	// reading state
				if (temp_last == 1'b1)
					nex_state <= 2'd0;
				else if (i_last == 1'b1)
					nex_state <= 2'd2;
				else
					nex_state <= 2'd1;
			end
			default: nex_state <= 2'd0;
		endcase
	end
	
endmodule
