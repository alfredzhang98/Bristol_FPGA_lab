`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 01:05:56
// Design Name: 
// Module Name: ButtonChangeClk
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


module ButtonChangeClk(clk, flag, sw34_value, switch_clk);

//parameter DIV_FACTOR_10Khz = 10000; // 10KHZ
input clk;
input logic [3:0] flag;
input logic [7:0] sw34_value;
output logic switch_clk;

logic [15:0] value_temp;
logic [15:0] count_clk;

always @(posedge clk) begin
    if(flag[2] != 1'b0 || flag[3] != 1'b0) begin
        value_temp <= 15'd10000;
        value_temp <= value_temp + (sw34_value - 100) * 40;
        count_clk  <= 16'b0;
    end
    else begin
        if (count_clk == value_temp - 1) begin
            switch_clk <= ~switch_clk;           
            count_clk  <= 0;        
        end
        else begin
            count_clk <= count_clk + 1;          
        end
    end
end

endmodule
