module dram(
    input clk,
    input write,
    input [15:0] address,
    input [15:0] data_in,
    output reg [15:0] data_out );
    reg [15:0] MEM [65535:0];

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
                if (write == 1)
                begin
                    MEM[address] <= data_in[15:0];
                    $display("address:- %d, mem_data_in:- %d",address,data_in);
                end
                data_out <= MEM[address];
                
            end
endmodule
