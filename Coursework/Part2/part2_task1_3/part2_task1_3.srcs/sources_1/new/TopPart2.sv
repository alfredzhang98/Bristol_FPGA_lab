`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 19:18:36
// Design Name: 
// Module Name: TopPart2
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


module TopPart2(
    input clk, 
    input reset, 
    output  logic dac_sdi,
	output  logic dac_cs,
	output  logic dac_sck,	
	output  logic dac_ld
    );
    
    logic out_10Khz;    
    logic out_50Mhz;
    logic [9:0] y;
    
    ClkDivider u_ClkDivider(
        .clk(clk),
        .reset(reset),
        .out_10Khz(out_10Khz),
        .out_50Mhz(out_50Mhz)
    );
        
    
    DigSineGenerator u_DigSineGenerator(
        .clk(out_10Khz),
        .reset(reset),
        .y(y)
    );
    
        
    spi2dac u_spi2dac(
        .sysclk(out_50Mhz),
        .data_in(y),
        .load(1'b1),
        .dac_sdi(dac_sdi),
        .dac_cs(dac_cs),
        .dac_sck(dac_sck),
        .dac_ld(dac_ld)
    );
 
endmodule
