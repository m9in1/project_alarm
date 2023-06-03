module top_artyx(input CLK100MHZ, 
	input BTNC, 
	output CA,CB,CC,CD,CE,CF,CG,
	output [6:0] AN);


	watch_bindec watch(
		.clk(CLK100MHZ),//input 				clk,
		.rstn(BTNC),//input 				rstn,
		.hourdec_init(hourdec_init),//input [3:0] 		hourdec_init,
		.hourone_init(hourone_init),//input [3:0] 		hourone_init,
		.mindec_init(mindec_init),//input [3:0]			mindec_init,
		.minone_init(minone_init),//input [3:0] 		minone_init,

		.hourdec_now(hourdec_now),//output logic [3:0] 	hourdec_now,
		.hourone_now(hourone_now),//output logic [3:0] 	hourone_now,
		.mindec_now(mindec_now),//output logic [3:0]	mindec_now,
		.minone_now(minone_now),//output logic [3:0] 	minone_now,

		.tim_over(),//input 				tim_over,
		.tim_en(),//output logic		tim_en,

		.CA(),CB(),.CC(),.CD(), .CE(),.CF(),.CG(),//output logic 		CA,CB,CC,CE,CF,CG,
		.AN()//output logic [6:0]	AN
		);
	logic [3:0] hourdec_init, hourone_init, mindec_init, minone_init;
	logic [3:0] hourdec_now, hourone_now, mindec_now, minone_now;
	assign {hourdec_init, hourone_init, mindec_init, minone_init} = {'0,'0,'0,'0};

	


endmodule;