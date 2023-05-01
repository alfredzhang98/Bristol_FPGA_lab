`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2023 15:51:38
// Design Name: 
// Module Name: DigSineGenerator
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


module DigSineGenerator(clk, reset, y);

input clk, reset;
output logic[9:0] y;

//We also use the Q0.8 to express the fractional figure
//0.2730
//0.0100 0101 (111000110101001111110111110011101101100100011)
//0.9620
//0.1111 0110 (1000101101000011100101011000000100000110001)

logic signed [10:0] y_temp_1, y_temp_2;
logic signed [10:0] y_result, mul_1, mul_2;

always @(posedge clk or posedge reset) begin
    if(reset) begin
        y_temp_1 <= 11'b00001000101;
        y_temp_2 <= 11'b0;
    end
    else begin
        y_temp_1 <= y_temp_2;
        y_temp_2 <= y_result;
    end
end
        
//assign mul_1 = ((y_temp_2 >> 1) + (y_temp_2 >> 2) + (y_temp_2 >> 3) + (y_temp_2 >> 4) + (y_temp_2 >> 6) + (y_temp_2 >> 7)) << 1; 
assign mul_1 = {{{1{y_temp_2[10]}}, y_temp_2[10:1]} + {{2{y_temp_2[10]}}, y_temp_2[10:2]} + {{3{y_temp_2[10]}}, y_temp_2[10:3]} + {{4{y_temp_2[10]}}, y_temp_2[10:4]} + {{6{y_temp_2[10]}}, y_temp_2[10:6]} + {{7{y_temp_2[10]}}, y_temp_2[10:7]}}<<1;
assign mul_2 = y_temp_1;
assign y_result = mul_1 - mul_2;
assign y = y_result + 10'd512;

endmodule
