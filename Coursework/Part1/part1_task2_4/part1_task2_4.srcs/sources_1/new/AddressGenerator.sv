`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 16:38:03
// Design Name: 
// Module Name: AddressGenerator
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


module AddressGenerator(clock, reset, address);

input   clock;
input   reset;
output  [8:0] address;


reg [8:0] address_temp;

always@(posedge clock or posedge reset)
    if(reset)
        address_temp <= 9'b0;
    else if(address_temp == 9'd511) begin
        address_temp <= 9'd0;
end
    else 
    begin
        address_temp <= address_temp + 1'b1;
    end

assign address = address_temp;

endmodule
