`timescale 1ns / 1ps



module MAIN_ALU_TB;
    reg clk;
    reg [15:0] bus_in;
    reg [15:0] ac_in;
    reg [3:0] op_code;
    wire [15:0] out;
    wire zflag;
    parameter clk_period = 10;
       
    MAIN_ALU ALU (clk,bus_in,ac_in,op_code,out,zflag);
       
    initial 
        begin
            clk = 0; 
        end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            bus_in = 16'd0;ac_in=16'd0;op_code=3'd0;
            #(clk_period);
            op_code = 3'd0;bus_in=16'd41;ac_in=16'd41;
            #(clk_period);
            op_code = 3'd1;
            #(clk_period);
            op_code = 3'd2;
            #(clk_period);
            op_code = 3'd3;
            #(clk_period);
            op_code = 3'd4;
            #(clk_period);
            op_code = 3'd5;
            
               
        end
endmodule
