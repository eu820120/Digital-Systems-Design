module led_control(input logic clk,
                   output logic [7:0] LED);

logic [3:0] count = 4'b0000;
logic [7:0] ledd = 8'b00000001;

assign LED = ledd;

always_ff @(posedge clk)
begin

if(count == 4'd13)
begin
ledd <= ledd >> 1;
count <= 4'b000;
end

else if (count < 4'd7)
begin
ledd <= ledd << 1;
count <= count + 1;
end

else if(count >= 4'd7)
begin
ledd <= ledd >> 1;
count <= count + 1;
end


end

endmodule