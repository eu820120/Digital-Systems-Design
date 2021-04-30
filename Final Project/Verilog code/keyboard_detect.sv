module keyboard_detect (input logic [7:0] ascii, received_ascii,
                        input logic clk,
                        output logic key);

logic key_t;
always_ff @(posedge clk)
if (received_ascii == ascii)
key_t <= 1'b1;
else 
key_t <= 1'b0;

edge_det mkmk(.clk(clk),
              .level(key_t),
				  .tick(key));
				  
				  
endmodule
