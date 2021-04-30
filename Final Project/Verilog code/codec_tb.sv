module codec_tb();

//input
logic reset_in, clk, k_in;
logic [7:0] audio_data;

//output
logic [9:0] output_10b;
logic en_disparity, de_disparity;
logic [7:0] audio_data_out;
logic err, dis_err, k_out;

encoder_8b10b asdf(.reset(reset_in),
                   .SBYTECLK(clk),
						 .K(k_in),
						 .ebi(audio_data),
						 .tbi(output_10b),
						 .disparity(en_disparity));
						 
						 
decoder_8b10b qwer(.reset(reset_in),
                   .RBYTECLK(clk),
						 .tbi(output_10b),
						 .ebi(audio_data_out),
						 .coding_err(err),
						 .disparity(de_disparity),
						 .disparity_err(dis_err),
						 .K_out(k_out));
						 
	initial begin
	clk = 0;
	reset_in = 0;
	k_in = 0;
	audio_data = 8'b10101111;
	
	#6
	reset_in = 1;
	
	#2
	reset_in = 0;
	# 50
	
	audio_data = 8'b00001010;
	#50
	
	audio_data = 8'b11111111;
	
	
	#50
	audio_data = 8'b01100110;
	
	end
	
	always #1 clk = ~clk; 
	
	endmodule
