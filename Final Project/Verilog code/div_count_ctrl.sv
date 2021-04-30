module div_count_ctrl(input logic clk, fast, slow, center,
                      output logic [31:0] div_count = 32'd6757);
							 
always_ff @(posedge clk)
begin
if(center)
div_count <= 32'd6757;
else if(fast)
if()
div_count <= div_count + 32'd50;
else if(slow)
div_count <= div_count - 32'd50;
end

endmodule
