`timescale 1ns / 1ps

(* dont_touch="true" *)
module pwm_compute
(
    input	wire			clk,
    input	wire			compute_start,	//1 for start
    input	wire			compu_working,
    output	wire			compute_done,
    
    input	wire	[3:0]	PWM_length,
	input	wire			PQC_mode,	// '=0': Dilithium; '=1': Kyber
    
    output	wire			coef_ena,	//RAM for 256 coefficient
    output	wire			coef_wea,
    output	wire	[7:0]	coef_addra,
    input	wire	[22:0]	coef_douta,
    output	wire			coef_enb,
    output	wire			coef_web,
    output	wire	[7:0]	coef_addrb,
    input	wire	[22:0]	coef_doutb,
    
    input	wire			Rm_tvalid,
    input	wire	[63:0]	Rm_tdata,
    output	wire			ram_read,
    	
    input	wire			Write_FIFO_tready,
    output	wire	[63:0]	Write_FIFO_tdata,
    output	wire			Write_FIFO_tvalid
);

	reg				read_working;
	reg		[7:0]	counter_inner;
	wire			counter_inner_last;
	reg		[3:0]	counter_outer;
	reg				rd_en;
	wire			read_done;
	reg				read_last_save;
	reg		[63:0]	Rm_tdata_buf;
    
    
	reg		[22:0]	mat_num1_1;
	reg		[22:0]	mat_num1_2;
	wire	[22:0]	mul_result1;
	reg		[22:0]	mat_num2_1;
	reg		[22:0]	mat_num2_2;
	wire	[22:0]	mul_result2;
	reg		[22:0]	mul_result1_buf;
	reg		[22:0]	mul_result2_buf;
	
	reg		[11:0]	Kyber_a0;
	reg		[11:0]	Kyber_a1;
	reg		[11:0]	Kyber_b0;
	reg		[11:0]	Kyber_b1;
	
	wire	[11:0]	Kyber_c0_res0;
	reg		[11:0]	Kyber_c0_res0_reg1;
	reg		[11:0]	Kyber_c0_res0_reg2;
	reg		[11:0]	Kyber_c0_res0_reg3;
	reg		[11:0]	Kyber_c0_res0_reg4;
	wire	[11:0]	Kyber_c0_res1;
	wire	[11:0]	Kyber_c0_res2;
	reg		[12:0]	Kyber_c0;
	reg		[12:0]	Kyber_c0_r;

	wire	[11:0]	Kyber_c1_res0;
	wire	[11:0]	Kyber_c1_res1;
	reg		[12:0]	Kyber_c1;
	reg		[12:0]	Kyber_c1_reg1;
	reg		[12:0]	Kyber_c1_reg2;
	reg		[12:0]	Kyber_c1_reg3;
	reg		[12:0]	Kyber_c1_reg4;
	reg		[12:0]	Kyber_c1_reg4_r;

	reg				PWM_zetas_ena;
	reg		[6:0]	PWM_zetas_addra;
	wire	[11:0]	PWM_zetas_douta;
	
	reg				rd_en_1;
	reg				rd_en_2;	//start mul
	reg				rd_en_3;
	reg				rd_en_4;
	reg				rd_en_5;
	reg				rd_en_6;
	reg				rd_en_7;
	reg				rd_en_8;
	reg				rd_en_9;
	reg				rd_en_10;
	reg				rd_en_11;
    
    assign ram_read = Rm_tvalid && read_working && compu_working;
    assign coef_ena = ram_read;
    assign coef_enb = ram_read;
    assign coef_wea = 1'b0;
    assign coef_web = 1'b0;
    assign coef_addra = counter_inner;
    assign coef_addrb = counter_inner + 1'b1;
    assign read_done = (counter_outer == PWM_length - 1'b1) && counter_inner_last;
    assign counter_inner_last = (counter_inner == 8'd254);
    
	assign Write_FIFO_tdata = PQC_mode ? {20'd0, mul_result2_buf[11:0], 20'd0, mul_result1_buf[11:0]} : {9'd0, mul_result2_buf, 9'd0, mul_result1_buf};
	assign Write_FIFO_tvalid = PQC_mode ? rd_en_11 : rd_en_10; 
	assign compute_done = (read_last_save == 1) && (counter_inner == (PQC_mode ? 5'd22 : 5'd20));
	
	wire			Kyber_c0_C_OUT;
	wire	[12:0]	Kyber_c0_S;

	c_addsub_3329 c0 (
		.A		(Kyber_c0),      // input wire [12 : 0] A
		.CE		(1'b1),        // input wire CE
		.C_OUT	(Kyber_c0_C_OUT),  // output wire C_OUT
		.S		(Kyber_c0_S)          // output wire [12 : 0] S
	);
	
	wire			Kyber_c1_C_OUT;
	wire	[12:0]	Kyber_c1_S;

	c_addsub_3329 c1 (
		.A		(Kyber_c1_reg4),          // input wire [12 : 0] A
		.CE		(1'b1),        // input wire CE
		.C_OUT	(Kyber_c1_C_OUT),  // output wire C_OUT
		.S		(Kyber_c1_S)          // output wire [12 : 0] S
	);
	
	always @(posedge clk) begin
		counter_inner	<= (compute_start || counter_inner_last) ? 1'b0 : ((ram_read || read_last_save) ? counter_inner + 2'd2 : counter_inner);
		counter_outer	<= compute_start? 1'b0 : (counter_inner_last ? counter_outer + 1'b1 : counter_outer);
		rd_en			<= ram_read;
		Rm_tdata_buf	<= Rm_tdata;
		
		if (PQC_mode == 1'b0) begin	// Dilithium
			mat_num1_1		<= coef_douta;
			mat_num1_2		<= Rm_tdata_buf[22:0];
			mat_num2_1		<= coef_doutb;
			mat_num2_2		<= Rm_tdata_buf[54:32];
			mul_result1_buf	<= mul_result1;
			mul_result2_buf	<= mul_result2;
		end
		else begin	// Kyber
			Kyber_a0	<= coef_douta[11:0];
			Kyber_a1	<= coef_doutb[11:0];
			Kyber_b0	<= Rm_tdata_buf[11:0];
			Kyber_b1	<= Rm_tdata_buf[43:32];
			
			Kyber_c0_res0_reg1	<= Kyber_c0_res0;
			Kyber_c0_res0_reg2	<= Kyber_c0_res0_reg1;
			Kyber_c0_res0_reg3	<= Kyber_c0_res0_reg2;
			Kyber_c0_res0_reg4	<= Kyber_c0_res0_reg3;
			Kyber_c0	<= Kyber_c0_res0_reg4 + Kyber_c0_res2;
			
			if (Kyber_c0_C_OUT) begin
				mul_result1_buf	<= {11'd0, Kyber_c0_S[11:0]};
			end
			else begin
				mul_result1_buf	<= {11'd0, Kyber_c0[11:0]};
			end
			
			Kyber_c1		<= Kyber_c1_res0 + Kyber_c1_res1;
			Kyber_c1_reg1	<= Kyber_c1;
			Kyber_c1_reg2	<= Kyber_c1_reg1;
			Kyber_c1_reg3	<= Kyber_c1_reg2;
			Kyber_c1_reg4	<= Kyber_c1_reg3;
			
			if (Kyber_c1_C_OUT) begin
				mul_result2_buf	<= {11'd0, Kyber_c1_S[11:0]};
			end
			else begin
				mul_result2_buf	<= {11'd0, Kyber_c1_reg4[11:0]};
			end
			
		end
		
		rd_en_1			<= rd_en;
		rd_en_2			<= rd_en_1;
		rd_en_3			<= rd_en_2;
		rd_en_4			<= rd_en_3;
		rd_en_5			<= rd_en_4;
		rd_en_6			<= rd_en_5;
		rd_en_7			<= rd_en_6; 
		rd_en_8			<= rd_en_7;
		rd_en_9			<= rd_en_8;
		rd_en_10		<= rd_en_9;
		rd_en_11		<= rd_en_10;
		
        read_working	<= compute_start ? 1'b1 : read_done ? 1'b0 : read_working;
        read_last_save	<= (compute_start||compute_done) ? 1'b0 : read_done ? 1'b1 : read_last_save;
        
	end

	mul_and_reduce_pipe #(
		.PARAM_Q(23'b11111111110000000000001)
	) DSA_module1(
		.clk    (clk),
		.opt1   (mat_num1_1),
		.opt2   (mat_num1_2),
		.result (mul_result1)
	);

	mul_and_reduce_pipe #(
		.PARAM_Q(23'b11111111110000000000001)
	) DSA_module2(
		.clk    (clk),
		.opt1   (mat_num2_1),
		.opt2   (mat_num2_2),
		.result (mul_result2)
	);
	
	Kyber_mul_and_reduce Kyber_module1_1 (
		.clk    (clk),
		.opt1   (Kyber_a0),
		.opt2   (Kyber_b0),
		.result (Kyber_c0_res0)
	);
	
	Kyber_mul_and_reduce Kyber_module1_2 (
		.clk    (clk),
		.opt1   (Kyber_a1),
		.opt2   (Kyber_b1),
		.result (Kyber_c0_res1)
	);
	
	Kyber_mul_and_reduce Kyber_module1_3 (
		.clk    (clk),
		.opt1   (Kyber_c0_res1),
		.opt2   (PWM_zetas_douta),
		.result (Kyber_c0_res2)
	);
		
	Kyber_mul_and_reduce Kyber_module2_1 (
		.clk    (clk),
		.opt1   (Kyber_a0),
		.opt2   (Kyber_b1),
		.result (Kyber_c1_res0)
	);
	
	Kyber_mul_and_reduce Kyber_module2_2 (
		.clk    (clk),
		.opt1   (Kyber_a1),
		.opt2   (Kyber_b0),
		.result (Kyber_c1_res1)
	);
	
	
//	always @(posedge clk) begin
//		if (rd_en_3) begin
//			PWM_zetas_ena	<= 1'b1;
//			PWM_zetas_addra	<= PWM_zetas_addra + rd_en_4;
//		end
//		else begin
//			PWM_zetas_ena	<= 1'b0;
//			PWM_zetas_addra	<= 7'd0;
//		end
//	end
	
	reg		[2:0]	PWM_state = 0;
	
	always @(posedge clk) begin
		case (PWM_state) 
			3'd0: begin
				if (rd_en_2 && PWM_zetas_addra == 7'd0) begin
					PWM_zetas_ena	<= 1'b0;
					PWM_zetas_addra <= 7'd0;
					PWM_state		<= 3'd1;
				end
				else begin
					PWM_zetas_ena	<= 1'b0;
					PWM_zetas_addra <= 7'd0;
					PWM_state		<= 3'd0;
				end
			end
			3'd1: begin
				if (PWM_zetas_addra != 7'd127) begin
					PWM_state	<= 3'd1;
					if (rd_en_3) begin
						PWM_zetas_ena	<= 1'b1;
						PWM_zetas_addra	<= PWM_zetas_addra + rd_en_4;
					end
					else begin
						PWM_zetas_ena	<= 1'b0;
						PWM_zetas_addra	<= PWM_zetas_addra + rd_en_4;
					end
				end
				else begin
					PWM_zetas_ena	<= 1'b0;
					PWM_zetas_addra	<= 7'd0;
					PWM_state		<= 3'd0;
				end
			end
			default:;
		endcase
	end

	Kyber_PWM_zetas_v PWM_zetas (
		.clka	(clk),
		.ena	(PWM_zetas_ena),
		.addra	(PWM_zetas_addra),
		.douta	(PWM_zetas_douta)
	);
    
endmodule
