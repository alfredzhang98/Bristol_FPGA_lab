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
  output logic [7:0] value_12,
  output logic [7:0] value_34
);

  parameter VALUE_MAX_CLK = 200;
  parameter VALUE_MAX_MAG = 100; 
  parameter VALUE_INIT_CLK = 100;
  parameter VALUE_INIT_MAG = 50; 
  
  logic [7:0] value_temp1;
  logic [7:0] value_temp2;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      value_temp1 = 8'd100;
      value_temp2 = 8'd50;
    end
    else begin
      if (flag[0]) begin
        if (value_temp1 < VALUE_MAX_CLK - 1) begin
          value_temp1 = value_temp1 + 1;
        end
      end
      if (flag[1]) begin
        if (value_temp1 > 1) begin
          value_temp1 = value_temp1 - 1;
        end
      end
      if (flag[2]) begin
        if (value_temp2 < VALUE_MAX_MAG - 1) begin
          value_temp2 = value_temp2 + 1;
        end
      end
      if (flag[3]) begin
        if (value_temp2 > 1) begin
          value_temp2 = value_temp2 - 1;
        end
      end
    end
  end

  assign value_12 = value_temp1;
  assign value_34 = value_temp2;

endmodule

