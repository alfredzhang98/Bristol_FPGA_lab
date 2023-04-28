`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2023 09:39:08
// Design Name: 
// Module Name: Testbench
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

module FIRFilter (clock, reset, x, y);

input   clock;
input   reset;
input   [9:0]   x;
output  [9:0]   y;

logic [9:0] z_1, z_2, z_3, z_4, z_5, z_6;
logic [9:0] mul_0, mul_1, mul_2, mul_3, mul_4, mul_5, mul_6;

//data shift
always @(posedge clock or posedge reset) begin
    if (reset) begin
        z_1 <= 10'b0;
        z_2 <= 10'b0;
        z_3 <= 10'b0;
        z_4 <= 10'b0;
        z_5 <= 10'b0;
        z_6 <= 10'b0;
    end
    else begin
        z_1 <= x;
        z_2 <= z_1;
        z_3 <= z_2;
        z_4 <= z_3;
        z_5 <= z_4;
        z_6 <= z_5;
    end
end

//coef mult
////0 00100110 coef 0.149
assign mul_0 = (x      >> 3) + (x      >> 6) + (x      >> 7);
assign mul_1 = (z_1    >> 3) + (z_1    >> 6) + (z_1    >> 7);
assign mul_2 = (z_2    >> 3) + (z_2    >> 6) + (z_2    >> 7);
assign mul_3 = (z_3    >> 3) + (z_3    >> 6) + (z_3    >> 7);
assign mul_4 = (z_4    >> 3) + (z_4    >> 6) + (z_4    >> 7);
assign mul_5 = (z_5    >> 3) + (z_5    >> 6) + (z_5    >> 7);
assign mul_6 = (z_6    >> 3) + (z_6    >> 6) + (z_6    >> 7);

//outcome
assign y = mul_0 + mul_1 + mul_2 + mul_3 + mul_4 + mul_5 + mul_6;

endmodule
