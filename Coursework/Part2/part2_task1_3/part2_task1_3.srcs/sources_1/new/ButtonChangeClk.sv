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


module ButtonChangeClk(clk, shake, sw34_value, switch_clk);


parameter DIV_FACTOR_10Khz = 10000; // 10KHZ
//0010 0111 0001 0000

input clk;
input sw34_value;
input shake;
output logic switch_clk;

logic [3:0] shake_value;
logic signed [8:0] clk_value;
logic [15:0] count_clk_value;
logic [15:0] count_clk;

always @(posedge clk) begin
    if(shake_value[0] == 1'b1 || shake_value[1] == 1'b1) begin
        count_clk       <= 1'b0;
        clk_value       <= sw34_value;
        count_clk_value <= 15'b0010011100010000;
        count_clk_value <= count_clk_value + sw34_value * 20;
    end
    else begin
        if (count_clk == count_clk_value - 1) begin
            switch_clk <= ~switch_clk;           
            count_clk <= 0;        
        end
        else begin
            count_clk <= count_clk + 1;          
        end
           
    end
end

endmodule
