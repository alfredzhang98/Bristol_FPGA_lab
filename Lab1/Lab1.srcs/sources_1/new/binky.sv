`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 14:46:06
// Design Name: 
// Module Name: binky
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


module binky(input clk, output led);

logic [24:0] count = 0;

assign led = count [24];

always@ (posedge(clk))
    count <= count + 1;

endmodule
