`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2023 17:15:50
// Design Name: 
// Module Name: ButtonChangeMagnitude
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


module ButtonChangeMagnitude(clk, reset, valid_mag, sw12_value, switch_magnitude, handshake_mag);

//parameter NORAML = 69;

input clk, reset;
input valid_mag;
input logic [7:0] sw12_value;
output logic [10:0] switch_magnitude;
output logic handshake_mag;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        switch_magnitude <= 11'd70;
        handshake_mag <= 1'b0;
    end
    else if (valid_mag) begin
        switch_magnitude <= sw12_value; //0-126
        handshake_mag <= ~ handshake_mag;
    end
end

endmodule
