module edge_det(input logic clk,
                input logic level,
					 output logic tick);

logic delay_reg;

always @(posedge clk)
delay_reg <= level;

assign tick = ~delay_reg & level;

endmodule
