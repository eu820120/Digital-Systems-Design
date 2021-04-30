module clock1hz_tb();

//inputs
logic clk;

//output
logic outclk;

//instantiation
clock1hz qwer(.clk(clk),
						 .outclk(outclk));
						 
initial begin
clk = 0;
#500000000;



end

always #1 clk = ~clk;
endmodule