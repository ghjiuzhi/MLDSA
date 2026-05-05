`timescale 1ns / 1ps

module SHA3_padder(
        input                               clk_in,
        input                               reset_in,

        input   [2:0]                       mode_in,
        input   [63:0]                      data_in,
        input                               dvld_in,
        input                               dlast_in,
        input   [2:0]                       byte_num_in,

        output  [1343:0]                    result_out,     //support sha3-224/256/384/512
        output                              rvld_out
    );
//-----------------------------------------------------------------------------
// Local Parameters
//-----------------------------------------------------------------------------

localparam SHA3_224     = 3'b000;
localparam SHA3_256     = 3'b001;
localparam SHA3_384     = 3'b010;
localparam SHA3_512     = 3'b011;
localparam SHAKE128     = 3'b100;
localparam SHAKE256     = 3'b101;


localparam SHA3_224_PADDING_NUM   = (1600 - 224 * 2) / 64;
localparam SHA3_256_PADDING_NUM   = (1600 - 256 * 2) / 64;
localparam SHA3_384_PADDING_NUM   = (1600 - 384 * 2) / 64;
localparam SHA3_512_PADDING_NUM   = (1600 - 512 * 2) / 64;
localparam SHAKE128_PADDING_NUM   = (1600 - 128 * 2) / 64;
localparam SHAKE256_PADDING_NUM   = (1600 - 256 * 2) / 64;


//-----------------------------------------------------------------------------
// Signals and regs
//-----------------------------------------------------------------------------
reg  [1343:0]                       padding_buffer;
wire [63:0]                         v0;
reg  [63:0]                         v1;
reg  [12:0]                         dcnt;
reg  [4:0]                          padding_num;
wire                                accept;
wire                                update;
wire                                pad_eof_en;
reg                                 padderdone;
reg                                 state;          /* state == 0: user will send more input data
                                                     * state == 1: user will not send any data */   


//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Logics
//-----------------------------------------------------------------------------
assign rvld_out = (dcnt == padding_num);
assign pad_eof_en = (dcnt > padding_num - 2);

assign accept = (~ state) & dvld_in; // if state == 1, do not eat input
assign update = (accept | (state & (~ rvld_out))) & (~ padderdone); // don't fill buffer if done
assign result_out = padding_buffer;


always @ (posedge clk_in)
    if(reset_in)                padderdone  <=  1'b0;
    else if(padderdone)         padderdone  <=  1'b0;
    else if(state & rvld_out)   padderdone  <=  1'b1;

always @ (posedge clk_in) 
    if(reset_in)        state   <=  1'b0;
    else if(padderdone) state   <=  1'b0;
    else if(dlast_in)   state   <=  1'b1;


always @ (*) begin
    case(mode_in)
        SHA3_224:   padding_num = SHA3_224_PADDING_NUM;
        SHA3_256:   padding_num = SHA3_256_PADDING_NUM;
        SHA3_384:   padding_num = SHA3_384_PADDING_NUM;
        SHA3_512:   padding_num = SHA3_512_PADDING_NUM;
        SHAKE128:   padding_num = SHAKE128_PADDING_NUM;
        SHAKE256:   padding_num = SHAKE256_PADDING_NUM;
    default:        padding_num = SHA3_256_PADDING_NUM;
    endcase
end

always @ (posedge clk_in) begin
    if(reset_in)
        dcnt    <=  13'd0;    
    else if(update) begin
        if(rvld_out)    dcnt    <=  13'd1;
        else            dcnt    <=  dcnt + 1'b1;
    end
    else if(rvld_out)
        dcnt    <=  13'd0;
end



always @ (posedge clk_in) begin
    if(reset_in)
        padding_buffer <= 1152'h0;        
    else if(update) 
        padding_buffer <= {padding_buffer[1344-64:0], v1};
end



always @ (*) begin
    if (state) begin
        v1 = 0;
        v1[7] = v1[7] | pad_eof_en;
    end
    else if (dlast_in == 0)
        v1 = data_in;
    else begin
        v1 = v0;
        v1[7] = v1[7] | pad_eof_en;
    end
end



//-----------------------------------------------------------------------------
//end of Logics
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Underlying Caculation Modules
//-----------------------------------------------------------------------------
    padder1 p0 (data_in, byte_num_in, mode_in, v0);
    

//-----------------------------------------------------------------------------
//end of Underlying Caculation Modules
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------


endmodule
