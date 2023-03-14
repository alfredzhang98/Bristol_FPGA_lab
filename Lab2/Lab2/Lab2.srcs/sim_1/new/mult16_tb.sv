`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 15:04:18
// Design Name: 
// Module Name: mult16_tb
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


module mult16_tb();

    logic [15:0] x1, x2;
    logic [31:0] out;
    mult16 dut_mult16 (.a(x1), .b(x2), .out(out));
    
    logic clk = 0; 
    
    initial begin
        #10000;
        $finish;
    end
    
    always #2 clk = ~clk;
    always @(posedge clk) begin
        #1;
        x1 <= $random;
        x2 <= $random;
    end
        
endmodule
