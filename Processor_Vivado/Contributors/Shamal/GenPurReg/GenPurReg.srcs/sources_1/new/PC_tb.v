`timescale 1ns / 1ps

module PC_tb;
    reg clk,write,incpc,read;
    reg [15:0] data_in;
    wire [15:0] data_out;
    wire [15:0] data_store;
    parameter clk_period = 10;

    PC pc (clk,write,read,incpc,data_in,data_out,data_store);

    initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            incpc=0; write = 0; read = 0; data_in =16'd0;
            #(clk_period)
            write=1; data_in =16'd1;
            #(clk_period)
            write=0; read =1;
            #(clk_period)
            read=0; incpc=1;
            #(clk_period)
            #(clk_period)
            incpc=0; read=1;
            
    
        end
endmodule
