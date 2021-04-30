module fsm_address_tb();

logic clk, start, stop, forw, backw, restart, stimulus;
logic [22:0] address;
logic [3:0] state;

fsm_address qqwefd(.clk(clk),
                   .start(start),
						 .stop(stop),
						 .forw(forw),
						 .backw(backw),
						 .restart(restart),
						 .stimulus(stimulus),
						 .address(address),
						 .state(state));
						 
initial begin
//idle

clk = 0;
stimulus = 1;
#20

//forward
start = 1;
#20

//restart
start = 0;
stimulus = 0;
restart = 1;
#10
stimulus = 1;

//for_stop
restart = 0;
stop = 1;
#20

//back_stop
stop = 0;
backw = 1;
#20

//restart
backw = 0;
stimulus = 0;
restart = 1;
#20

//backward
restart = 0;
stimulus = 1;
start = 1;
#20

//forward
start = 0;
forw = 1;
#20;

end

always #5 clk = ~clk;
endmodule