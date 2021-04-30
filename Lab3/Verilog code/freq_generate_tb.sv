module freq_generate_tb();

logic clk, fast, slow, reset;
logic new_sig, slow_sig;
logic [31:0] div_count;

freq_generate wergewrg(.clk(clk),
                    .fast(fast),
						  .slow(slow),
						  .reset(reset),
						  .new_sig(new_sig),
						  .slow_sig(slow_sig),
						  .div_count(div_count));
initial begin
// max freq
clk = 0;
fast = 1;
#100;
#100000;

//min freq
fast = 0;
slow = 1;
#200
#100000

//restart freq = 22kHz
slow = 0;
reset = 1;




end

always #1 clk = ~clk;
endmodule