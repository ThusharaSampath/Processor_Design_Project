module IRAM(
    input clk,
    input [3:0]write,
    input [63:0] address,
    input [63:0] instr_in,
    output reg [63:0] instr_out
    );
    reg [15:0] MEM [1000:0];
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
    parameter STORM = 8'd44;
   
    
    initial begin
        
//Comment:- load 0 BASE_A
MEM[0] = LOAD;
MEM[1] = 16'd0;
MEM[2] = 16'd10;

//Comment:- load 1 BASE_B
MEM[3] = LOAD;
MEM[4] = 16'd1;
MEM[5] = 16'd13;

//Comment:- load 2 BASE_C
MEM[6] = LOAD;
MEM[7] = 16'd2;
MEM[8] = 16'd7;

//Comment:- load 3 i_ref
MEM[9] = LOAD;
MEM[10] = 16'd3;
MEM[11] = 16'd9;

//Comment:- load 4 j_ref
MEM[12] = LOAD;
MEM[13] = 16'd4;
MEM[14] = 16'd12;

//Comment:- load 15 k_ref
MEM[15] = LOAD;
MEM[16] = 16'd15;
MEM[17] = 16'd15;

//Comment:- clr i
MEM[18] = CLR;
MEM[19] = 16'd8;

//Comment:- move PRO_ID k
MEM[20] = MOVE;
MEM[21] = 16'd23;
MEM[22] = 16'd14;

//Comment:- :TAG6
//TAG6

//Comment:- jump i_flag TAG1
MEM[23] = JUMP;
MEM[24] = 16'd2;
MEM[25] = 16'd86;

//Comment:- :TAG5
//TAG5

//Comment:- jump k_flag TAG2
MEM[26] = JUMP;
MEM[27] = 16'd6;
MEM[28] = 16'd70;

//Comment:- clr P
MEM[29] = CLR;
MEM[30] = 16'd16;

//Comment:- clr j
MEM[31] = CLR;
MEM[32] = 16'd11;

//Comment:- :TAG4
//TAG4

//Comment:- jump j_flag TAG3
MEM[33] = JUMP;
MEM[34] = 16'd4;
MEM[35] = 16'd60;

//Comment:- loadm MAT_A
MEM[36] = LOADM;
MEM[37] = 16'd21;

//Comment:- move AC R
MEM[38] = MOVE;
MEM[39] = 16'd20;
MEM[40] = 16'd17;

//Comment:- loadm MAT_B
MEM[41] = LOADM;
MEM[42] = 16'd22;

//Comment:- mul
MEM[43] = MUL;

//Comment:- move AC R
MEM[44] = MOVE;
MEM[45] = 16'd20;
MEM[46] = 16'd17;

//Comment:- move P AC
MEM[47] = MOVE;
MEM[48] = 16'd16;
MEM[49] = 16'd20;

//Comment:- add
MEM[50] = ADD;

//Comment:- move AC P
MEM[51] = MOVE;
MEM[52] = 16'd20;
MEM[53] = 16'd16;

//Comment:- inc 1 j
MEM[54] = INC;
MEM[55] = 16'd1;
MEM[56] = 16'd11;

//Comment:- jump nj_flag TAG4
MEM[57] = JUMP;
MEM[58] = 16'd5;
MEM[59] = 16'd33;

//Comment:- :TAG3
//TAG3

//Comment:- move P AC
MEM[60] = MOVE;
MEM[61] = 16'd16;
MEM[62] = 16'd20;

//Comment:- storm
MEM[63] = STORM;

//Comment:- inc 3 k
MEM[64] = INC;
MEM[65] = 16'd4;
MEM[66] = 16'd14;

//Comment:- jump nk_flag TAG5
MEM[67] = JUMP;
MEM[68] = 16'd7;
MEM[69] = 16'd26;

//Comment:- :TAG2
//TAG2

//Comment:- inc 1 i
MEM[70] = INC;
MEM[71] = 16'd1;
MEM[72] = 16'd8;

//Comment:- move k_ref R
MEM[73] = MOVE;
MEM[74] = 16'd15;
MEM[75] = 16'd17;

//Comment:- move k AC
MEM[76] = MOVE;
MEM[77] = 16'd14;
MEM[78] = 16'd20;

//Comment:- sub
MEM[79] = SUB;

//Comment:- move AC k
MEM[80] = MOVE;
MEM[81] = 16'd20;
MEM[82] = 16'd14;

//Comment:- jump ni_flag TAG6
MEM[83] = JUMP;
MEM[84] = 16'd3;
MEM[85] = 16'd23;

//Comment:- :TAG1
//TAG1

//Comment:- end
MEM[86] = END;





    end
always @(posedge clk) 
begin
                if (write[0:0] == 1)
                begin
                    MEM[address[15:0]] <= instr_in[15:0];
                end
                if (write[1:1] == 1)
                begin
                    MEM[address[31:16]] <= instr_in[31:16];
                end
                if (write[2:2] == 1)
                begin
                    MEM[address[47:32]] <= instr_in[47:32];
                end
                if (write[3:3] == 1)
                begin
                    MEM[address[63:48]] <= instr_in[63:48];
                end
                instr_out[15:0] <= MEM[address[15:0]];
                instr_out[31:16] <= MEM[address[31:16]];
                instr_out[47:32] <= MEM[address[47:32]];
                instr_out[63:48] <= MEM[address[63:48]];
                
            end

endmodule