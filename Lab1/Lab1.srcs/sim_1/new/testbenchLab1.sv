`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2023 13:50:21
// Design Name: 
// Module Name: testbenchLab1
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


module testbenchLab1;

logic x1, x2, x3, y;

Lab1 U0(x1, x2, x3, y);

initial
begin
    for(int k = 0; k < 8; k = k + 1)
    begin
        {x1, x2, x3} = k;
        #20 ;
        end
#5 $finish;
end

endmodule
