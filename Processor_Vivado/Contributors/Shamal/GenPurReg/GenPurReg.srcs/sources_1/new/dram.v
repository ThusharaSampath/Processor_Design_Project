module DRAM(
    input clk,
    input [3:0]write,
    input [63:0] address ,
    input [63:0] data_in ,
    output reg [63:0] data_out);
    reg [15:0] MEM [1000:0];
    initial begin    
        MEM[0]=16'd5; //mat_a_base
MEM[1]=16'd32; //mat_b_base
MEM[2]=16'd57; //mat_c_base 

MEM[3]=16'd5; //i_ref
MEM[4]=16'd5; //j_ref 

//[1, 1, 3, 0, 2]
MEM[5]=16'd1;
MEM[6]=16'd1;
MEM[7]=16'd3;
MEM[8]=16'd0;
MEM[9]=16'd2;
//[5, 2, 4, 3, 6]
MEM[10]=16'd5;
MEM[11]=16'd2;
MEM[12]=16'd4;
MEM[13]=16'd3;
MEM[14]=16'd6;
//[4, 5, 3, 5, 3]
MEM[15]=16'd4;
MEM[16]=16'd5;
MEM[17]=16'd3;
MEM[18]=16'd5;
MEM[19]=16'd3;
//[0, 3, 7, 7, 6]
MEM[20]=16'd0;
MEM[21]=16'd3;
MEM[22]=16'd7;
MEM[23]=16'd7;
MEM[24]=16'd6;
//[2, 2, 3, 3, 3]
MEM[25]=16'd2;
MEM[26]=16'd2;
MEM[27]=16'd3;
MEM[28]=16'd3;
MEM[29]=16'd3;

MEM[30]=16'd5; //j_ref
MEM[31]=16'd5; //k_ref

//[4, 2, 1, 7, 3]
MEM[32]=16'd4;
MEM[33]=16'd2;
MEM[34]=16'd1;
MEM[35]=16'd7;
MEM[36]=16'd3;
//[2, 2, 9, 4, 9]
MEM[37]=16'd2;
MEM[38]=16'd2;
MEM[39]=16'd9;
MEM[40]=16'd4;
MEM[41]=16'd9;
//[3, 3, 2, 8, 7]
MEM[42]=16'd3;
MEM[43]=16'd3;
MEM[44]=16'd2;
MEM[45]=16'd8;
MEM[46]=16'd7;
//[2, 1, 4, 3, 1]
MEM[47]=16'd2;
MEM[48]=16'd1;
MEM[49]=16'd4;
MEM[50]=16'd3;
MEM[51]=16'd1;
//[9, 2, 1, 9, 7]
MEM[52]=16'd9;
MEM[53]=16'd2;
MEM[54]=16'd1;
MEM[55]=16'd9;
MEM[56]=16'd7;

//results should be..
//[33, 17, 18, 53, 47]
//[96, 41, 49, 138, 106]
//[72, 38, 78, 114, 104]
//[95, 46, 75, 143, 125]
//[54, 26, 41, 82, 69]

    end
        always @(posedge clk)
            begin
                if (write[0:0] == 1)
                begin
                    MEM[address[15:0]] <= data_in[15:0];
                    $display("address0:- %d, mem_data_in0:- %d",address[15:0],data_in[15:0]);
                end
                if (write[1:1] == 1)
                begin
                    MEM[address[31:16]] <= data_in[31:16];
                    $display("address1:- %d, mem_data_in1:- %d",address[31:16],data_in[31:16]);
                end
                if (write[2:2] == 1)
                begin
                    MEM[address[47:32]] <= data_in[47:32];
                    $display("address2:- %d, mem_data_in2:- %d",address[47:32],data_in[47:32]);
                end
                if (write[3:3] == 1)
                begin
                    MEM[address[63:48]] <= data_in[63:48];
                    $display("address3:- %d, mem_data_in3:- %d",address[63:48],data_in[63:48]);
                end
                data_out[15:0] <= MEM[address[15:0]];
                data_out[31:16] <= MEM[address[31:16]];
                data_out[47:32] <= MEM[address[47:32]];
                data_out[63:48] <= MEM[address[63:48]];
        end
endmodule
