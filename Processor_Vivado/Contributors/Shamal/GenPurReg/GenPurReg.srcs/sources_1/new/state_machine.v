// write === 1
module CU(
    input clk,
    input [0:0] z,
    input [0:0] i,
    input [0:0] j,
    input [0:0] k,
    input [7:0] instruction,
    input [15:0]MDDR,

    output reg[3:0] to_ALU,
    output reg[0:0] to_DM,
    output reg[0:0] to_IM,
    output reg[5:0] to_REG,
    output reg[4:0] to_BUS,
    output reg[0:0] to_PC,
    output reg[2:0] to_AC,
    output reg[0:0] En_Select,
    output reg[0:0] RW_Select,
    output reg finish,
    output reg [7:0]current_micro_instruction
    
//    input [1:0] status
);
    reg [5:0] PS = 8'd3;
    reg [5:0] NS = 8'd0;
    parameter FETCH1 = 8'd0;
    parameter FETCH2 = 8'd1;
    parameter FETCH3 = 8'd2;
    parameter NOP = 8'd3;
    parameter END = 8'd4;
    parameter CLR1 = 8'd5;
    parameter CLR2 = 8'd6;
    parameter CLR3 = 8'd7;
    parameter LOAD1 = 8'd8;
    parameter LOAD2 = 8'd9;
    parameter LOAD3 = 8'd10;
    parameter LOAD4 = 8'd11;
    parameter LOAD5 = 8'd12;
    parameter LOAD6 = 8'd13;
    parameter LOADM1 = 8'd14;
    parameter LOADM2 = 8'd15;
    parameter LOADM3 = 8'd16;
    parameter LOADM4 = 8'd17;
    parameter STAC1 = 8'd18;
    parameter STAC2 = 8'd19;
    parameter STAC3 = 8'd20;
    parameter INC1 = 8'd21;
    parameter INC2 = 8'd22;
    parameter INC3 = 8'd23;
    parameter INC4 = 8'd24;
    parameter INC5 = 8'd25;
    parameter INC6 = 8'd26;
    parameter INCAC1 = 8'd27;
    parameter JUMP1 = 8'd28;
    parameter JUMP2 = 8'd43;
    parameter JUMPY1 = 8'd29;
    parameter JUMPY2 = 8'd30;
    parameter JUMPY3 = 8'd31;
    parameter JUMPN1 = 8'd32;
    parameter MOVE1 = 8'd33;
    parameter MOVE2 = 8'd34;
    parameter MOVE3 = 8'd35;
    parameter MOVE4 = 8'd36;
    parameter MOVE5 = 8'd37;
    parameter ADD = 8'd38;
    parameter SUB = 8'd39;
    parameter MUL = 8'd40;
    parameter AND = 8'd41;
    parameter OR = 8'd42;

    parameter STORM1 = 8'd44;
    parameter STORM2 = 8'd45;

