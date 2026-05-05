`timescale 1ns / 1ps

module Kyber_PWM_zetas_v(
	input	wire			clka,
	input	wire			ena,
	input	wire	[6:0]	addra,
	output	reg		[15:0]	douta
);

	reg [15:0] zetas_mem [0:127];
	
	initial begin
		zetas_mem[0] = 16'd17;
		zetas_mem[1] = 16'd3312;
		zetas_mem[2] = 16'd2761;
		zetas_mem[3] = 16'd568;
		zetas_mem[4] = 16'd583;
		zetas_mem[5] = 16'd2746;
		zetas_mem[6] = 16'd2649;
		zetas_mem[7] = 16'd680;
		zetas_mem[8] = 16'd1637;
		zetas_mem[9] = 16'd1692;
		zetas_mem[10] = 16'd723;
		zetas_mem[11] = 16'd2606;
		zetas_mem[12] = 16'd2288;
		zetas_mem[13] = 16'd1041;
		zetas_mem[14] = 16'd1100;
		zetas_mem[15] = 16'd2229;
		zetas_mem[16] = 16'd1409;
		zetas_mem[17] = 16'd1920;
		zetas_mem[18] = 16'd2662;
		zetas_mem[19] = 16'd667;
		zetas_mem[20] = 16'd3281;
		zetas_mem[21] = 16'd48;
		zetas_mem[22] = 16'd233;
		zetas_mem[23] = 16'd3096;
		zetas_mem[24] = 16'd756;
		zetas_mem[25] = 16'd2573;
		zetas_mem[26] = 16'd2156;
		zetas_mem[27] = 16'd1173;
		zetas_mem[28] = 16'd3015;
		zetas_mem[29] = 16'd314;
		zetas_mem[30] = 16'd3050;
		zetas_mem[31] = 16'd279;
		zetas_mem[32] = 16'd1703;
		zetas_mem[33] = 16'd1626;
		zetas_mem[34] = 16'd1651;
		zetas_mem[35] = 16'd1678;
		zetas_mem[36] = 16'd2789;
		zetas_mem[37] = 16'd540;
		zetas_mem[38] = 16'd1789;
		zetas_mem[39] = 16'd1540;
		zetas_mem[40] = 16'd1847;
		zetas_mem[41] = 16'd1482;
		zetas_mem[42] = 16'd952;
		zetas_mem[43] = 16'd2377;
		zetas_mem[44] = 16'd1461;
		zetas_mem[45] = 16'd1868;
		zetas_mem[46] = 16'd2687;
		zetas_mem[47] = 16'd642;
		zetas_mem[48] = 16'd939;
		zetas_mem[49] = 16'd2390;
		zetas_mem[50] = 16'd2308;
		zetas_mem[51] = 16'd1021;
		zetas_mem[52] = 16'd2437;
		zetas_mem[53] = 16'd892;
		zetas_mem[54] = 16'd2388;
		zetas_mem[55] = 16'd941;
		zetas_mem[56] = 16'd733;
		zetas_mem[57] = 16'd2596;
		zetas_mem[58] = 16'd2337;
		zetas_mem[59] = 16'd992;
		zetas_mem[60] = 16'd268;
		zetas_mem[61] = 16'd3061;
		zetas_mem[62] = 16'd641;
		zetas_mem[63] = 16'd2688;
		zetas_mem[64] = 16'd1584;
		zetas_mem[65] = 16'd1745;
		zetas_mem[66] = 16'd2298;
		zetas_mem[67] = 16'd1031;
		zetas_mem[68] = 16'd2037;
		zetas_mem[69] = 16'd1292;
		zetas_mem[70] = 16'd3220;
		zetas_mem[71] = 16'd109;
		zetas_mem[72] = 16'd375;
		zetas_mem[73] = 16'd2954;
		zetas_mem[74] = 16'd2549;
		zetas_mem[75] = 16'd780;
		zetas_mem[76] = 16'd2090;
		zetas_mem[77] = 16'd1239;
		zetas_mem[78] = 16'd1645;
		zetas_mem[79] = 16'd1684;
		zetas_mem[80] = 16'd1063;
		zetas_mem[81] = 16'd2266;
		zetas_mem[82] = 16'd319;
		zetas_mem[83] = 16'd3010;
		zetas_mem[84] = 16'd2773;
		zetas_mem[85] = 16'd556;
		zetas_mem[86] = 16'd757;
		zetas_mem[87] = 16'd2572;
		zetas_mem[88] = 16'd2099;
		zetas_mem[89] = 16'd1230;
		zetas_mem[90] = 16'd561;
		zetas_mem[91] = 16'd2768;
		zetas_mem[92] = 16'd2466;
		zetas_mem[93] = 16'd863;
		zetas_mem[94] = 16'd2594;
		zetas_mem[95] = 16'd735;
		zetas_mem[96] = 16'd2804;
		zetas_mem[97] = 16'd525;
		zetas_mem[98] = 16'd1092;
		zetas_mem[99] = 16'd2237;
		zetas_mem[100] = 16'd403;
		zetas_mem[101] = 16'd2926;
		zetas_mem[102] = 16'd1026;
		zetas_mem[103] = 16'd2303;
		zetas_mem[104] = 16'd1143;
		zetas_mem[105] = 16'd2186;
		zetas_mem[106] = 16'd2150;
		zetas_mem[107] = 16'd1179;
		zetas_mem[108] = 16'd2775;
		zetas_mem[109] = 16'd554;
		zetas_mem[110] = 16'd886;
		zetas_mem[111] = 16'd2443;
		zetas_mem[112] = 16'd1722;
		zetas_mem[113] = 16'd1607;
		zetas_mem[114] = 16'd1212;
		zetas_mem[115] = 16'd2117;
		zetas_mem[116] = 16'd1874;
		zetas_mem[117] = 16'd1455;
		zetas_mem[118] = 16'd1029;
		zetas_mem[119] = 16'd2300;
		zetas_mem[120] = 16'd2110;
		zetas_mem[121] = 16'd1219;
		zetas_mem[122] = 16'd2935;
		zetas_mem[123] = 16'd394;
		zetas_mem[124] = 16'd885;
		zetas_mem[125] = 16'd2444;
		zetas_mem[126] = 16'd2154;
		zetas_mem[127] = 16'd1175;
	end

	always @(posedge clka) begin
		if (ena) begin
			douta <= zetas_mem[addra];
		end
	end
	
endmodule
