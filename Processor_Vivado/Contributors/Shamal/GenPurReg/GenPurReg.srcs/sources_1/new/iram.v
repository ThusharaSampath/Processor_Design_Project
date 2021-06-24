module IRAM(
    input clk,
    input [3:0]write,
    input [63:0] address,
    input [63:0] instr_in,
    output reg [63:0] instr_out
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
        MEM[22]=MOVE;
        MEM[23]=16'd23;
        MEM[24]=16'd14;



        MEM[25]=CLR;
        MEM[26]=16'd16;


        //load first number of matrix a to AC
        MEM[27]=LOADM;
        MEM[28]=16'd21;

        //move ac to r
        MEM[29]=MOVE;
        MEM[30]=16'd20;
        MEM[31]=16'd17;

        //load first number of matrix b to AC
        MEM[32]=LOADM;
        MEM[33]=16'd22;
        
        MEM[34]=MUL;

        //move ac to r
        MEM[35]=MOVE;
        MEM[36]=16'd20;
        MEM[37]=16'd17;

        //move p to ac
        MEM[38]=MOVE;
        MEM[39]=16'd16;
        MEM[40]=16'd20;

        MEM[41]=ADD;

        //move ac to p
        MEM[42]=MOVE;
        MEM[43]=16'd20;
        MEM[44]=16'd16;

        //inc j
        MEM[45]=INC;
        MEM[46]=16'd1;
        MEM[47]=16'd11;

        MEM[48]=JUMP;
        MEM[49]=16'd5;
        MEM[50]=16'd27;

        //move p to ac
        MEM[51]=MOVE;
        MEM[52]=16'd16;
        MEM[53]=16'd20;

        //store m
        MEM[54]=STORM;


        //inc k
        MEM[55]=INC;
        MEM[56]=16'd3;
        MEM[57]=16'd14;

        MEM[58]=CLR;
        MEM[59]=16'd11; //ckear j


        MEM[60]=JUMP;
        MEM[61]=16'd7;
        MEM[62]=16'd25;


        //inc i
        MEM[63]=INC;
        MEM[64]=16'd1;
        MEM[65]=16'd8;

        //move k_ref to r
        MEM[66]=MOVE;
        MEM[67]=16'd15;
        MEM[68]=16'd17;

        //move k to ac
        MEM[69]=MOVE;
        MEM[70]=16'd14;
        MEM[71]=16'd20;

        //ac = ac -r
        MEM[72]=SUB;

        //k <- ac
        MEM[73]=MOVE;
        MEM[74]=16'd20;
        MEM[75]=16'd14;

        MEM[76]=JUMP;
        MEM[77]=16'd3;
        MEM[78]=16'd25;

        MEM[79]=END;






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