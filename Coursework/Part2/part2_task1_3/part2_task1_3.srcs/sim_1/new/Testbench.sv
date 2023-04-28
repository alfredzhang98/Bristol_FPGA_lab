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
    
    logic [9:0] y;
    
    DigSineGenerator u_DigSineGenerator(
        .clk(clk),
        .reset(reset),
        .y(y)
    );
    
    initial begin
        clk = 0;
        reset = 1;
        #10;
        reset = 0;
        #20000;
//        $finish;
    end

    always #50000 clk = ~ clk ;

endmodule
