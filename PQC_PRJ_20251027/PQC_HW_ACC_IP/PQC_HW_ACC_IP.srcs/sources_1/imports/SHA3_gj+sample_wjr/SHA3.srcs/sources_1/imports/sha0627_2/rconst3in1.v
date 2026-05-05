`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: rconst3in1
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


/* round constant (3 in 1 ~ ~) */
module rconst3in1(i, rc1, rc2, rc3);
    input  [15:0] i;
    output [63:0] rc1, rc2, rc3;
    reg    [63:0] rc1, rc2, rc3;
    
    always @ (i)
      begin
        rc1 = 0;
        rc1[0] = i[0] | i[2] | i[4] | i[5];
        rc1[1] = i[4] | i[5] | i[6];
        rc1[3] = i[3] | i[4] | i[6];
        rc1[7] = i[2] | i[3] | i[4] | i[7];
        rc1[15] = i[1] | i[2] | i[4] | i[5] | i[6] | i[7];
        rc1[31] = i[1] | i[2] | i[4];
        rc1[63] = i[1] | i[2] | i[5] | i[7];
      end
    
    always @ (i)
      begin
        rc2 = 0;
        rc2[0] = i[1] | i[2] | i[3] | i[4] | i[7];
        rc2[1] = i[0] | i[1] | i[4] | i[5] | i[6];
        rc2[3] = i[1] | i[2] | i[3] | i[4] | i[6];
        rc2[7] = i[0] | i[1] | i[4];
        rc2[15] = i[0] | i[1] | i[2] | i[3] | i[5];
        rc2[31] = i[3] | i[6] | i[7];
        rc2[63] = i[2] | i[4] | i[5] | i[6];
      end

    always @ (i)
      begin
        rc3 = 0;
        rc3[0] = i[1] | i[4] | i[6];
        rc3[1] = i[0] | i[2] | i[3];
        rc3[3] = i[0] | i[2] | i[3] | i[4] | i[7];
        rc3[7] = i[0] | i[2] | i[4] | i[5] | i[6];
        rc3[15] = i[0] | i[4] | i[6] | i[7];
        rc3[31] = i[1] | i[3] | i[6] | i[7];
        rc3[63] = i[0] | i[4] | i[5] | i[6] | i[7];
      end      
endmodule
