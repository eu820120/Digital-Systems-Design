module freq_7200hz_tb();
logic clk, new_sig;

freq_7200hz lkjd(.clk(clk),
                 .new_sig(new_sig));

initial begin

clk = 0;

end
always #5 clk = ~clk;

endmodule

