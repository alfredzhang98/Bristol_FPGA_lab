`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 14:35:48
// Design Name: 
// Module Name: KeyFlagSettingVlaue
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

module KeyFlagSettingVlaue(
  input clk,
  input reset,
  input logic [3:0] flag,
  output logic value_change,
  output logic signed [8:0] value_12,
  output logic signed [8:0] value_34
);

  parameter VALUE_MAX_CLK = 255;
  parameter VALUE_MIN_CLK = -255;
  parameter VALUE_MAX_MAG = 50; 
  parameter VALUE_MIN_MAG = -50;
  
  logic signed [8:0] value_temp1;
  logic signed [8:0] value_temp2;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      value_temp1 = 0;
      value_temp2 = 0;
    end
    else begin
      if (flag[0]) begin
        if (value_temp1 < VALUE_MAX_MAG) begin
          value_temp1 = value_temp1 + 1;
        end
      end
      if (flag[1]) begin
        if (value_temp1 > VALUE_MIN_MAG) begin
          value_temp1 = value_temp1 - 1;
        end
      end
      if (flag[2]) begin
        if (value_temp2 < VALUE_MAX_CLK) begin
          value_temp2 = value_temp2 + 1;
        end
      end
      if (flag[3]) begin
        if (value_temp2 > VALUE_MIN_CLK) begin
          value_temp2 = value_temp2 - 1;
        end
      end
    end
  end

  assign value_12 = value_temp1;
  assign value_34 = value_temp2;

endmodule

