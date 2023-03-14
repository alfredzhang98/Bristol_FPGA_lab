`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 13:39:07
// Design Name: 
// Module Name: mult8_tb
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


module mult8_tb();
    logic [7:0] x1, x2;
    logic [15:0] out;
    mult8 dut (.x1(x1), .x2(x2), .out(out));
    
    
    
    logic clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        x1 = 8'b00100100;
        x2 = 8'b00001101;
        $display("x1 = %b, x2 =%b, out = %b", x1, x2, out);
        assert(out == 16'b000100111100) else $error("Test failed!");  
    end
    
    initial begin
        #1000;
        $finish;
    end
    
    always #2 clk = ~clk;
    always @(posedge clk) begin
        #1;
        x1 <= $random;
        x2 <= $random;
    end
    
endmodule
