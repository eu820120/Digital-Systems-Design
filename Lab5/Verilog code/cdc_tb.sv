module cdc_tb();

timeunit 10ns;
logic clk1, clk2, reset;


logic [11:0] sin_out, ssin;
waveform_gen dds(.clk(clk1),
                 .reset(reset),
					  .en(1'b1),
					  .phase_inc(32'h00000102),
					  .sin_out(sin_out));
					  
cdc_fast_to_slow cdc(.clk1(clk1),
                 .clk2(clk2),
					  .in_sig(sin_out),
					  .out_sig(ssin));
					  
initial begin
clk1 = 0;
clk2 = 0;
reset = 0;
#10
reset = 1;
end

always #1 clk1 = ~clk1;
always #250000 clk2 = ~clk2;

endmodule
