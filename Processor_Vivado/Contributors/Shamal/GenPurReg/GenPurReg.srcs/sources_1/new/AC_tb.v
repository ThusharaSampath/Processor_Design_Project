`timescale 1ns / 1ps
module ac_tb;
    reg clk;
    reg writealu;
    reg readalu ;
    reg readbus ;
    reg rstac;
    reg incac;
    reg [15:0] data_inalu;
    wire [15:0] data_out_alu;
    wire [15:0] data_out_bus;
    wire [15:0] data_store;

    parameter clk_period =10;

    ac ac (clk,writealu,readalu,readbus,rstac,incac,data_inalu,data_out_alu,data_out_bus,data_store);

    initial 
    begin
        clk =0;
    end

    always 
        #(clk_period/2)
        clk=~clk;
    
    initial
    begin
        writealu = 0;readbus=0; readalu=0; rstac=0; incac=0; data_inalu=16'd0;
        #(clk_period);
        data_inalu=16'd16; writealu=1;
        #(clk_period);
        writealu=0; readalu=1;
        #(clk_period);
        readalu=0; readbus=1;
        #(clk_period);
        readbus=0; rstac=1;
        #(clk_period);
        rstac=0; readalu=1;
        #(clk_period);
        readalu=0; incac=1;
        #(clk_period);
        incac=0; readalu=1;
        #(clk_period);
        readalu=0; writealu=1; data_inalu=-2;
        
    end
endmodule
