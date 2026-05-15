`timescale 1ns / 1ps

(* dont_touch="true" *)
module KAD_NTT_mem_write(
	input	wire			clk,
	input	wire			aresetn,
	input	wire			module_start,
	input	wire			Ws_tready,
	output	wire	[63:0]	Ws_tdata,
	output	wire			Ws_tvalid,
	input	wire			KAD_Mode,	//=1 ML_KEM, =0 ML_DSA
	input	wire			Multi_Mode,	//=1 NTT, =0 INTT
	
	output	reg				coef_ena_bram0,
	output	reg				coef_wea_bram0,
	output	reg		[5:0]	coef_addra_bram0,
	input	wire	[22:0]	coef_douta_bram0,
	output	reg				coef_enb_bram0,
	output	reg				coef_web_bram0,
	output	reg		[5:0]	coef_addrb_bram0,
	input	wire	[22:0]	coef_doutb_bram0,
	output	reg				coef_ena_bram1,
	output	reg				coef_wea_bram1,
	output	reg		[5:0]	coef_addra_bram1,
	input	wire	[22:0]	coef_douta_bram1,
	output	reg				coef_enb_bram1,
	output	reg				coef_web_bram1,
	output	reg		[5:0]	coef_addrb_bram1,
	input	wire	[22:0]	coef_doutb_bram1,
	output	reg				coef_ena_bram2,
	output	reg				coef_wea_bram2,
	output	reg		[5:0]	coef_addra_bram2,
	input	wire	[22:0]	coef_douta_bram2,
	output	reg				coef_enb_bram2,
	output	reg				coef_web_bram2,
	output	reg		[5:0]	coef_addrb_bram2,
	input	wire	[22:0]	coef_doutb_bram2,
	output	reg				coef_ena_bram3,
	output	reg				coef_wea_bram3,
	output	reg		[5:0]	coef_addra_bram3,
	input	wire	[22:0]	coef_douta_bram3,
	output	reg				coef_enb_bram3,
	output	reg				coef_web_bram3,
	output	reg		[5:0]	coef_addrb_bram3,
	input	wire	[22:0]	coef_doutb_bram3,
	
	output	wire			module_done 
);

    parameter
    IDLE = 5'b00000,
    S1   = 5'b00001,
    S2   = 5'b00010,
    S3   = 5'b00100,
    S4   = 5'b01000,
    LAST = 5'b10000;
    
	reg		[4:0]	CS;
	reg		[4:0]	NS;        
	reg		[4:0]	cnt_30;
	reg		[4:0]	cnt_31;
	reg		[7:0]	cnt_128_ntt;
	
	reg				cnt_2;
	reg		[4:0]	addr;
	reg		[1:0]	bram_sel;  // bram0/bram1    bram2/bram3
	reg		[1:0]	bram_sel_d1;  
	reg		[1:0]	bram_sel_d2;  
	reg		[7:0]	cnt_128;   //0-127
	wire	[1:0]	offset;
	wire			bram;
	wire	[2:0]	iter;
	wire			bram_group_sel;
	wire	[4:0]	base;
	wire	[7:0]	ntt_out_issue;
	reg				NTT_working;
	reg				INTT_working;
	       
	reg		[7:0]	counter;
	wire			count_done;
	reg				counter_working;
	assign ntt_out_issue = cnt_128_ntt + 8'd1;

	
	reg				module_start_d1;
	reg				module_start_d2;
	
	reg		[22:0]	data1;
	reg		[22:0]	data2;
	reg		[1:0]	ntt_out_bank_d1;
	reg		[1:0]	ntt_out_bank_d2;
	reg		[1:0]	ntt_out_bank_d3;
	reg				working_1;
	reg				working_2;
	reg				working_3;
	reg				working_4;
	
	reg				module_done_ntt;
	wire			module_done_ntt_flag;
	reg				module_done_ntt_d1;
	reg				module_done_ntt_flag_d1;
	reg				intt_done;
	reg				intt_done_d1;
	reg				intt_done_d2;
	reg				intt_done_d3;
	
    assign module_done = (Multi_Mode && cnt_128_ntt==8'd130) | (intt_done_d2==1'b1);

	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			module_start_d1	<= 1'd0;
			module_start_d2 <= 1'd0;
			NTT_working		<= 1'd0;
		end
		else begin
			module_start_d1 <= module_start;
			module_start_d2 <= module_start_d1;
			
			if(module_start) begin
				NTT_working <= 1'd1;
			end
			else if(module_done) begin
				NTT_working <= 1'd0;
			end
		end
    end
    
    assign Ws_tvalid = (Multi_Mode && cnt_128_ntt >= 8'd3 && cnt_128_ntt < 8'd131) | (!Multi_Mode && cnt_128 >= 7'd3 && cnt_128 < 8'd128);
    
    assign Ws_tdata = KAD_Mode ? {20'b0, data1[11:0], 20'b0, data2[11:0]} : {9'b0, data1, 9'b0, data2};
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			cnt_30 <= 5'd0;
		end
		else if (module_start_d1 | (cnt_30==5'd30 && cnt_2==5'b1)) begin
			cnt_30 <= 5'd0;
		end
		else if (cnt_2) begin
			cnt_30 <= cnt_30 +'d2;
		end
	end
        
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			cnt_2 <= 1'b0;
		end
		else if(module_start_d1) begin
			cnt_2 <= 1'b0;
		end
		else begin
			cnt_2 <= cnt_2 + 1;
		end
	end
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			cnt_31 <= 5'd0;
		end
 		else if (module_start_d1 | (cnt_31==5'd31 && cnt_2==5'b1)) begin
 			cnt_31 <= 5'd1;
		end
 		else if(cnt_2) begin
			cnt_31 <= cnt_31 + 5'd2;
		end
	end
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			cnt_128_ntt <= 8'd131;
		end else if (module_start_d1) begin
			cnt_128_ntt <= 8'd0;
		end else if (cnt_128_ntt < 8'd131) begin
			cnt_128_ntt <= cnt_128_ntt + 1;
		end else if (cnt_128_ntt==8'd131) begin
			cnt_128_ntt <= 8'd131;
		end
    end
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			CS <= 5'd0;
		end
 		else if (module_start) begin
			CS <= IDLE;
		end
		else begin
			CS <= NS;
		end
    end
    
    always @(*) begin
        NS = IDLE;
		case(CS)
			IDLE: begin
				if(NTT_working)
					NS = S1;
				else
					NS = IDLE;
			end
			S1: begin
				if(cnt_128_ntt=='d31)
					NS = S2;
				else
					NS = S1;
			end
			S2: begin
				if(cnt_128_ntt=='d63)
				    NS = S3;
				else
				    NS = S2;
			end
			S3: begin
			    if(cnt_128_ntt=='d95)
			        NS = S4;
			    else
			        NS = S3;
			end
			S4: begin
			    if(cnt_128_ntt=='d130)
			        NS = LAST;
			    else
			        NS = S4;
			end
			LAST:begin
			    if(module_done)
			        NS = IDLE;
			    else
			        NS = LAST;
			end
		endcase
	end

	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
 			coef_ena_bram0		<= 1'b0 ;
 			coef_wea_bram0		<= 1'b0 ;
 			coef_enb_bram0		<= 1'b0 ;
 			coef_web_bram0		<= 1'b0 ;
 			coef_ena_bram1		<= 1'b0 ;
 			coef_wea_bram1		<= 1'b0 ;
 			coef_enb_bram1		<= 1'b0 ;
 			coef_web_bram1		<= 1'b0 ;
 			coef_ena_bram2		<= 1'b0 ;
 			coef_wea_bram2		<= 1'b0 ;
 			coef_enb_bram2		<= 1'b0 ;
 			coef_web_bram2		<= 1'b0 ;
 			coef_ena_bram3		<= 1'b0 ;
 			coef_wea_bram3		<= 1'b0 ;
 			coef_enb_bram3		<= 1'b0 ;
 			coef_web_bram3		<= 1'b0 ;
 			module_done_ntt		<= 1'b0 ;
 			coef_addra_bram0	<= 6'd0 ;
 			coef_addrb_bram0	<= 6'd0 ;
 			coef_addra_bram1	<= 6'd0 ;
 			coef_addrb_bram1	<= 6'd0 ;
 			coef_addra_bram2	<= 6'd0 ;
 			coef_addrb_bram2	<= 6'd0 ;
 			coef_addra_bram3	<= 6'd0 ;
 			coef_addrb_bram3	<= 6'd0 ;
 			data1				<= 23'd0;
 			data2				<= 23'd0;
		end
 		else if (module_start) begin                                   
			coef_ena_bram0	<= 1'b0 ;
			coef_enb_bram0	<= 1'b0 ;
			coef_ena_bram1	<= 1'b0 ;
			coef_enb_bram1	<= 1'b0 ;
			coef_ena_bram2	<= 1'b0 ;
			coef_enb_bram2	<= 1'b0 ;
			coef_ena_bram3	<= 1'b0 ;
			coef_enb_bram3	<= 1'b0 ;
			module_done_ntt	<= 1'b0 ;
 		end
 		else if (Multi_Mode) begin
 			if (KAD_Mode) begin
 				coef_ena_bram0   <= (cnt_128_ntt < 8'd131) ;
 				coef_enb_bram0   <= (cnt_128_ntt < 8'd131) ;
 				coef_ena_bram1   <= (cnt_128_ntt < 8'd131) ;
 				coef_enb_bram1   <= (cnt_128_ntt < 8'd131) ;
 				coef_ena_bram2   <= (cnt_128_ntt < 8'd131) ;
 				coef_enb_bram2   <= (cnt_128_ntt < 8'd131) ;
 				coef_ena_bram3   <= (cnt_128_ntt < 8'd131) ;
 				coef_enb_bram3   <= (cnt_128_ntt < 8'd131) ;
 				coef_wea_bram0   <= 1'b0 ;
 				coef_web_bram0   <= 1'b0 ;
 				coef_wea_bram1   <= 1'b0 ;
 				coef_web_bram1   <= 1'b0 ;
 				coef_wea_bram2   <= 1'b0 ;
 				coef_web_bram2   <= 1'b0 ;
 				coef_wea_bram3   <= 1'b0 ;
 				coef_web_bram3   <= 1'b0 ;
 				coef_addra_bram0 <= cnt_128_ntt[6:2] ;
 				coef_addrb_bram0 <= cnt_128_ntt[6:2] + 6'd32 ;
 				coef_addra_bram1 <= cnt_128_ntt[6:2] ;
 				coef_addrb_bram1 <= cnt_128_ntt[6:2] + 6'd32 ;
 				coef_addra_bram2 <= cnt_128_ntt[6:2] ;
 				coef_addrb_bram2 <= cnt_128_ntt[6:2] + 6'd32 ;
 				coef_addra_bram3 <= cnt_128_ntt[6:2] ;
 				coef_addrb_bram3 <= cnt_128_ntt[6:2] + 6'd32 ;
 				ntt_out_bank_d1  <= cnt_128_ntt[1:0] ;
 				ntt_out_bank_d2  <= ntt_out_bank_d1 ;
 				ntt_out_bank_d3  <= ntt_out_bank_d2 ;
 				case (ntt_out_bank_d2)
 					2'd0: begin data1 <= coef_douta_bram0; data2 <= coef_doutb_bram0; end
 					2'd1: begin data1 <= coef_douta_bram1; data2 <= coef_doutb_bram1; end
 					2'd2: begin data1 <= coef_douta_bram2; data2 <= coef_doutb_bram2; end
 					2'd3: begin data1 <= coef_douta_bram3; data2 <= coef_doutb_bram3; end
 				endcase
 			end
 			else begin
 			case (CS)                                            
 				IDLE: begin
 				 	coef_ena_bram0 <= 'b0 ;
 				 	coef_wea_bram0 <= 'b0 ;
 				 	coef_enb_bram0 <= 'b0 ;
 				 	coef_web_bram0 <= 'b0 ;
 				 	coef_ena_bram1 <= 'b0 ;
 				 	coef_wea_bram1 <= 'b0 ;
 				 	coef_enb_bram1 <= 'b0 ;
 				 	coef_web_bram1 <= 'b0 ;
 				 	coef_ena_bram2 <= 'b0 ;
 				 	coef_wea_bram2 <= 'b0 ;
 				 	coef_enb_bram2 <= 'b0 ;
 				 	coef_web_bram2 <= 'b0 ;
 				 	coef_ena_bram3 <= 'b0 ;
 				 	coef_wea_bram3 <= 'b0 ;
 				 	coef_enb_bram3 <= 'b0 ;
 				 	coef_web_bram3 <= 'b0 ;
 				 	module_done_ntt   <= 'b0 ;
 				end
 				S1: begin      
 					coef_ena_bram0   <= 'b1 ;
 					coef_enb_bram0   <= 'b1 ;
 					coef_ena_bram2   <= 'b1 ;
 					coef_enb_bram2   <= 'b1 ;
 					coef_ena_bram1   <= 'b1 ;
 					coef_enb_bram1   <= 'b1 ;
 					coef_ena_bram3   <= 'b1 ;
 					coef_enb_bram3   <= 'b1 ;    
 					coef_addra_bram0 <= cnt_30 ;   
 					coef_addrb_bram0 <= cnt_30 + 'd32 ;
 					coef_addra_bram2 <= cnt_30 ;   
 					coef_addrb_bram2 <= cnt_30 + 'd32 ;
 					data1 <= (cnt_2=='b0) ? coef_douta_bram0 : coef_douta_bram2 ;
 					data2 <= (cnt_2=='b0) ? coef_doutb_bram0 : coef_doutb_bram2 ;    
 				end
 				S2: begin        
 					coef_ena_bram0   <= 'b0 ;
 					coef_enb_bram0   <= 'b0 ;
 					coef_ena_bram2   <= 'b0 ;
 					coef_enb_bram2   <= 'b0 ;
 					coef_ena_bram1   <= 'b1 ;
 					coef_enb_bram1   <= 'b1 ;
 					coef_ena_bram3   <= 'b1 ;
 					coef_enb_bram3   <= 'b1 ;
 					coef_addra_bram1 <= cnt_31 ;   
 					coef_addrb_bram1 <= cnt_31 + 'd32 ;
 					coef_addra_bram3 <= cnt_31 ;   
 					coef_addrb_bram3 <= cnt_31 + 'd32 ;
 					data1 <= (cnt_2=='b0) ? coef_douta_bram1 : coef_douta_bram3 ;
 					data2 <= (cnt_2=='b0) ? coef_doutb_bram1 : coef_doutb_bram3 ;    
 				end      
 				S3: begin      
					coef_ena_bram0   <= 'b0 ;
					coef_enb_bram0   <= 'b0 ;
					coef_ena_bram2   <= 'b0 ;
					coef_enb_bram2   <= 'b0 ;
 					coef_ena_bram1   <= 'b1 ;
 					coef_enb_bram1   <= 'b1 ;
 					coef_ena_bram3   <= 'b1 ;
 					coef_enb_bram3   <= 'b1 ;          
 					coef_addra_bram1 <= cnt_30 ;   
 					coef_addrb_bram1 <= cnt_30 + 'd32 ;
 					coef_addra_bram3 <= cnt_30 ;   
					coef_addrb_bram3 <= cnt_30 + 'd32 ;
 					data1 <= (cnt_2=='b0) ? coef_douta_bram1 : coef_douta_bram3 ;
 					data2 <= (cnt_2=='b0) ? coef_doutb_bram1 : coef_doutb_bram3 ;   
 				end      
 				S4: begin       
 				  coef_ena_bram0   <= 'b1 ;
 				  coef_enb_bram0   <= 'b1 ;
 				  coef_ena_bram2   <= 'b1 ;
 				  coef_enb_bram2   <= 'b1 ;
 				  coef_ena_bram1   <= 'b0 ;
 				  coef_enb_bram1   <= 'b0 ;
 				  coef_ena_bram3   <= 'b0 ;
 				  coef_enb_bram3   <= 'b0 ;
 				  coef_addra_bram0 <= cnt_31 ;   
 				  coef_addrb_bram0 <= cnt_31 + 'd32 ;
 				  coef_addra_bram2 <= cnt_31 ;   
 				  coef_addrb_bram2 <= cnt_31 + 'd32 ;          
 				  data1 <= (cnt_2=='b0) ? coef_douta_bram0 : coef_douta_bram2 ;
 				  data2 <= (cnt_2=='b0) ? coef_doutb_bram0 : coef_doutb_bram2 ;    
 				
 				end      
 				LAST: begin
 				    coef_ena_bram0   <= 'b0 ;
 				    coef_enb_bram0   <= 'b0 ;
 				    coef_ena_bram1   <= 'b0 ;
 				    coef_enb_bram1   <= 'b0 ;
 				    coef_ena_bram2   <= 'b0 ;
 				    coef_enb_bram2   <= 'b0 ;
 				    coef_ena_bram3   <= 'b0 ;
 				    coef_enb_bram3   <= 'b0 ;
 				    module_done_ntt      <= 'b1 ;        
 				end        
 			endcase
 			end      
 		end
 		else if (!Multi_Mode) begin
 		    if (!INTT_working) begin
 		        coef_ena_bram0 <= 'b0;
 		        coef_enb_bram0 <= 'b0;
 		        coef_ena_bram1 <= 'b0;
 		        coef_enb_bram1 <= 'b0;
 		        coef_ena_bram2 <= 'b0;
 		        coef_enb_bram2 <= 'b0;
 		        coef_ena_bram3 <= 'b0;
 		        coef_enb_bram3 <= 'b0;        
 		    end
 		    else if (INTT_working) begin
 		        coef_ena_bram0 <= 'b1;
 		        coef_enb_bram0 <= 'b1;
 		        coef_ena_bram1 <= 'b1;
 		        coef_enb_bram1 <= 'b1;
 		        coef_ena_bram2 <= 'b1;
 		        coef_enb_bram2 <= 'b1;
 		        coef_ena_bram3 <= 'b1;
 		        coef_enb_bram3 <= 'b1;
 		        coef_addra_bram0 <= addr ;
 		        coef_addrb_bram0 <= addr + 'd32 ;
 		        coef_addra_bram1 <= addr ;
 		        coef_addrb_bram1 <= addr + 'd32 ;
 		        coef_addra_bram2 <= addr ;
 		        coef_addrb_bram2 <= addr + 'd32 ;
 		        coef_addra_bram3 <= addr ;
 		        coef_addrb_bram3 <= addr + 'd32 ;
 		    
 		        if (bram_sel_d2=='d0) begin
 		        	data1 <= coef_douta_bram0 ;
 		        	data2 <= coef_doutb_bram0 ;
 		        end
 		        else if (bram_sel_d2=='d1) begin
 		        	data1 <= coef_douta_bram1 ;
 		        	data2 <= coef_doutb_bram1 ;
 		        end
 		        else if (bram_sel_d2=='d2) begin
 		        	data1 <= coef_douta_bram2 ;
 		        	data2 <= coef_doutb_bram2 ;
 		        end
 		        else if (bram_sel_d2=='d3) begin
 		        	data1 <= coef_douta_bram3 ;
 		        	data2 <= coef_doutb_bram3 ;
 		        end   
 		    end
 		end
    end
         
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			INTT_working <= 1'b0;
		end
        else if (module_start && !Multi_Mode)
            INTT_working <= 'b1;
        else if(intt_done_d2)
            INTT_working <= 'b0;
        else begin
            INTT_working <= INTT_working;
		end
    end

	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			cnt_128 <= 8'd128;
		end
        else if (module_start_d1) begin
            cnt_128 <= 8'd0;
        end
        else if (cnt_128 < 8'd128) begin
            cnt_128 <= cnt_128 + 1'b1;
        end
        else if (cnt_128 == 8'd128) begin
            cnt_128 <= 8'd128;
        end
    end

    assign offset = cnt_128[1:0];    
    assign bram = cnt_128[2];
    assign iter = cnt_128[5:3];
    assign bram_group_sel = cnt_128[6];
    assign base = (iter >> 1) + (iter[0] ? 5'd4 : 5'd0);
    
    always @(*) begin
        addr = base + (offset << 3);  // offset * 8
        bram_sel = (bram_group_sel ? 2'b10 : 2'b00) + (bram ? 2'b01 : 2'b00);
    end
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			bram_sel_d1		<= 2'd0;
			bram_sel_d2		<= 2'd0;
			intt_done_d1	<= 1'd0;
			intt_done_d2	<= 1'd0;
			intt_done_d3	<= 1'd0;
		end
		else begin
			bram_sel_d1		<= bram_sel;
			bram_sel_d2		<= bram_sel_d1;
			intt_done_d1	<= intt_done;
			intt_done_d2	<= intt_done_d1;
			intt_done_d3	<= intt_done_d2;
		end
	end
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			intt_done <= 1'b0;
		end
 		else if (cnt_128=='d127 && !Multi_Mode) begin
 			intt_done <= 1'b1;
 		end
 		else begin
			intt_done <= 1'b0;
		end
	end
	
endmodule
