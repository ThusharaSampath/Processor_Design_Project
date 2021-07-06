module MAIN_ALU
   ( input clk,
      input [15:0] data_bus_alu,
      input [15:0] data_ac_alu,
      input [3:0] op_code,
      output reg [15:0] out,
      output reg [0:0] zflag =1'd0
      );
      always @(negedge clk)
         begin
            case (op_code)
               4'b0000: {zflag,out}= {zflag,out};
               4'b0001: {zflag,out}= data_bus_alu;
               4'b0010: {zflag,out}= data_ac_alu + data_bus_alu;
               4'b0011: {zflag,out}= data_ac_alu - data_bus_alu;
               4'b0100: {zflag,out}= data_ac_alu * data_bus_alu;
               4'b0101: {zflag,out}= data_ac_alu & data_bus_alu;
               4'b0110: {zflag,out}= data_ac_alu | data_bus_alu;
               4'b0111: {zflag,out}= data_ac_alu + 1;
               4'b1000: {zflag,out}= 0;
               default:out = 0;
            endcase
            if(out == 16'd0) zflag = 1'd1;
      end
endmodule