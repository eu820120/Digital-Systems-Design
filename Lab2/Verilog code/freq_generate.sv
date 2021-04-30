module freq_generate(input logic clk, fast, slow, reset,
                     output logic new_sig = 0, slow_sig= 0,
							output logic [31:0] div_count);


					
logic [31:0] r_next = 0, r_reg = 0;
logic [31:0] r_reg2 = 0, r_next2 = 0, div_count2;
logic [37:0] state = {6'd63, 32'd2273};

parameter [37:0] origin = {6'd63, 32'd2273};

parameter [37:0] first1 = {6'd0, 32'd2223};
parameter [37:0] first2 = {6'd1, 32'd2173};
parameter [37:0] first3 = {6'd2, 32'd2123};
parameter [37:0] first4 = {6'd3, 32'd2073};
parameter [37:0] first5 = {6'd4, 32'd2023};
parameter [37:0] first6 = {6'd5, 32'd1973};
parameter [37:0] first7 = {6'd6, 32'd1923};
parameter [37:0] first8 = {6'd7, 32'd1873};
parameter [37:0] first9 = {6'd8, 32'd1823};
parameter [37:0] first10 = {6'd9, 32'd1773};
parameter [37:0] first11 = {6'd10, 32'd1723};
parameter [37:0] first12 = {6'd11, 32'd1673};
parameter [37:0] first13 = {6'd12, 32'd1623};
parameter [37:0] first14 = {6'd13, 32'd1573};
parameter [37:0] first15 = {6'd14, 32'd1523};
parameter [37:0] first16 = {6'd15, 32'd1473};
parameter [37:0] first17 = {6'd16, 32'd1423};
parameter [37:0] first18 = {6'd17, 32'd1373};
parameter [37:0] first19 = {6'd18, 32'd1323};
parameter [37:0] first20 = {6'd19, 32'd1273};
parameter [37:0] first21 = {6'd20, 32'd1223};
parameter [37:0] first22 = {6'd21, 32'd1173};
parameter [37:0] first23 = {6'd22, 32'd1123};
parameter [37:0] first24 = {6'd23, 32'd1073};
parameter [37:0] first25 = {6'd24, 32'd1023};
parameter [37:0] first26 = {6'd25, 32'd973};
parameter [37:0] first27 = {6'd26, 32'd923};
parameter [37:0] first28 = {6'd27, 32'd873};
parameter [37:0] first29 = {6'd28, 32'd823};
parameter [37:0] first30 = {6'd29, 32'd773};
parameter [37:0] first31 = {6'd30, 32'd723};


parameter [37:0] slow1 = {6'd32, 32'd2323};
parameter [37:0] slow2 = {6'd33, 32'd2373};
parameter [37:0] slow3 = {6'd34, 32'd2423};
parameter [37:0] slow4 = {6'd35, 32'd2473};
parameter [37:0] slow5 = {6'd36, 32'd2523};
parameter [37:0] slow6 = {6'd37, 32'd2573};
parameter [37:0] slow7 = {6'd38, 32'd2623};
parameter [37:0] slow8 = {6'd39, 32'd2673};
parameter [37:0] slow9 = {6'd40, 32'd2723};
parameter [37:0] slow10 = {6'd41, 32'd2773};
parameter [37:0] slow11 = {6'd42, 32'd2823};
parameter [37:0] slow12 = {6'd43, 32'd2873};
parameter [37:0] slow13 = {6'd44, 32'd2923};
parameter [37:0] slow14 = {6'd45, 32'd2973};
parameter [37:0] slow15 = {6'd46, 32'd3023};
parameter [37:0] slow16 = {6'd47, 32'd3073};
parameter [37:0] slow17 = {6'd48, 32'd3123};
parameter [37:0] slow18 = {6'd49, 32'd3173};
parameter [37:0] slow19 = {6'd50, 32'd3223};
parameter [37:0] slow20 = {6'd51, 32'd3273};
parameter [37:0] slow21 = {6'd52, 32'd3323};
parameter [37:0] slow22 = {6'd53, 32'd3373};
parameter [37:0] slow23 = {6'd54, 32'd3423};
parameter [37:0] slow24 = {6'd55, 32'd3473};
parameter [37:0] slow25 = {6'd56, 32'd3523};
parameter [37:0] slow26 = {6'd57, 32'd3573};
parameter [37:0] slow27 = {6'd58, 32'd3623};
parameter [37:0] slow28 = {6'd59, 32'd3673};
parameter [37:0] slow29 = {6'd60, 32'd3723};
parameter [37:0] slow30 = {6'd61, 32'd3773};
parameter [37:0] slow31 = {6'd62, 32'd3823};



