`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2023 09:49:34
// Design Name: 
// Module Name: dataROM
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


module dataROM (clock, address, dataOut);
input clock ;
input [0:8] address ;
output logic [9:0] dataOut;

    logic [0:9] ROMData [0:511]; // data width is 10 bits ; depth is 256

    initial begin
        $readmemh ("ROMData.mem",ROMData);
    end

    always @ (posedge clock)
    begin
        dataOut <= ROMData[address];
    end
endmodule
