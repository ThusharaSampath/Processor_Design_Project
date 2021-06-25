module dram(
    input clk,
    input [3:0]write,
    input [63:0] address ,
    input [63:0] data_in ,
    output reg [63:0] data_out);
    reg [15:0] MEM [1000:0];

    initial begin
        MEM[0]=16'd5; //mat_a_base
        MEM[1]=16'd16; //mat_b_base
        MEM[2]=16'd25;

        MEM[3]=16'd3; //i_ref
        MEM[4]=16'd3; //j_ref
        //[1,2,3]
        //[4,5,6]
        //[7,8,9]
        MEM[5]=16'd1; 
        MEM[6]=16'd2;  
        MEM[7]=16'd3;
        MEM[8]=16'd4;
        MEM[9]=16'd5; 
        MEM[10]=16'd6;  
        MEM[11]=16'd7;
        MEM[12]=16'd8;
        MEM[13]=16'd9;

        MEM[14]=16'd3;  //j_ref
        MEM[15]=16'd3;  //k_ref
        //[5,6,7]
        //[7,8,7]
        //[1,4,9]
        MEM[16]=16'd5;
        MEM[17]=16'd6;
        MEM[18]=16'd7;
        MEM[19]=16'd7;
        MEM[20]=16'd8;
        MEM[21]=16'd7;
        MEM[22]=16'd1;
        MEM[23]=16'd4;
        MEM[24]=16'd9;
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
