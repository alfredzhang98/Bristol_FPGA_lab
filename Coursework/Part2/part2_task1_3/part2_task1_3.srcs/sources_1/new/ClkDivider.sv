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
    parameter DIV_FACTOR_10Khz = 5000 // 10KHZ
)
(
    input clk,         
    input reset,            
    output logic out_10Khz,        
    output logic out_50Mhz          
);

logic [15:0] count_10Khz = 0;       // 10Khz counter

always @(posedge clk or posedge reset) begin
    if(reset) begin
        count_10Khz <= 16'b0;
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
