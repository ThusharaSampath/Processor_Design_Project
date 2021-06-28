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
                            4'b0000: {zflag,out}= {zflag,out};
                            4'b0001: {zflag,out}= bus_in;
                            4'b0010: {zflag,out}= bus_in + ac_in;
                            4'b0011: {zflag,out}= ac_in - bus_in;
                            4'b0100: {zflag,out}= ac_in * bus_in;
                            4'b0101: {zflag,out}= ac_in & bus_in;
                            4'b0110: {zflag,out}= ac_in | bus_in;
                            4'b0111: {zflag,out}= ac_in + 1;
                            4'b1000: {zflag,out}= 0;
                            
                            default:out = 0;
                         endcase
//                        out= 16'd56;
                         if(out == 16'd0) zflag = 1'd1;

                         $display("out :- %d z:- %d",out,zflag);
                    end
endmodule