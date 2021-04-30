module freq_7200hz (input logic clk, fast, slow, reset,
                    output logic new_sig = 0);

logic [31:0] r_reg = 0, r_next = 0, div_count = 32'd6757;  

//div_count generator(can be controlled)
always_ff @(posedge clk)
begin
if(reset)
div_count <= 32'd6757;

else if(fast)
begin
if(div_count <= 32'd10000)
div_count <= div_count + 32'd50;
else 
div_count <= div_count;
end

else if(slow)
begin
if(div_count >= 32'd2000)
div_count <= div_count - 32'd50;
else
div_count <= div_count;
end

end

//signal generator
always_ff @(posedge clk)
r_reg <= r_next;

always_comb
if (r_reg >= ((div_count/2)-1)) r_next = 0;
else r_next = r_reg + 1;

always_ff @(posedge clk)
if (r_reg >= ((div_count/2)-1)) new_sig = ~new_sig;
else new_sig = new_sig;

endmodule
