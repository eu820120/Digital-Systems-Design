module phoneme_ctrl(input logic start, converter_ok, clk,
                    output logic start_converter, finish,
						  output logic [5:0] state = 6'b000000);

localparam idle = 6'b0000_0_0;
localparam converter_go = 6'b0001_0_1;
localparam wait_converter = 6'b0010_0_0;
localparam finished= 6'b0011_1_0;


		  
//state bits, start_converter is for starting phoneme_to_address module, finish is for pacoblaze
assign start_converter = state[0];
assign finish = state[1];

always_ff @(posedge clk)
case(state)
idle: 
begin
if(start)
state <= converter_go;
else
state <= idle;
end

converter_go:
state <= wait_converter;

wait_converter:
if(converter_ok)
state <= finished;
else
state <= wait_converter;

finished:
if(start)
state <= converter_go;
else
state <= finished;
endcase
endmodule
