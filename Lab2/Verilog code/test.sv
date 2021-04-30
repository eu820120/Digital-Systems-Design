module test(input logic clk,
            output logic [22:0] address = 0,
				output logic read,
				output logic [3:0] byteen);
				
assign read = 1;
assign byteen = 4'b1111;

always_ff @(posedge clk)
address = address + 1;

