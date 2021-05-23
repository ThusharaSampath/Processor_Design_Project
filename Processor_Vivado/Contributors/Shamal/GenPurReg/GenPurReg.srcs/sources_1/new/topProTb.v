`timescale 1ns / 1ps

module topProTb;
    reg clk;
    reg [15:0]DM_out;
    reg [15:0]IM_out;
    wire  [15:0]IM_in,DM_in,AR_out;
    wire  DM_en,IM_en,finish;
    parameter clk_period = 10;

    topProcessor topProcessor(clk,DM_out,IM_out,IM_in,DM_in,DM_en,IM_en,AR_out,finish);

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
