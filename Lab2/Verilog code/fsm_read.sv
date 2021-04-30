module fsm_read(input logic clk, start, stop,
                output logic read,
					 output logic [3:0] byteenable); //data signal is 32bits (4 bytes)

					 
parameter [5:0] idle = 6'b0_0_0000;
parameter [5:0] read_state = 6'b1_1_1111; 


logic [5:0] state = idle;
assign read = state[4];
assign byteenable = state[3:0];

always_ff @(posedge clk)
begin
 case(state)
	  idle:
	  if (start) state <= read_state;
	  else state <= idle;
	  
	  read_state:
	  if (stop) state <= idle;
	  else state <= read_state;
 endcase
end

endmodule

