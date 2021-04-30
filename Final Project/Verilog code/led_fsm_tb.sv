module led_fsm_tb();

//input
logic [7:0] audio_data;
logic clk;

//output
logic [7:0] led_dis;
logic [2:0] state;

led_fsm qwerasd(.audio_data(audio_data),
                   .clk(clk),
						 .led_dis(led_dis),
						 .state(state));
						 
initial begin
clk = 0;
audio_data = 8'b10010011;
#4000
audio_data = 8'b01101010;

end

always #1 clk = ~clk;

endmodule

