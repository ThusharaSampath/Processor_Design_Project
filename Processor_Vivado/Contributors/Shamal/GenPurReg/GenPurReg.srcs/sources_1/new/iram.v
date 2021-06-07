module IRAM(
    input clk,
    input write,
    input [15:0] address,
    input [15:0] instr_in,
    output reg [15:0] instr_out
    );
    reg [15:0] MEM [65535:0];
    parameter FETCH = 8'd0;
    parameter NOP = 8'd1;
    parameter END = 8'd2;
    parameter CLR = 8'd3;
    parameter LOAD = 8'd4;
    parameter LOADM = 8'd5;
    parameter STAC = 8'd6;
    parameter INC1 = 8'd7;
    parameter INCAC = 8'd27;
    parameter JUMP = 8'd28;
    parameter MOVE = 8'd33;
    parameter ADD = 8'd38;
    parameter SUB = 8'd39;
    parameter MUL = 8'd40;
    parameter AND = 8'd41;
    parameter OR = 8'd42;
   
    
    initial begin
        MEM[0]=LOAD;
    end
always @(*) begin
if (write == 1)
MEM[address] <= instr_in[7:0];
else
instr_out <= MEM[address];
end
endmodule