`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 02:00:14
// Design Name: 
// Module Name: BottonChangeMagnitude
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


module BottonChangeMagnitude(clk, flag, sw12_value, switch_magnitude);

//parameter NORAML = 69;

input clk;
input logic [3:0] flag;
input logic [7:0] sw12_value;
output logic [15:0] switch_magnitude;

logic [15:0] value_temp;

always @(posedge clk) begin
    if(flag[0] != 1'b0 || flag[1] != 1'b0) begin
        value_temp <= 15'd69;
        value_temp <= value_temp + (sw12_value - 50);
    end
    else begin
        switch_magnitude <= value_temp;
    end
end

endmodule
