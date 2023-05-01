`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2023 09:39:08
// Design Name: 
// Module Name: Testbench
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



module Testbench ();

    logic clock;
    logic reset;
    logic [9:0] out;
    
    TopPart1 u_TopPart1(
    .clock(clock), 
    .reset(reset), 
    .out(out)
    );
    

    initial begin
        clock = 0;
        reset = 1;
        #10;
        reset = 0;
        #10000;
        $finish;
    end
    
    integer fd ;
    initial fd = $fopen ("./../../../../out.txt", "w");

    always @ ( posedge clock ) begin
        $fwrite (fd, "%d \n ", out);
    end
    
    always #10 clock = ~ clock ;

endmodule

