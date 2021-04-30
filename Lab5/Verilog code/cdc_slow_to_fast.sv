module cdc_slow_to_fast(input logic sig, clk1, clk2,
                      output logic out);

							 
logic q1, q2, qq1, en;

always_ff @(posedge clk1)
q1 <= sig;

always_ff @(posedge clk2)
if (en) 
q2 <= q1;

always_ff @(posedge clk2)
out <= q2;

always_ff @(posedge ~clk2)
qq1 <= clk1;

always_ff @(posedge ~clk2)
en <= qq1;

endmodule