assign div_count = state[31:0];

always_ff @(posedge clk)
case (state)
origin: 
if (fast) state <= first1;
else if (slow) state <= slow1;
else state <= origin;

first1:
if (reset) state <= origin;
else if (fast) state <= first2;
else if (slow) state <= origin;
else state <= first1;

first2:
if (reset) state <= origin;
else if (fast) state <= first3;
else if (slow) state <= first1;
else state <= first2;

first3:
if (reset) state <= origin;
else if (fast) state <= first4;
else if (slow) state <= first2;
else state <= first3;

first4:
if (reset) state <= origin;
else if (fast) state <= first5;
else if (slow) state <= first3;
else state <= first4;

first5:
if (reset) state <= origin;
else if (fast) state <= first6;
else if (slow) state <= first4;
else state <= first5;

first6:
if (reset) state <= origin;
else if (fast) state <= first7;
else if (slow) state <= first5;
else state <= first6;

first7:
if (reset) state <= origin;
else if (fast) state <= first8;
else if (slow) state <= first6;
else state <= first7;

first8:
if (reset) state <= origin;
else if (fast) state <= first9;
else if (slow) state <= first7;
else state <= first8;

first9:
if (reset) state <= origin;
else if (fast) state <= first10;
else if (slow) state <= first8;
else state <= first9;

first10:
if (reset) state <= origin;
else if (fast) state <= first11;
else if (slow) state <= first9;
else state <= first10;

first11:
if (reset) state <= origin;
else if (fast) state <= first12;
else if (slow) state <= first10;
else state <= first11;

first12:
if (reset) state <= origin;
else if (fast) state <= first13;
else if (slow) state <= first11;
else state <= first12;

first13:
if (reset) state <= origin;
else if (fast) state <= first14;
else if (slow) state <= first12;
else state <= first13;

first14:
if (reset) state <= origin;
else if (fast) state <= first15;
else if (slow) state <= first13;
else state <= first14;

first15:
if (reset) state <= origin;
else if (fast) state <= first16;
else if (slow) state <= first14;
else state <= first15;

first16:
if (reset) state <= origin;
else if (fast) state <= first17;
else if (slow) state <= first15;
else state <= first16;

first17:
if (reset) state <= origin;
else if (fast) state <= first18;
else if (slow) state <= first16;
else state <= first17;

first18:
if (reset) state <= origin;
else if (fast) state <= first19;
else if (slow) state <= first17;
else state <= first18;

first19:
if (reset) state <= origin;
else if (fast) state <= first20;
else if (slow) state <= first18;
else state <= first19;

first20:
if (reset) state <= origin;
else if (fast) state <= first21;
else if (slow) state <= first19;
else state <= first20;

first21:
if (reset) state <= origin;
else if (fast) state <= first22;
else if (slow) state <= first20;
else state <= first21;

first22:
if (reset) state <= origin;
else if (fast) state <= first23;
else if (slow) state <= first21;
else state <= first22;

first23:
if (reset) state <= origin;
else if (fast) state <= first24;
else if (slow) state <= first22;
else state <= first23;

first24:
if (reset) state <= origin;
else if (fast) state <= first25;
else if (slow) state <= first23;
else state <= first24;

first25:
if (reset) state <= origin;
else if (fast) state <= first26;
else if (slow) state <= first24;
else state <= first25;

first26:
if (reset) state <= origin;
else if (fast) state <= first27;
else if (slow) state <= first25;
else state <= first26;

first27:
if (reset) state <= origin;
else if (fast) state <= first28;
else if (slow) state <= first26;
else state <= first27;

first28:
if (reset) state <= origin;
else if (fast) state <= first29;
else if (slow) state <= first27;
else state <= first28;

first29:
if (reset) state <= origin;
else if (fast) state <= first30;
else if (slow) state <= first28;
else state <= first29;

first30:
if (reset) state <= origin;
else if (fast) state <= first31;
else if (slow) state <= first29;
else state <= first30;

first31:
if (reset) state <= origin;
else if (slow) state <= first30;
else state <= first31;

slow1:
if (reset) state <= origin;
else if (slow) state <= slow2;
else if (fast) state <= origin;
else state <= slow1;

slow2:
if (reset) state <= origin;
else if (slow) state <= slow3;
else if (fast) state <= slow1;
else state <= slow2;

slow3:
if (reset) state <= origin;
else if (slow) state <= slow4;
else if (fast) state <= slow2;
else state <= slow3;

