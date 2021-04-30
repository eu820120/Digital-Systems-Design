module calc_fsm_tb ();

//input
logic key_0, key_1, key_2, key_3, key_4, key_5, key_6, key_7, key_8, key_9, key_plus, key_equal, key_minus, clk, talk_done, kbd_ready;

//output
logic start_talk;
logic [7:0] word_code, z;
logic [9:0] state = 10'b0000000000;

calc_fsm cccc(.key_0(key_0),
              .key_1(key_1),
				  .key_2(key_2),
				  .key_3(key_3),
				  .key_4(key_4),
				  .key_5(key_5),
				  .key_6(key_6),
				  .key_7(key_7),
				  .key_8(key_8),
				  .key_9(key_9),
				  .key_plus(key_plus),
				  .key_equal(key_equal),
				  .key_minus(key_minus),
				  .clk(clk),
				  .talk_done(talk_done),
				  .kbd_ready(kbd_ready),
				  .start_talk(start_talk),
				  .word_code(word_code),
				  .z(z),
				  .state(state));
				  
initial begin
clk = 0;
kbd_ready = 1;
talk_done = 1;
key_1 = 1;
key_0 = 0;
key_2 = 0;
key_3 = 0;
key_4 = 0;
key_5 = 0;
key_6 = 0;
key_7 = 0;
key_8 = 0;
key_9 = 0;

#20

key_1 = 0;
key_plus = 0;
key_minus = 1;


#20

key_minus = 0;
key_5 = 1;

#20

key_5 = 0;
key_equal = 1;

end

always #1 clk = ~clk;

endmodule

