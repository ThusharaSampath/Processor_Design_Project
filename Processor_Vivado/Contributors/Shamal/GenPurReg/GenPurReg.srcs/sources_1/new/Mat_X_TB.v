module Mat_X_TB;
    reg clk;
    reg [15:0] X_Ref;
    reg [15:0] X;
    reg [15:0] Base; 
    reg [15:0] Y;
    wire [15:0] Mat_data_out;
    parameter clk_period = 10;
    MAT_X MAT_X (clk,X_Ref,X,Base,Y,Mat_data_out);
 initial 
        begin
            clk = 0; 
        end
    
    always
        #(clk_period/2)
        clk = ~clk;
    
    initial
        begin
            X_Ref = 16'd5;X=16'd3;Base=16'd0;Y=16'd2;
            #(clk_period);
            X_Ref = 16'd5;X=16'd3;Base=16'd0;Y=16'd3;
            #(clk_period);
            X_Ref = 16'd5;X=16'd2;Base=16'd0;Y=16'd2;
            #(clk_period);
        
        end
endmodule
