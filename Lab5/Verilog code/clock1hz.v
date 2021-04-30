module clock1hz(input logic clk,
                output logic outclk);

logic [31:0] div_count;
logic [31:0] r_reg = 0, r_next = 0;
logic new_sig = 1'b1;

assign div_count = 32'd50000000;

always_ff @(posedge clk)
r_reg <= r_next;

always_comb
if (r_reg >= ((div_count/2)-1)) r_next = 0;
else r_next = r_reg + 1;

always_ff @(posedge clk)
if (r_reg == ((div_count/2)-1)) new_sig = ~new_sig;
else new_sig = new_sig;

assign  outclk = new_sig;

endmodule