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
    parameter STORM = 8'd44;
   
    
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
        MEM[8]=16'd7; //base

        MEM[9]=LOAD;
        MEM[10]=16'd3;
        MEM[11]=16'd9; //i_ref
        MEM[12]=LOAD;
        MEM[13]=16'd4;
        MEM[14]=16'd12; //j_ref
        MEM[15]=LOAD;
        MEM[16]=16'd15; //address in d-memory
        MEM[17]=16'd15; //k_ref

        //clear i,j,k
        MEM[18]=CLR;
        MEM[19]=16'd8;
        MEM[20]=CLR;
        MEM[21]=16'd11;
        MEM[22]=CLR;
        MEM[23]=16'd14;

        MEM[24]=CLR;
        MEM[25]=16'd16;


        //load first number of matrix a to AC
        MEM[26]=LOADM;
        MEM[27]=16'd21;

        //move ac to r
        MEM[28]=MOVE;
        MEM[29]=16'd20;
        MEM[30]=16'd17;

        //load first number of matrix b to AC
        MEM[31]=LOADM;
        MEM[32]=16'd22;
        
        MEM[33]=MUL;

        //move ac to r
        MEM[34]=MOVE;
        MEM[35]=16'd20;
        MEM[36]=16'd17;

        //move p to ac
        MEM[37]=MOVE;
        MEM[38]=16'd16;
        MEM[39]=16'd20;

        MEM[40]=ADD;

        //move ac to p
        MEM[41]=MOVE;
        MEM[42]=16'd20;
        MEM[43]=16'd16;

        //inc j
        MEM[44]=INC;
        MEM[45]=16'd1;
        MEM[46]=16'd11;

        MEM[47]=JUMP;
        MEM[48]=16'd5;
        MEM[49]=16'd26;

        //move p to ac
        MEM[50]=MOVE;
        MEM[51]=16'd16;
        MEM[52]=16'd20;

        //store m
        MEM[53]=STORM;


        //inc k
        MEM[54]=INC;
        MEM[55]=16'd6;
        MEM[56]=16'd14;

        MEM[57]=CLR;
        MEM[58]=16'd11; //ckear j


        MEM[59]=JUMP;
        MEM[60]=16'd7;
        MEM[61]=16'd24;


        //inc i
        MEM[62]=INC;
        MEM[63]=16'd1;
        MEM[64]=16'd8;

        //move k_ref to r
        MEM[65]=MOVE;
        MEM[66]=16'd15;
        MEM[67]=16'd17;

        //move k to ac
        MEM[68]=MOVE;
        MEM[69]=16'd14;
        MEM[70]=16'd20;

        //ac = ac -r
        MEM[71]=SUB;

        //k <- ac
        MEM[72]=MOVE;
        MEM[73]=16'd20;
        MEM[74]=16'd14;

        MEM[75]=JUMP;
        MEM[76]=16'd3;
        MEM[77]=16'd24;

        MEM[78]=END;





    end
always @(posedge clk) begin
if (write == 1)
MEM[address] <= instr_in[7:0];

instr_out <= MEM[address];
end

endmodule