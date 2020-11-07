module IRAM(
    input clk,
    input w_en,
    input [15:0] address,
    input [15:0] instr_in,
    output reg [15:0] instr_out
    );
    reg [15:0] MEM [180:0];
    parameter LDAC = 8'd3;
    parameter ACTOR = 8'd5;
    parameter ACTOR1 = 8'd6;
    parameter ACTOR2 = 8'd7;
    parameter ACTOR3 = 8'd8;
    parameter ACTOR4 = 8'd9;
    parameter ACTOR5 = 8'd10;
    parameter ACTODAR = 8'd11;
    parameter RTOAC = 8'd12;
    parameter R1TOAC = 8'd13;
    parameter R2TOAC = 8'd14;
    parameter R3TOAC = 8'd15;
    parameter R4TOAC = 8'd16;
    parameter R5TOAC = 8'd17;
    parameter DARTOAC = 8'd18;
    parameter STAC = 8'd19;
    parameter ADD = 8'd20;
    parameter SUB = 8'd22;
    parameter SHIFTLEFT = 8'd24;
    parameter SHIFTRIGH = 8'd26;
    parameter INAC = 8'd28;
    parameter INDAR = 8'd29;
    parameter INR1 = 8'd30;
    parameter INR2 = 8'd31;
    parameter INR3 = 8'd32;
    parameter LDIM = 8'd33;
    parameter JMPZ = 8'd35;
    parameter JMPNZ = 8'd39;
    parameter JMP = 8'd40;
    parameter NOP = 8'd41;
    parameter ENDOP = 8'd42;
    
    initial begin
    MEM[0] = LDIM;
    end
always @(posedge clk) begin
if (w_en == 1)
MEM[address] <= instr_in[7:0];
else
instr_out <= MEM[address];
end
endmodule