`timescale 1ns / 1ps

module SHA3_permutation(
    input                               clk_in,
    input                               reset_in,
    input   [2:0]                       mode_in,
    input   [1343:0]                    data_in,
    input                               dvld_in,
    input                               finish_in,
    input                               sha_hold,
    input                               squeeze, // 新增：挤压控制信号
    output                              ack_out,
    output  [1343:0]                    result_out,
    output                              rvld_out


);

    localparam SHA3_224     = 3'b000;
    localparam SHA3_256     = 3'b001;
    localparam SHA3_384     = 3'b010;
    localparam SHA3_512     = 3'b011;
    localparam SHAKE128     = 3'b100;
    localparam SHAKE256     = 3'b101;

    localparam SHA3_224_PADDING_NUM  = (1600 - 224 * 2) / 64;
    localparam SHA3_256_PADDING_NUM  = (1600 - 256 * 2) / 64;
    localparam SHA3_384_PADDING_NUM  = (1600 - 384 * 2) / 64;
    localparam SHA3_512_PADDING_NUM  = (1600 - 512 * 2) / 64;
    localparam SHAKE128_PADDING_NUM  = (1600 - 128 * 2) / 64;
    localparam SHAKE256_PADDING_NUM  = (1600 - 256 * 2) / 64;

    localparam rr1     = 64'h8000000000008080;
    localparam rr2     = 64'h0000000080000001;
    localparam rr3     = 64'h8000000080008008;

    wire       [63:0]   rc1, rc2, rc3;
    //reg        [63:0]   rc1_reg1, rc2_reg1, rc3_reg1;
    wire       [63:0]   rc1_reg1, rc2_reg1, rc3_reg1;
    reg        [63:0]   rc1_reg2, rc2_reg2, rc3_reg2;
    reg        [63:0]   rc1_reg3, rc2_reg3, rc3_reg3;
    reg        [63:0]   rc1_reg4, rc2_reg4, rc3_reg4;
    reg        [63:0]   rc1_reg5, rc2_reg5, rc3_reg5;
    reg        [63:0]   rc1_reg6, rc2_reg6, rc3_reg6;
    reg        [63:0]   rc1_reg7, rc2_reg7, rc3_reg7;
    reg        [63:0]   rc1_reg8, rc2_reg8, rc3_reg8;
    wire       [63:0]   rc1_reg , rc2_reg , rc3_reg;

    wire       [1599:0] round_in, round_out;
    reg        [14:0]    i;
    reg        [1599:0] dreg;
    reg                 dvld;
    reg        [1599:0] rreg;
    reg                 rvld;
    reg                 calc;
    reg                 in_squeeze; // 新增：跟踪挤压状态



    assign accept = dvld & (~calc);
    assign update = calc | accept | (squeeze & in_squeeze); // 修改：支持挤压阶段更新
    assign result_out = rreg[1599:1599-1343];
    assign rvld_out = rvld;
    assign round_in = accept ? dreg : rreg;
    assign ack_out = accept;

    assign rc1_reg1 = rc1;
    assign rc2_reg1 = rc2;
    assign rc3_reg1 = rc3;

    assign rc1_reg = (i == 15'b000_0000_0000_0000) ? rc1_reg1 :
                     (i == 15'b000_0000_0000_0001) ? rc1_reg2 :
                     (i == 15'b000_0000_0000_0010) ? rc1_reg2 :
                     (i == 15'b000_0000_0000_0100) ? rc1_reg3 :
                     (i == 15'b000_0000_0000_1000) ? rc1_reg3 : 
                     (i == 15'b000_0000_0001_0000) ? rc1_reg4 : 
                     (i == 15'b000_0000_0010_0000) ? rc1_reg4 :
                     (i == 15'b000_0000_0100_0000) ? rc1_reg5 :
                     (i == 15'b000_0000_1000_0000) ? rc1_reg5 :
                     (i == 15'b000_0001_0000_0000) ? rc1_reg6 :
                     (i == 15'b000_0010_0000_0000) ? rc1_reg6 : 
                     (i == 15'b000_0100_0000_0000) ? rc1_reg7 :
                     (i == 15'b000_1000_0000_0000) ? rc1_reg7 : 
                     (i == 15'b001_0000_0000_0000) ? rc1_reg8 :
                     (i == 15'b010_0000_0000_0000) ? rc1_reg8 : 
                     (i == 15'b100_0000_0000_0000) ? rr1 : 
                     64'b0; // 默认值，避免锁存器

    assign rc2_reg = (i == 15'b000_0000_0000_0000) ? rc2_reg1 :
                     (i == 15'b000_0000_0000_0001) ? rc2_reg2 :
                     (i == 15'b000_0000_0000_0010) ? rc2_reg2 :
                     (i == 15'b000_0000_0000_0100) ? rc2_reg3 :
                     (i == 15'b000_0000_0000_1000) ? rc2_reg3 : 
                     (i == 15'b000_0000_0001_0000) ? rc2_reg4 : 
                     (i == 15'b000_0000_0010_0000) ? rc2_reg4 :
                     (i == 15'b000_0000_0100_0000) ? rc2_reg5 :
                     (i == 15'b000_0000_1000_0000) ? rc2_reg5 :
                     (i == 15'b000_0001_0000_0000) ? rc2_reg6 :
                     (i == 15'b000_0010_0000_0000) ? rc2_reg6 : 
                     (i == 15'b000_0100_0000_0000) ? rc2_reg7 :
                     (i == 15'b000_1000_0000_0000) ? rc2_reg7 : 
                     (i == 15'b001_0000_0000_0000) ? rc2_reg8 :
                     (i == 15'b010_0000_0000_0000) ? rc2_reg8 : 
                     (i == 15'b100_0000_0000_0000) ? rr2 : 
                     64'b0; // 默认值，避免锁存器

    assign rc3_reg = (i == 15'b000_0000_0000_0000) ? rc3_reg1 :
                     (i == 15'b000_0000_0000_0001) ? rc3_reg2 :
                     (i == 15'b000_0000_0000_0010) ? rc3_reg2 :
                     (i == 15'b000_0000_0000_0100) ? rc3_reg3 :
                     (i == 15'b000_0000_0000_1000) ? rc3_reg3 : 
                     (i == 15'b000_0000_0001_0000) ? rc3_reg4 : 
                     (i == 15'b000_0000_0010_0000) ? rc3_reg4 :
                     (i == 15'b000_0000_0100_0000) ? rc3_reg5 :
                     (i == 15'b000_0000_1000_0000) ? rc3_reg5 :
                     (i == 15'b000_0001_0000_0000) ? rc3_reg6 :
                     (i == 15'b000_0010_0000_0000) ? rc3_reg6 : 
                     (i == 15'b000_0100_0000_0000) ? rc3_reg7 :
                     (i == 15'b000_1000_0000_0000) ? rc3_reg7 : 
                     (i == 15'b001_0000_0000_0000) ? rc3_reg8 :
                     (i == 15'b010_0000_0000_0000) ? rc3_reg8 : 
                     (i == 15'b100_0000_0000_0000) ? rr3 : 
                     64'b0; // 默认值，避免锁存器

    always @(posedge clk_in)begin
        if(reset_in)begin
            // rc1_reg1 <= 0;
            // rc2_reg1 <= 0;
            // rc3_reg1 <= 0;

            rc1_reg2 <= 0;
            rc2_reg2 <= 0;
            rc3_reg2 <= 0;

            rc1_reg3 <= 0;
            rc2_reg3 <= 0;
            rc3_reg3 <= 0;

            rc1_reg4 <= 0;
            rc2_reg4 <= 0;
            rc3_reg4 <= 0;

            rc1_reg5 <= 0;
            rc2_reg5 <= 0;
            rc3_reg5 <= 0;

            rc1_reg6 <= 0;
            rc2_reg6 <= 0;
            rc3_reg6 <= 0;

            rc1_reg7 <= 0;
            rc2_reg7 <= 0;
            rc3_reg7 <= 0;

            rc1_reg8 <= 0;
            rc2_reg8 <= 0;
            rc3_reg8 <= 0;
        end

        else if(sha_hold)begin
            // rc1_reg1 <= rc1_reg1;
            // rc2_reg1 <= rc2_reg1;
            // rc3_reg1 <= rc3_reg1;

            rc1_reg2 <= rc1_reg2;
            rc2_reg2 <= rc2_reg2;
            rc3_reg2 <= rc3_reg2;

            rc1_reg3 <= rc1_reg3;
            rc2_reg3 <= rc2_reg3;
            rc3_reg3 <= rc3_reg3;

            rc1_reg4 <= rc1_reg4;
            rc2_reg4 <= rc2_reg4;
            rc3_reg4 <= rc3_reg4;

            rc1_reg5 <= rc1_reg5;
            rc2_reg5 <= rc2_reg5;
            rc3_reg5 <= rc3_reg5;

            rc1_reg6 <= rc1_reg6;
            rc2_reg6 <= rc2_reg6;
            rc3_reg6 <= rc3_reg6;

            rc1_reg7 <= rc1_reg7;
            rc2_reg7 <= rc2_reg7;
            rc3_reg7 <= rc3_reg7;

            rc1_reg8 <= rc1_reg8;
            rc2_reg8 <= rc2_reg8;
            rc3_reg8 <= rc3_reg8;
        end

        else begin 
            // rc1_reg1 <= rc1;
            // rc2_reg1 <= rc2;
            // rc3_reg1 <= rc3;

            rc1_reg2 <= rc1_reg1;
            rc2_reg2 <= rc2_reg1;
            rc3_reg2 <= rc3_reg1;

            rc1_reg3 <= rc1_reg2;
            rc2_reg3 <= rc2_reg2;
            rc3_reg3 <= rc3_reg2;

            rc1_reg4 <= rc1_reg3;
            rc2_reg4 <= rc2_reg3;
            rc3_reg4 <= rc3_reg3;

            rc1_reg5 <= rc1_reg4;
            rc2_reg5 <= rc2_reg4;
            rc3_reg5 <= rc3_reg4;

            rc1_reg6 <= rc1_reg5;
            rc2_reg6 <= rc2_reg5;
            rc3_reg6 <= rc3_reg5;

            rc1_reg7 <= rc1_reg6;
            rc2_reg7 <= rc2_reg6;
            rc3_reg7 <= rc3_reg6;

            rc1_reg8 <= rc1_reg7;
            rc2_reg8 <= rc2_reg7;
            rc3_reg8 <= rc3_reg7;


    end
    end


    always @(posedge clk_in) begin
        if (reset_in)
            dreg <= 0;
        else if (dvld_in) begin
            case (mode_in)
                SHA3_224:   dreg = {data_in[1151:0] ^ rreg[1599:1599-1151], rreg[1599-1152:0]};
                SHA3_256:   dreg = {data_in[1087:0] ^ rreg[1599:1599-1087], rreg[1599-1088:0]};
                SHA3_384:   dreg = {data_in[831:0]  ^ rreg[1599:1599-831],  rreg[1599-832:0]};
                SHA3_512:   dreg = {data_in[575:0]  ^ rreg[1599:1599-575],  rreg[1599-576:0]};
                SHAKE128:   dreg = {data_in[1343:0] ^ rreg[1599:1599-1343], rreg[1599-1344:0]};
                SHAKE256:   dreg = {data_in[1087:0] ^ rreg[1599:1599-1087], rreg[1599-1088:0]};
                default:    dreg = 0;
            endcase
        end
        else dreg <= dreg;
    end

    always @(posedge clk_in) begin
        if (reset_in)
            dvld <= 0;
        else
            dvld <= dvld_in;
    end

    // 新增：挤压状态控制
    always @(posedge clk_in) begin
        if (reset_in)
            in_squeeze <= 0;
        else if (mode_in == SHA3_224 || mode_in == SHA3_256 || 
                 mode_in == SHA3_384 || mode_in == SHA3_512)
            in_squeeze <= 0; // SHA3模式禁用挤压
        else if (squeeze && rvld && finish_in) // 启动挤压（SHAKE模式）
            in_squeeze <= 1;
        else 
            in_squeeze <= 0;
    end

    always @(posedge clk_in) begin
        if (reset_in)
            i <= 0;
        else if (sha_hold) 
            i <= i;
        else if (in_squeeze)
            i <= {i[13:0], in_squeeze};
        else
            i <= {i[13:0], accept};
    end


    always @(posedge clk_in) begin
        if (reset_in)
            calc <= 0;
        else if (sha_hold) 
            calc <= calc;
        else if (accept || in_squeeze)
            calc <= 1;
        else if (i[14])
            calc <= 0;
    end


always @(posedge clk_in) begin
        if (reset_in)
            rvld <= 0;
        else if (sha_hold) 
            rvld <= rvld;
        else if (accept || finish_in)
            rvld <= 0;
        else if (i[14])
            rvld <= 1;
    end

    always @(posedge clk_in)
 begin
        if (reset_in)
            rreg <= 0;
        else if (finish_in && in_squeeze)
            rreg <= 0;
        else if (update && ~(sha_hold)) 
            rreg <= round_out;
        else
            rreg <= rreg;
    end

    rconst3in1 rconst_ ({i, accept || in_squeeze}, rc1, rc2, rc3);
    round3in1 round_ (clk_in, reset_in, round_in, rc1_reg, rc2_reg, rc3_reg, round_out);

endmodule

