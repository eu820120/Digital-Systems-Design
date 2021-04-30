module clock_divider(input logic clk, reset,
							input logic [2:0] control,
							output logic outclk);
logic [31:0] div_count, r_reg, r_next;
logic new_sig = 1'b1;

/*SW[3:1] = 3'b000 Low DO
  SW[3:1] = 3'b001 RE
  SW[3:1] = 3'b010 MI
  SW[3:1] = 3'b011 FA
  SW[3:1] = 3'b100 SO
  SW[3:1] = 3'b101 LA
  SW[3:1] = 3'b110 Si
  SW[3:1] = 3'b111 High DO*/

//Switch control
always_ff @(posedge clk)
case(control)
3'b000: div_count = 32'd95600;
3'b001: div_count = 32'd85180;
3'b010: div_count = 32'd75870;
3'b011: div_count = 32'd71630;
3'b100: div_count = 32'd63860;
3'b101: div_count = 32'd56820;
3'b110: div_count = 32'd50660;
3'b111: div_count = 32'd47800;
endcase

//register
always_ff @(posedge clk)
if (reset) r_reg = 0;
else r_reg <= r_next;

//next state logic
always_comb
if (r_reg >= ((div_count/2)-1)) r_next = 0;
else r_next = r_reg + 1;

//output logic
always_ff @(posedge clk)
if (r_reg == ((div_count/2)-1)) new_sig = ~new_sig;
else new_sig = new_sig;

assign  outclk = new_sig;

endmodule