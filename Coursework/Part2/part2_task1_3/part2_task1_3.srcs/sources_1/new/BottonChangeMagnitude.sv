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


module BottonChangeMagnitude(clk, reset, valid_mag, sw12_value, switch_magnitude, handshake_mag);

//parameter NORAML = 69;

input clk, reset;
input valid_mag;
input logic [7:0] sw12_value;
output logic [15:0] switch_magnitude;
output logic handshake_mag;

logic [15:0] value_temp;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        value_temp <= 16'd69;
        handshake_mag <= 1'b0;
    end
    else if (valid_mag) begin
        value_temp <= 16'd69 + (sw12_value - 50) * 10;
        handshake_mag <= ~ handshake_mag;
    end
end

assign switch_magnitude = value_temp;

endmodule
