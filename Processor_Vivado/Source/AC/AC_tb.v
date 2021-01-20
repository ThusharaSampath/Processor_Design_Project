`timescale 1ns / 1ps
module ac_tb;
    reg clk;
    reg writealu;
    reg writebus;
    reg read ;
    reg rstac;
    reg incac;
    reg [15:0] data_inalu;
    reg [15:0] data_inbus;
    wire [15:0] data_out;
    wire [15:0] data_store;
    wire zflag = 1'b0;

    parameter clk_period =10;

    ac ac (clk,writealu,writebus,read,rstac,incac,data_inalu,data_inbus,data_out,data_store,zflag);

    initial 
    begin
        clk =0;
    end

    always 
        #(clk_period/2)
        clk=~clk;
    
    initial
    begin
        writealu = 0; writebus=0; read=0; rstac=0; incac=0; data_inalu=16'd0; data_inbus=16'd0;
        #(clk_period);
        data_inalu=16'd16; writebus=1;
        #(clk_period);
        writebus=0; writealu=1;
        #(clk_period);
        data_inbus=16'd32;
        #(clk_period);
        writealu=0; writebus=1;
        #(clk_period);
        writebus=0; read=1;
        #(clk_period);
        read=0; rstac=1;
        #(clk_period);
        rstac=0; read=1;
        #(clk_period);
        read=0; incac=1;
        #(clk_period);
        incac=0; read=1;
        #(clk_period);
    end
endmodule
