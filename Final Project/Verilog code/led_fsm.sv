module led_fsm(input logic [7:0] audio_data,
               input logic clk,
               output logic [7:0] led_dis,
					//debug
					output logic [2:0] state = 3'b000);
					
logic [7:0] count = 8'b00000000;  //counter , counts to 256
logic [7:0] abso_val;             //absolute value of input
logic [15:0] sum = 16'd0;         //sum
logic [7:0] average;              //average of sum


localparam counter_plus = 3'b000;
localparam twos_comp = 3'b001;
localparam summer = 3'b010;
localparam count_check = 3'b011;
localparam display_calc = 3'b100;



always_ff @(posedge clk)
begin
case(state)
counter_plus:
begin
count <= count + 1'b1;
state <= twos_comp;
end

twos_comp:
begin
if(audio_data[7])
begin
abso_val <= (~audio_data) + 1'b1;
end
else
begin
abso_val <= audio_data;
end
state <= summer;
end

summer:
begin
sum <= sum + abso_val;
state <= count_check;
end

count_check:
begin
if(count == 8'b00000000)
begin
average <= (sum >> 8);
state <= display_calc;
end
else
state <= counter_plus;
end

//reset count and sum, check MSB and give value to led_display
display_calc:
begin
count <= 8'b00000000;
sum <= 16'd0;
state <= counter_plus;
if(average[7])
led_dis <= 8'b11111111;
else if(average[6])
led_dis <= 8'b11111110;
else if(average[5])
led_dis <= 8'b11111100;
else if(average[4])
led_dis <= 8'b11111000;
else if(average[3])
led_dis <= 8'b11110000;
else if(average[2])
led_dis <= 8'b11100000;
else if(average[1])
led_dis <= 8'b11000000;
else if(average[0])
led_dis <= 8'b10000000;
else
led_dis <= 8'b00000000;
end

endcase
end
endmodule
