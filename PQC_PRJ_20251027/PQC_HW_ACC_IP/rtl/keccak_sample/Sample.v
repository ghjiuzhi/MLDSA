`timescale 1ns / 1ps

(* dont_touch="true" *)
module Sample(
	input	wire				clk,
	input	wire				SHA3_Samp_start,
	input	wire	[31:0]		SHA3_output_length,	// SHA3 output length
	
	output	reg					m_axis_tvalid,
	input	wire				m_axis_tready,
	output	reg		[63:0]		m_axis_tdata,
	output	reg		[7:0]		m_axis_tkeep,
	output	reg					m_axis_tlast,
    
	input	wire				is_last, 
	input	wire	[1343:0]	out,
	input	wire				out_ready,
	output  reg					sha_hold,
	output	reg					squeeze,

	output	wire				module_end,
    
	input	wire	[1:0]		SHA3_mode,		// 2'd0:SHA3-256, 2'd1:SHA3-512, 2'd2:SHAKE128, 2'd3:SHAKE256
	input	wire	[2:0]		Samp_mode,		// 3'd0: None, 3'd1:Dilithium_uni_samp, 3'd2:Dilithium_rej_samp, 3'd3:Dilithium_gamma_samp, 3'd4:Dilithium_Ball_samp, 3'd5:Kyber_uni_samp, 3'd6:Kyber_cbd_samp
	input	wire				Samp_eta		// Kyber(0->2,1->3) Dilithium(0->2,1->4)
);
    
	reg		[1:0]		SHA3_mode_buf = 0;
	reg		[2:0]		Samp_mode_buf = 0;
	reg					Samp_eta_buf = 0;
    
    reg		[1:0]		cur_state = 0;
    reg		[1:0]		nex_state = 0;
    reg		[9:0]		count_shake = 0; //count_shake计数器，跟踪不同采样下处理数据块的次数
	reg		[9:0]		count_shake_reg0 = 0;
	reg		[9:0]		count_shake_reg1 = 0;
    
    reg		[1343:0]	out_keep = 0;
    reg		[9:0]		shake_num = 0;
//    reg                 cycle_counter = 0;

    wire                is_rej_samp;
    
	wire	[10:0]		Kyber_upper_shake128_Uni;	//均匀采样时从out_keep中提取24位数据的起始位置
	wire	[10:0]		Kyber_upper_shake256_CBD;	//中心二项采样时从out_keep中提取8位数据的起始位置
	wire	[10:0]		Dilithum_upper_shake128_Uni;	//均匀采样时从out_keep中提取48位数据的起始位置
    wire	[10:0]		Dilithum_upper_shake128_Rej;//中心二项采样时从out_keep中提取8位数据的起始位置
    
	wire				Kyber_shake128_Uni_eff;	//均匀采样的有效信号控制。：是否小于需要处理的24位数据块数量
	wire				Kyber_shake256_CBD_eff;	//中心二项采样的有效信号控制。：是否小于需要处理的8位数据块数量
	reg					Kyber_shake256_CBD_eff_reg0;
	reg					Kyber_shake256_CBD_eff_reg1;
	reg					Kyber_shake256_CBD_eff_reg2;
	
	wire				Dilithum_shake128_Uni_eff;	//均匀采样的有效信号控制。：是否小于需要处理的48位数据块数量
	wire				Dilithum_shake128_Rej_eff;
	
	reg					shake_eff = 0;			//检查并选择不同采样的有效信号
	reg					shake_eff_buf = 0;


	reg		[23:0]		Kyber_out_shake128_Uni;	//从shake128输出的1344位的out_keep里每次提取的24位数据块
	reg		[11:0]		Kyber_out_shake256_CBD;	//kyber里的rej要用shake256
	reg		[47:0]		Dilithum_out_shake128_Uni;	//从shake128输出的1344位的out_keep里每次提取的48位数据块
	reg		[7:0]		Dilithum_out_shake128_Rej;
	reg		[22:0]		sample_num1 = 0;
	reg		[22:0]		sample_num2 = 0;
	reg		[22:0]		sample_num1_buf = 0;
	reg		[22:0]		sample_num2_buf = 0;
	reg		[22:0]		sample_num1_buf2 = 0;
	reg		[22:0]		sample_num2_buf2 = 0;
    reg		[22:0]		sample_num3 = 0;
	reg		[22:0]		sample_num4 = 0;
	reg		[22:0]		sample_num3_buf = 0;
	reg		[22:0]		sample_num4_buf = 0;
	reg		[22:0]		sample_num3_buf2 = 0;
	reg		[22:0]		sample_num4_buf2 = 0;
	
    
    reg		[22:0]		sample_num_temp = 0;		//shake128中间缓存数
    reg		[22:0]		sample_num_temp_buf = 0;
    reg		[22:0]		sample_num_temp_buf2 = 0;
    reg					label_num1 = 0;				//第1个数采样有效标志位
    reg					label_num2 = 0;				//第2个数采样有效标志位
    reg					label_num1_buf = 0;

    
    reg					label_temp = 0;			//中间缓存数有效标志位
    reg					label_temp_buf = 0;
    wire				temp_save_last;		//继续保存上一个中间缓存数
    wire				temp_new;			//保存一个新采样数
    wire				temp_relace_new;	//将采样数替换
    wire	[1:0]		add_label;
    
	wire				label_out;			//输出有效标志
	reg					label_out_buf = 0;
    wire				eff_count;			//shake128和256有效计数标志位
    reg					eff_count_1 = 0;
    reg					eff_count_2 = 0;
	reg		[22:0]		out_temp1 = 0;		//初步采样的输出；对于均匀来讲是通过拒绝采样的输出，对于中心二项来讲还需要取模映射处理
	reg		[22:0]		out_temp2 = 0;
	
    wire	[11:0]		temp1_1;
    wire	[11:0]		temp2_1;
    wire	[3:0]		temp1_2;
    wire	[3:0]		temp2_2;
    wire	[3:0]		temp1_3;
    wire	[3:0]		temp2_3;
    wire	[2:0]		Rej_mod5_n1;
    wire	[2:0]		Rej_mod5_n2;
    
 	reg		[31:0]		out_Rej_1;		//中心二项采样输出（选择eta）
 	reg		[31:0]		out_Rej_2;

	reg		[9:0]		out_count ;		//shake128和256剩余的byte数
	wire				end_flag;		//输出满足要求
	reg					end_flag_1 = 0;
	reg					end_flag_2 = 0;

    wire	[10:0]		upper_SHA3_256;
    wire	[63:0]		out_SHA3_256;
    wire	[63:0]		out_SHA3_256_reorder;
    wire				SHA3_256_eff;  
    wire	[10:0]		upper_SHA3_512;
    wire	[63:0]		out_SHA3_512;
    wire	[63:0]		out_SHA3_512_reorder;
    wire				SHA3_512_eff;
    wire	[10:0]		upper_SHAKE256;
    wire	[63:0]		out_SHAKE256;
    wire	[63:0]		out_SHAKE256_reorder;
    wire				SHAKE256_eff;
    
	// SHA3_256
    assign upper_SHA3_256 = 11'd1343 - (count_shake << 6);
    assign out_SHA3_256 = out_keep[upper_SHA3_256 -: 64];
    assign out_SHA3_256_reorder = {out_SHA3_256[7:0],out_SHA3_256[15:8],out_SHA3_256[23:16],out_SHA3_256[31:24],out_SHA3_256[39:32],out_SHA3_256[47:40],out_SHA3_256[55:48],out_SHA3_256[63:56]};
    assign SHA3_256_eff = (count_shake < 10'd5) && (nex_state == 2'd2);
    
	// SHA3_512
    assign upper_SHA3_512 = 11'd1343 - (count_shake << 6);
    assign out_SHA3_512 = out_keep[upper_SHA3_512 -: 64];
    assign out_SHA3_512_reorder = {out_SHA3_512[7:0],out_SHA3_512[15:8],out_SHA3_512[23:16],out_SHA3_512[31:24],out_SHA3_512[39:32],out_SHA3_512[47:40],out_SHA3_512[55:48],out_SHA3_512[63:56]};
    assign SHA3_512_eff = (count_shake < 10'd9) && (nex_state == 2'd2);

	// SHAKE256
    assign upper_SHAKE256 = 11'd1343 - (count_shake << 6);
    assign out_SHAKE256 = out_keep[upper_SHAKE256 -: 64];
    assign out_SHAKE256_reorder = {out_SHAKE256[7:0],out_SHAKE256[15:8],out_SHAKE256[23:16],out_SHAKE256[31:24],out_SHAKE256[39:32],out_SHAKE256[47:40],out_SHAKE256[55:48],out_SHAKE256[63:56]};
    assign SHAKE256_eff = (count_shake < 10'd17) && (nex_state == 2'd2);
    
	// Kyber shake128 uni gen A
	assign Kyber_upper_shake128_Uni = 11'd1343 - (count_shake[5:0] * 24);
//	assign Kyber_out_shake128_Uni = out_keep[Kyber_upper_shake128_Uni -: 24];
	assign Kyber_shake128_Uni_eff = (count_shake < 6'd56);		//有效信号控制，1344位 / 24位 每次采样 = 56次 ：对应Uni采样下需要处理的24位数据块数量
	
	// Kyber shake256 CBD gen s
	assign Kyber_upper_shake256_CBD = (Samp_eta == 1'b0) ? 11'd1343 - (count_shake * 8) : 11'd1343 - (count_shake * 12);
//    assign Kyber_out_shake256_CBD = (Samp_eta == 1'b0) ? out_keep[Kyber_upper_shake256_CBD -: 8] : ((count_shake[0] == 0) ? {out_keep[Kyber_upper_shake256_CBD - 12 -: 4], out_keep[Kyber_upper_shake256_CBD -: 8]} : {out_keep[Kyber_upper_shake256_CBD - 4 -: 8], out_keep[Kyber_upper_shake256_CBD + 4 -: 4]});
	assign Kyber_shake256_CBD_eff = ((Samp_eta == 1'b0) ? (count_shake > 8'd0 && count_shake < 8'd138) && (nex_state == 2'd2) : (count_shake > 8'd0 && count_shake < 8'd91)) && (nex_state == 2'd2); // 一次shake256输出1088位1088/8 = 136、1088/12 = 90次

	// Dlilithum shake128 uni gen A
	assign Dilithum_upper_shake128_Uni = 11'd1343 - (count_shake[4:0] * 48);
//	assign Dilithum_out_shake128_Uni = out_keep[Dilithum_upper_shake128_Uni -: 48 ];
	assign Dilithum_shake128_Uni_eff = (count_shake < 5'd28);	//有效信号控制，1344位 / 48位 每次采样 = 28次 
	
    // Dilithum shake128 rej gen s
	assign Dilithum_upper_shake128_Rej = 11'd1343 - (count_shake << 3);
//	assign Dilithum_out_shake128_Rej = out_keep[Dilithum_upper_shake128_Rej -: 8];
	assign Dilithum_shake128_Rej_eff = (count_shake < 8'd168); //1344/8 = 168

    always @(posedge clk) begin
//    	out_SHA3_512 = out_keep[upper_SHA3_512 -: 64];
//    	out_SHAKE256 = out_keep[upper_SHAKE256 -: 64];
    	Kyber_out_shake128_Uni = out_keep[Kyber_upper_shake128_Uni -: 24];
    	Kyber_out_shake256_CBD = (Samp_eta == 1'b0) ? out_keep[Kyber_upper_shake256_CBD -: 8] : ((count_shake[0] == 0) ? {out_keep[Kyber_upper_shake256_CBD - 12 -: 4], out_keep[Kyber_upper_shake256_CBD -: 8]} : {out_keep[Kyber_upper_shake256_CBD - 4 -: 8], out_keep[Kyber_upper_shake256_CBD + 4 -: 4]});
		Dilithum_out_shake128_Uni = out_keep[Dilithum_upper_shake128_Uni -: 48 ];
		Dilithum_out_shake128_Rej = out_keep[Dilithum_upper_shake128_Rej -: 8];
	end

	assign is_rej_samp = (SHA3_mode_buf == 4'd2  && Samp_mode_buf ==  3'd1) || (SHA3_mode_buf == 4'd2  && Samp_mode_buf ==  3'd2) || (SHA3_mode_buf == 4'd3  && Samp_mode_buf == 3'd6) || (SHA3_mode_buf == 4'd2  && Samp_mode_buf ==  3'd5) ;
    
    always @(*) begin
    	if ((SHA3_mode == 4'd3) && (Samp_mode_buf == 3'd0)) begin	// shake256
    		sha_hold <= (cur_state == 2'd2) && m_axis_tvalid;
    	end
    	else begin
    		sha_hold <= (cur_state == 2'd2) && is_rej_samp && (count_shake > 2'd0) && (count_shake < shake_num);
    	end
    end
    
    reg		sha_hold_d0;
    
    always @(posedge clk) begin
    	sha_hold_d0	<= sha_hold;
    	if (~sha_hold && sha_hold_d0) begin
    		squeeze	<= 1'b1;
    	end
    	else begin
    		squeeze	<= 1'b0;
    	end
    end
    
	always @(*) begin
		if (cur_state == 2'd2) begin
			case (SHA3_mode)
				4'd0:	shake_num	<= 10'd5;
				4'd1:	shake_num	<= 10'd9;
				4'd2:	begin	// SHAKE128
					case (Samp_mode_buf)
						3'd1: shake_num	<= 5'd28;
						3'd2: shake_num	<= 8'd168;
						3'd5: shake_num	<= 6'd56;
					default:;
					endcase
				end
				4'd3: begin	// SHAKE256
					case (Samp_mode_buf)
						3'd0: shake_num <= SHA3_output_length >> 3;				// Only SHAKE256
						3'd6: shake_num	<= (Samp_eta == 1'b0) ? 8'd138 : 8'd91;	// Kyber_cbd_samp
						default:;
					endcase
				end
			default:;        
			endcase
		end
	end

	always @(*) begin
		if (cur_state == 2'd2) begin
			case (Samp_mode_buf)
				3'd0: shake_eff	<= 1'b0;
				3'd1: shake_eff	<= Dilithum_shake128_Uni_eff;
				3'd2: shake_eff	<= Dilithum_shake128_Rej_eff;
				3'd5: shake_eff	<= Kyber_shake128_Uni_eff;
				3'd6: shake_eff	<= Kyber_shake256_CBD_eff;
				default: shake_eff	<= 1'b0;
			endcase
		end
		else begin
			shake_eff	<= 1'b0;
		end
	end

    always @(*) begin
		case (Samp_mode_buf)
			3'd0: begin
				sample_num1_buf	<= 23'd0;
				sample_num2_buf	<= 23'd0;
			end
			3'd1: begin
				sample_num1_buf	<= {Dilithum_out_shake128_Uni[30:24],Dilithum_out_shake128_Uni[39:32],Dilithum_out_shake128_Uni[47:40]} ;
				sample_num2_buf	<= {Dilithum_out_shake128_Uni[6:0],Dilithum_out_shake128_Uni[15:8],Dilithum_out_shake128_Uni[23:16]};
			end
			3'd2: begin
				sample_num1_buf	<= Dilithum_out_shake128_Rej[3:0];
				sample_num2_buf	<= Dilithum_out_shake128_Rej[7:4];
			end
			3'd5: begin
				sample_num1_buf	<= {Kyber_out_shake128_Uni[11:8],Kyber_out_shake128_Uni[23:16]};
				sample_num2_buf	<= {Kyber_out_shake128_Uni[7:0],Kyber_out_shake128_Uni[15:12]};
			end
			3'd6: begin
			    case (Samp_eta_buf)
					1'd0: begin
						sample_num1_buf	<= Kyber_out_shake256_CBD[0] +  Kyber_out_shake256_CBD[1] ;
						sample_num2_buf	<= Kyber_out_shake256_CBD[2] +  Kyber_out_shake256_CBD[3] ;
						sample_num3_buf	<= Kyber_out_shake256_CBD[4] +  Kyber_out_shake256_CBD[5] ;
						sample_num4_buf	<= Kyber_out_shake256_CBD[6] +  Kyber_out_shake256_CBD[7] ;
					end
					1'd1: begin
						sample_num1_buf	<= Kyber_out_shake256_CBD[0] +  Kyber_out_shake256_CBD[1] +  Kyber_out_shake256_CBD[2];
						sample_num2_buf	<= Kyber_out_shake256_CBD[3] +  Kyber_out_shake256_CBD[4] +  Kyber_out_shake256_CBD[5];
						sample_num3_buf	<= Kyber_out_shake256_CBD[6] +  Kyber_out_shake256_CBD[7] +  Kyber_out_shake256_CBD[8];
						sample_num4_buf	<= Kyber_out_shake256_CBD[9] +  Kyber_out_shake256_CBD[10] +  Kyber_out_shake256_CBD[11];
					end
					default: begin
						sample_num1_buf	<= 23'd0;
						sample_num2_buf	<= 23'd0;
					end
				endcase
			end
			default: begin
				sample_num1_buf	<= 23'd0;
				sample_num2_buf	<= 23'd0;
			end
		endcase
	end

	always @(*) begin
		if (shake_eff_buf) begin
			case (Samp_mode_buf)
				3'd1: begin
					label_num1	<= sample_num1_buf < 23'd8380417;
					label_num2	<= sample_num2_buf < 23'd8380417;
				end
				3'd2: begin
					label_num1	<= Samp_eta_buf ? sample_num1_buf[3:0] < 4'd9  : sample_num1_buf[3:0] < 4'd15;
					label_num2	<= Samp_eta_buf ? sample_num2_buf[3:0] < 4'd9  : sample_num2_buf[3:0] < 4'd15;
				end
				3'd5: begin
					label_num1	<= sample_num1_buf < 12'd3329;
					label_num2	<= sample_num2_buf < 12'd3329;
				end
				default: begin
					label_num1	<= 1'd0;
					label_num2	<= 1'd0;
				end
			endcase
		end
		else begin
			label_num1	<= 1'd0;
			label_num2	<= 1'd0;
		end
	end
    
    //管理临时样本
    assign temp_save_last = (label_temp == 1'b1) && (label_num1 + label_num2 == 1'b0);	//临时样本存在但当前无新样本
    assign temp_new = (label_temp == 1'b0) && (label_num1 + label_num2 == 1'b1);		//临时样本不存在且只有一个新样本通过
    assign temp_relace_new = label_temp & label_num1 & label_num2;						//两个样本通过且已有临时样本
    
    //输出有效条件
    assign add_label = label_num1 + label_num2 + label_temp; 	//两个新样本和临时样本一共通过的数量
    assign label_out = ((add_label > 1'b1) && shake_eff_buf);
    assign eff_count = label_out_buf;
    
    //取模5
    assign temp1_1 = out_temp1[3:0] * 8'd205;
    assign temp2_1 = out_temp2[3:0] * 8'd205;
    assign temp1_2 = temp1_1[11:10] * 3'd5;
    assign temp2_2 = temp2_1[11:10] * 3'd5;
    assign temp1_3 = out_temp1[3:0] - temp1_2;
    assign temp2_3 = out_temp2[3:0] - temp2_2;
	//temp1_1 - temp1_3和temp2_1-3对应的就是当eta=2时取模五的运算过程
    assign Rej_mod5_n1 = temp1_3[2:0];
    assign Rej_mod5_n2 = temp2_3[2:0];
    
    always @(*) begin
		case (Samp_mode_buf)
			3'd0: begin
            	out_Rej_1 = 1'd0;
            	out_Rej_2 = 1'd0;
			end
			3'd1: begin
				out_Rej_1 = 1'd0;
				out_Rej_2 = 1'd0;
		    end
			3'd2: begin
				out_Rej_1 = Samp_eta_buf ? 3'd4 - out_temp1[3:0] : 2'd2 - Rej_mod5_n1;
				out_Rej_2 = Samp_eta_buf ? 3'd4 - out_temp2[3:0] : 2'd2 - Rej_mod5_n2;
			end
			3'd5: begin
				out_Rej_1 = 1'd0;
				out_Rej_2 = 1'd0;
			end
			3'd6: begin
				out_Rej_1 = sample_num1_buf2 - sample_num2_buf2;
				out_Rej_2 = sample_num3_buf2 - sample_num4_buf2;
			end
			default: begin
				out_Rej_1 = 1'd0;
				out_Rej_2 = 1'd0;
			end
		endcase
	end
	
    assign end_flag = (cur_state == 2'd2) && (out_count == 1'b0);
    assign module_end = end_flag_2;
    always @(*) begin
		case (SHA3_mode)
			4'd0:	m_axis_tlast <= end_flag;	// SHA3-256
			4'd1:	m_axis_tlast <= end_flag;	// SHA3-512
			4'd2: 	m_axis_tlast <= end_flag_1;	// SHAKE128
			4'd3:	begin	// SHAKE256
				if (Samp_mode_buf == 3'd0) m_axis_tlast <= end_flag;	// Only SHAKE256
				else m_axis_tlast <= end_flag_1;	// Other SHAKE256
			end
			default:;
		endcase
	end	
        
    reg		[2:0]		state = 0;
    reg					concat_out	= 1'b0;	// 用于表示是否对Kyber CBD samp进行拼接
    
    always @(posedge clk) begin
		cur_state		<= nex_state;
		
		SHA3_mode_buf	<= SHA3_Samp_start ? SHA3_mode : SHA3_mode_buf;
		Samp_mode_buf	<= SHA3_Samp_start ? Samp_mode : Samp_mode_buf;
		Samp_eta_buf	<= SHA3_Samp_start ? Samp_eta : Samp_eta_buf;        
    
//		sample_num1_buf <= sample_num1;
//		sample_num2_buf <= sample_num2;
		sample_num1_buf2 <= sample_num1_buf;
		sample_num2_buf2 <= sample_num2_buf;
//		sample_num3_buf <= sample_num3;
//		sample_num4_buf <= sample_num4;
		sample_num3_buf2 <= sample_num3_buf;
		sample_num4_buf2 <= sample_num4_buf;
		
		label_num1_buf <= label_num1;
		
		sample_num_temp_buf <= sample_num_temp;
		
		shake_eff_buf <= SHA3_Samp_start ? 1'b0 : shake_eff;
		label_out_buf <= label_out;
	   	
		Kyber_shake256_CBD_eff_reg0	<= Kyber_shake256_CBD_eff;
		Kyber_shake256_CBD_eff_reg1	<= Kyber_shake256_CBD_eff_reg0;
		Kyber_shake256_CBD_eff_reg2	<= Kyber_shake256_CBD_eff_reg1;         
            
		case (state)
			3'd0: begin
				if (out_ready) begin
					count_shake <= 10'd0;
					if (Samp_mode_buf == 3'd6 && concat_out) begin
						out_keep	<= {out_keep[263:256], out[1343:8]};
						concat_out	<= 1'b0;
					end
					else begin
						out_keep	<= out;
						concat_out	<= 1'b0;
					end
					state		<= 3'd1;
				end
				else begin
					if (Samp_mode_buf == 3'd6 && concat_out) begin
						count_shake_reg0	<= 10'd0;
						count_shake_reg1	<= count_shake_reg0;
						count_shake			<= count_shake;
					end
					else begin
						count_shake_reg0	<= 10'd89;
						count_shake_reg1	<= 10'd89;
						count_shake			<= count_shake;
					end
					out_keep	<= out_keep;
					state 		<= state;
				end
			end
			3'd1: begin
				if (count_shake < shake_num && cur_state == 2'd2)begin
					if (Samp_mode_buf == 3'd6 && count_shake == shake_num - 1) begin
						concat_out	<= 1'b1;
					end
					else begin
						concat_out	<= 1'b0;
					end
					count_shake <= count_shake + 1'b1;
					out_keep	<= out_keep;
					
					if ((SHA3_mode == 4'd3) && (Samp_mode_buf == 3'd0)) begin
						if (count_shake <= 17) begin
							state		<= state;
						end
						else begin
							state 		<= 3'd0;
						end
					end
					else begin
						state		<= state;
					end
				end
				else begin
					count_shake <= count_shake;
					out_keep	<= out_keep;
					state 		<= 3'd0;
				end
			end
		endcase
        
        eff_count_1 <= eff_count;
        eff_count_2 <= eff_count_1;
        
        //临时样本管理    
        label_temp <= SHA3_Samp_start? 1'b0:((shake_eff_buf)? (( temp_save_last|| temp_new || temp_relace_new)? 1'b1 :1'b0):label_temp);
        label_temp_buf <= label_temp;
        sample_num_temp <= temp_new?  (label_num1? sample_num1_buf:sample_num2_buf) : (temp_relace_new? sample_num2_buf : sample_num_temp);
        
        //初步采样输出
        out_temp1 <= label_temp_buf? sample_num_temp_buf : sample_num1_buf2;
        out_temp2 <= (label_num1_buf&label_temp_buf)?  sample_num1_buf2 : sample_num2_buf2;

		if (SHA3_Samp_start) begin	// 初始化SHA3输出剩余字节数
			case (SHA3_mode)
				4'd0:   out_count	<= 10'd32;	// SHA3-256
				4'd1: 	out_count	<= 10'd64;	// SHA3-512
				4'd2: 	out_count	<= 10'd128;	// SHAKE128
				4'd3:	begin
					if (Samp_mode == 3'd0) out_count <= SHA3_output_length[9:0] >> 3;	// Only SHAKE256
					else out_count <= 10'd127;	// SHAKE256 + sample
				end
				default:;
			endcase
		end
		else if (cur_state == 2'd2) begin
			case (SHA3_mode)
				4'd0: out_count <= out_count - 10'd8;		// SHA3-256
				4'd1: out_count <= out_count - 10'd8;		// SHA3-512
				4'd2: out_count <= out_count - eff_count;	// SHAKE128
				4'd3: begin		// SHAKE256
					case (Samp_mode_buf)
						3'd0: out_count	<= out_count - SHAKE256_eff;	// Only SHAKE256
						3'd6: out_count	<= out_count - Kyber_shake256_CBD_eff_reg0;			// kyber CBD
						default: out_count <= out_count - eff_count;
					endcase
				end     
				default:;
			endcase
		end
		else begin
			out_count <= out_count;
		end

		case (SHA3_mode)
			4'd0: m_axis_tdata	<= out_SHA3_256_reorder;	// SHA3-256
			4'd1: m_axis_tdata	<= out_SHA3_512_reorder;	// SHA3-512
			4'd2: begin	// SHAKE128
				case (Samp_mode_buf)
					3'd1: m_axis_tdata	<= {9'd0, out_temp2, 9'd0, out_temp1};
					3'd2: m_axis_tdata	<= {out_Rej_2, out_Rej_1};
					3'd5: m_axis_tdata	<= {9'd0, out_temp2, 9'd0, out_temp1};
					default: m_axis_tdata	<= {64'd0};
				endcase
			end
			4'd3: begin	// SHAKE256
				case (Samp_mode_buf)
					3'd0: m_axis_tdata	<= out_SHAKE256_reorder;	// Only SHAKE256
					3'd6: m_axis_tdata	<= {out_Rej_2, out_Rej_1};
					default: m_axis_tdata	<= {64'd0};
	            endcase
			end
			default:;
		endcase

        if (cur_state == 2'd2) begin
        	case(SHA3_mode)
        		4'd0: m_axis_tvalid	<= SHA3_256_eff;	// SHA3-256
				4'd1: m_axis_tvalid	<= SHA3_512_eff;	// SHA3-512
				4'd2: m_axis_tvalid	<= eff_count_1;		// SHAKE128
				4'd3: begin		// SHAKE256
					case (Samp_mode)
						3'd0: m_axis_tvalid	<= SHAKE256_eff;	// Only SHAKE256
						3'd6: m_axis_tvalid <= Kyber_shake256_CBD_eff_reg0;
						default: m_axis_tvalid	<= eff_count_1;
					endcase
				end
				default:;
        	endcase
        end
        else begin
        	m_axis_tvalid	<= 1'b0;
        end
        
		m_axis_tkeep <= 8'hFF;
        
		end_flag_1 <= end_flag;
		end_flag_2 <= end_flag_1;
	end
    
	always @(*) begin
		case (cur_state)
			2'd0: begin
				if (is_last)
					nex_state	<= 2'd1;
				else
					nex_state	<= 2'd0;
			end
			2'd1: begin
				if (out_ready)
					nex_state	<= 2'd2;
				else
					nex_state	<= 2'd1;
			end
			2'd2: begin
				if (end_flag)
					nex_state	<= 2'd0;
				else
					nex_state	<= 2'd2;
			end
			default: nex_state	<= 2'd0;
		endcase
	end
    
endmodule