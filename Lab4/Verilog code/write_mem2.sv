				module write_mem2(input logic clk,
 
                  //s_memory
                  input logic [7:0] readd,
						output logic [7:0] address,
					   output logic [7:0] data,
					   output logic write_en,
						
						//rom
						input logic [7:0] read_m,
						output logic [4:0] address_m,
						
						//output ram
						input logic [7:0] read_d,
						output logic [4:0] address_d,
						output logic [7:0] data_d,
						output logic wren_d,
						output logic [23:0] secret_key,
						
						//output flag
						output logic good = 1'b0,
						output logic bad  = 1'b0,
										
						
						// debug
						output logic [7:0] si,
						output logic [7:0] j_next,
						output logic [7:0] j = 8'b00000000,
						output logic [7:0] i = 8'b00000000,
						output logic [7:0] state = 8'b00000000);
	
	

//Task1
logic [7:0] counter = 8'b00000000;	

//Task2A
logic [7:0] secret_key0;
logic [7:0] secret_key1;
logic [7:0] secret_key2;
logic [1:0] key_num;
logic [7:0] sj;

//Task2B
logic [4:0] k = 5'b00000;
logic [7:0] ii, jj;
logic [7:0] f_address, f;
logic [7:0] encrypt;

//Task3
logic [4:0] adr_count = 5'b00000;
logic [23:0] secret_test = 24'd1048576;
logic [7:0] final_data;


//Task1
parameter idle = 8'b0000000_0;
parameter set_output = 8'b0000001_1;
parameter add_count = 8'b0000010_1;
parameter wait_write = 8'b0000011_1;
parameter finish_init = 8'b0000100_0;

//Task2A
parameter i_mod = 8'b0000101_0;
parameter wait_read = 8'b0000110_0;
parameter j_next_calc = 8'b0000111_0;
parameter wait_read2 = 8'b0001000_0;
parameter write_si_to_j = 8'b0001001_0;
parameter wait_write2 = 8'b0001010_1;
parameter write_sj_to_i = 8'b0001011_1;
parameter wait_write3 = 8'b0001101_1;
parameter finish_task2a = 8'b0001110_0;
parameter i_counter = 8'b0001111_0;
parameter get_si = 8'b0010001_0;

//Task2B
parameter task2b_init = 8'b0010000_0;
parameter get_si2 = 8'b0010010_0;
parameter wait1 = 8'b0010011_0;
parameter new_ij = 8'b0010100_0;
parameter new_si = 8'b0010101_0;
parameter wait2 = 8'b0010110_0;
parameter new_sj = 8'b0010111_0;
parameter wait3 = 8'b0011000_0;
parameter write_si_to_jj = 8'b0011001_0;
parameter write_en1 = 8'b0011010_1;
parameter write_sj_to_ii = 8'b0011011_1;
parameter wait4 = 8'b0011100_1;
parameter wren_off = 8'b0011101_0;
parameter get_f = 8'b0011110_0;
parameter wait5 = 8'b0011111_0;
parameter f_encrypt = 8'b0100000_0;
parameter write_output = 8'b0100001_0;
parameter write_en2 = 8'b0100010_0;
parameter wait6 = 8'b0100011_0;
parameter k_counter = 8'b0001100_0;

//Task3
parameter task3_init = 8'b0100100_0;
parameter wait7 = 8'b0100110_0;
parameter get_data = 8'b0100111_0;
parameter comparison1 = 8'b0101000_0;
parameter comparison_adr = 8'b0101101_0;
parameter comparison_space = 8'b0101110_0;
parameter gottem = 8'b0101001_0;
parameter next_key = 8'b0101010_0;
parameter no_key = 8'b0101011_0;
parameter loop = 8'b0101100_0;
parameter adr_counter = 8'b0100101_0;


assign secret_key0 = secret_test[23:16];
assign secret_key1 = secret_test[15:8];
assign secret_key2 = secret_test[7:0];
assign write_en = state[0];


always_ff @(posedge clk)
case(state)
//Task 1
idle: 
begin
state <= set_output;
secret_key <= secret_test;
bad <= 1'b0;
good <= 1'b0;
end

set_output: 
if(counter == 8'b11111111)
begin
address <= counter;
data <= counter;
state <= wait_write;
end
else
begin
address <= counter;
data <= counter;
state <= add_count;
end

add_count:
begin
counter <= counter + 1;
state <= set_output;
end

wait_write:
state <= finish_init;

finish_init: 
begin
counter <= 8'b00000000;
state <= i_mod;
end


//Task2A

//i_counter
i_counter:
begin
if(i == 8'b11111111)
state <= task2b_init;
else
begin
i = i + 1;
j <= j_next;
state <= i_mod;
end
end


//algorithm
i_mod:                    //i modulus
begin
address <= i;
key_num <= i % 2'd3;
state <= wait_read;
end

wait_read:                     //reads s[i]
begin
state <= get_si;
end

get_si:
begin
si <= readd;
state <= j_next_calc;
end

j_next_calc:                    //calculation of j(new), set data and address for reading s[j(new)], get s[i]
begin
if(key_num == 2'b01)
begin
j_next <= (j + si + secret_key1) % 9'd256;
address <= (j + si + secret_key1) % 9'd256;
state <= wait_read2;
end

else if(key_num == 2'b10)
begin
j_next <= (j + si + secret_key2) % 9'd256;
address <= (j + si + secret_key2) % 9'd256;
state <= wait_read2;
end

else if(key_num == 2'b00)
begin
j_next <= (j + si + secret_key0) % 9'd256;
address <= (j + si + secret_key0) % 9'd256;
state <= wait_read2;
end
end

wait_read2: 
begin                    //reads s[j]
state <= write_si_to_j;
end


write_si_to_j:                 //write s[i] value to s[j]
begin
sj <= readd;
address <= j_next;
data <= si;
state <= wait_write2;
end
 
wait_write2:                  //write wait
state <= write_sj_to_i;

write_sj_to_i:                 //write s[j] value to si
begin
address <= i;
data <= sj;
state <= wait_write3;
end


wait_write3:                 //write wait
begin
state <= finish_task2a;
end

finish_task2a:    
state <= i_counter;

//Task 2B


//k counter
k_counter:
begin
if(k == 5'b11111)
begin
wren_d <= 0;
state <= task3_init;
end
else
begin
wren_d <= 0;
k <= k + 1;
state <= get_si2;
end
end

//algorithm
task2b_init:                //i,j initialization
begin
i <= 8'b00000000;
j <= 8'b00000000;
state <= get_si2;
end

get_si2:                   //give address=i + 1 to s_memory
begin
address <= (i + 1);
state <= wait1;
end

wait1:                 //read wait cycle
state <= new_ij;

new_ij:              //get new i,j values
begin
ii <= (i + 1);
jj <= (j + readd);
state <= new_si;
end

new_si:               //give address=ii to s_memory
begin
i <= ii;
j <= jj;
address <= ii;
state <= wait2;
end

wait2:                  //read wait cycle
state <= new_sj;

new_sj:               //get si, give address=jj to s_memory
begin
si <= readd;
address <= jj;
state <= wait3;
end

wait3:            //read wait cycle
state <= write_si_to_jj;

write_si_to_jj:      //give data=si, address=jj to s_memory
begin
sj <= readd;
data <= si;
address <= jj;
state <= write_en1;
end

write_en1:                //write enable
state <= write_sj_to_ii;

write_sj_to_ii:          //give data=sj, address=ii to s_memory
begin
data <= sj;
address <= ii;
state <= wait4;
end

wait4:                  //write wait cycle
state <= wren_off;

wren_off:              //wren = 0
state <= get_f;

get_f:                   //give address to both s_memory and rom
begin
address <= (si + sj);
address_m <= k;
state <= wait5;
end

wait5:                  //read wait cycle
state <= f_encrypt;

f_encrypt:           //get values
begin
f <= readd;
encrypt <= read_m;
state <= write_output;
end

write_output:            //give address and data to output ram
begin
address_d <= k;
data_d <= f ^ encrypt;
state <= write_en2;
end

write_en2:        //wren_d = 1
begin
wren_d = 1;
state <= wait6;
end

wait6:
state <= k_counter;

//Task 3


//address counter
adr_counter:
begin
adr_count <= adr_count + 1;
state <= task3_init;
end


task3_init:        //initialization for task3, give adr_count to address_d
begin
wren_d <= 0;
address_d <= adr_count;
state <= wait7;
end

wait7:                 //wait read cycle
state <= get_data;

get_data:             //get read data
begin
final_data <= read_d;
state <= comparison1;
end

comparison1:               //see if read d
begin
if((final_data >= 8'd97)&&(final_data <= 8'd122))
state <= comparison_adr;
else 
state <= comparison_space;
end

comparison_space:
begin
if(final_data == 8'd32)
state <= comparison_adr;
else
state <= next_key;
end

comparison_adr:
begin
if(adr_count == 5'b11111)
begin
state <= gottem;
good <= 1'b1;
end
else
state <= adr_counter;
end

next_key:
begin
if (secret_test == 24'd2097151)
begin
state <= no_key;
bad <= 1'b1;
end
else
begin
adr_count <= 5'b00000;
k <= 5'b00000;
i <= 8'b00000000;
j <= 8'b00000000;
secret_test <= secret_test + 1;
state <= idle;
end
end

gottem:
begin
secret_key <= secret_test;
state <= loop;
end

no_key:
begin
state <= loop;
end

loop:
state <= loop;

endcase

endmodule


