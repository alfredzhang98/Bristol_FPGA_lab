`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 17:55:22
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


module Testbench();

    logic clk;
    logic reset;
    logic sw1_mag_up, sw2_mag_down, sw3_clk_up, sw4_clk_down;
    logic dac_sdi;
    logic dac_cs;
    logic dac_sck;
    logic dac_ld;
    
    ToPart2Update u_ToPart2Update(
    .clk(clk), 
    .reset(reset),
    .sw1_mag_up(sw1_mag_up),
    .sw2_mag_down(sw2_mag_down),
    .sw3_clk_up(sw3_clk_up),
    .sw4_clk_down(sw4_clk_down),
    .dac_sdi(dac_sdi),
	.dac_cs(dac_cs),
	.dac_sck(dac_sck),	
	.dac_ld(dac_ld)
    );
    
    initial begin
        sw1_mag_up = 0;
        sw2_mag_down = 0;
        sw3_clk_up = 0;
        sw4_clk_down = 0;
        clk <= 1'b1;
        reset = 1'b1;
        #20;
        reset = 1'b0;
        #20;
        reset = 1'b1;
        #20;
        reset = 1'b0;
//        #10000;
//        $finish;
    end
    
//    always #1000 sw3_clk_up = ~ sw3_clk_up ;
    always #5 clk = ~ clk ;

endmodule
