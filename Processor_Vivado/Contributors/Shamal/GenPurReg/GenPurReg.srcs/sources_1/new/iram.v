module IRAM(
    input clk,
    input write,
    input [15:0] address,
    input [15:0] instr_in,
    output reg [15:0] instr_out
    );
    reg [15:0] MEM [65535:0];
    parameter FETCH = 8'd0;
    parameter NOP = 8'd3;
    parameter END = 8'd4;
    parameter CLR = 8'd5;
    parameter LOAD = 8'd8;
    parameter LOADM = 8'd14;
    parameter STAC = 8'd18;
    parameter INC = 8'd21;
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
        MEM[1]=16'd0;
        MEM[2]=16'd17;
        MEM[3]=LOAD;
        MEM[4]=16'd1;
        MEM[5]=16'd0;
        MEM[6]=INCAC;
        MEM[7]=ADD;
        MEM[8]=STAC;
        MEM[9]=16'd2;
        MEM[10]=LOAD;
        MEM[11]=16'd2;
        MEM[12]=16'd17;
        MEM[13]=CLR;
        MEM[14]=16'd0;
        // MEM[15]=INC;         Not Working
        // MEM[16]=16'd3;
        // MEM[17]=16'd17;
        MEM[15]=MOVE;
        MEM[16]=16'd0;
        MEM[17]=16'd17;

    end
always @(posedge clk) begin
if (write == 1)
MEM[address] <= instr_in[7:0];

instr_out <= MEM[address];
end

endmodule