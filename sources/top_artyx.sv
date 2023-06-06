module top_artyx(
    input CLK100MHZ, 
	input BTNC, 
	//output CA,CB,CC,CD,CE,CF,CG,
	//output [7:0] AN,
	output [15:0] LED
	);
logic clk_sec;
logic [3:0] hourdec_init, hourone_init, mindec_init, minone_init;
logic [3:0] hourdec_now, hourone_now, mindec_now, minone_now;

assign {hourdec_init, hourone_init, mindec_init, minone_init} = {'0,'0,'0,'0};
//assign {LED[15:12],LED[11:8], LED[7:4], LED[3:0]} = {hourdec_now, hourone_now, mindec_now, minone_now};	
assign LED[0] = clk_sec;
assign LED[15:1] = 0;
logic rstn;
assign rstn = !BTNC;

	top_alarm alarm(
		.clk(CLK100MHZ),
		.rstn(rstn),
		.clk_sec_o(clk_sec),
		.*
				);


endmodule