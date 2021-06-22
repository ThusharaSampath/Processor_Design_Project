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

        //loading

        //load base a
        //load base b
        //load i_ref
        //load j_ref
        //load k_ref

        MEM[0]=LOAD;
        MEM[1]=16'd0;
        MEM[2]=16'd10; //mat_a
        MEM[3]=LOAD;
        MEM[4]=16'd1;
        MEM[5]=16'd13; //mat_a
        MEM[6]=LOAD;
        MEM[7]=16'd2;
        MEM[8]=16'd9; //i_ref
        MEM[9]=LOAD;
        MEM[10]=16'd3;
        MEM[11]=16'd12; //j_ref
        MEM[12]=LOAD;
        MEM[13]=16'd9;
        MEM[14]=16'd15; //k_ref

        //clear i,j,k
        MEM[15]=CLR;
        MEM[16]=16'd8;
        MEM[17]=CLR;
        MEM[18]=16'd11;
        MEM[19]=CLR;
        MEM[20]=16'd14;

        MEM[21]=CLR;
        MEM[22]=16'd16;


        //load first number of matrix a to AC
        MEM[23]=LOADM;
        MEM[24]=16'd21;

        //move ac to r
        MEM[25]=MOVE;
        MEM[26]=16'd20;
        MEM[27]=16'd17;

        //load first number of matrix b to AC
        MEM[28]=LOADM;
        MEM[29]=16'd22;
        
        MEM[30]=MUL;

        //move ac to r
        MEM[31]=MOVE;
        MEM[32]=16'd20;
        MEM[33]=16'd17;

        //move p to ac
        MEM[34]=MOVE;
        MEM[35]=16'd16;
        MEM[36]=16'd20;

        MEM[37]=ADD;

        //move ac to p
        MEM[38]=MOVE;
        MEM[39]=16'd20;
        MEM[40]=16'd16;

        //inc j
        MEM[41]=INC;
        MEM[42]=16'd1;
        MEM[43]=16'd11;

        MEM[44]=JUMP;
        MEM[45]=16'd5;
        MEM[46]=16'd23;

        //inc k
        MEM[47]=INC;
        MEM[48]=16'd1;
        MEM[49]=16'd14;

        MEM[50]=CLR;
        MEM[51]=16'd11;

        MEM[52]=JUMP;
        MEM[53]=16'd7;
        MEM[54]=16'd21;


        //inc i
        MEM[55]=INC;
        MEM[56]=16'd1;
        MEM[57]=16'd8;

        MEM[58]=CLR;
        MEM[59]=16'd14;

        MEM[60]=JUMP;
        MEM[61]=16'd3;
        MEM[62]=16'd21;







    end
always @(posedge clk) begin
if (write == 1)
MEM[address] <= instr_in[7:0];

instr_out <= MEM[address];
end

endmodule