`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.04.2023 19:19:47
// Design Name: 
// Module Name: ClkDivider
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


module ClkDivider

#(
    parameter DIV_FACTOR_10Khz = 10000 // 10KHZ
//    parameter DIV_FACTOR_50Mhz = 2      // 50MHz
)
(
    input clk,         
    input reset,            
    output logic out_10Khz,        
    output logic out_50Mhz          
);

logic [31:0] count_10Khz = 0;       // 10Khz counter
logic [31:0] count_50Mhz = 0;       // 50MHz counter

always @(posedge clk or posedge reset) begin
    if(reset) begin
        count_10Khz <= 1'b0;
        count_50Mhz <= 1'b0;
        out_50Mhz <= 1'b0; 
        out_10Khz <= 1'b0;
    end
    else begin
        if (count_10Khz == DIV_FACTOR_10Khz - 1) begin
            out_10Khz <= ~out_10Khz;           
            count_10Khz <= 0;        
        end
        else begin
            count_10Khz <= count_10Khz + 1;          
        end
        out_50Mhz <= ~out_50Mhz;                  
    end
end

endmodule
