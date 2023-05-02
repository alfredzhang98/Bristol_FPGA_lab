`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 00:56:32
// Design Name: 
// Module Name: DigSineGeneratorUpdate
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


module DigSineGeneratorUpdate(clk, reset, handshake_mag, magnitude, y);

input clk, reset;
input handshake_mag;
input logic [10:0] magnitude;
output logic [9:0] y;


logic signed [10:0] y_temp_1, y_temp_2;
logic signed [10:0] y_result, mul_1, mul_2;
logic shake_save1, shake_save2;

always @(posedge clk or posedge reset) begin
    if(reset) begin
        y_temp_1 <= 11'b00001000101;
        y_temp_2 <= 11'b0;
    end
    else if(shake_save1 ^ shake_save2) begin
        y_temp_1 <= magnitude[10:0];
        y_temp_2 <= 11'b0;
    end
    else begin
        y_temp_1 <= y_temp_2;
        y_temp_2 <= y_result;
    end
end

always @(posedge clk or posedge reset) begin
    if(reset) begin
        shake_save1 <= 1'b0;
        shake_save2 <= 1'b0;
    end
    else begin
        shake_save1 <= handshake_mag;
        shake_save2 <= shake_save1;
    end
end
        
assign mul_1 = {{{1{y_temp_2[10]}}, y_temp_2[10:1]} + {{2{y_temp_2[10]}}, y_temp_2[10:2]} + {{3{y_temp_2[10]}}, y_temp_2[10:3]} + {{4{y_temp_2[10]}}, y_temp_2[10:4]} + {{6{y_temp_2[10]}}, y_temp_2[10:6]} + {{7{y_temp_2[10]}}, y_temp_2[10:7]}}<<1;
assign mul_2 = y_temp_1;

assign y_result = mul_1 - mul_2;
assign y = y_result + 10'd512;

endmodule
