module codec_reset(input logic clk,
                   output logic reset);
						 
						 
logic [1:0] state = 2'b00;

//changes from 0 to 1 to 0
always_ff @(posedge clk)
begin
case(state)
2'b00:
begin
reset <= 1'b0;
state <= 2'b01;
end

2'b01:
begin
reset <= 1'b1;
state <= 2'b10;
end

2'b10:
begin
reset <= 1'b0;
state <= 2'b10;
end
endcase
end
endmodule
