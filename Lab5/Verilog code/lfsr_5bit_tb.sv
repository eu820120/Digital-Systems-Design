module lfsr_5bit_tb();

logic [4:0] lfsr;
logic clk;

lfsr_5bit qwer(.clk(clk),
                .lfsr(lfsr));

initial
begin
clk = 0;
end

always #1 clk = ~clk;

endmodule
					 
			