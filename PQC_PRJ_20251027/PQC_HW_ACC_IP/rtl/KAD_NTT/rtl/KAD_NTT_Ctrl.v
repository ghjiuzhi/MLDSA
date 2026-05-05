`timescale 1ns / 1ps

(* dont_touch="true" *)
module KAD_NTT_Ctrl
(
	input	wire			clk,    
	input	wire			aresetn,
	input	wire			start,
	input	wire			sel,
	input	wire			KAD_Mode,	//=1 ML_KEM, =0 ML_DSA
	input	wire			Multi_Mode,	//=1 NTT, =0 INTT
	input	wire			Rm_tvalid,
	output	wire			Rm_tready,
	input	wire	[63:0]	Rm_tdata,
	input	wire	[7:0]	Rm_tkeep,
	input	wire			Rm_tlast,
	output	wire	       	Ws_tvalid,
	input	wire	      	Ws_tready,
	output	wire	[63:0]	Ws_tdata,
	output	wire	[7:0]	Ws_tkeep,
	output	wire			Ws_tlast,

    output	wire			write_done
    );
	
	wire			sel_keep;
	wire	[22:0]	a;
	wire	[22:0]	b;
	wire	[22:0]	omiga;
	wire	[22:0]	a1;
	wire	[22:0]	b1;
	
	reg				read_start;
	wire			read_done;
	wire			read_working;
	reg				compute_start;
	wire			compute_done;
	//wire compu_working;
	reg				write_start;
	wire			write_working;
	
	reg		[1:0]	cur_state;
	reg		[1:0]	nex_state;
    
    //read_mem_wire
    wire			coef_ena_bram0_read;
    wire			coef_wea_bram0_read;
    wire	[5:0]	coef_addra_bram0_read; 
    wire	[22:0]	coef_dina_bram0_read; 
    wire			coef_enb_bram0_read;
    wire			coef_web_bram0_read;
    wire	[5:0]	coef_addrb_bram0_read; 
    wire	[22:0]	coef_dinb_bram0_read; 
	
    wire			coef_ena_bram1_read;
    wire			coef_wea_bram1_read;
    wire	[5:0]	coef_addra_bram1_read; 
    wire	[22:0]	coef_dina_bram1_read; 
    wire			coef_enb_bram1_read;
    wire			coef_web_bram1_read;
    wire	[5:0]	coef_addrb_bram1_read; 
    wire	[22:0]	coef_dinb_bram1_read; 
	
    wire			coef_ena_bram2_read;
    wire			coef_wea_bram2_read;
    wire	[5:0]	coef_addra_bram2_read; 
    wire	[22:0]	coef_dina_bram2_read; 
    wire			coef_enb_bram2_read;
    wire			coef_web_bram2_read;
    wire	[5:0]	coef_addrb_bram2_read; 
    wire	[22:0]	coef_dinb_bram2_read; 
	
    wire			coef_ena_bram3_read;
    wire			coef_wea_bram3_read;
    wire	[5:0]	coef_addra_bram3_read; 
    wire	[22:0]	coef_dina_bram3_read; 
    wire			coef_enb_bram3_read;
    wire			coef_web_bram3_read;
    wire	[5:0]	coef_addrb_bram3_read; 
    wire	[22:0]	coef_dinb_bram3_read; 
    
    //implement_wire
    wire        coef_ena_bram0_implement  ;
    wire        coef_wea_bram0_implement  ;
    wire [5:0]  coef_addra_bram0_implement;
    wire [22:0] coef_dina_bram0_implement ;
    wire        coef_enb_bram0_implement  ;
    wire        coef_web_bram0_implement  ;
    wire [5:0]  coef_addrb_bram0_implement;
    wire [22:0] coef_doutb_bram0_implement;
    wire        coef_ena_bram1_implement  ;
    wire        coef_wea_bram1_implement  ;
    wire [5:0]  coef_addra_bram1_implement;
    wire [22:0] coef_dina_bram1_implement ;
    wire        coef_enb_bram1_implement  ;
    wire        coef_web_bram1_implement  ;
    wire [5:0]  coef_addrb_bram1_implement;
    wire [22:0] coef_doutb_bram1_implement;
    wire        coef_ena_bram2_implement  ;
    wire        coef_wea_bram2_implement  ;
    wire [5:0]  coef_addra_bram2_implement;
    wire [22:0] coef_dina_bram2_implement ;
    wire        coef_enb_bram2_implement  ;
    wire        coef_web_bram2_implement  ;
    wire [5:0]  coef_addrb_bram2_implement;
    wire [22:0] coef_doutb_bram2_implement;
    wire        coef_ena_bram3_implement  ;
    wire        coef_wea_bram3_implement  ;
    wire [5:0]  coef_addra_bram3_implement;
    wire [22:0] coef_dina_bram3_implement ;
    wire        coef_enb_bram3_implement  ;
    wire        coef_web_bram3_implement  ;
    wire [5:0]  coef_addrb_bram3_implement;
    wire [22:0] coef_doutb_bram3_implement;
    
    //write_wire
    wire	[22:0]	coef_douta_bram0_write;
    wire	[22:0]	coef_doutb_bram0_write;
    wire	[22:0]	coef_douta_bram1_write;
    wire	[22:0]	coef_doutb_bram1_write;
    wire	[22:0]	coef_douta_bram2_write;
    wire	[22:0]	coef_doutb_bram2_write;
    wire	[22:0]	coef_douta_bram3_write;
    wire	[22:0]	coef_doutb_bram3_write;
    wire			coef_ena_bram0_write;
    wire			coef_wea_bram0_write;
    wire			coef_enb_bram0_write;
    wire			coef_web_bram0_write;
    wire			coef_ena_bram1_write;
    wire			coef_wea_bram1_write;
    wire			coef_enb_bram1_write;
    wire			coef_web_bram1_write;
    wire			coef_ena_bram2_write;
    wire			coef_wea_bram2_write;
    wire			coef_enb_bram2_write;
    wire			coef_web_bram2_write;
    wire			coef_ena_bram3_write;
    wire			coef_wea_bram3_write;
    wire			coef_enb_bram3_write;
    wire			coef_web_bram3_write;
    wire	[5:0]	coef_addra_bram0_write; 
    wire	[5:0]	coef_addrb_bram0_write;
    wire	[5:0]	coef_addra_bram1_write; 
    wire	[5:0]	coef_addrb_bram1_write;
    wire	[5:0]	coef_addra_bram2_write; 
    wire	[5:0]	coef_addrb_bram2_write;
    wire	[5:0]	coef_addra_bram3_write; 
    wire	[5:0]	coef_addrb_bram3_write;

	wire			coef_ena_bram0;
	wire			coef_wea_bram0;
	wire	[5:0]	coef_addra_bram0;
	wire	[22:0]	coef_dina_bram0;
	wire	[22:0]	coef_douta_bram0;
	wire			coef_enb_bram0;
	wire			coef_web_bram0;
	wire	[5:0]	coef_addrb_bram0;
	wire	[22:0]	coef_dinb_bram0;
	wire	[22:0]	coef_doutb_bram0;
		
	wire			coef_ena_bram1;
	wire			coef_wea_bram1;
	wire	[5:0]	coef_addra_bram1;
	wire	[22:0]	coef_dina_bram1;
	wire	[22:0]	coef_douta_bram1;
	wire			coef_enb_bram1;
	wire			coef_web_bram1;
	wire	[5:0]	coef_addrb_bram1;
	wire	[22:0]	coef_dinb_bram1;
	wire	[22:0]	coef_doutb_bram1;
		
	wire			coef_ena_bram2;
	wire			coef_wea_bram2;
	wire	[5:0]	coef_addra_bram2;
	wire	[22:0]	coef_dina_bram2;
	wire	[22:0]	coef_douta_bram2;
	wire			coef_enb_bram2;
	wire			coef_web_bram2;
	wire	[5:0]	coef_addrb_bram2;
	wire	[22:0]	coef_dinb_bram2;
	wire	[22:0]	coef_doutb_bram2;
		
	wire			coef_ena_bram3;
	wire			coef_wea_bram3;
	wire	[7:0]	coef_addra_bram3;
	wire	[22:0]	coef_dina_bram3;
	wire	[22:0]	coef_douta_bram3;
	wire			coef_enb_bram3;
	wire			coef_web_bram3;
	wire	[5:0]	coef_addrb_bram3;
	wire	[22:0]	coef_dinb_bram3;
	wire	[22:0]	coef_doutb_bram3;
	
    always @(posedge clk) begin
        cur_state <= nex_state;
        
        if(start)
             read_start <= 1'b1;
        else
            read_start <= 1'b0;
            
        if(read_done)
            compute_start <= 1'b1;
        else
            compute_start <= 1'b0;
            
        if(compute_done)
            write_start <= 1'b1;
        else
            write_start <= 1'b0;
            
    end
    
    always @(*) begin
        case(cur_state)
            2'b00:
                if(start==1'b1)
                    nex_state <= 2'b01;
                else
                    nex_state <= 2'b00;
            2'b01:
                if(read_done==1'b1) 
                    nex_state <= 2'b10;
                else
                    nex_state <= 2'b01;
            2'b10:
                if(compute_done==1'b1) 
                    nex_state <= 2'b11;
                else
                    nex_state <= 2'b10;
            2'b11:
                if(write_done == 1'b1)
                    nex_state <= 2'b00;
                else
                    nex_state <= 2'b11;
            default:
                    nex_state <= 2'b00;
        endcase
    end
    
    assign read_working  = (cur_state == 2'b01); 
    assign compu_working = (cur_state == 2'b10);
    assign write_working = (cur_state == 2'b11);
    assign Rm_tready     = read_working & ~read_start & ~read_done;
    assign Ws_tkeep = 8'hFF;
    assign Ws_tlast = write_done;
    
    assign coef_ena_bram0    = (read_working) ? coef_ena_bram0_read   : (compu_working) ? coef_ena_bram0_implement   : write_working ? coef_ena_bram0_write   : 1'b0;
    assign coef_wea_bram0    = (read_working) ? coef_wea_bram0_read   : (compu_working) ? coef_wea_bram0_implement   : write_working ? coef_wea_bram0_write   : 1'b0;
    assign coef_addra_bram0  = (read_working) ? coef_addra_bram0_read : (compu_working) ? coef_addra_bram0_implement : write_working ? coef_addra_bram0_write : 1'b0;
    assign coef_dina_bram0   = (read_working) ? coef_dina_bram0_read  : (compu_working) ? coef_dina_bram0_implement  : 1'b0;
    assign coef_douta_bram0_implement	= compu_working ? coef_douta_bram0 : coef_douta_bram0_implement;
    assign coef_douta_bram0_write		= write_working ? coef_douta_bram0 : coef_douta_bram0_write;
                                
    assign coef_enb_bram0    = (read_working) ? coef_enb_bram0_read   : (compu_working) ? coef_enb_bram0_implement   : write_working ? coef_enb_bram0_write   : 1'b0;
    assign coef_web_bram0    = (read_working) ? coef_web_bram0_read   : (compu_working) ? coef_web_bram0_implement   : write_working ? coef_web_bram0_write   : 1'b0;
    assign coef_addrb_bram0  = (read_working) ? coef_addrb_bram0_read : (compu_working) ? coef_addrb_bram0_implement : write_working ? coef_addrb_bram0_write : 1'b0;
    assign coef_dinb_bram0   =  coef_dinb_bram0_read;
    assign coef_doutb_bram0_implement	= compu_working ? coef_doutb_bram0 : coef_doutb_bram0_implement;
    assign coef_doutb_bram0_write		= write_working ? coef_doutb_bram0 : coef_doutb_bram0_write;
                               
    assign coef_ena_bram1    = (read_working) ? coef_ena_bram1_read   : (compu_working) ? coef_ena_bram1_implement   : write_working ? coef_ena_bram1_write   : 1'b0;
    assign coef_wea_bram1    = (read_working) ? coef_wea_bram1_read   : (compu_working) ? coef_wea_bram1_implement   : write_working ? coef_wea_bram1_write   : 1'b0;
    assign coef_addra_bram1  = (read_working) ? coef_addra_bram1_read : (compu_working) ? coef_addra_bram1_implement : write_working ? coef_addra_bram1_write : 1'b0;
    assign coef_dina_bram1   = (read_working) ? coef_dina_bram1_read  : (compu_working) ? coef_dina_bram1_implement  : 1'b0;
    assign coef_douta_bram1_implement	= compu_working ? coef_douta_bram1 : coef_douta_bram1_implement;
    assign coef_douta_bram1_write		= write_working ? coef_douta_bram1 : coef_douta_bram1_write;
                                
    assign coef_enb_bram1    =  (read_working) ? coef_enb_bram1_read   : (compu_working) ? coef_enb_bram1_implement   : write_working ? coef_enb_bram1_write   : 1'b0;
    assign coef_web_bram1    =  (read_working) ? coef_web_bram1_read   : (compu_working) ? coef_web_bram1_implement   : write_working ? coef_web_bram1_write   : 1'b0;
    assign coef_addrb_bram1  =  (read_working) ? coef_addrb_bram1_read : (compu_working) ? coef_addrb_bram1_implement : write_working ? coef_addrb_bram1_write : 1'b0;
    assign coef_dinb_bram1   =  coef_dinb_bram1_read;
    assign coef_doutb_bram1_implement	= compu_working ? coef_doutb_bram1 : coef_doutb_bram1_implement;
    assign coef_doutb_bram1_write		= write_working ? coef_doutb_bram1 : coef_doutb_bram1_write;
                                
    assign coef_ena_bram2    =  (read_working)? coef_ena_bram2_read : (compu_working)? coef_ena_bram2_implement : write_working? coef_ena_bram2_write : 1'b0;
    assign coef_wea_bram2    =  (read_working)? coef_wea_bram2_read : (compu_working)? coef_wea_bram2_implement : write_working? coef_wea_bram2_write : 1'b0;
    assign coef_addra_bram2  =  (read_working)? coef_addra_bram2_read : (compu_working)? coef_addra_bram2_implement : write_working? coef_addra_bram2_write : 1'b0;
    assign coef_dina_bram2   =  (read_working)? coef_dina_bram2_read : (compu_working)? coef_dina_bram2_implement : 1'b0;
    assign coef_douta_bram2_implement	= compu_working ? coef_douta_bram2 : coef_douta_bram2_implement;
    assign coef_douta_bram2_write		= write_working ? coef_douta_bram2 : coef_douta_bram2_write;
                                
    assign coef_enb_bram2    =  (read_working)? coef_enb_bram2_read : (compu_working)? coef_enb_bram2_implement : write_working? coef_enb_bram2_write : 1'b0;
    assign coef_web_bram2    =  (read_working)? coef_web_bram2_read : (compu_working)? coef_web_bram2_implement : write_working? coef_web_bram2_write : 1'b0;
    assign coef_addrb_bram2  =  (read_working)? coef_addrb_bram2_read : (compu_working)? coef_addrb_bram2_implement : write_working? coef_addrb_bram2_write : 1'b0;
    assign coef_dinb_bram2   =  coef_dinb_bram2_read;
    assign coef_doutb_bram2_implement	= compu_working ? coef_doutb_bram2 : coef_doutb_bram2_implement;
    assign coef_doutb_bram2_write		= write_working ? coef_doutb_bram2 : coef_doutb_bram2_write;
                               
    assign coef_ena_bram3    =  (read_working)? coef_ena_bram3_read : (compu_working)? coef_ena_bram3_implement : write_working? coef_ena_bram3_write : 1'b0;
    assign coef_wea_bram3    =  (read_working)? coef_wea_bram3_read : (compu_working)? coef_wea_bram3_implement : write_working? coef_wea_bram3_write : 1'b0;
    assign coef_addra_bram3  =  (read_working)? coef_addra_bram3_read : (compu_working)? coef_addra_bram3_implement : write_working? coef_addra_bram3_write : 1'b0;
    assign coef_dina_bram3   =  (read_working)? coef_dina_bram3_read : (compu_working)? coef_dina_bram3_implement : 1'b0;
    assign coef_douta_bram3_implement	= compu_working ? coef_douta_bram3 : coef_douta_bram3_implement;
    assign coef_douta_bram3_write		= write_working ? coef_douta_bram3 : coef_douta_bram3_write;
                                
    assign coef_enb_bram3    =  (read_working)? coef_enb_bram3_read : (compu_working)? coef_enb_bram3_implement : write_working? coef_enb_bram3_write : 1'b0;
    assign coef_web_bram3    =  (read_working)? coef_web_bram3_read : (compu_working)? coef_web_bram3_implement : write_working? coef_web_bram3_write : 1'b0;
    assign coef_addrb_bram3  =  (read_working)? coef_addrb_bram3_read : (compu_working)? coef_addrb_bram3_implement : write_working? coef_addrb_bram3_write : 1'b0;
    assign coef_dinb_bram3   =  coef_dinb_bram3_read;
    assign coef_doutb_bram3_implement	= compu_working ? coef_doutb_bram3 : coef_doutb_bram3_implement;
    assign coef_doutb_bram3_write		= write_working ? coef_doutb_bram3 : coef_doutb_bram3_write;

    KAD_NTT_mem_read u_KAD_NTT_mem_read(
 		.clk				(clk					),
 		.aresetn			(aresetn				),
 		.module_start		(read_start				),
 		.read_working		(read_working			),
 		.Rm_tvalid			(Rm_tvalid				),
 		.Rm_tdata			(Rm_tdata				),
		.KAD_Mode			(KAD_Mode				),
		.Multi_Mode			(Multi_Mode				),

		.coef_ena_bram0		(coef_ena_bram0_read	),
		.coef_wea_bram0		(coef_wea_bram0_read	),
		.coef_addra_bram0	(coef_addra_bram0_read	),
		.coef_dina_bram0	(coef_dina_bram0_read	),
		.coef_enb_bram0		(coef_enb_bram0_read	),
		.coef_web_bram0		(coef_web_bram0_read	),
		.coef_addrb_bram0	(coef_addrb_bram0_read	),
		.coef_dinb_bram0	(coef_dinb_bram0_read	),       
		.coef_ena_bram1		(coef_ena_bram1_read	),
		.coef_wea_bram1		(coef_wea_bram1_read	),
		.coef_addra_bram1	(coef_addra_bram1_read	),
		.coef_dina_bram1	(coef_dina_bram1_read	),
		.coef_enb_bram1		(coef_enb_bram1_read	),
		.coef_web_bram1		(coef_web_bram1_read	),
		.coef_addrb_bram1	(coef_addrb_bram1_read	),
		.coef_dinb_bram1	(coef_dinb_bram1_read	),
		.coef_ena_bram2		(coef_ena_bram2_read	),
		.coef_wea_bram2		(coef_wea_bram2_read	),
		.coef_addra_bram2	(coef_addra_bram2_read	),
		.coef_dina_bram2	(coef_dina_bram2_read	),
		.coef_enb_bram2		(coef_enb_bram2_read	),
		.coef_web_bram2		(coef_web_bram2_read	),
		.coef_addrb_bram2	(coef_addrb_bram2_read	),
		.coef_dinb_bram2	(coef_dinb_bram2_read	),
		.coef_ena_bram3		(coef_ena_bram3_read	),
		.coef_wea_bram3		(coef_wea_bram3_read	),
		.coef_addra_bram3	(coef_addra_bram3_read	),
		.coef_dina_bram3	(coef_dina_bram3_read	),
		.coef_enb_bram3		(coef_enb_bram3_read	),
		.coef_web_bram3		(coef_web_bram3_read	),
		.coef_addrb_bram3	(coef_addrb_bram3_read	),
		.coef_dinb_bram3	(coef_dinb_bram3_read	),

		.module_done		(read_done				)
    );
    
    top_NTT u_top_NTT(
		.clk				(clk),
		.rst_n				(aresetn),
		.enable				(compu_working),
		.KAD_Mode			(KAD_Mode),
		.Multi_Mode			(Multi_Mode),
		.done_flag			(compute_done),
		.coef_ena_bram0		(coef_ena_bram0_implement),
		.coef_wea_bram0		(coef_wea_bram0_implement),
		.coef_addra_bram0	(coef_addra_bram0_implement),    
		.coef_dina_bram0	(coef_dina_bram0_implement),
		.coef_enb_bram0		(coef_enb_bram0_implement),
		.coef_web_bram0		(coef_web_bram0_implement),
		.coef_addrb_bram0	(coef_addrb_bram0_implement), 
		.coef_doutb_bram0	(coef_doutb_bram0_implement),
		.coef_ena_bram1		(coef_ena_bram1_implement),
		.coef_wea_bram1		(coef_wea_bram1_implement),
		.coef_addra_bram1	(coef_addra_bram1_implement),    
		.coef_dina_bram1	(coef_dina_bram1_implement),
		.coef_enb_bram1		(coef_enb_bram1_implement),
		.coef_addrb_bram1	(coef_addrb_bram1_implement),
		.coef_web_bram1		(coef_web_bram1_implement),
		.coef_doutb_bram1	(coef_doutb_bram1_implement),
		.coef_ena_bram2		(coef_ena_bram2_implement),
		.coef_wea_bram2		(coef_wea_bram2_implement),
		.coef_addra_bram2	(coef_addra_bram2_implement),    
		.coef_dina_bram2	(coef_dina_bram2_implement),
		.coef_enb_bram2		(coef_enb_bram2_implement),
		.coef_web_bram2		(coef_web_bram2_implement),
		.coef_addrb_bram2	(coef_addrb_bram2_implement),
		.coef_doutb_bram2	(coef_doutb_bram2_implement),
		.coef_ena_bram3		(coef_ena_bram3_implement),
		.coef_wea_bram3		(coef_wea_bram3_implement),
		.coef_addra_bram3	(coef_addra_bram3_implement),    
		.coef_dina_bram3	(coef_dina_bram3_implement),
		.coef_enb_bram3		(coef_enb_bram3_implement),
		.coef_web_bram3		(coef_web_bram3_implement),
		.coef_addrb_bram3	(coef_addrb_bram3_implement),
		.coef_doutb_bram3	(coef_doutb_bram3_implement)
	);
    
    KAD_NTT_mem_write u_KAD_NTT_mem_write(
		.clk				(clk),
        .aresetn			(aresetn),
		.module_start		(write_start),
		.Ws_tready			(Ws_tready),
		.Ws_tdata			(Ws_tdata),
		.Ws_tvalid			(Ws_tvalid),   
		.KAD_Mode			(KAD_Mode),
		.Multi_Mode			(Multi_Mode),
		
		.coef_ena_bram0		(coef_ena_bram0_write),
		.coef_wea_bram0		(coef_wea_bram0_write),
		.coef_addra_bram0	(coef_addra_bram0_write),    
		.coef_douta_bram0	(coef_douta_bram0_write),
		.coef_enb_bram0		(coef_enb_bram0_write),
		.coef_web_bram0		(coef_web_bram0_write),
		.coef_addrb_bram0	(coef_addrb_bram0_write), 
		.coef_doutb_bram0	(coef_doutb_bram0_write),
		.coef_ena_bram1		(coef_ena_bram1_write),
		.coef_wea_bram1		(coef_wea_bram1_write),
		.coef_addra_bram1	(coef_addra_bram1_write),    
		.coef_douta_bram1	(coef_douta_bram1_write),
		.coef_enb_bram1		(coef_enb_bram1_write),
		.coef_addrb_bram1	(coef_addrb_bram1_write),
		.coef_web_bram1		(coef_web_bram1_write),
		.coef_doutb_bram1	(coef_doutb_bram1_write),
		.coef_ena_bram2		(coef_ena_bram2_write),
		.coef_wea_bram2		(coef_wea_bram2_write),
		.coef_addra_bram2	(coef_addra_bram2_write),    
		.coef_douta_bram2	(coef_douta_bram2_write),
		.coef_enb_bram2		(coef_enb_bram2_write),
		.coef_web_bram2		(coef_web_bram2_write),
		.coef_addrb_bram2	(coef_addrb_bram2_write),
		.coef_doutb_bram2	(coef_doutb_bram2_write),
		.coef_ena_bram3		(coef_ena_bram3_write),
		.coef_wea_bram3		(coef_wea_bram3_write),
		.coef_addra_bram3	(coef_addra_bram3_write),    
		.coef_douta_bram3	(coef_douta_bram3_write),
		.coef_enb_bram3		(coef_enb_bram3_write),
		.coef_web_bram3		(coef_web_bram3_write),
		.coef_addrb_bram3	(coef_addrb_bram3_write),
		.coef_doutb_bram3	(coef_doutb_bram3_write),  
		
		.module_done		(write_done)
    );
    	
	(*DONT_TOUCH= "TRUE"*)
	bank64_KAD_NTT inst_bank0 (
	  .clka(clk),    // input wire clka
	  .ena(coef_ena_bram0),      // input wire ena
	  .wea(coef_wea_bram0),      // input wire [0 : 0] wea
	  .addra(coef_addra_bram0),  // input wire [5 : 0] addra
	  .dina(coef_dina_bram0),    // input wire [22 : 0] dina
	  .douta(coef_douta_bram0),    // output wire [22 : 0] dina
	  .clkb(clk),    // input wire clkb
	  .enb(coef_enb_bram0),      // input wire enb
	  .web(coef_web_bram0),      // input wire [0 : 0] wea
	  .addrb(coef_addrb_bram0),  // input wire [5 : 0] addrb
	  .dinb(coef_dinb_bram0),    // input wire [22 : 0] dina
	  .doutb(coef_doutb_bram0)  // output wire [22 : 0] doutb
	);
	(*DONT_TOUCH= "TRUE"*)
	bank64_KAD_NTT inst_bank1 (
	  .clka(clk),    // input wire clka
	  .ena(coef_ena_bram1),      // input wire ena
	  .wea(coef_wea_bram1),      // input wire [0 : 0] wea
	  .addra(coef_addra_bram1),  // input wire [5 : 0] addra
	  .dina(coef_dina_bram1),    // input wire [22 : 0] dina
	  .douta(coef_douta_bram1),    // output wire [22 : 0] dina
	  .clkb(clk),    // input wire clkb
	  .enb(coef_enb_bram1),      // input wire enb
	  .web(coef_web_bram1),      // input wire [0 : 0] wea
	  .addrb(coef_addrb_bram1),  // input wire [5 : 0] addrb
	  .dinb(coef_dinb_bram1),    // input wire [22 : 0] dina
	  .doutb(coef_doutb_bram1)  // output wire [22 : 0] doutb
	);
	(*DONT_TOUCH= "TRUE"*)
	bank64_KAD_NTT inst_bank2 (
	  .clka(clk),    // input wire clka
	  .ena(coef_ena_bram2),      // input wire ena
	  .wea(coef_wea_bram2),      // input wire [0 : 0] wea
	  .addra(coef_addra_bram2),  // input wire [5 : 0] addra
	  .dina(coef_dina_bram2),    // input wire [22 : 0] dina
	  .douta(coef_douta_bram2),    // output wire [22 : 0] dina
	  .clkb(clk),    // input wire clkb
	  .enb(coef_enb_bram2),      // input wire enb
	  .web(coef_web_bram2),      // input wire [0 : 0] wea
	  .addrb(coef_addrb_bram2),  // input wire [5 : 0] addrb
	  .dinb(coef_dinb_bram2),    // input wire [22 : 0] dina
	  .doutb(coef_doutb_bram2)  // output wire [22 : 0] doutb
	);
	(*DONT_TOUCH= "TRUE"*)
	bank64_KAD_NTT inst_bank3 (
	  .clka(clk),    // input wire clka
	  .ena(coef_ena_bram3),      // input wire ena
	  .wea(coef_wea_bram3),      // input wire [0 : 0] wea
	  .addra(coef_addra_bram3),  // input wire [5 : 0] addra
	  .dina(coef_dina_bram3),    // input wire [22 : 0] dina
	  .douta(coef_douta_bram3),    // output wire [22 : 0] dina
	  .clkb(clk),    // input wire clkb
	  .enb(coef_enb_bram3),      // input wire enb
	  .web(coef_web_bram3),      // input wire [0 : 0] wea
	  .addrb(coef_addrb_bram3),  // input wire [5 : 0] addrb
	  .dinb(coef_dinb_bram3),    // input wire [22 : 0] dina
	  .doutb(coef_doutb_bram3)  // output wire [22 : 0] doutb
	);

endmodule
