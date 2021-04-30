module fsm_read_tb();

logic clk, start, stop;
logic read;
logic [3:0] byteenable;

fsm_read qwer(.clk(clk),
              .start(start),
				  .stop(stop),
				  .read(read),
				  .byteenable(byteenable));
		  
initial begin 

clk = 0;
stop = 0;
start = 1;

//read_state for a couple cycles
#30

//go back to idle
start = 0;
stop = 1;

#10

stop = 0;
start = 0;


end

always #5 clk = ~clk;

endmodule