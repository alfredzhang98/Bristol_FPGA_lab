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


module SwitchInterface(clk, reset, sw1_mag_up, sw2_mag_down, sw3_clk_up, sw3_clk_down, sw12_value, sw34_value, shake);

input clk;
input reset;
input sw1_mag_up;
input sw2_mag_down;
input sw3_clk_up;
input sw3_clk_down;
output logic [3:0] sw12_value;
output logic [3:0] sw34_value;
output logic [3:0] shake;

parameter AVOID_SHAKE = 16;
parameter VLAUE_MAX = 255;
parameter VLAUE_MIN = -255;

logic [3:0] count_switch1 = 0;  
logic [3:0] count_switch2 = 0;  
logic [3:0] count_switch3 = 0;  
logic [3:0] count_switch4 = 0;
logic signed [8:0] value12;
logic signed [8:0] value34;
logic [3:0] shake_value;

always @(posedge clk or posedge reset) begin
    if(reset) begin
        count_switch1 <= 1'b0;
        count_switch2 <= 1'b0; 
        count_switch3 <= 1'b0;
        count_switch4 <= 1'b0;
        value12 <= 1'b0;
        value34 <= 1'b0;
    end
    else begin
        //value12
        if (count_switch1 == AVOID_SHAKE - 1) begin
            if(value12 < VLAUE_MAX) begin
                value12 <= value12 + 1;
                shake_value[0] = 1'b1;         
                count_switch1 <= 0;
            end
        end
        else begin
            shake_value[0] = 1'b0;
            count_switch1 <= count_switch1 + 1;          
        end
        if (count_switch2 == AVOID_SHAKE - 1) begin
            if(value12 > VLAUE_MIN) begin
                value12 <= value12 - 1;
                shake_value[1] = 1'b1;         
                count_switch2 <= 0;  
            end  
        end
        else begin
            shake_value[1] = 1'b0; 
            count_switch2 <= count_switch2 + 1;          
        end
        //value34
        if (count_switch3 == AVOID_SHAKE - 1) begin
            if(value12 < VLAUE_MAX) begin
                value34 <= value34 + 1;
                shake_value[2] = 1'b1;         
                count_switch3 <= 0; 
            end       
        end
        else begin
            shake_value[2] = 1'b0; 
            count_switch3 <= count_switch3 + 1;          
        end
        if (count_switch4 == AVOID_SHAKE - 1) begin
            if(value12 > VLAUE_MIN) begin
                value34 <= value34 - 1;
                shake_value[3] = 1'b1;        
                count_switch4 <= 0; 
            end               
        end
        else begin
            shake_value[3] = 1'b0; 
            count_switch4 <= count_switch4 + 1;          
        end
    end
end

assign sw12_value = value12;
assign sw34_value = value34;
assign shake = shake_value;

endmodule