always @(posedge clk)
begin
PS <= NS;
current_micro_instruction<=NS;
end
always @(posedge clk)
begin
if (PS == END)
finish <= 1'd1;
else
finish <= 1'd0;
end
always @(PS or z or instruction)
begin
case(PS)
NOP: begin
NS = FETCH1;
end
FETCH1: begin
to_ALU = 4'd0;
to_BUS = 5'd2;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'd0;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH2;
end
FETCH2: begin
to_ALU = 4'd0;
to_BUS = 5'd2;
to_REG = 5'd18; //6i 1i ekata kara
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'd0;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH3;
end
FETCH3: begin
to_ALU = 4'd0;
to_BUS = 5'd4;
to_REG = 5'd3;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'd0;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = instruction[7:0];
end
END: begin
NS = END;
end
CLR1: begin
to_ALU = 4'd0;
to_BUS = 5'd4;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'd0;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = CLR2;
end
CLR2: begin
to_ALU = 4'd8;
to_BUS = 5'd0;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = CLR3;
end
CLR3: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd1;
RW_Select = 1'd1;
NS = FETCH1;
end
LOAD1: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = LOAD2;
end
LOAD2: begin
to_ALU = 4'd0;
to_BUS = 5'd4;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = LOAD3;
end
LOAD3: begin
to_ALU = 4'd0;
to_BUS = 5'd2;
to_REG = 5'd19;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = LOAD4;
end
LOAD4: begin
to_ALU = 4'd1;
to_BUS = 5'd4;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = LOAD5;
end
LOAD5: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = LOAD6;
end
LOAD6: begin
to_ALU = 4'd0;
to_BUS = 5'd20;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd1;
RW_Select = 1'd1;
NS = FETCH1;
end
LOADM1: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = LOADM2;
end
LOADM2: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd1;
RW_Select = 1'd0;
NS = LOADM3;
end
LOADM3: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd5;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = LOADM4;
end
LOADM4: begin
to_ALU = 4'd1;
to_BUS = 5'd4;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end
STAC1: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = STAC2;
end
STAC2: begin
to_ALU = 4'd0;
to_BUS = 5'd4;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = STAC3;
end
STAC3: begin
to_ALU = 4'd0;
to_BUS = 5'd20;
to_REG = 5'd4;
to_IM = 1'd0;
to_DM = 1'd1;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end
INC1: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = INC2;
end
INC2: begin
to_ALU = 4'd1;
to_BUS = 5'd4;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = INC3;
end
INC3: begin
to_ALU = 4'd0;
to_BUS = 5'd2;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = INC4;
end
INC4: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = INC5;
end
INC5: begin
to_ALU = 4'd2;
to_BUS = 5'd0;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd1;
RW_Select = 1'd0;
NS = INC6;
end
INC6: begin
to_ALU = 4'd0;
to_BUS = 5'd20;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd1;
RW_Select = 1'd1;
NS = FETCH1;
end
INCAC1: begin
to_ALU = 4'd7;
to_BUS = 5'd0;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end
MOVE1: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = MOVE2;
end
MOVE2: begin
to_ALU = 4'd1;
to_BUS = 5'd0;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd1;
RW_Select = 1'd0;
NS = MOVE3;
end
MOVE3: begin
to_ALU = 4'd0;
to_BUS = 5'd2;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = MOVE4;
end
MOVE4: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = MOVE5;
end
MOVE5: begin
to_ALU = 4'd0;
to_BUS = 5'd20;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd1;
RW_Select = 1'd1;
NS = FETCH1;
end
ADD: begin
to_ALU = 4'd2;
to_BUS = 5'd17;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end
SUB: begin
to_ALU = 4'd3;
to_BUS = 5'd17;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end
MUL: begin
to_ALU = 4'd4;
to_BUS = 5'd17;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end
AND: begin
to_ALU = 4'd5;
to_BUS = 5'd17;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end
OR: begin
to_ALU = 4'd6;
to_BUS = 5'd17;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b100;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end

JUMP1: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = JUMP2;
end

JUMP2: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;

if(((MDDR==16'd0 && z==1'b1) || (MDDR==16'd2 && i==1'b1) || (MDDR==16'd4 && j==1'b1) || (MDDR==16'd6 && k==1'b1) || (MDDR==16'd1 && z==1'b0) || (MDDR==16'd3 && i==1'b0) || (MDDR==16'd5 && j==1'b0) || (MDDR==16'd7 && k==1'b0))) 
    NS = JUMPY1;
else
    NS = JUMPN1;
end

JUMPN1: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd0;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end

JUMPY1: begin
to_ALU = 4'd0;
to_BUS = 5'd2;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = JUMPY2;
end


JUMPY2: begin
to_ALU = 4'd0;
to_BUS = 5'd0;
to_REG = 5'd6;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd1;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = JUMPY3;
end

JUMPY3: begin
to_ALU = 4'd0;
to_BUS = 5'd4;
to_REG = 5'd2;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end

STORM1: begin
to_ALU = 4'd0;
to_BUS = 5'd7;
to_REG = 5'd1;
to_IM = 1'd0;
to_DM = 1'd0;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = STORM2;
end

STORM2: begin
to_ALU = 4'd0;
to_BUS = 5'd20;
to_REG = 5'd4;
to_IM = 1'd0;
to_DM = 1'd1;
to_PC = 1'd0;
to_AC = 3'b000;
En_Select = 1'd0;
RW_Select = 1'd0;
NS = FETCH1;
end





endcase

$display("current instruction: %d MDDR:- %d" ,PS,MDDR);
end
endmodule