module main_alu ( input clk,
                  input [15:0] bus_in,
                  input [15:0] ac_in,
                  input [2:0] op_code,
                  output reg [15:0] out,
                  output reg [0:0] zflag =1'd0
                  );
                  
                  always @(negedge clk)
                    begin
                         case (op_code)
                            4'b0000: out= out;
                            4'b0001: out= bus_in;
                            4'b0010: out= bus_in + ac_in;
                            4'b0011: out= ac_in - bus_in;
                            4'b0100: out= ac_in * bus_in;
                            4'b0101: out= ac_in & bus_in;
                            4'b0110: out= ac_in | bus_in;
                            4'b0111: out= ac_in + 1;
                            4'b1000: out= 0;
                            
                            default:out = 0;
                         endcase
//                        out= 16'd56;
                         if(out == 16'd0) zflag = 1'd1;

                        //  out = op_code;
                        
                    end
endmodule