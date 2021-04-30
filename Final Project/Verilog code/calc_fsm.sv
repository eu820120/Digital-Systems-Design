module calc_fsm(input logic key_0, key_1, key_2, key_3, key_4, key_5, key_6, key_7, key_8, key_9, key_plus, key_equal, key_minus, clk, talk_done, kbd_ready,
                output logic start_talk,
					 output logic [7:0] word_code, z,
					 
					 //debug
					 output logic [9:0] state = 10'b0000000000);

//calculation stuff
logic [7:0] x, y;// two input numbers
logic p_or_m; //plus or minus

//state parameters
localparam sensor = 10'b000000000_0;
localparam error_state = 10'b000000001_0;
localparam talk1 = 10'b000000010_1;
localparam one_state = 10'b000000011_0;
localparam two_state = 10'b000000100_0;
localparam three_state = 10'b000000101_0;
localparam four_state = 10'b000000110_0;
localparam five_state = 10'b000000111_0;
localparam six_state = 10'b000001000_0;
localparam seven_state = 10'b000001001_0;
localparam eight_state = 10'b000001010_0;
localparam nine_state = 10'b000001011_0;
localparam zero_state = 10'b000001100_0;
localparam word_coder = 10'b000001101_0;
localparam talk_error1 = 10'b000001110_1;
localparam stage2 = 10'b000001111_0;
localparam word_coder2 = 10'b000010000_0;
localparam plus_state = 10'b000010001_0;
localparam minus_state = 10'b000010010_0;
localparam talk2 = 10'b000010011_1;
localparam talk_error2 = 10'b000010100_1;
localparam stage3 = 10'b000010101_0;
localparam error_state2 = 10'b000010110_0;
localparam word_coder3 = 10'b000010111_0;
localparam zero_state2 = 10'b000011000_0;
localparam one_state2 = 10'b000011001_0;
localparam two_state2 = 10'b000011010_0;
localparam three_state2 = 10'b000011011_0;
localparam four_state2 = 10'b000011100_0;
localparam five_state2 = 10'b000011101_0;
localparam six_state2 = 10'b000011110_0;
localparam seven_state2 = 10'b000011111_0;
localparam eight_state2 = 10'b000100000_0;
localparam nine_state2 = 10'b000100001_0;
localparam talk3 = 10'b000100010_1;
localparam talk_error3 = 10'b000100011_1;
localparam stage4 = 10'b000100100_0;
localparam error_state3 = 10'b000100101_0;
localparam sensorr = 10'b000100110_0;
localparam word_coder4 = 10'b000100111_0;
localparam talk4 = 10'b000101000_1;
localparam check_equals = 10'b000101001_0;
localparam error_state4 = 10'b000101010_0;
localparam talk_error4 = 10'b000101011_1;


//word_code parameters(sent to pacoblaze to control which word to say)
localparam silent = 8'h00;
localparam error = 8'h01;
localparam one = 8'h02;
localparam two = 8'h03;
localparam three = 8'h04;
localparam four = 8'h05;
localparam five = 8'h06;
localparam six = 8'h07;
localparam seven = 8'h08;
localparam eight = 8'h09;
localparam nine = 8'h0A;
localparam zero = 8'h0B;
localparam plus = 8'h0C;
localparam minus = 8'h0D;
localparam ten = 8'h0E;
localparam eleven = 8'h0F;
localparam twelve = 8'h10;
localparam thirteen = 8'h11;
localparam fourteen = 8'h12;
localparam fifteen = 8'h13;
localparam sixteen = 8'h14;
localparam seventeen = 8'h15;
localparam eighteen = 8'h16;

//state bit assign (signal for pacoblaze to start talking)
assign start_talk = state[0];

always_ff @(posedge clk)
begin
case(state)
//stage 1, first input
sensor:
begin
x <= 8'd0;
y <= 8'd0;
z <= 8'd0;
p_or_m <= 1'b0;
if(kbd_ready)
state <= word_coder;
else
state <= sensor;
end


word_coder:
begin
case({key_0, key_1, key_2, key_3, key_4, key_5, key_6, key_7, key_8, key_9})
10'b1000000000: state <= zero_state;
10'b0100000000: state <= one_state;
10'b0010000000: state <= two_state;
10'b0001000000: state <= three_state;
10'b0000100000: state <= four_state;
10'b0000010000: state <= five_state;
10'b0000001000: state <= six_state;
10'b0000000100: state <= seven_state;
10'b0000000010: state <= eight_state;
10'b0000000001: state <= nine_state;
10'b0000000000: state <= error_state;
endcase
end

zero_state:
begin
word_code <= zero;
x <= 8'd0;
state <= talk1;
end

one_state:
begin
word_code <= one;
x <= 8'd1;
state <= talk1;
end

two_state:
begin
word_code <= two;
x <= 8'd2;
state <= talk1;
end

three_state:
begin
word_code <= three;
x <= 8'd3;
state <= talk1;
end

four_state:
begin
word_code <= four;
x <= 8'd4;
state <= talk1;
end

five_state:
begin
word_code <= five;
x <= 8'd5;
state <= talk1;
end

six_state:
begin
word_code <= six;
x <= 8'd6;
state <= talk1;
end

seven_state:
begin
word_code <= seven;
x <= 8'd7;
state <= talk1;
end

eight_state:
begin
word_code <= eight;
x <= 8'd8;
state <= talk1;
end

nine_state:
begin
word_code <= nine;
x <= 8'd9;
state <= talk1;
end

error_state:
begin
word_code <= error;
state <= talk_error1;
end

talk1:
begin
if(talk_done)
state <= stage2;
else
state <= talk1;
end

talk_error1:
begin
if(talk_done)
state <= sensor;
else
state <= talk_error1;
end

//stage 2, plus or minus
stage2:
begin
if(kbd_ready)
state <= word_coder2;
else 
state <= stage2;
end

word_coder2:
begin
case({key_plus, key_minus})
2'b10: state <= plus_state;
2'b01: state <= minus_state;
2'b00: state <= error_state2;
endcase
end

plus_state:
begin
word_code <= plus;
p_or_m <= 1'b1;
state <= talk2;
end

minus_state:
begin
word_code <= minus;
p_or_m <= 1'b0;
state <= talk2;
end

error_state2:
begin
word_code <= error;
state <= talk_error2;
end


talk2:
begin
if(talk_done)
state <= stage3;
else
state <= talk2;
end

talk_error2:
begin
if(talk_done)
state <= stage2;
else
state <= talk_error2;
end

//stage 3, second input
stage3:
begin
if(kbd_ready)
state <= word_coder3;
else
state <= stage3;
end

word_coder3:
begin
case({key_0, key_1, key_2, key_3, key_4, key_5, key_6, key_7, key_8, key_9})
10'b1000000000: state <= zero_state2;
10'b0100000000: state <= one_state2;
10'b0010000000: state <= two_state2;
10'b0001000000: state <= three_state2;
10'b0000100000: state <= four_state2;
10'b0000010000: state <= five_state2;
10'b0000001000: state <= six_state2;
10'b0000000100: state <= seven_state2;
10'b0000000010: state <= eight_state2;
10'b0000000001: state <= nine_state2;
10'b0000000000: state <= error_state3;
endcase
end

zero_state2:
begin
word_code <= zero;
y <= 8'd0;
state <= talk3;
end

one_state2:
begin
word_code <= one;
y <= 8'd1;
state <= talk3;
end

two_state2:
begin
word_code <= two;
y <= 8'd2;
state <= talk3;
end

three_state2:
begin
word_code <= three;
y <= 8'd3;
state <= talk3;
end

four_state2:
begin
word_code <= four;
y <= 8'd4;
state <= talk3;
end

five_state2:
begin
word_code <= five;
y <= 8'd5;
state <= talk3;
end

six_state2:
begin
word_code <= six;
y <= 8'd6;
state <= talk3;
end

seven_state2:
begin
word_code <= seven;
y <= 8'd7;
state <= talk3;
end

eight_state2:
begin
word_code <= eight;
y <= 8'd8;
state <= talk3;
end

nine_state2:
begin
word_code <= nine;
y <= 8'd9;
state <= talk3;
end

error_state3:
begin
word_code <= error;
state <= talk_error3;
end

talk3:
begin
if(talk_done)
state <= stage4;
else
state <= talk3;
end

talk_error3:
begin
if(talk_done)
state <= stage3;
else
state <= talk_error3;
end

//stage 4, final value calculation 
stage4:
begin
if(p_or_m)
begin
z <= x + y;
end
else
begin
z <= x - y;
end
state <= sensorr;
end

sensorr:
begin
if(kbd_ready)
state <= word_coder4;
else
state <= sensorr;
end


word_coder4:
begin
if(key_equal)
begin
case(z)
//0
8'b00000000: word_code <= zero;
//1
8'b00000001: word_code <= one;
8'b11111111: word_code <= one;
//2
8'b00000010: word_code <= two;
8'b11111110: word_code <= two;
//3
8'b00000011: word_code <= three;
8'b11111101: word_code <= three;
//4
8'b00000100: word_code <= four;
8'b11111100: word_code <= four;
//5
8'b00000101: word_code <= five;
8'b11111011: word_code <= five;
//6
8'b00000110: word_code <= six;
8'b11111010: word_code <= six;
//7
8'b00000111: word_code <= seven;
8'b11111001: word_code <= seven;
//8
8'b00001000: word_code <= eight;
8'b11111000: word_code <= eight;
//9
8'b00001001: word_code <= nine;
8'b11110111: word_code <= nine;
//10
8'b00001010: word_code <= ten;
//11
8'b00001011: word_code <= eleven;
//12
8'b00001100: word_code <= twelve;
//13
8'b00001101: word_code <= thirteen;
//14
8'b00001110: word_code <= fourteen;
//15
8'b00001111: word_code <= fifteen;
//16
8'b00010000: word_code <= sixteen;
//17
8'b00010001: word_code <= seventeen;
//18
8'b00010010: word_code <= eighteen;
endcase
state <= talk4;
end
else
begin
word_code <= error;
state <= talk_error4;
end
end

talk4:
begin
if(talk_done)
state <= sensor;
else
state <= talk4;
end

talk_error4:
begin
if(talk_done)
state <= sensorr; 
else
state <= talk_error4;
end


endcase
end
endmodule

