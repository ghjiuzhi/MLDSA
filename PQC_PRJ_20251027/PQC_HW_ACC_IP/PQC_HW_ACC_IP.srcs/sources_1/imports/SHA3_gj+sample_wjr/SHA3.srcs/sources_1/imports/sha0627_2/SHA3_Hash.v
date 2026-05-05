`timescale 1ns / 1ps
`define low_pos(w,b)      ((w)*64 + (b)*8)
`define low_pos2(w,b)     `low_pos(w,7-b)
`define high_pos(w,b)     (`low_pos(w,b) + 7)
`define high_pos2(w,b)    (`low_pos2(w,b) + 7)

module SHA3_Hash#(
    parameter RDLY_CCNUM = 1
)(
    input                               clk_in,
    input                               reset_in,
    input   [2:0]                       mode_in,    // 000/001/010/011/100/101: sha3-224/256/384/512/shake128/shake256
    input                               sha_hold,
    input   [63:0]                      data_in,
    input                               dvld_in,
    input                               dlast_in,
    input   [2:0]                       byte_num_in,
    input                               squeeze,    // 新增：控制挤压阶段的信号
    output  [1343:0]                    result_out,
    output reg                          rvld_out

);

    localparam SHA3_224 = 3'b000;
    localparam SHA3_256 = 3'b001;
    localparam SHA3_384 = 3'b010;
    localparam SHA3_512 = 3'b011;
    localparam SHAKE128 = 3'b100;
    localparam SHAKE256 = 3'b101;

    reg                 state;
    reg                 in_squeeze;  // 新增：跟踪挤压状�?
    wire [1343:0]       padder_data;
    wire [1343:0]       padder_data_reorder;
    wire                padder_dvld;
    wire                perm_ack;
    wire [1343:0]       perm_data;
    wire [1343:0]       perm_data_reorder;
    wire                perm_dvld;
    wire                finish;

    reg                 sha_hold_reg1;
    reg                 sha_hold_reg2;
    reg                 sha_hold_reg3;

    // reg                 dlvd_in_reg;
    // reg   [255:0]       data_in_buf;

    reg  [14+RDLY_CCNUM:0] i;
    genvar w, b;

    assign finish = i[14+RDLY_CCNUM];

    // always @ (posedge clk_in) begin
    //     if(reset_in)
    //         data_in_buf <= 256'h0;        
    //     else if(dvld_in) 
    //         data_in_buf <= {data_in_buf[256-64:0], data_in};
    // end

    always @(posedge clk_in) begin
        if (reset_in)begin
            sha_hold_reg1 <= 1'b0; 
            sha_hold_reg2 <= 1'b0;
            sha_hold_reg3 <= 1'b0;
        end
        else begin
            sha_hold_reg1 <= sha_hold;
            sha_hold_reg2 <= sha_hold_reg1;
            sha_hold_reg3 <= sha_hold_reg2;
        end
    end

    always @(posedge clk_in) begin
        if (reset_in)
            i <= 0;
        else if(sha_hold_reg3)
            i <= i;
        else
            i <= {i[13+RDLY_CCNUM:0], (state & perm_ack) || in_squeeze};
    end

    always @(posedge clk_in) begin
        if (reset_in)
            state <= 0;
        else if (finish)
            state <= 0;
        else if (dlast_in)
            state <= 1;
    end


    always @(posedge clk_in) begin
        if (reset_in)
            in_squeeze <= 0;
        else if (mode_in == SHA3_224 || mode_in == SHA3_256 || 
                 mode_in == SHA3_384 || mode_in == SHA3_512)
            in_squeeze <= 0;
        else if (squeeze && perm_dvld && finish)
            in_squeeze <= 1;
        else
            in_squeeze <= 0;
    end

    always @(posedge clk_in) begin
        if (reset_in)
            rvld_out <= 0;
        else if (finish)
            rvld_out <= 0;
        else if (i[14])
            rvld_out <= 1; // 支持挤压阶段的多次输�?
    end

    /* reorder byte */
    generate
        for (w = 0; w < 21; w = w + 1) begin : L2
            for (b = 0; b < 8; b = b + 1) begin : L3
                assign padder_data_reorder[`high_pos(w,b):`low_pos(w,b)] = 
                       padder_data[`high_pos2(w,b):`low_pos2(w,b)];
            end
        end
    endgenerate

    generate
        for (w = 0; w < 21; w = w + 1) begin : L0
            for (b = 0; b < 8; b = b + 1) begin : L1
                assign perm_data_reorder[`high_pos(w,b):`low_pos(w,b)] = 
                       perm_data[`high_pos2(w,b):`low_pos2(w,b)];
            end
        end
    endgenerate

    assign result_out = perm_data_reorder;

    SHA3_padder padder_ (
        .clk_in(clk_in),
        .reset_in(reset_in),
        .mode_in(mode_in),
        .data_in(data_in),
        .dvld_in(dvld_in),
        .dlast_in(dlast_in),
        .byte_num_in(byte_num_in),
        .result_out(padder_data),
        .rvld_out(padder_dvld)
    );

    SHA3_permutation permutation_ (
        .clk_in(clk_in),
        .reset_in(reset_in),
        .mode_in(mode_in),
        .data_in(padder_data_reorder),
        .dvld_in(padder_dvld),
        .sha_hold(sha_hold_reg3),
        .finish_in(finish),
        .squeeze(squeeze), // 新增：传递squeeze信号
        .ack_out(perm_ack),
        .result_out(perm_data),
        .rvld_out(perm_dvld)

    );

endmodule

`undef low_pos
`undef low_pos2
`undef high_pos
`undef high_pos2