module dram(
    input clk,
    input write,
    input [15:0] address,
    input [15:0] data_in,
    output reg [15:0] data_out );
    reg [15:0] MEM [65535:0];

    initial begin
        MEM[0]=16'd4; //mat_a_base
        MEM[1]=16'd10; //mat_b_base

        MEM[2]=16'd2; //i_ref
        MEM[3]=16'd2; //j_ref
        //[1,2]
        //[3,4]
        MEM[4]=16'd1; 
        MEM[5]=16'd2;  
        MEM[6]=16'd3;
        MEM[7]=16'd4;

        MEM[8]=16'd2;  //j_ref
        MEM[9]=16'd2;  //k_ref
        //[5,6]
        //[7,8]
        MEM[10]=16'd5;
        MEM[11]=16'd6;
        MEM[12]=16'd7;
        MEM[13]=16'd8;
    end

        always @(posedge clk)
            begin
                if (write == 1)
                MEM[address] <= data_in[15:0];
                data_out <= MEM[address];
            end
endmodule
