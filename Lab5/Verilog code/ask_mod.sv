module ask_mod(input logic [11:0] sin, cos, squ, saw,
               input logic clk, mod_sig,
					output logic [11:0] sin_mod, cos_mod, squ_mod, saw_mod);

//output assigning
assign sin_mod = mod_sig ? sin : 1'b0;
assign cos_mod = mod_sig ? cos : 1'b0;
assign squ_mod = mod_sig ? squ : 1'b0;
assign saw_mod = mod_sig ? saw : 1'b0;

endmodule
