module top_artyx(input CLK100MHZ, 
	input BTNC, 
	output CA,CB,CC,CD,CE,CF,CG,
	output [6:0] AN);

logic [3:0] hourdec_init, hourone_init, mindec_init, minone_init;
logic [3:0] hourdec_now, hourone_now, mindec_now, minone_now;

assign {hourdec_init, hourone_init, mindec_init, minone_init} = {'0,'0,'0,'0};
	
	top_alarm alarm(
		.clk(CLK100MHZ),
		.rstn(!BTNC),
		.*
				)


endmodule