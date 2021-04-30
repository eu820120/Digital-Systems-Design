module dds_tb();

//inputs
logic clk, reset, en;
logic [31:0] phase_inc;

//outputs
logic [11:0] sin_out, cos_out, squ_out, saw_out;

//instantiantion
waveform_gen qwer(.clk(clk),
                  .reset(reset),
						.en(en),
						.phase_inc(phase_inc),
						.sin_out(sin_out),
						.cos_out(cos_out),
						.squ_out(squ_out),
						.saw_out(saw_out));
						
initial begin
clk = 0;
reset = 0;
en = 1;

#30

reset = 1;
phase_inc = 32'b00000100010110100001110010101100;

end

always #1 clk = ~clk;
endmodule
