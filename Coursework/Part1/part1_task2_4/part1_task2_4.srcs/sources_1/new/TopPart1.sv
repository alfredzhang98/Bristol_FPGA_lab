`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 21:51:25
// Design Name: 
// Module Name: TopPart1
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


module TopPart1(clock, reset, out);

    input clock;
    input reset;
    output [9:0] out;
    
    logic [9:0] dataOut;
    logic [0:8] address;
    
    AddressGenerator u_AddressGenerator(
        .clock(clock),
        .reset(reset),
        .address(address)
    );

    dataROM u_dataROM(
        .clock(clock),
        .address(address),
        .dataOut(dataOut)
    );

    FIRFilter u_FIRFilter(
        .clock(clock),
        .reset(reset),
        .x(dataOut),
        .y(out)
    );
endmodule
