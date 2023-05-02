`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Company: 
// Engineer: 
// 
// Create Date: 30.04.2023 01:07:20
// Design Name: 
// Module Name: SwitchInterface
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


module SwitchInterface(clk, reset, sw1_mag_up, sw2_mag_down, sw3_clk_up, sw4_clk_down, flag_out);

input clk;
input reset;
input sw1_mag_up;
input sw2_mag_down;
input sw3_clk_up;
input sw4_clk_down;
//flagflag_out
//0: sw1_mag_up
//1: sw2_mag_down
//2: sw3_clk_up
//3: sw4_clk_down
output logic [3:0] flag_out;

//avoid shake for 20ms
//10ns * 1000000 = 10 ms
//parameter AVOID_SHAKE = 32'd10;
parameter AVOID_SHAKE = 32'd1_000;

logic [31:0] count_switch1 = 0;  
logic [31:0] count_switch2 = 0;  
logic [31:0] count_switch3 = 0;  
logic [31:0] count_switch4 = 0;

logic [3:0] flag;

//sw1_mag_up
always @(posedge clk or posedge reset) begin
    if(reset) begin
        count_switch1 <= 32'b0;
    end
    else if(sw1_mag_up == 1'b0) begin
        count_switch1 <= 32'b0;
    end
    else if(sw1_mag_up == 1'b1 && count_switch1 == AVOID_SHAKE) begin
        count_switch1 <= count_switch1;
    end
    else begin
        count_switch1 <= count_switch1 + 1;
    end
 end
 
always @(posedge clk or posedge reset) begin
    if(reset) begin
        flag[0] <= 1'b0;
    end
    else if(count_switch1 == AVOID_SHAKE - 1'b1) begin
        flag[0] <= 1'b1;
    end
    else begin
        flag[0] <= 1'b0;
    end
end

//sw2_mag_down
always @(posedge clk or posedge reset) begin
    if(reset) begin
        count_switch2 <= 32'b0;
    end
    else if(sw2_mag_down == 1'b0) begin
        count_switch2 <= 32'b0;
    end
    else if(sw2_mag_down == 1'b1 && count_switch2 == AVOID_SHAKE) begin
        count_switch2 <= count_switch2;
    end
    else begin
        count_switch2 <= count_switch2 + 1;
    end
 end
 
always @(posedge clk or posedge reset) begin
    if(reset) begin
        flag[1] <= 1'b0;
    end
    else if(count_switch2 == AVOID_SHAKE - 1'b1) begin
        flag[1] <= 1'b1;
    end
    else begin
        flag[1] <= 1'b0;
    end
end

//sw3_clk_up
always @(posedge clk or posedge reset) begin
    if(reset) begin
        count_switch3 <= 32'b0;
    end
    else if(sw3_clk_up == 1'b0) begin
        count_switch3 <= 32'b0;
    end
    else if(sw3_clk_up == 1'b1 && count_switch3 == AVOID_SHAKE) begin
        count_switch3 <= count_switch3;
    end
    else begin
        count_switch3 <= count_switch3 + 1;
    end
 end
 
always @(posedge clk or posedge reset) begin
    if(reset) begin
        flag[2] <= 1'b0;
    end
    else if(count_switch3 == AVOID_SHAKE - 1'b1) begin
        flag[2] <= 1'b1;
    end
    else begin
        flag[2] <= 1'b0;
    end
end

//sw4_clk_down
always @(posedge clk or posedge reset) begin
    if(reset) begin
        count_switch4 <= 32'b0;
    end
    else if(sw4_clk_down == 1'b0) begin
        count_switch4 <= 32'b0;
    end
    else if(sw4_clk_down == 1'b1 && count_switch4 == AVOID_SHAKE) begin
        count_switch4 <= count_switch4;
    end
    else begin
        count_switch4 <= count_switch4 + 1;
    end
 end
 
always @(posedge clk or posedge reset) begin
    if(reset) begin
        flag[3] <= 1'b0;
    end
    else if(count_switch4 == AVOID_SHAKE - 1'b1) begin
        flag[3] <= 1'b1;
    end
    else begin
        flag[3] <= 1'b0;
    end
end

assign flag_out = flag;

endmodule