slow4:
if (reset) state <= origin;
else if (slow) state <= slow5;
else if (fast) state <= slow3;
else state <= slow4;

slow5:
if (reset) state <= origin;
else if (slow) state <= slow6;
else if (fast) state <= slow4;
else state <= slow5;

slow6:
if (reset) state <= origin;
else if (slow) state <= slow7;
else if (fast) state <= slow5;
else state <= slow6;

slow7:
if (reset) state <= origin;
else if (slow) state <= slow8;
else if (fast) state <= slow6;
else state <= slow7;

slow8:
if (reset) state <= origin;
else if (slow) state <= slow9;
else if (fast) state <= slow7;
else state <= slow8;

slow9:
if (reset) state <= origin;
else if (slow) state <= slow10;
else if (fast) state <= slow8;
else state <= slow9;

slow10:
if (reset) state <= origin;
else if (slow) state <= slow11;
else if (fast) state <= slow9;
else state <= slow10;

slow11:
if (reset) state <= origin;
else if (slow) state <= slow12;
else if (fast) state <= slow10;
else state <= slow11;

slow12:
if (reset) state <= origin;
else if (slow) state <= slow13;
else if (fast) state <= slow11;
else state <= slow12;

slow13:
if (reset) state <= origin;
else if (slow) state <= slow14;
else if (fast) state <= slow12;
else state <= slow13;

slow14:
if (reset) state <= origin;
else if (slow) state <= slow15;
else if (fast) state <= slow13;
else state <= slow14;

slow15:
if (reset) state <= origin;
else if (slow) state <= slow16;
else if (fast) state <= slow14;
else state <= slow15;

slow16:
if (reset) state <= origin;
else if (slow) state <= slow17;
else if (fast) state <= slow15;
else state <= slow16;

slow17:
if (reset) state <= origin;
else if (slow) state <= slow18;
else if (fast) state <= slow16;
else state <= slow17;

slow18:
if (reset) state <= origin;
else if (slow) state <= slow19;
else if (fast) state <= slow17;
else state <= slow18;

slow19:
if (reset) state <= origin;
else if (slow) state <= slow20;
else if (fast) state <= slow18;
else state <= slow19;

slow20:
if (reset) state <= origin;
else if (slow) state <= slow21;
else if (fast) state <= slow19;
else state <= slow20;

slow21:
if (reset) state <= origin;
else if (slow) state <= slow22;
else if (fast) state <= slow20;
else state <= slow21;

slow22:
if (reset) state <= origin;
else if (slow) state <= slow23;
else if (fast) state <= slow21;
else state <= slow22;

slow23:
if (reset) state <= origin;
else if (slow) state <= slow24;
else if (fast) state <= slow22;
else state <= slow23;

slow24:
if (reset) state <= origin;
else if (slow) state <= slow25;
else if (fast) state <= slow23;
else state <= slow24;

slow25:
if (reset) state <= origin;
else if (slow) state <= slow26;
else if (fast) state <= slow24;
else state <= slow25;

slow26:
if (reset) state <= origin;
else if (slow) state <= slow27;
else if (fast) state <= slow25;
else state <= slow26;

slow27:
if (reset) state <= origin;
else if (slow) state <= slow28;
else if (fast) state <= slow26;
else state <= slow27;

slow28:
if (reset) state <= origin;
else if (slow) state <= slow29;
else if (fast) state <= slow27;
else state <= slow28;

slow29:
if (reset) state <= origin;
else if (slow) state <= slow30;
else if (fast) state <= slow28;
else state <= slow29;

slow30:
if (reset) state <= origin;
else if (slow) state <= slow31;
else if (fast) state <= slow29;
else state <= slow30;

slow31:
if (reset) state <= origin;
else if (fast) state <= slow30;
else state <= slow31;
endcase


//freq div default 22kHz (for audio_data) *obtained from module in lab 1 
always_ff @(posedge clk)
r_reg <= r_next;

always_comb
if (r_reg >= ((div_count/2)-1)) r_next = 0;
else r_next = r_reg + 1;

always_ff @(posedge clk)
if (r_reg >= ((div_count/2)-1)) new_sig = ~new_sig;
else new_sig = new_sig;



//freq div2 default 11kHz (for address change) *obtained from module in lab 1 

always_ff @(posedge clk)
r_reg2 <= r_next2;

always_comb
if (r_reg2 >= (div_count-1)) r_next2 = 0;
else r_next2 = r_reg2 + 1;

always_ff @(posedge clk)
if (r_reg2 >= (div_count-1)) slow_sig = ~slow_sig;
else slow_sig = slow_sig;

endmodule