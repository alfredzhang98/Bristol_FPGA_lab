`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 14:10:56
// Design Name: 
// Module Name: mult16
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


module mult16(
    input [15:0] a,
    input [15:0] b,
    output reg [31:0] out
    );

logic [15:0] temp1;
logic [15:0] temp2;
logic [15:0] temp3;
logic [15:0] temp4;

mult8 dut1 (.x1(a[7:0]), .x2(b[7:0]), .out(temp1));

mult8 dut2 (.x1(a[7:0]), .x2(b[15:8]), .out(temp2));

mult8 dut3 (.x1(a[15:8]), .x2(b[7:0]), .out(temp3));

mult8 dut4 (.x1(a[15:8]), .x2(b[15:8]), .out(temp4));

//assign out = temp1 + (temp2 << 8) + (temp3 << 8) + (temp4 << 16);
assign out = {16'b0,temp1} + {8'b0, temp2, 8'b0} + {8'b0, temp3, 8'b0} + {temp4, 16'b0};
    
endmodule
