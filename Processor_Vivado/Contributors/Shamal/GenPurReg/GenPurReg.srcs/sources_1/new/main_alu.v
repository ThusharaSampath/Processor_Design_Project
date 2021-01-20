module main_alu ( input clk,
                  input [15:0] bus_in,
                  input [15:0] ac_in,
                  input [3:0] op_code,
                  output reg [15:0] out,
                  output reg [0:0] zflag =1'd0
                  );
                  
                  always @(negedge clk)
                    begin
                        case (op_code)
                            3'd0: out= out;
                            3'd1: {zflag,out}= bus_in;
                            3'd2: {zflag,out}= bus_in + ac_in;
                            3'd3: {zflag,out}= ac_in - bus_in;
                            3'd4: {zflag,out}= ac_in * bus_in;
                            3'd5: {zflag,out}= ac_in | bus_in;
                            3'd6: {zflag,out}= ac_in & bus_in;
                            default:out= out;
                        endcase
                        if(out == 16'd0) zflag = 1'd1;
                        
                    end
endmodule
                  