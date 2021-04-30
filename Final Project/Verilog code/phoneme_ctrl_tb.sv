module phoneme_ctrl_tb();

//input
logic start, converter_ok, clk;

//output
logic start_converter, finish;
logic [5:0] state;

phoneme_ctrl tbtbtb(.start(start),
                       .converter_ok(converter_ok),
							  .clk(clk),
							  .start_converter(start_converter),
							  .finish(finish),
							  .state(state));
							  
initial begin
clk = 0;
start = 1;

#10

converter_ok = 1;
end

always #1 clk = ~clk;
endmodule
