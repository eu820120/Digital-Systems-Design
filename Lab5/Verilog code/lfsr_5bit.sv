module lfsr_5bit(input logic clk,
                 output logic[4:0] lfsr = 5'b11111);

logic feedback;
								
assign feedback = lfsr[0] ^ lfsr[2];

always_ff @(posedge clk)
begin
if (lfsr == 5'b00000)
lfsr <= 5'b11111;

else
begin
lfsr[4] <= lfsr[0] ^ lfsr[2];
lfsr[3] <= lfsr[4];
lfsr[2] <= lfsr[3];
lfsr[1] <= lfsr[2];
lfsr[0] <= lfsr[1];
end
end
endmodule
