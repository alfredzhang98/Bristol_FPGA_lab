`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2023 09:39:08
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



module Testbench ();

    logic clock;
    logic reset;
    
    logic [9:0] dataOut;
    logic [9:0] out;
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

    initial begin
        clock = 0;
        reset = 1;
        #10;
        reset = 0;
        #20000;
        $finish;
    end

    always #10 clock = ~ clock ;

endmodule

