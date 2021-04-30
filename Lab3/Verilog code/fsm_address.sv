module fsm_address(input logic clk, start, stop, forw, backw, restart, stimulus,
                   output logic [22:0] address = 0,
						 output logic [3:0] state = 4'b0000);
						 
						 
parameter [3:0] idle = 4'b0000;
parameter [3:0] forward = 4'b0001;
parameter [3:0] for_stop = 4'b0010;
parameter [3:0] for_stop_re = 4'b0011;
parameter [3:0] restart_for = 4'b0100;
parameter [3:0] backward = 4'b0101;
parameter [3:0] back_stop = 4'b0110;
parameter [3:0] back_stop_re = 4'b0111;
parameter [3:0] restart_back = 4'b1000;


always_ff @(posedge clk)
begin

case(state)
 idle:
 if (start) state <= forward;
 else state <= idle;

 
 forward:
 if (stop) state <= for_stop;
 else if (backw) state <= backward;
 else if (stimulus)
 begin
 state <= forward;
 if (address == 23'h7FFFF) address <= 0;
 else address <= address + 1;
 end
 else if (restart)
 address <= 0;
 else 
 state <= forward;
 
 
 for_stop:
 if (start) state <= forward;
 else if (backw) state <= back_stop;
 else if (restart)
 address <= 0;
 else
 begin
 state <= for_stop;
 address <= address;
 end
 
 
 backward:
 if (stop) state <= back_stop;
 else if (forw) state <= forward;
 else if (stimulus)
 begin
 state <= backward;
 if (address == 0) address <= 23'h7FFFF;
 else address <= address - 1;
 end
 else if (restart)
 address <= 23'h7FFFF;
 else 
 state <= backward;
 
 back_stop:
 if (start) state <= backward;
 else if (forw) state <= for_stop;
 else if (restart)
 address <= 23'h7FFFF;
 else
 begin
 state <= back_stop;
 address <= address;
 end

endcase
end

endmodule
