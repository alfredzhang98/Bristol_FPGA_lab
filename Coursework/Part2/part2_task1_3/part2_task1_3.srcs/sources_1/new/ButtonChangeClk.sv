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
module ButtonChangeClk(clk, reset, valid_clk, sw34_value, switch_clk);

//parameter DIV_FACTOR_10Khz = 10000; // 10KHZ
input clk, reset;
input valid_clk;
input logic [7:0] sw34_value;
output logic switch_clk;

logic [15:0] value_temp;
logic [15:0] count_clk;

//sw34_value 0-50 normal 25
always @(posedge clk or posedge reset) begin
    if (reset) begin
        value_temp <= 16'd5000;
        count_clk  <= 16'b0;
        switch_clk <= 1'b0;
    end
    else if(valid_clk) begin
        value_temp <= sw34_value * 50; // 50-20000
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
