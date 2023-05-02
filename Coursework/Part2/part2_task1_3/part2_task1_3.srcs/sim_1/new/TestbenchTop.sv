`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 19:32:44
// Design Name: 
// Module Name: TestbenchTop
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


module TestbenchTop();

    logic clk;
    logic reset;
    logic dac_sdi;
    logic dac_cs;
    logic dac_sck;
    logic dac_ld;

TopPart2 u_TopPart2(
    .clk(clk), 
    .reset(reset), 
    .dac_sdi(dac_sdi),
	.dac_cs(dac_cs),
	.dac_sck(dac_sck),	
	.dac_ld(dac_ld)
);

    initial begin
        clk <= 1'b1;
        reset = 1'b1;
        #20;
        reset = 1'b0;
        #20;
        reset = 1'b1;
        #20;
        reset = 1'b0;   
    end

    always #5 clk = ~ clk ;

endmodule
