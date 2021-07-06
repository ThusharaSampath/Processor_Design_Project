`timescale 1ns / 1ps
module AC (
    input clk,
    input [2:0]write,
    input [15:0] data_alu_ac,
    output reg [15:0] data_out );
    always @(*) 
        begin
        if (write==3'b100) data_out = data_alu_ac;
        end
endmodule