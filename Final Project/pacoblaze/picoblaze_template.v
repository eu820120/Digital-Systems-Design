
`default_nettype none
 `define USE_PACOBLAZE
module 
picoblaze_template
#(
parameter clk_freq_in_hz = 25000000
) (
				output logic [7:0] led,
				output logic [7:0] phoneme,
				output logic start_ctrl, talk_done,
				input clk,
				input [7:0] input_data, start_talk, word_code, overflow

			     );


assign start_ctrl = out_flags[0];
assign talk_done = talk_ok[0];
//--
//------------------------------------------------------------------------------------
//--
//-- Signals used to connect KCPSM3 to program ROM and I/O logic
//--
logic [7:0] out_flags, talk_ok;

wire[9:0]  address;
wire[17:0]  instruction;
wire[7:0]  port_id;
wire[7:0]  out_port;
reg[7:0]  in_port;
wire  write_strobe;
wire  read_strobe;
reg  interrupt;
wire  interrupt_ack;
wire  kcpsm3_reset;

//--
//-- Signals used to generate interrupt 
//--
reg[26:0] int_count;
reg event_1hz;

//-- Signals for LCD operation
//--
//--

reg        lcd_rw_control;
reg[7:0]   lcd_output_data;
pacoblaze3 led_8seg_kcpsm
(
                  .address(address),
               .instruction(instruction),
                   .port_id(port_id),
              .write_strobe(write_strobe),
                  .out_port(out_port),
               .read_strobe(read_strobe),
                   .in_port(in_port),
                 .interrupt(interrupt),
             .interrupt_ack(interrupt_ack),
                     .reset(kcpsm3_reset),
                       .clk(clk));

 wire [19:0] raw_instruction;
	
	pacoblaze_instruction_memory 
	pacoblaze_instruction_memory_inst(
     	.addr(address),
	    .outdata(raw_instruction)
	);
	
	always @ (posedge clk)
	begin
	      instruction <= raw_instruction[17:0];
	end

    assign kcpsm3_reset = 0;                       
  
//  ----------------------------------------------------------------------------------------------------------------------------------
//  -- Interrupt 
//  ----------------------------------------------------------------------------------------------------------------------------------
//  --
//  --
//  -- Interrupt is used to provide a 1 second time reference.
//  --
//  --
//  -- A simple binary counter is used to divide the 50MHz system clock and provide interrupt pulses.
//  --


// Note that because we are using clock enable we DO NOT need to synchronize with clk

  always @ (posedge clk)
  begin
      //--divide 50MHz by 50,000,000 to form 1Hz pulses
      if (int_count==(clk_freq_in_hz-1)) //clock enable
		begin
         int_count <= 0;
         event_1hz <= 1;
      end else
		begin
         int_count <= int_count + 1;
         event_1hz <= 0;
      end
 end

 always @ (posedge clk or posedge interrupt_ack)  //FF with clock "clk" and reset "interrupt_ack"
 begin
      if (interrupt_ack) //if we get reset, reset interrupt in order to wait for next clock.
            interrupt <= 0;
      else
		begin 
		      if (event_1hz)   //clock enable
      		      interrupt <= 1;
          		else
		            interrupt <= interrupt;
      end
 end

//  --
//  ----------------------------------------------------------------------------------------------------------------------------------
//  -- KCPSM3 input ports 
//  ----------------------------------------------------------------------------------------------------------------------------------
//  --
//  --
//  -- The inputs connect via a pipelined multiplexer
//  --

 always @ (posedge clk)
 begin
    case (port_id[7:0])
        8'h0:    in_port <= input_data;
		  8'hA0:   in_port <= start_talk;
		  8'hC0:   in_port <= word_code;
		  8'hE0:   in_port <= overflow;
        default: in_port <= 8'bx;
    endcase
end
   
//
//  --
//  ----------------------------------------------------------------------------------------------------------------------------------
//  -- KCPSM3 output ports 
//  ----------------------------------------------------------------------------------------------------------------------------------
//  --
//  -- adding the output registers to the processor
//  --
//   
  always @ (posedge clk)
  begin

        //port 80 hex 
        if (write_strobe & port_id[7])  //clock enable 
          talk_ok <= out_port;

        //port 40 hex 
        if (write_strobe & port_id[6])  //clock enable 
          phoneme <= out_port;
			      
		  //port 20 hex 
		  if (write_strobe & port_id[5])  //clock enable 
          out_flags <= out_port;
			      

			      
  end

endmodule
