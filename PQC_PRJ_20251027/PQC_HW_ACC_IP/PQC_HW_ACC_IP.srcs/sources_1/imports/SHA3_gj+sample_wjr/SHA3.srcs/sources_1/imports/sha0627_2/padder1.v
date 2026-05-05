/*
 * Copyright 2013, Homer Hsing <homer.hsing@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module padder1(in, byte_num, mode_in, out);
    input      [63:0] in;
    input      [2:0]  byte_num;
    input      [2:0]  mode_in;
    output reg [63:0] out;
    
    always @ (*)
      case ({mode_in[2], byte_num})
        4'b0_000: out =             64'h0600000000000000;
        4'b0_001: out = {in[63:56], 56'h06000000000000};
        4'b0_010: out = {in[63:48], 48'h060000000000};
        4'b0_011: out = {in[63:40], 40'h0600000000};
        4'b0_100: out = {in[63:32], 32'h06000000};
        4'b0_101: out = {in[63:24], 24'h060000};
        4'b0_110: out = {in[63:16], 16'h0600};
        4'b0_111: out = {in[63:8],   8'h06};

        4'b1_000: out =             64'h1f00000000000000;
        4'b1_001: out = {in[63:56], 56'h1f000000000000};
        4'b1_010: out = {in[63:48], 48'h1f0000000000};
        4'b1_011: out = {in[63:40], 40'h1f00000000};
        4'b1_100: out = {in[63:32], 32'h1f000000};
        4'b1_101: out = {in[63:24], 24'h1f0000};
        4'b1_110: out = {in[63:16], 16'h1f00};
        4'b1_111: out = {in[63:8],   8'h1f};
      endcase
endmodule
