module mod_tb();

timeunit 10ns;

logic clk, reset, mod_sig, one_hz;

//dds wave
logic [11:0] sin_out, cos_out, squ_out, saw_out; 

//ask modulation wave
logic [11:0] sin_mod, cos_mod, squ_mod, saw_mod; 

//bpsk modulation wave
logic [11:0] sin_mod2, cos_mod2, squ_mod2, saw_mod2; 

//lfsr output
logic [4:0] lfsr;

clock1hz clockk(.clk(clk),
                .outclk(one_hz));

cdc_slow_to_fast cdccc(.sig(lfsr[0]),
                       .clk1(one_hz),
					        .clk2(clk),
					        .out(mod_sig));

lfsr_5bit lfsrr(.clk(one_hz),
               .lfsr(lfsr));

waveform_gen dds(.clk(clk),
                 .reset(reset),
					  .en(1'b1),
					  .phase_inc(32'h00011102),
					  .sin_out(sin_out),
					  .cos_out(cos_out),
					  .squ_out(squ_out),
					  .saw_out(saw_out));
					  
ask_mod ask(.clk(clk),
            .mod_sig(mod_sig),
            .sin(sin_out),
				.cos(cos_out),
				.squ(squ_out),
				.saw(saw_out),
				.sin_mod(sin_mod),
				.cos_mod(cos_mod),
				.squ_mod(squ_mod),
				.saw_mod(saw_mod));

bpsk_mod psk(.clk(clk),
             .mod_sig(mod_sig),
             .sin(sin_out),
			  	 .cos(cos_out),
			 	 .squ(squ_out),
				 .saw(saw_out),
				 .sin_mod(sin_mod2),
				 .cos_mod(cos_mod2),
				 .squ_mod(squ_mod2),
				 .saw_mod(saw_mod2));
					  
initial begin
clk = 0;
reset = 0;

#20
reset = 1;

end

always #1 clk = ~clk;

endmodule
