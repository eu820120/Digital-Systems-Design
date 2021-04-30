module synth_tb ();

//input
logic clk;
logic [7:0] phoneme_sel;
logic start, flash_ok;
logic tick;

//output
logic [23:0] start_word, end_word;
logic [1:0] start_num, end_num;
logic finish, flash_start;
logic [4:0] state;

logic    [22:0]  flash_mem_address;
logic flash_mem_read;
logic [1:0] num_mux;

phoneme_to_address qwer(.clk(clk),
                        .phoneme_sel(phoneme_sel),
								.start(start),
								.flash_ok(flash_ok),
								.start_word(start_word),
								.end_word(end_word),
								.start_num(start_num),
								.end_num(end_num),
								.finish(finish),
								.flash_start(flash_start),
								.state(state));
								

flash_addr_ctrl lksmdfn(.start_word_addr(start_word),
                        .end_word_addr(end_word),
								.start_byte_num(start_num),
								.end_byte_num(end_num),
								.start(flash_start), 
								.clk(clk),
								.tick(tick),
								.flash_address(flash_mem_address),
						      .num_mux(num_mux),
								.read(flash_mem_read),
								.finish(flash_ok));
initial begin
clk = 0;
phoneme_sel = 8'h09;
start = 0;
tick = 0;

#5
start = 1;

#4
start = 0;


#10000
phoneme_sel = 8'h0a;
start = 1;

#4

start = 0;



end


always #1 clk =~clk;
always #10 tick =~tick;
endmodule

