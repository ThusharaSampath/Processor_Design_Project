`timescale 1ns / 1ps


module busTB;

    input clk,
    input [4:0] from_selector,
    input [4:0] from_cu,
    input [15:0] AR,
    input [15:0] PC,
    input [15:0] R,
    input [15:0] P,
    input [15:0] Mat_A,
    input [15:0] Mat_B,
    input [15:0] MDDR,
    input [15:0] AC,
    input [15:0] I,
    input [15:0] J,
    input [15:0] K,
    input [15:0] BASE,
    output reg [15:0] out) ;

    topProcessor topProcessor(clk,DM_out,IM_out,IM_in,DM_in,DM_en,IM_en,AR_out,finish,test);

    initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    initial
        begin
            IM_out=8'd8;DM_out=8'd5;
            #(clk_period);
        end
endmodule