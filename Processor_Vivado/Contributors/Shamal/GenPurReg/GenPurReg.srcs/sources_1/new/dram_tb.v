`timescale 1ns / 1ps

module DRAM_TB;
    reg clk,write;
    reg [15:0] data_in;
    reg [15:0] address;
    wire [15:0] data_out;
        
    parameter clk_period = 10;
     
    DRAM DRAM (clk,write,address,data_in,data_out);
     initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            write=0;address=16'd0; data_in=16'd0;
            #clk_period
            write=1;address=16'd0; data_in=16'd100;
            #clk_period
            write=1;address=16'd10; data_in=16'd200;
            #clk_period
            write=1;address=16'd65000; data_in=16'd300;
            #clk_period
            write=1;address=16'd65400; data_in=16'd400;
            #clk_period
            write=0;address=16'd10;
            #clk_period
            write=0;address=16'd65400;
            #clk_period
            write=0;address=16'd0;
            #clk_period
            write=0;address=16'd650;
            #clk_period
            write=0;address=16'd65000;
            
        end



endmodule
