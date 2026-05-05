`timescale 1ns / 1ps

(* dont_touch="true" *)
module KAD_NTT_mem_read
(
	input	wire			clk,
	input	wire			aresetn,
	input	wire			module_start,
	input	wire			read_working,
	input	wire			Rm_tvalid,
	input	wire	[63:0]	Rm_tdata,
	input	wire			KAD_Mode,	//=1 ML_KEM, =0 ML_DSA
	input	wire			Multi_Mode,	//=1 NTT, =0 INTT
	
	output	wire			rd_en,

	output	reg				coef_ena_bram0,
	output	reg				coef_wea_bram0,
	output	reg		[5:0]	coef_addra_bram0,
	output	reg		[22:0]	coef_dina_bram0,
	output	reg				coef_enb_bram0,
	output	reg				coef_web_bram0,
	output	reg		[5:0]	coef_addrb_bram0,
	output	reg		[22:0]	coef_dinb_bram0,
	output	reg				coef_ena_bram1,
	output	reg				coef_wea_bram1,
	output	reg		[5:0]	coef_addra_bram1,
	output	reg		[22:0]	coef_dina_bram1,
	output	reg				coef_enb_bram1,
	output	reg				coef_web_bram1,
	output	reg		[5:0]	coef_addrb_bram1,
	output	reg		[22:0]	coef_dinb_bram1,
	output	reg				coef_ena_bram2,
	output	reg				coef_wea_bram2,
	output	reg		[5:0]	coef_addra_bram2,
	output	reg		[22:0]	coef_dina_bram2,
	output	reg				coef_enb_bram2,
	output	reg				coef_web_bram2,
	output	reg		[5:0]	coef_addrb_bram2,
	output	reg		[22:0]	coef_dinb_bram2,
	output	reg				coef_ena_bram3,
	output	reg				coef_wea_bram3,
	output	reg		[5:0]	coef_addra_bram3,
	output	reg		[22:0]	coef_dina_bram3,
	output	reg				coef_enb_bram3,
	output	reg				coef_web_bram3,
	output	reg		[5:0]	coef_addrb_bram3,
	output	reg		[22:0]	coef_dinb_bram3,
	 
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
	
	reg		[63:0]	data_in;
	wire	[31:0]	data_temp_1;
	wire	[31:0]	data_temp_2;
	wire	[22:0]	data_1;
	wire	[22:0]	data_2;
	
	wire			count_done;
	reg		[7:0]	counter;
	reg		[7:0]	counter_1;
	reg		[7:0]	counter_2;
	reg		[7:0]	counter_3;
	reg		[7:0]	counter_intt;
	reg				read_module_done;
	reg				read_module_done_d1;
	reg				read_module_done_d2;
	reg				read_module_done_d3;
	wire	[7:0]	rev_counter;
	wire	[1:0]	bram_id;
	wire	[5:0]	bram_addr;
	
	reg				rd_en_1;
	reg				rd_en_2;
    
    assign data_1 = Rm_tdata[63] ? (KAD_Mode ? (Rm_tdata[54:32]+ 23'd8380417) : (Rm_tdata[43:32]+ 12'd3329)) : Rm_tdata[63:32];
	assign data_2 = Rm_tdata[31] ? (KAD_Mode ? (Rm_tdata[22:0]+ 23'd8380417) : (Rm_tdata[11:0] + 12'd3329)) : Rm_tdata[31:0];
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			data_in		<= 64'd0;
			counter_1	<= 8'd0;
			counter_2	<= 8'd0;
			counter_3	<= 8'd0;
			rd_en_1		<= 1'd0;
			rd_en_2		<= 1'd0;
			read_module_done_d1	<= 1'd0;
			read_module_done_d2	<= 1'd0;
			read_module_done_d3	<= 1'd0;
		end
		else begin
			data_in		<= Rm_tdata;			
			counter_1	<= counter;
			counter_2	<= counter_1;
			counter_3	<= counter_2;
			rd_en_1		<= rd_en;
			rd_en_2		<= rd_en_1;
			read_module_done_d1	<= read_module_done;
			read_module_done_d2	<= read_module_done_d1;
			read_module_done_d3	<= read_module_done_d2;
		end
    end
    
    assign module_done = read_module_done_d2 && (!read_module_done_d3);
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			counter_intt <= 0;
		end 
		else if (module_start | counter_intt==8'd254) begin
			counter_intt <= 0;
		end
		else if (rd_en) begin
			counter_intt <= counter_intt + 1;
		end
	end
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			counter <= 0;
		end 
		else if (module_start | (counter==8'd254 && rd_en))
			counter <= 0;
		else if (rd_en)
			counter <= counter + 2;
    end
    
    //把counter计数器位反转成原始顺序排列的序号，据此低两确定此数的bram_id，高六位确定在bram中的地址的值
//    assign rev_counter = {counter_2[0], counter_2[1], counter_2[2], counter_2[3],
//                          counter_2[4], counter_2[5], counter_2[6], counter_2[7]};
    assign rev_counter = {counter[0], counter[1], counter[2], counter[3],
                          counter[4], counter[5], counter[6], counter[7]};
    assign bram_id = rev_counter[1:0];      //确定此数的bram_id
    assign bram_addr = rev_counter[7:2];    //确定在bram中的地址
    
    //处理axi_stream发来的数据
    assign data_temp_1 = data_in[63] ? (data_in[43:32]+ 12'd3329): data_in[63:32];
    assign data_temp_2 = data_in[31] ? (data_in[11:0] + 12'd3329): data_in[31:0];
    
    assign rd_en = read_working & Rm_tvalid & (~module_start);
    
	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			CS <= 0;
		end
		else if(module_start)
			CS <= IDLE;
		else
			CS <= NS;
    end
    
    always @ (*) begin
        NS = IDLE;

		case(CS)
			IDLE: begin
				if(rd_en)
					NS = S1;
				else
					NS = IDLE;
			end
			S1: begin
				if(counter_1=='d62)
					NS = S2;
				else
					NS = S1;
			end
			S2: begin
				if(counter_1=='d126)
					NS = S3;
				else
					NS = S2;
			end
			S3: begin
				if(counter_1=='d190)
					NS = S4;
				else
					NS = S3;
			end
			S4: begin
				if(counter_1=='d254)
					NS = LAST;
				else
					NS = S4;
			end
			LAST:begin
				if(read_module_done)
					NS = IDLE;
				else
					NS = LAST;
			end
		endcase
    end

	always @(posedge clk or negedge aresetn) begin
		if (!aresetn) begin
			coef_ena_bram0		<= 'b0;
			coef_wea_bram0		<= 'b0;
			coef_enb_bram0		<= 'b0;
			coef_web_bram0		<= 'b0;
			coef_ena_bram1		<= 'b0;
			coef_wea_bram1		<= 'b0;
			coef_enb_bram1		<= 'b0;
			coef_web_bram1		<= 'b0;
			coef_ena_bram2		<= 'b0;
			coef_wea_bram2		<= 'b0;
			coef_enb_bram2		<= 'b0;
			coef_web_bram2		<= 'b0;
			coef_ena_bram3		<= 'b0;  
			coef_wea_bram3		<= 'b0;
			coef_enb_bram3		<= 'b0;
			coef_web_bram3		<= 'b0;
			coef_addra_bram0	<= 'b0;
			coef_dina_bram0		<= 'b0;
			coef_addrb_bram0	<= 'b0;
			coef_dinb_bram0		<= 'b0; 
			coef_addra_bram1	<= 'b0;
			coef_dina_bram1		<= 'b0;
			coef_addrb_bram1 	<= 'b0;
			coef_dinb_bram1 	<= 'b0;
			coef_addra_bram2 	<= 'b0;
			coef_dina_bram2		<= 'b0;
			coef_addrb_bram2	<= 'b0;
			coef_dinb_bram2		<= 'b0;
			coef_addra_bram3	<= 'b0;
			coef_dina_bram3		<= 'b0;
			coef_addrb_bram3	<= 'b0;
			coef_dinb_bram3		<= 'b0;
			read_module_done	<= 'b0;
		end
		else if (module_start) begin
			coef_ena_bram0   <= 'b0 ;
			coef_wea_bram0   <= 'b1 ;
			coef_enb_bram0   <= 'b0 ;
			coef_web_bram0   <= 'b1 ;
			coef_ena_bram1   <= 'b0 ;
			coef_wea_bram1   <= 'b1 ;
			coef_enb_bram1   <= 'b0 ;
			coef_web_bram1   <= 'b1 ;
			coef_ena_bram2   <= 'b0 ;
			coef_wea_bram2   <= 'b1 ;
			coef_enb_bram2   <= 'b0 ;
			coef_web_bram2   <= 'b1 ;
			coef_ena_bram3   <= 'b0 ;  
			coef_wea_bram3   <= 'b1 ;
			coef_enb_bram3   <= 'b0 ;
			coef_web_bram3   <= 'b1 ;
			
			coef_addra_bram0 <= 'b0 ;
			coef_dina_bram0 <= 'b0 ;
			coef_addrb_bram0 <= 'b0 ;
			coef_dinb_bram0 <= 'b0 ;
						   
			coef_addra_bram1 <= 'b0 ;
			coef_dina_bram1 <= 'b0 ;
			coef_addrb_bram1 <= 'b0 ;
			coef_dinb_bram1 <= 'b0 ;
							
			coef_addra_bram2 <= 'b0 ;
			coef_dina_bram2 <= 'b0 ;
			coef_addrb_bram2 <= 'b0 ;
			coef_dinb_bram2 <= 'b0 ;
							 
			coef_addra_bram3 <= 'b0 ;
			coef_dina_bram3 <= 'b0 ;
			coef_addrb_bram3 <= 'b0 ;
			coef_dinb_bram3 <= 'b0 ;
			 
			read_module_done <= 'b0;
		end
		else if (Multi_Mode) begin	// 	NTT
			case (NS)
				IDLE: begin
					coef_ena_bram0   <= 'b0 ;    
					coef_wea_bram0   <= 'b1 ;    
					coef_enb_bram0   <= 'b0 ;    
					coef_web_bram0   <= 'b1 ;    
					coef_ena_bram1   <= 'b0 ;    
					coef_wea_bram1   <= 'b1 ;    
					coef_enb_bram1   <= 'b0 ;            
					coef_web_bram1   <= 'b1 ;    
					coef_ena_bram2   <= 'b0 ;           
					coef_wea_bram2   <= 'b1 ;    
					coef_enb_bram2   <= 'b0 ;           
					coef_web_bram2   <= 'b1 ;    
					coef_ena_bram3   <= 'b0 ;       
					coef_wea_bram3   <= 'b1 ;    
					coef_enb_bram3   <= 'b0 ;    
					coef_web_bram3   <= 'b1 ;
					
					coef_addra_bram0 <= 'b0 ;
					coef_dina_bram0  <= 'b0 ;
					coef_addrb_bram0 <= 'b0 ;
					coef_dinb_bram0  <= 'b0 ;
		
					coef_addra_bram1 <= 'b0 ;
					coef_dina_bram1  <= 'b0 ;
					coef_addrb_bram1 <= 'b0 ;
					coef_dinb_bram1  <= 'b0 ;
		
					coef_addra_bram2 <= 'b0 ;
					coef_dina_bram2  <= 'b0 ;
					coef_addrb_bram2 <= 'b0 ;
					coef_dinb_bram2  <= 'b0 ;
		
					coef_addra_bram3 <= 'b0 ;
					coef_dina_bram3  <= 'b0 ;
					coef_addrb_bram3 <= 'b0 ;
					coef_dinb_bram3  <= 'b0 ;
				end
				S1: begin
					coef_ena_bram0   <= 'b1 ;    
					coef_wea_bram0   <= 'b1 ;    
					coef_enb_bram0   <= 'b1 ;    
					coef_web_bram0   <= 'b1 ;    
					
					coef_addra_bram0	<= bram_addr ;
					coef_dina_bram0		<= data_1 ;
					coef_addrb_bram0	<= bram_addr + 'd32 ;
					coef_dinb_bram0		<= data_2 ;
				end
				S2: begin
					coef_ena_bram0   <= 'b0 ;
					coef_enb_bram0   <= 'b0 ; 
					
					coef_ena_bram2   <= 'b1 ;
					coef_wea_bram2   <= 'b1 ;
					coef_enb_bram2   <= 'b1 ;
					coef_web_bram2   <= 'b1 ;
					
					coef_addra_bram2 <= bram_addr ;
					coef_dina_bram2 <= data_1 ;
					coef_addrb_bram2 <= bram_addr + 'd32 ;
					coef_dinb_bram2 <= data_2 ;
				end
				S3: begin
					coef_ena_bram2   <= 'b0 ;
					coef_enb_bram2   <= 'b0 ;
					
					coef_ena_bram1   <= 'b1 ;
					coef_wea_bram1   <= 'b1 ;
					coef_enb_bram1   <= 'b1 ;
					coef_web_bram1   <= 'b1 ;
					
					coef_addra_bram1 <= bram_addr ;
					coef_dina_bram1 <= data_1 ;
					coef_addrb_bram1 <= bram_addr + 'd32 ;
					coef_dinb_bram1 <= data_2 ;
				end
				S4: begin
					coef_ena_bram1   <= 'b0 ;
					coef_enb_bram1   <= 'b0 ; 
					
					coef_ena_bram3   <= 'b1 ;    
					coef_wea_bram3   <= 'b1 ;    
					coef_enb_bram3   <= 'b1 ;    
					coef_web_bram3   <= 'b1 ;    
					
					coef_addra_bram3 <= bram_addr ;
					coef_dina_bram3 <= data_1 ;
					coef_addrb_bram3 <= bram_addr + 'd32 ;
					coef_dinb_bram3 <= data_2 ;
				end
				LAST: begin
					coef_ena_bram3		<= 'b0 ;
					coef_enb_bram3		<= 'b0 ; 
					read_module_done	<= 'b1 ;
				end
			endcase
		end
		else begin	//INTT
			case(NS)
				IDLE: begin
					coef_ena_bram0   <= 'b0 ;    
					coef_wea_bram0   <= 'b1 ;    
					coef_enb_bram0   <= 'b0 ;    
					coef_web_bram0   <= 'b0 ;    
					coef_ena_bram1   <= 'b0 ;    
					coef_wea_bram1   <= 'b1 ;    
					coef_enb_bram1   <= 'b0 ;            
					coef_web_bram1   <= 'b0 ;    
					coef_ena_bram2   <= 'b0 ;           
					coef_wea_bram2   <= 'b1 ;    
					coef_enb_bram2   <= 'b0 ;           
					coef_web_bram2   <= 'b0 ;    
					coef_ena_bram3   <= 'b0 ;       
					coef_wea_bram3   <= 'b1 ;    
					coef_enb_bram3   <= 'b0 ;    
					coef_web_bram3   <= 'b0 ;
					
					coef_addra_bram0 <= 'b0 ;
					coef_dina_bram0 <= 'b0 ;
					coef_addrb_bram0 <= 'b0 ;
					coef_dinb_bram0 <= 'b0 ;
									 
					coef_addra_bram1 <= 'b0 ;
					coef_dina_bram1 <= 'b0 ;
					coef_addrb_bram1 <= 'b0 ;
					coef_dinb_bram1 <= 'b0 ;
									
					coef_addra_bram2 <= 'b0 ;
					coef_dina_bram2 <= 'b0 ;
					coef_addrb_bram2 <= 'b0 ;
					coef_dinb_bram2 <= 'b0 ;
									 
					coef_addra_bram3 <= 'b0 ;
					coef_dina_bram3 <= 'b0 ;
					coef_addrb_bram3 <= 'b0 ;
					coef_dinb_bram3 <= 'b0 ;
				end
				S1: begin
					coef_ena_bram0   <= 'b1 ;    
					coef_wea_bram0   <= 'b1 ;    
					coef_enb_bram0   <= 'b1 ;    
					coef_web_bram0   <= 'b1 ;    
					
					coef_addra_bram0 <= counter_intt ;
					coef_dina_bram0 <= data_1 ;
					coef_addrb_bram0 <= counter_intt + 'd32 ;
					coef_dinb_bram0 <= data_2 ;
				end
				S2: begin
					coef_ena_bram0	<= 'b0 ;
					coef_enb_bram0	<= 'b0 ; 
					
					coef_ena_bram1	<= 'b1 ;    
					coef_wea_bram1	<= 'b1 ;    
					coef_enb_bram1	<= 'b1 ;    
					coef_web_bram1	<= 'b1 ;    
					
					coef_addra_bram1	<= counter_intt - 'd32 ;
					coef_dina_bram1		<= data_1 ;
					coef_addrb_bram1	<= counter_intt;
					coef_dinb_bram1		<= data_2 ;		
				end
				S3: begin
					coef_ena_bram1	<= 'b0 ;
					coef_enb_bram1	<= 'b0 ; 
					
					coef_ena_bram2	<= 'b1 ;    
					coef_wea_bram2	<= 'b1 ;    
					coef_enb_bram2	<= 'b1 ;    
					coef_web_bram2	<= 'b1 ;    
					
					coef_addra_bram2	<= counter_intt - 'd64 ;
					coef_dina_bram2		<= data_1 ;
					coef_addrb_bram2	<= counter_intt - 'd32 ;
					coef_dinb_bram2		<= data_2 ;
				end
				S4: begin
					coef_ena_bram2   <= 'b0 ;
					coef_enb_bram2   <= 'b0 ; 
					
					coef_ena_bram3   <= 'b1 ;    
					coef_wea_bram3   <= 'b1 ;    
					coef_enb_bram3   <= 'b1 ;    
					coef_web_bram3   <= 'b1 ;    
					
					coef_addra_bram3 <= counter_intt - 'd96 ;
					coef_dina_bram3 <= data_1 ;
					coef_addrb_bram3 <= counter_intt - 'd64 ;
					coef_dinb_bram3 <= data_2 ;
				end
				LAST: begin
					coef_ena_bram3		<= 'b0 ;
					coef_enb_bram3		<= 'b0 ;
					read_module_done	<= 'b1 ;
				end   
			endcase
		end
    end
    
    
endmodule