`timescale 1ns / 1ps

module REG_X_TB;
    reg clk,write_x,write_xref;
    reg [15:0] data_in;
    wire [0:0] xflag;
    wire [15:0] data_out_x;
    wire [15:0] data_out_xref;
    
    parameter clk_period = 10;
     
    REG_X REG_X (clk,write_x,write_xref,data_in,xflag,data_out_x,data_out_xref);
     initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            write_x = 0;write_xref=0;read_i=0;read_iref=0;data_in=16'd0;
            #(clk_period)
            write_xref = 1; data_in = 16'd5;
            #(clk_period)
            write_xref=0; write_x=1; data_in=16'd0;
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
            write_xref=0; read_i=1;read_iref=1;
            #(clk_period);
            
        
        
        
        end



endmodule
