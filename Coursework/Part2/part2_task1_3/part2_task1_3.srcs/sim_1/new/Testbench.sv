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
    logic [9:0] out;
    
    ToPart2Update u_ToPart2Update(
    .clk(clk), 
    .reset(reset),
    .sw1_mag_up(sw1_mag_up),
    .sw2_mag_down(sw2_mag_down),
    .sw3_clk_up(sw3_clk_up),
    .sw4_clk_down(sw4_clk_down),
    .out(out)
    );
    
//    DigSineGenerator u_DigSineGenerator(
//        .clk(clk),
//        .reset(reset),
//        .y(out)
//    );
    
    initial begin
        clk = 0;
        reset = 1;
        sw1_mag_up = 0;
        sw2_mag_down = 0;
        sw3_clk_up = 0;
        sw4_clk_down = 0;
        #10;
        reset = 0;
        #20000;
//        $finish;
    end
    
    always #50 sw1_mag_up = ~ sw1_mag_up ;
    always #100 sw2_mag_down = ~ sw2_mag_down ;
    always #150 sw3_clk_up = ~ sw3_clk_up ;
    always #200 sw4_clk_down = ~ sw4_clk_down ;
    always #5 clk = ~ clk ;

endmodule
