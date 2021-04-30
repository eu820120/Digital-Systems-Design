module flash_addr_ctrl(input logic [22:0] start_word_addr, end_word_addr,           //word addresses from phoneme_to_address
                       input logic [1:0] start_byte_num, end_byte_num,              //byte numbers
							  input logic start, clk, tick,                                //start signal, tick is the edge detected signal for 7200hz signal
							  output logic [22:0] flash_address,                           //the address for reading
							  output logic [1:0] num_mux = 2'b0,                           //multiplexer control bus for changing byte number
							  output logic read, finish,
							  
							  //debug
							  output logic [5:0] state = 6'b000000);

localparam idle = 6'b0000_0_0;
localparam init = 6'b0001_1_1;
localparam check_num_mux = 6'b0010_1_1;
localparam num_mux_plus = 6'b0011_1_1;
localparam check_addr = 6'b0100_1_1;
localparam addr_plus = 6'b0101_1_1;
localparam check_num_end = 6'b0110_1_1;
localparam num_mux_plus_two = 6'b0111_1_1;
localparam the_end = 6'b1000_0_0;

assign read = state[1];
assign finish = ~state[0];
							  
always_ff @(posedge clk)
case(state)
idle:
begin
if (start) 
state <= init;
else
state <= idle;
end

init:
begin
flash_address <= start_word_addr;
num_mux <= start_byte_num;
state <= check_num_mux;
end

check_num_mux:
begin
if((tick == 1'b1) & (num_mux != 2'b11))
state <= num_mux_plus;
else if ((tick == 1'b1) & (num_mux == 2'b11))
state <= addr_plus;
else
state <= check_num_mux;
end	  

num_mux_plus:
begin
num_mux <= num_mux + 1;
state <= check_num_mux;
end

addr_plus:
begin
flash_address = flash_address + 1;
state <= check_addr;
num_mux <= 2'b00;
end

check_addr:
begin
if (flash_address == end_word_addr)
state <= check_num_end;
else
state <= check_num_mux;
end

check_num_end:
begin
if((tick == 1'b1) & (num_mux != end_byte_num))
state <= num_mux_plus_two;
else if ((tick == 1'b1) & (num_mux == end_byte_num))
state <= idle;
else
state <= check_num_end;
end	

num_mux_plus_two:
begin
num_mux = num_mux + 1;
state <= check_num_end;
end

endcase

endmodule
