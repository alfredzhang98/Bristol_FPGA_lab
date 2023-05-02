`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2023 17:17:51
// Design Name: 
// Module Name: FlagSettingValue
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


module FlagSettingValue(
  input clk,
  input reset,
  input logic [3:0] flag,
  output logic [7:0] value_12,
  output logic [7:0] value_34,
  output logic valid_mag,
  output logic valid_clk
);

  parameter VALUE_MAX1 = 126;//0-126
  parameter VALUE_MAX2 = 200;
  
  logic [7:0] value_temp1;
  logic [7:0] value_temp2;

always @(posedge clk or posedge reset) begin
    if (reset) begin
      value_temp1 <= 8'd70;
      valid_mag <= 1'b0;
    end
    else begin
      //0
      if (flag[0]) begin
        if (value_temp1 < VALUE_MAX1) begin
          value_temp1 <= value_temp1 + 2;
          valid_mag <= 1'b1;
        end
      end
      else if (valid_mag) begin
        valid_mag <= 1'b0;
      end 
      //1
      if (flag[1]) begin
        if (value_temp1 >= 2) begin
          value_temp1 <= value_temp1 - 2;
          valid_mag <= 1'b1;
        end
      end
      else if (valid_mag) begin
        valid_mag <= 1'b0;
      end
    end 
end
     
always @(posedge clk or posedge reset) begin
    if (reset) begin
      value_temp2 <= 8'd100;
      valid_clk <= 1'b0;
    end
    else begin
      //2
      if (flag[2]) begin
        if (value_temp2 < VALUE_MAX2) begin
          value_temp2 <= value_temp2 + 1;
          valid_clk <= 1'b1;
        end
      end
      else if (valid_clk) begin
        valid_clk <= 1'b0;
      end
      //3
      if (flag[3]) begin
        if (value_temp2 > 1) begin
          value_temp2 <= value_temp2 - 1;
          valid_clk <= 1'b1;
        end
      end
      else if (valid_clk) begin
        valid_clk <= 1'b0;
      end 
    end
end

assign value_12 = value_temp1;
assign value_34 = value_temp2;

endmodule