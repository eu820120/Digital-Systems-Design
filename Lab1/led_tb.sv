module led_tb();

//inputs
logic clk;

//output
logic [7:0] LED;

//instantiation
led_control qwer(.clk(clk),
						 .LED(LED));
						 
initial begin
clk = 1;
#500;


$stop;
end

always #5 clk = ~clk;
always #5 $display("%d", qwer.count);
endmodule