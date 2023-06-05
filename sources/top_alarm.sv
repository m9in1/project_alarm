module top_alarm(
	input clk,
	input rstn,
	input [3:0] hourdec_init, hourone_init, mindec_init, minone_init,
	output logic [3:0] hourdec_now, hourone_now, mindec_now, minone_now,
	output CA,CB,CC,CD,CE,CF,CG,
	output [7:0] AN
	);


    
   
	logic clk_sec, clk_disp;

	watch_bindec watch(
		.clk(clk_sec),
		.clk_disp(clk_disp),//input 				clk,
		.rstn(rstn),//input 				rstn,
		.hourdec_init(hourdec_init),//input [3:0] 		hourdec_init,
		.hourone_init(hourone_init),//input [3:0] 		hourone_init,
		.mindec_init(mindec_init),//input [3:0]			mindec_init,
		.minone_init(minone_init),//input [3:0] 		minone_init,

		.hourdec_now(hourdec_now),//output logic [3:0] 	hourdec_now,
		.hourone_now(hourone_now),//output logic [3:0] 	hourone_now,
		.mindec_now(mindec_now),//output logic [3:0]	mindec_now,
		.minone_now(minone_now),//output logic [3:0] 	minone_now,

		//.tim_over(tim_over),//input 				tim_over,
		//.tim_en(tim_en),//output logic		tim_en,
		.*
		//.CA(),CB(),.CC(),.CD(), .CE(),.CF(),.CG(),//output logic 		CA,CB,CC,CE,CF,CG,
		//.AN()//output logic [6:0]	AN
		);


	div_clk
	#(.MAX_CNT(10000))
	 sec_cnt(
		.clk(clk),
		.rstn(rstn),
		.clk_sec(clk_sec)
		);	
		
		
	div_clk
	#(.MAX_CNT(100))
	 disp_clk(
		.clk(clk),
		.rstn(rstn),
		.clk_sec(clk_disp)
		);	


	

endmodule