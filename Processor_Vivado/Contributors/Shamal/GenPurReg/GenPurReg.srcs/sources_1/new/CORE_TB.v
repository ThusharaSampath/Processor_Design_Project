`timescale 1ns / 1ps

module CORE_TB;
    reg clk;
    reg [15:0]DM_out;
    reg [15:0]IM_out;
    wire [15:0]IM_in,DM_in,AR_out;
    wire [15:0]test;
    wire [15:0]test2;
    wire [4:0] test3;
    wire  DM_en,IM_en,finish;
    parameter clk_period = 10;

    CORE CORE(clk,DM_out,IM_out,IM_in,DM_in,DM_en,IM_en,AR_out,finish,test,test2,test3);

    initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    initial
        begin
            #(clk_period/2);
            #(clk_period);
            IM_out=8'd8;DM_out=8'd0;
            #(clk_period/2);
            #(clk_period);
            IM_out=8'd100;DM_out=8'd25;
            #(clk_period);
        end
endmodule