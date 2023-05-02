`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2023 09:39:59
// Design Name: 
// Module Name: ToPart2Update
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


module ToPart2Update(
    input clk, 
    input reset,
    input sw1_mag_up,
    input sw2_mag_down,
    input sw3_clk_up,
    input sw4_clk_down,
    output  logic [9:0] out
    );
    
    logic [3:0] flag_out;
    logic [7:0] value_12;
    logic [7:0] value_34;
    logic [15:0] switch_magnitude;
    logic switch_clk;
    logic out_10Khz;    
    logic out_50Mhz;
    
    SwitchInterface u_SwitchInterface(
    .clk(clk), 
    .reset(reset), 
    .sw1_mag_up(sw1_mag_up), 
    .sw2_mag_down(sw2_mag_down), 
    .sw3_clk_up(sw3_clk_up), 
    .sw4_clk_down(sw4_clk_down), 
    .flag_out(flag_out)
    );
    
    KeyFlagSettingVlaue u_KeyFlagSettingVlaue(
      .clk(clk),
      .reset(reset),
      .flag(flag_out),
      .value_12(value_12),
      .value_34(value_34)
    );
    
    BottonChangeMagnitude u_BottonChangeMagnitude(
    .clk(clk), 
    .flag(flag_out), 
    .sw12_value(value_12), 
    .switch_magnitude(switch_magnitude)
    );
    
    ButtonChangeClk u_ButtonChangeClk(
    .clk(clk), 
    .flag(flag_out), 
    .sw34_value(value_34), 
    .switch_clk(switch_clk)
    );
    
//    ClkDivider u_ClkDivider(
//        .clk(clk),
//        .reset(reset),
//        .out_10Khz(out_10Khz),
//        .out_50Mhz(out_50Mhz)
//    );
    
    DigSineGeneratorUpdate u_DigSineGeneratorUpdate(
        .clk(switch_clk),
        .reset(reset),
        .magnitude(switch_magnitude),
        .y(out)
    );
    
endmodule
