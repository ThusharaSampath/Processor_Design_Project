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
                            3'b000: out= out;
                            3'b001: out= bus_in;
                            3'b010: out= bus_in + ac_in;
                            3'b011: out= ac_in - bus_in;
                            3'b100: out= ac_in * bus_in;
                            3'b101: out= ac_in & bus_in;
                            3'b110: out= ac_in | bus_in;
                            
                            default:out = 0;
                         endcase
//                        out= 16'd56;
                         if(out == 16'd0) zflag = 1'd1;

                        //  out = op_code;
                        
                    end
endmodule