`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 15:17:50
// Design Name: 
// Module Name: Testswitch
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


module Testswitch();

    logic clk;
    logic reset;
    
    logic sw1_mag_up;
    logic sw2_mag_down;
    logic sw3_clk_up;
    logic sw4_clk_down;
    
    logic [3:0] flag;
    
    SwitchInterface u_SwitchInterface(
        .clk(clk), 
        .reset(reset), 
        .sw1_mag_up(sw1_mag_up), 
        .sw2_mag_down(sw2_mag_down), 
        .sw3_clk_up(sw3_clk_up), 
        .sw4_clk_down(sw4_clk_down), 
        .flag_out(flag)
    );

    initial begin
        clk = 0;
        sw1_mag_up = 0;
        sw2_mag_down = 0;
        sw3_clk_up = 0;
        sw4_clk_down = 0;
        
        reset = 1;
        #10;
        reset = 0;
        #20000;
//        $finish;
    end

    always #5 clk = ~ clk ;
    
    always #50 sw1_mag_up = ~ sw1_mag_up ;
    always #100 sw2_mag_down = ~ sw2_mag_down ;
    always #150 sw3_clk_up = ~ sw3_clk_up ;
    always #200 sw4_clk_down = ~ sw4_clk_down ;

endmodule
