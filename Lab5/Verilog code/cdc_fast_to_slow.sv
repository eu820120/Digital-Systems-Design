module cdc_fast_to_slow(input logic clk1, clk2,
                        input logic [11:0] in_sig,
								output logic [11:0] out_sig);
								
								
cdc_bit bit0(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[0]),
				 .out_bit(out_sig[0]));
				 
cdc_bit bit1(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[1]),
				 .out_bit(out_sig[1]));
				 
cdc_bit bit2(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[2]),
				 .out_bit(out_sig[2]));
				 
cdc_bit bit3(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[3]),
				 .out_bit(out_sig[3]));

cdc_bit bit4(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[4]),
				 .out_bit(out_sig[4]));				 
								
cdc_bit bit5(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[5]),
				 .out_bit(out_sig[5]));

cdc_bit bit6(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[6]),
				 .out_bit(out_sig[6]));
				 
cdc_bit bit7(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[7]),
				 .out_bit(out_sig[7]));

cdc_bit bit8(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[8]),
				 .out_bit(out_sig[8]));

cdc_bit bit9(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[9]),
				 .out_bit(out_sig[9]));

cdc_bit bit10(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[10]),
				 .out_bit(out_sig[10]));

cdc_bit bit11(.clk1(clk1),
             .clk2(clk2),
				 .in_bit(in_sig[11]),
				 .out_bit(out_sig[11]));				 
								
endmodule

module cdc_bit	(input logic clk1, clk2, in_bit,
                output logic out_bit);
logic q1, q2, q11, en;

always_ff @(posedge clk1)
q1 <= in_bit;

always_ff @(posedge clk1)
if (en)
q2 <= q1;

always_ff @(posedge clk2)
out_bit <= q2;

always_ff @(posedge ~clk1)
q11 <= clk2;

always_ff @(posedge ~clk1)
en <= q11;


endmodule