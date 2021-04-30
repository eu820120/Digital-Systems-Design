module pp(input logic [23:0] secret, secret2, secret3, secret4,
          input logic good, good2, good3, good4,
			 input logic bad, bad2, bad3, bad4,
			 input logic clk,
			 output logic [23:0] secret_key,
			 output logic led_good, led_bad);
			 
			 
assign led_good = good | good2 | good3 | good4;
assign led_bad = bad & bad2 & bad3 & bad4;

always_ff @(posedge clk)
begin
if (good)
secret_key = secret;
else if (good2)
secret_key = secret2;
else if (good3)
secret_key = secret3;
else if (good4)
secret_key = secret4;
else
secret_key = secret;
end


endmodule
