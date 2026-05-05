
    /* calc "dd == rho(cc)" */
    // always @(posedge clk_in) begin
    //     if (reset_in) begin
    //         // Reset all ddd registers to zero
    //         dd[0][0] <= 64'b0; dd[1][0] <= 64'b0; dd[2][0] <= 64'b0; dd[3][0] <= 64'b0; dd[4][0] <= 0;
    //         dd[0][1] <= 64'b0; dd[1][1] <= 64'b0; dd[2][1] <= 64'b0; dd[3][1] <= 64'b0; dd[4][1] <= 0;
    //         dd[0][2] <= 64'b0; dd[1][2] <= 64'b0; dd[2][2] <= 64'b0; dd[3][2] <= 64'b0; dd[4][2] <= 0;
    //         dd[0][3] <= 64'b0; dd[1][3] <= 64'b0; dd[2][3] <= 64'b0; dd[3][3] <= 64'b0; dd[4][3] <= 0;
    //         dd[0][4] <= 64'b0; dd[1][4] <= 64'b0; dd[2][4] <= 64'b0; dd[3][4] <= 64'b0; dd[4][4] <= 0;
    //     end else begin
    //         dd[0][0] <= cc[0][0];
    //         dd[1][0] <= `rot_up_1(cc[1][0]);
    //         dd[2][0] <= `rot_up(cc[2][0], 62);
    //         dd[3][0] <= `rot_up(cc[3][0], 28);
    //         dd[4][0] <= `rot_up(cc[4][0], 27);
    //         dd[0][1] <= `rot_up(cc[0][1], 36);
    //         dd[1][1] <= `rot_up(cc[1][1], 44);
    //         dd[2][1] <= `rot_up(cc[2][1], 6);
    //         dd[3][1] <= `rot_up(cc[3][1], 55);
    //         dd[4][1] <= `rot_up(cc[4][1], 20);
    //         dd[0][2] <= `rot_up(cc[0][2], 3);
    //         dd[1][2] <= `rot_up(cc[1][2], 10);
    //         dd[2][2] <= `rot_up(cc[2][2], 43);
    //         dd[3][2] <= `rot_up(cc[3][2], 25);
    //         dd[4][2] <= `rot_up(cc[4][2], 39);
    //         dd[0][3] <= `rot_up(cc[0][3], 41);
    //         dd[1][3] <= `rot_up(cc[1][3], 45);
    //         dd[2][3] <= `rot_up(cc[2][3], 15);
    //         dd[3][3] <= `rot_up(cc[3][3], 21);
    //         dd[4][3] <= `rot_up(cc[4][3], 8);
    //         dd[0][4] <= `rot_up(cc[0][4], 18);
    //         dd[1][4] <= `rot_up(cc[1][4], 2);
    //         dd[2][4] <= `rot_up(cc[2][4], 61);
    //         dd[3][4] <= `rot_up(cc[3][4], 56);
    //         dd[4][4] <= `rot_up(cc[4][4], 14);
    //     end
    // end

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: round3in1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define low_pos(x,y)        `high_pos(x,y) - 63
`define high_pos(x,y)       1599 - 64*(5*y+x)
`define add_1(x)            (x == 4 ? 0 : x + 1)
`define add_2(x)            (x == 3 ? 0 : x == 4 ? 1 : x + 2)
`define sub_1(x)            (x == 0 ? 4 : x - 1)
`define rot_up(in, n)       {in[63-n:0], in[63:63-n+1]}
`define rot_up_1(in)        {in[62:0], in[63]}

module round3in1(clk_in, reset_in, in, round_const_1, round_const_2, round_const_3, out);
    input   clk_in;
    input   reset_in;
    input  [1599:0] in;
    input  [63:0]   round_const_1, round_const_2, round_const_3;
    output [1599:0] out;

    /* "a ~ g" for round 1 */
    (* dont_touch="true" *) wire   [63:0]   a[4:0][4:0];
    (* dont_touch="true" *) wire   [63:0]   b[4:0];
    wire    [63:0]   e[4:0][4:0]; // 将 wire 改为 reg
    (* dont_touch="true" *) wire   [63:0]   c[4:0][4:0], d[4:0][4:0], f[4:0][4:0], g[4:0][4:0];

    /* "aa ~ gg" for round 2 */
    (* dont_touch="true" *) wire   [63:0]   bb[4:0];
    wire [63:0]  dd[4:0][4:0];
    reg  [63:0]  ee[4:0][4:0];
    (* dont_touch="true" *) wire   [63:0]   cc[4:0][4:0], ff[4:0][4:0], gg[4:0][4:0];

    (* dont_touch="true" *) wire   [63:0]   bbb[4:0];
    (* dont_touch="true" *) wire   [63:0]   ccc[4:0][4:0], ddd[4:0][4:0], eee[4:0][4:0], fff[4:0][4:0], ggg[4:0][4:0];


    genvar x, y;

    /* assign "a[x][y][z] == in[w(5y+x)+z]" */
    generate
      for(y=0; y<5; y=y+1)
        begin : L0
          for(x=0; x<5; x=x+1)
            begin : L1
              assign a[x][y] = in[`high_pos(x,y) : `low_pos(x,y)];
            end
        end
    endgenerate

    /* calc "b[x] == a[x][0] ^ a[x][1] ^ ... ^ a[x][4]" */
    generate
      for(x=0; x<5; x=x+1)
        begin : L2
          assign b[x] = a[x][0] ^ a[x][1] ^ a[x][2] ^ a[x][3] ^ a[x][4];
        end
    endgenerate

    /* calc "c == theta(a)" */
    // generate
    //   for(y=0; y<5; y=y+1)
    //     begin : L3
    //       for(x=0; x<5; x=x+1)
    //         begin : L4
    //           assign c[x][y] = a[x][y] ^ b[`sub_1(x)] ^ `rot_up_1(b[`add_1(x)]);
            // assign c[x][y] = a[x][y];
    (* dont_touch="true" *) wire [63:0]     b0,b1,b2,b3,b4;
    assign b0 = b[4] ^ {b[1][62:0],b[1][63]};
    assign b1 = b[0] ^ {b[2][62:0],b[2][63]};
    assign b2 = b[1] ^ {b[3][62:0],b[3][63]};
    assign b3 = b[2] ^ {b[4][62:0],b[4][63]};
    assign b4 = b[3] ^ {b[0][62:0],b[0][63]};
            assign c[0][0] = a[0][0] ^ b0;
            assign c[1][0] = a[1][0] ^ b1;
            assign c[2][0] = a[2][0] ^ b2;
            assign c[3][0] = a[3][0] ^ b3;
            assign c[4][0] = a[4][0] ^ b4;

            assign c[0][1] = a[0][1] ^ b0;
            assign c[1][1] = a[1][1] ^ b1;
            assign c[2][1] = a[2][1] ^ b2;
            assign c[3][1] = a[3][1] ^ b3;
            assign c[4][1] = a[4][1] ^ b4;

            assign c[0][2] = a[0][2] ^ b0;
            assign c[1][2] = a[1][2] ^ b1;
            assign c[2][2] = a[2][2] ^ b2;
            assign c[3][2] = a[3][2] ^ b3;
            assign c[4][2] = a[4][2] ^ b4;

            assign c[0][3] = a[0][3] ^ b0;
            assign c[1][3] = a[1][3] ^ b1;
            assign c[2][3] = a[2][3] ^ b2;
            assign c[3][3] = a[3][3] ^ b3;
            assign c[4][3] = a[4][3] ^ b4;

            assign c[0][4] = a[0][4] ^ b0;
            assign c[1][4] = a[1][4] ^ b1;
            assign c[2][4] = a[2][4] ^ b2;
            assign c[3][4] = a[3][4] ^ b3;
            assign c[4][4] = a[4][4] ^ b4;
    //         end
    //     end
    // endgenerate

    /* calc "d == rho(c)" */
    assign d[0][0] = c[0][0];
    assign d[1][0] = `rot_up_1(c[1][0]);
    assign d[2][0] = `rot_up(c[2][0], 62);
    assign d[3][0] = `rot_up(c[3][0], 28);
    assign d[4][0] = `rot_up(c[4][0], 27);
    assign d[0][1] = `rot_up(c[0][1], 36);
    assign d[1][1] = `rot_up(c[1][1], 44);
    assign d[2][1] = `rot_up(c[2][1], 6);
    assign d[3][1] = `rot_up(c[3][1], 55);
    assign d[4][1] = `rot_up(c[4][1], 20);
    assign d[0][2] = `rot_up(c[0][2], 3);
    assign d[1][2] = `rot_up(c[1][2], 10);
    assign d[2][2] = `rot_up(c[2][2], 43);
    assign d[3][2] = `rot_up(c[3][2], 25);
    assign d[4][2] = `rot_up(c[4][2], 39);
    assign d[0][3] = `rot_up(c[0][3], 41);
    assign d[1][3] = `rot_up(c[1][3], 45);
    assign d[2][3] = `rot_up(c[2][3], 15);
    assign d[3][3] = `rot_up(c[3][3], 21);
    assign d[4][3] = `rot_up(c[4][3], 8);
    assign d[0][4] = `rot_up(c[0][4], 18);
    assign d[1][4] = `rot_up(c[1][4], 2);
    assign d[2][4] = `rot_up(c[2][4], 61);
    assign d[3][4] = `rot_up(c[3][4], 56);
    assign d[4][4] = `rot_up(c[4][4], 14);

    /* calc "e == pi(d)" */
    assign e[0][0] = d[0][0];
    assign e[0][2] = d[1][0];
    assign e[0][4] = d[2][0];
    assign e[0][1] = d[3][0];
    assign e[0][3] = d[4][0];
    assign e[1][3] = d[0][1];
    assign e[1][0] = d[1][1];
    assign e[1][2] = d[2][1];
    assign e[1][4] = d[3][1];
    assign e[1][1] = d[4][1];
    assign e[2][1] = d[0][2];
    assign e[2][3] = d[1][2];
    assign e[2][0] = d[2][2];
    assign e[2][2] = d[3][2];
    assign e[2][4] = d[4][2];
    assign e[3][4] = d[0][3];
    assign e[3][1] = d[1][3];
    assign e[3][3] = d[2][3];
    assign e[3][0] = d[3][3];
    assign e[3][2] = d[4][3];
    assign e[4][2] = d[0][4];
    assign e[4][4] = d[1][4];
    assign e[4][1] = d[2][4];
    assign e[4][3] = d[3][4];
    assign e[4][0] = d[4][4];
    // always @(posedge clk_in) begin
    //     if (reset_in) begin
    //         e[0][0] <= 0;
    //         e[0][2] <= 0;
    //         e[0][4] <= 0;
    //         e[0][1] <= 0;
    //         e[0][3] <= 0;
    //         e[1][3] <= 0;
    //         e[1][0] <= 0;
    //         e[1][2] <= 0;
    //         e[1][4] <= 0;
    //         e[1][1] <= 0;
    //         e[2][1] <= 0;
    //         e[2][3] <= 0;
    //         e[2][0] <= 0;
    //         e[2][2] <= 0;
    //         e[2][4] <= 0;
    //         e[3][4] <= 0;
    //         e[3][1] <= 0;
    //         e[3][3] <= 0;
    //         e[3][0] <= 0;
    //         e[3][2] <= 0;
    //         e[4][2] <= 0;
    //         e[4][4] <= 0;
    //         e[4][1] <= 0;
    //         e[4][3] <= 0;
    //         e[4][0] <= 0;
    //         end
    //    else begin
    //         e[0][0] <= d[0][0];
    //         e[0][2] <= d[1][0];
    //         e[0][4] <= d[2][0];
    //         e[0][1] <= d[3][0];
    //         e[0][3] <= d[4][0];
    //         e[1][3] <= d[0][1];
    //         e[1][0] <= d[1][1];
    //         e[1][2] <= d[2][1];
    //         e[1][4] <= d[3][1];
    //         e[1][1] <= d[4][1];
    //         e[2][1] <= d[0][2];
    //         e[2][3] <= d[1][2];
    //         e[2][0] <= d[2][2];
    //         e[2][2] <= d[3][2];
    //         e[2][4] <= d[4][2];
    //         e[3][4] <= d[0][3];
    //         e[3][1] <= d[1][3];
    //         e[3][3] <= d[2][3];
    //         e[3][0] <= d[3][3];
    //         e[3][2] <= d[4][3];
    //         e[4][2] <= d[0][4];
    //         e[4][4] <= d[1][4];
    //         e[4][1] <= d[2][4];
    //         e[4][3] <= d[3][4];
    //         e[4][0] <= d[4][4];
    //     end
    // end

    /* calc "f = chi(e)" */
    generate
      for(y=0; y<5; y=y+1)
        begin : L5
          for(x=0; x<5; x=x+1)
            begin : L6
              assign f[x][y] = e[x][y] ^ ((~ e[`add_1(x)][y]) & e[`add_2(x)][y]);
            // assign f[x][y] = e[x][y];
            end
        end
    endgenerate

    /* calc "g = iota(f)" */
    generate
      for(x=0; x<64; x=x+1)
        begin : L60
          if(x==0 || x==1 || x==3 || x==7 || x==15 || x==31 || x==63)
            assign g[0][0][x] = f[0][0][x] ^ round_const_1[x];
          else
            assign g[0][0][x] = f[0][0][x];
        end
    endgenerate
    
    generate
      for(y=0; y<5; y=y+1)
        begin : L7
          for(x=0; x<5; x=x+1)
            begin : L8
              if(x!=0 || y!=0)
                assign g[x][y] = f[x][y];
            end
        end
    endgenerate

    /* round 2 */

    /* calc "bb[x] == g[x][0] ^ g[x][1] ^ ... ^ g[x][4]" */
    generate
      for(x=0; x<5; x=x+1)
        begin : L12
          assign bb[x] = g[x][0] ^ g[x][1] ^ g[x][2] ^ g[x][3] ^ g[x][4];
        end
    endgenerate

    /* calc "cc == theta(g)" */
    // generate
    //   for(y=0; y<5; y=y+1)
    //     begin : L13
    //       for(x=0; x<5; x=x+1)
    //         begin : L14
    //         //   assign cc[x][y] = g[x][y] ^ bb[`sub_1(x)] ^ `rot_up_1(bb[`add_1(x)]);
    //         assign cc[x][y] = g[x][y];
    //         end
    //     end
    // endgenerate
    (* dont_touch="true" *)wire [63:0]     bb0,bb1,bb2,bb3,bb4;
    assign bb0 = bb[4] ^ {bb[1][62:0],bb[1][63]};
    assign bb1 = bb[0] ^ {bb[2][62:0],bb[2][63]};
    assign bb2 = bb[1] ^ {bb[3][62:0],bb[3][63]};
    assign bb3 = bb[2] ^ {bb[4][62:0],bb[4][63]};
    assign bb4 = bb[3] ^ {bb[0][62:0],bb[0][63]};
            assign cc[0][0] = g[0][0] ^ bb0;
            assign cc[1][0] = g[1][0] ^ bb1;
            assign cc[2][0] = g[2][0] ^ bb2;
            assign cc[3][0] = g[3][0] ^ bb3;
            assign cc[4][0] = g[4][0] ^ bb4;

            assign cc[0][1] = g[0][1] ^ bb0;
            assign cc[1][1] = g[1][1] ^ bb1;
            assign cc[2][1] = g[2][1] ^ bb2;
            assign cc[3][1] = g[3][1] ^ bb3;
            assign cc[4][1] = g[4][1] ^ bb4;

            assign cc[0][2] = g[0][2] ^ bb0;
            assign cc[1][2] = g[1][2] ^ bb1;
            assign cc[2][2] = g[2][2] ^ bb2;
            assign cc[3][2] = g[3][2] ^ bb3;
            assign cc[4][2] = g[4][2] ^ bb4;

            assign cc[0][3] = g[0][3] ^ bb0;
            assign cc[1][3] = g[1][3] ^ bb1;
            assign cc[2][3] = g[2][3] ^ bb2;
            assign cc[3][3] = g[3][3] ^ bb3;
            assign cc[4][3] = g[4][3] ^ bb4;

            assign cc[0][4] = g[0][4] ^ bb0;
            assign cc[1][4] = g[1][4] ^ bb1;
            assign cc[2][4] = g[2][4] ^ bb2;
            assign cc[3][4] = g[3][4] ^ bb3;
            assign cc[4][4] = g[4][4] ^ bb4;


    /* calc "dd == rho(cc)" */
    assign dd[0][0] = cc[0][0];
    assign dd[1][0] = `rot_up_1(cc[1][0]);
    assign dd[2][0] = `rot_up(cc[2][0], 62);
    assign dd[3][0] = `rot_up(cc[3][0], 28);
    assign dd[4][0] = `rot_up(cc[4][0], 27);
    assign dd[0][1] = `rot_up(cc[0][1], 36);
    assign dd[1][1] = `rot_up(cc[1][1], 44);
    assign dd[2][1] = `rot_up(cc[2][1], 6);
    assign dd[3][1] = `rot_up(cc[3][1], 55);
    assign dd[4][1] = `rot_up(cc[4][1], 20);
    assign dd[0][2] = `rot_up(cc[0][2], 3);
    assign dd[1][2] = `rot_up(cc[1][2], 10);
    assign dd[2][2] = `rot_up(cc[2][2], 43);
    assign dd[3][2] = `rot_up(cc[3][2], 25);
    assign dd[4][2] = `rot_up(cc[4][2], 39);
    assign dd[0][3] = `rot_up(cc[0][3], 41);
    assign dd[1][3] = `rot_up(cc[1][3], 45);
    assign dd[2][3] = `rot_up(cc[2][3], 15);
    assign dd[3][3] = `rot_up(cc[3][3], 21);
    assign dd[4][3] = `rot_up(cc[4][3], 8);
    assign dd[0][4] = `rot_up(cc[0][4], 18);
    assign dd[1][4] = `rot_up(cc[1][4], 2);
    assign dd[2][4] = `rot_up(cc[2][4], 61);
    assign dd[3][4] = `rot_up(cc[3][4], 56);
    assign dd[4][4] = `rot_up(cc[4][4], 14);

    /* calc "ee == pi(dd)" */
    // assign ee[0][0] = dd[0][0];
    // assign ee[0][2] = dd[1][0];
    // assign ee[0][4] = dd[2][0];
    // assign ee[0][1] = dd[3][0];
    // assign ee[0][3] = dd[4][0];
    // assign ee[1][3] = dd[0][1];
    // assign ee[1][0] = dd[1][1];
    // assign ee[1][2] = dd[2][1];
    // assign ee[1][4] = dd[3][1];
    // assign ee[1][1] = dd[4][1];
    // assign ee[2][1] = dd[0][2];
    // assign ee[2][3] = dd[1][2];
    // assign ee[2][0] = dd[2][2];
    // assign ee[2][2] = dd[3][2];
    // assign ee[2][4] = dd[4][2];
    // assign ee[3][4] = dd[0][3];
    // assign ee[3][1] = dd[1][3];
    // assign ee[3][3] = dd[2][3];
    // assign ee[3][0] = dd[3][3];
    // assign ee[3][2] = dd[4][3];
    // assign ee[4][2] = dd[0][4];
    // assign ee[4][4] = dd[1][4];
    // assign ee[4][1] = dd[2][4];
    // assign ee[4][3] = dd[3][4];
    // assign ee[4][0] = dd[4][4];
    always @(posedge clk_in) begin
        if (reset_in) begin
            ee[0][0] <= 0;
            ee[0][2] <= 0;
            ee[0][4] <= 0;
            ee[0][1] <= 0;
            ee[0][3] <= 0;
            ee[1][3] <= 0;
            ee[1][0] <= 0;
            ee[1][2] <= 0;
            ee[1][4] <= 0;
            ee[1][1] <= 0;
            ee[2][1] <= 0;
            ee[2][3] <= 0;
            ee[2][0] <= 0;
            ee[2][2] <= 0;
            ee[2][4] <= 0;
            ee[3][4] <= 0;
            ee[3][1] <= 0;
            ee[3][3] <= 0;
            ee[3][0] <= 0;
            ee[3][2] <= 0;
            ee[4][2] <= 0;
            ee[4][4] <= 0;
            ee[4][1] <= 0;
            ee[4][3] <= 0;
            ee[4][0] <= 0;
            end
       else begin
            ee[0][0] <= dd[0][0];
            ee[0][2] <= dd[1][0];
            ee[0][4] <= dd[2][0];
            ee[0][1] <= dd[3][0];
            ee[0][3] <= dd[4][0];
            ee[1][3] <= dd[0][1];
            ee[1][0] <= dd[1][1];
            ee[1][2] <= dd[2][1];
            ee[1][4] <= dd[3][1];
            ee[1][1] <= dd[4][1];
            ee[2][1] <= dd[0][2];
            ee[2][3] <= dd[1][2];
            ee[2][0] <= dd[2][2];
            ee[2][2] <= dd[3][2];
            ee[2][4] <= dd[4][2];
            ee[3][4] <= dd[0][3];
            ee[3][1] <= dd[1][3];
            ee[3][3] <= dd[2][3];
            ee[3][0] <= dd[3][3];
            ee[3][2] <= dd[4][3];
            ee[4][2] <= dd[0][4];
            ee[4][4] <= dd[1][4];
            ee[4][1] <= dd[2][4];
            ee[4][3] <= dd[3][4];
            ee[4][0] <= dd[4][4];
        end
    end

    /* calc "ff = chi(ee)" */
    generate
      for(y=0; y<5; y=y+1)
        begin : L15
          for(x=0; x<5; x=x+1)
            begin : L16
              assign ff[x][y] = ee[x][y] ^ ((~ ee[`add_1(x)][y]) & ee[`add_2(x)][y]);
            // assign ff[x][y] = ee[x][y];
            end
        end
    endgenerate

    /* calc "gg = iota(ff)" */
    generate
      for(x=0; x<64; x=x+1)
        begin : L160
          if(x==0 || x==1 || x==3 || x==7 || x==15 || x==31 || x==63)
            assign gg[0][0][x] = ff[0][0][x] ^ round_const_2[x];
          else
            assign gg[0][0][x] = ff[0][0][x];
        end
    endgenerate
    
    generate
      for(y=0; y<5; y=y+1)
        begin : L17
          for(x=0; x<5; x=x+1)
            begin : L18
              if(x!=0 || y!=0)
                assign gg[x][y] = ff[x][y];
            end
        end
    endgenerate


    /* round 3 */

    /* calc "bbb[x] == gg[x][0] ^ gg[x][1] ^ ... ^ gg[x][4]" */
    generate
      for(x=0; x<5; x=x+1)
        begin : L22
          assign bbb[x] = gg[x][0] ^ gg[x][1] ^ gg[x][2] ^ gg[x][3] ^ gg[x][4];
        end
    endgenerate

    /* calc "cc == theta(g)" */
    // generate
    //   for(y=0; y<5; y=y+1)
    //     begin : L23
    //       for(x=0; x<5; x=x+1)
    //         begin : L24
    //         //   assign ccc[x][y] = gg[x][y] ^ bbb[`sub_1(x)] ^ `rot_up_1(bbb[`add_1(x)]);
    //         assign ccc[x][y] = gg[x][y];
    //         end
    //     end
    // endgenerate
    (* dont_touch="true" *)wire [63:0]     bbb0,bbb1,bbb2,bbb3,bbb4;
    assign bbb0 = bbb[4] ^ {bbb[1][62:0],bbb[1][63]};
    assign bbb1 = bbb[0] ^ {bbb[2][62:0],bbb[2][63]};
    assign bbb2 = bbb[1] ^ {bbb[3][62:0],bbb[3][63]};
    assign bbb3 = bbb[2] ^ {bbb[4][62:0],bbb[4][63]};
    assign bbb4 = bbb[3] ^ {bbb[0][62:0],bbb[0][63]};
            assign ccc[0][0] = gg[0][0] ^ bbb0;
            assign ccc[1][0] = gg[1][0] ^ bbb1;
            assign ccc[2][0] = gg[2][0] ^ bbb2;
            assign ccc[3][0] = gg[3][0] ^ bbb3;
            assign ccc[4][0] = gg[4][0] ^ bbb4;

            assign ccc[0][1] = gg[0][1] ^ bbb0;
            assign ccc[1][1] = gg[1][1] ^ bbb1;
            assign ccc[2][1] = gg[2][1] ^ bbb2;
            assign ccc[3][1] = gg[3][1] ^ bbb3;
            assign ccc[4][1] = gg[4][1] ^ bbb4;

            assign ccc[0][2] = gg[0][2] ^ bbb0;
            assign ccc[1][2] = gg[1][2] ^ bbb1;
            assign ccc[2][2] = gg[2][2] ^ bbb2;
            assign ccc[3][2] = gg[3][2] ^ bbb3;
            assign ccc[4][2] = gg[4][2] ^ bbb4;

            assign ccc[0][3] = gg[0][3] ^ bbb0;
            assign ccc[1][3] = gg[1][3] ^ bbb1;
            assign ccc[2][3] = gg[2][3] ^ bbb2;
            assign ccc[3][3] = gg[3][3] ^ bbb3;
            assign ccc[4][3] = gg[4][3] ^ bbb4;

            assign ccc[0][4] = gg[0][4] ^ bbb0;
            assign ccc[1][4] = gg[1][4] ^ bbb1;
            assign ccc[2][4] = gg[2][4] ^ bbb2;
            assign ccc[3][4] = gg[3][4] ^ bbb3;
            assign ccc[4][4] = gg[4][4] ^ bbb4;    

    /* calc "dd == rho(cc)" */
    assign ddd[0][0] = ccc[0][0];
    assign ddd[1][0] = `rot_up_1(ccc[1][0]);
    assign ddd[2][0] = `rot_up(ccc[2][0], 62);
    assign ddd[3][0] = `rot_up(ccc[3][0], 28);
    assign ddd[4][0] = `rot_up(ccc[4][0], 27);
    assign ddd[0][1] = `rot_up(ccc[0][1], 36);
    assign ddd[1][1] = `rot_up(ccc[1][1], 44);
    assign ddd[2][1] = `rot_up(ccc[2][1], 6);
    assign ddd[3][1] = `rot_up(ccc[3][1], 55);
    assign ddd[4][1] = `rot_up(ccc[4][1], 20);
    assign ddd[0][2] = `rot_up(ccc[0][2], 3);
    assign ddd[1][2] = `rot_up(ccc[1][2], 10);
    assign ddd[2][2] = `rot_up(ccc[2][2], 43);
    assign ddd[3][2] = `rot_up(ccc[3][2], 25);
    assign ddd[4][2] = `rot_up(ccc[4][2], 39);
    assign ddd[0][3] = `rot_up(ccc[0][3], 41);
    assign ddd[1][3] = `rot_up(ccc[1][3], 45);
    assign ddd[2][3] = `rot_up(ccc[2][3], 15);
    assign ddd[3][3] = `rot_up(ccc[3][3], 21);
    assign ddd[4][3] = `rot_up(ccc[4][3], 8);
    assign ddd[0][4] = `rot_up(ccc[0][4], 18);
    assign ddd[1][4] = `rot_up(ccc[1][4], 2);
    assign ddd[2][4] = `rot_up(ccc[2][4], 61);
    assign ddd[3][4] = `rot_up(ccc[3][4], 56);
    assign ddd[4][4] = `rot_up(ccc[4][4], 14);

    /* calc "ee == pi(dd)" */
    assign eee[0][0] = ddd[0][0];
    assign eee[0][2] = ddd[1][0];
    assign eee[0][4] = ddd[2][0];
    assign eee[0][1] = ddd[3][0];
    assign eee[0][3] = ddd[4][0];
    assign eee[1][3] = ddd[0][1];
    assign eee[1][0] = ddd[1][1];
    assign eee[1][2] = ddd[2][1];
    assign eee[1][4] = ddd[3][1];
    assign eee[1][1] = ddd[4][1];
    assign eee[2][1] = ddd[0][2];
    assign eee[2][3] = ddd[1][2];
    assign eee[2][0] = ddd[2][2];
    assign eee[2][2] = ddd[3][2];
    assign eee[2][4] = ddd[4][2];
    assign eee[3][4] = ddd[0][3];
    assign eee[3][1] = ddd[1][3];
    assign eee[3][3] = ddd[2][3];
    assign eee[3][0] = ddd[3][3];
    assign eee[3][2] = ddd[4][3];
    assign eee[4][2] = ddd[0][4];
    assign eee[4][4] = ddd[1][4];
    assign eee[4][1] = ddd[2][4];
    assign eee[4][3] = ddd[3][4];
    assign eee[4][0] = ddd[4][4];

    /* calc "ff = chi(ee)" */
    generate
      for(y=0; y<5; y=y+1)
        begin : L25
          for(x=0; x<5; x=x+1)
            begin : L26
              assign fff[x][y] = eee[x][y] ^ ((~ eee[`add_1(x)][y]) & eee[`add_2(x)][y]);
            // assign fff[x][y] = eee[x][y];
            end
        end
    endgenerate

    /* calc "gg = iota(ff)" */
    generate
      for(x=0; x<64; x=x+1)
        begin : L260
          if(x==0 || x==1 || x==3 || x==7 || x==15 || x==31 || x==63)
            assign ggg[0][0][x] = fff[0][0][x] ^ round_const_3[x];
          else
            assign ggg[0][0][x] = fff[0][0][x];
        end
    endgenerate
    
    generate
      for(y=0; y<5; y=y+1)
        begin : L27
          for(x=0; x<5; x=x+1)
            begin : L28
              if(x!=0 || y!=0)
                assign ggg[x][y] = fff[x][y];
            end
        end
    endgenerate




    /* assign "out[w(5y+x)+z] == out_var[x][y][z]" */
    generate
      for(y=0; y<5; y=y+1)
        begin : L99
          for(x=0; x<5; x=x+1)
            begin : L100
              assign out[`high_pos(x,y) : `low_pos(x,y)] = ggg[x][y];
            end
        end
    endgenerate
endmodule

`undef low_pos
`undef high_pos
`undef add_1
`undef add_2
`undef sub_1
`undef rot_up
`undef rot_up_1

