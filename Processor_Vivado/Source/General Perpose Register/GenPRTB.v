module genPregtb;
    reg clk,write,read;
    reg [15:0] data_in;
    wire [15:0] data_out;
    wire [15:0] data_store;
    
    parameter clk_period = 10;

    Genaral_Purpose_Register gpr1 (clk,write,read,data_in,data_out,data_store);

    initial 
    begin
       clk = 0; 
    end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            write = 0; read = 0; data_in =16'd0;
            #(clk_period)
            data_in = 16'b0011001100110011; write =1;
            #(clk_period)
            write=0 ; read =1;
            #(clk_period)
            data_in = 16'b0011001100111111; write =0;
            #(clk_period)
            read =1;
            #(clk_period)
            read=0; data_in = 16'b0011111011111111; write =1;
            #(clk_period)
            write=0 ; read =1;
        end
endmodule