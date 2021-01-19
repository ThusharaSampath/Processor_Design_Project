module CU(
    input clk,
    input [15:0] z,
    input [15:0] instruction,
    output reg[2:0] to_alu,
    output reg[15:0] w_en,
    output reg[15:0] inc,
    output reg[3:0] r_en,
    output reg finish,
    input [1:0] status
);
reg [5:0] PS = 6'd0;
reg [5:0] NS = 6'd0;
localparam
IDLE = 6'd0,
FETCH1 = 6'd1,
FETCH2 = 6'd2,
FETCHX = 6'd44,
LDAC1 = 6'd3,
LDAC2 = 6'd4,
LDAC1X = 6'd50,
LDAC2X = 6'd51,
ACTOR = 6'd5,
ACTOR1 = 6'd6,
ACTOR2 = 6'd7,
ACTOR3 = 6'd8,
ACTOR4 = 6'd9,
ACTOR5 = 6'd10,
ACTODAR = 6'd11,
RTOAC = 6'd12,
R1TOAC = 6'd13,
R2TOAC = 6'd14,
R3TOAC = 6'd15,
R4TOAC = 6'd16,
R5TOAC = 6'd17,
DARTOAC = 6'd18,
STAC = 6'd19,
STAC2 = 6'd43,
STACX = 6'd49,
STACY = 6'd52,
ADD1 = 6'd20,
ADD2 = 6'd21,
SUB1 = 6'd22,
SUB2 = 6'd23,
SHIFTLEFT1 = 6'd24,
SHIFTLEFT2 = 6'd25,
SHIFTRIGHT1 = 6'd26,
SHIFTRIGHT2 = 6'd27,
INAC = 6'd28,
INDAR = 6'd29,
INR1 = 6'd30,
INR2 = 6'd31,
INR3 = 6'd32,
LDIM1 = 6'd33,
LDIM2 = 6'd34,
LDIMX = 6'd45,
JMPZ1 = 6'd35,
JMPZ2 = 6'd36,
JMPZ3 = 6'd37,
JMPZ4 = 6'd38,
JMPZ2X = 6'd46,
JMPZ3X = 6'd47,
JMPZ4X = 6'd48,
JMPNZ1 = 6'd39,
JMP1 = 6'd40,
NOP = 6'd41,
ENDOP = 6'd42;
always @(posedge clk)
PS <= NS;
always @(posedge clk)
begin
if (PS == ENDOP)
finish <= 1'd1;
else
finish <= 1'd0;
end
always @(PS or z or instruction or status)
case(PS)
IDLE: begin
if (status == 2'b01)
NS = FETCH1;
else
NS = IDLE;
end
FETCH1: begin
NS = FETCHX;
end
FETCHX: begin
NS = FETCH2;
end
FETCH2: begin
NS = instruction[5:0];
end
LDAC1: begin
NS = LDAC1X;
end