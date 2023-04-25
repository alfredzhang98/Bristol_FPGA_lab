module dataROM ( clock , address , dataOut );
input clock ;
input [0:8] address ;
output reg [9:0] dataOut ;

    reg [0:9] ROMData [0:511]; // data width is 10 bits ; depth is 256

    initial begin
        $readmemh ("ROMData.mem",ROMData);
    end

    always @ ( posedge clock )
    begin
        dataOut <= ROMData[address];
    end
endmodule