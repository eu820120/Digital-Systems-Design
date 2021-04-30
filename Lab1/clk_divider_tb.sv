module clk_divider_tb();

//inputs
logic clk, reset;
logic [2:0] control;

//output
logic outclk;

//instantiation
clock_divider qwer(.clk(clk),
                   .control(control),
						 .outclk(outclk),
						 .reset(reset));
						 
initial begin
clk = 0;
control = 3'b000;
reset = 1;
#20
reset = 0;

#500000
$display("%d", qwer.r_reg);

control = 3'b001;
#500000
$display("%d", qwer.r_reg);

control = 3'b010;
#500000
$display("%d", qwer.r_reg);

control = 3'b011;
#500000
$display("%d", qwer.r_reg);

control = 3'b100;
#500000
$display("%d", qwer.r_reg);

control = 3'b101;
#500000
$display("%d", qwer.r_reg);

control = 3'b110;
#500000
$display("%d", qwer.r_reg);

control = 3'b111;
#500000
$display("%d", qwer.r_reg);

$stop;

end

always #5 clk = ~clk;
endmodule
