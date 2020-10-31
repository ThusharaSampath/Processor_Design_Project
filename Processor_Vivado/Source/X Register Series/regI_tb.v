`timescale 1ns / 1ps

module regI_tb;
    reg clk,write_i,write_iref,read_i,read_iref;
    reg [15:0] data_in;
    wire [0:0] iflag;
    wire [15:0] data_out_i;
    wire [15:0] data_out_iref;
    
    parameter clk_period = 10;
     
    Reg_X reg_x (clk,write_i,write_iref,read_i,read_iref,data_in,iflag,data_out_i,data_out_iref);
     initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            write_i = 0;write_iref=0;read_i=0;read_iref=0;data_in=16'd0;
            #(clk_period)
            write_iref = 1; data_in = 16'd5;
            #(clk_period)
            write_iref=0; write_i=1; data_in=16'd0;
            #(clk_period)
            data_in=16'd2;
            #(clk_period)
            data_in=16'd3;
            #(clk_period)
            data_in=16'd4;
            #(clk_period)
            data_in=16'd5;
            #(clk_period)
            data_in=16'd6;
            #(clk_period)
            write_iref=0; read_i=1;read_iref=1;
            #(clk_period);
            
        
        
        
        end



endmodule
