`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 13:17:19
// Design Name: 
// Module Name: mult8
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


module mult8(

    input [7:0] x1,
    input [7:0] x2,
    output reg[15:0] out
    );
    always @(x1 or x2) 
    begin
        out = x1 * x2;
//        out = 16'b0;
//        for(int i=0; i<8; i++)
//            if(x1[i])
//                out = out + (x2 << i);
    end
endmodule
