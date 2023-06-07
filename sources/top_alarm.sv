module top_alarm(
	input clk,
	input rstn,
	input bud_en,
	input [3:0] hourdec_init, hourone_init, mindec_init, minone_init,
	output logic [3:0] hourdec_now, hourone_now, mindec_now, minone_now,
	input [3:0] hourdec_bud, hourone_bud, mindec_bud, minone_bud,
	output clk_sec_o,
	output bud_state_o
	//output CA,CB,CC,CD,CE,CF,CG,
	//output [7:0] AN,
	//output [15:0] led
	);


    
   
	logic clk_sec, clk_disp;
    assign clk_sec_o = clk_sec;
	watch_bindec watch(
		.clk(clk_sec),
		//.clk_disp(clk_disp),//input 				clk,
		.rstn(rstn),//input 				rstn,
		.hourdec_init(hourdec_init),//input [3:0] 		hourdec_init,
		.hourone_init(hourone_init),//input [3:0] 		hourone_init,
		.mindec_init(mindec_init),//input [3:0]			mindec_init,
		.minone_init(minone_init),//input [3:0] 		minone_init,

		.hourdec_now(hourdec_now),//output logic [3:0] 	hourdec_now,
		.hourone_now(hourone_now),//output logic [3:0] 	hourone_now,
		.mindec_now(mindec_now),//output logic [3:0]	mindec_now,
		.minone_now(minone_now)//output logic [3:0] 	minone_now,

		//.tim_over(tim_over),//input 				tim_over,
		//.tim_en(tim_en),//output logic		tim_en,
		//.*
		//.CA(),CB(),.CC(),.CD(), .CE(),.CF(),.CG(),//output logic 		CA,CB,CC,CE,CF,CG,
		//.AN()//output logic [6:0]	AN
		);



	//here will be sound module(clk100mhz, rstn, aud_en, pwm.....)....




	sound_control sound_control(
		.clk_sec(clk_sec),
		.rstn(rstn),
		.bud_on(bud_on),
		.bud_state(bud_state_o),
		.*
		);



	clk_div #(
		.N(28),
		.WIDTH(100000000)
		)
	clk_sec(
		.clk(clk),
		.rst_n(rstn),
		.o_clk(clk_sec)
				);


	// div_clk
	// #(.MAX_CNT(1000000000))//00))//????? its working for 100MHZ
	//  sec_cnt(
	// 	.clk(clk),
	// 	.rstn(rstn),
	// 	.clk_sec(clk_sec)
	// 	);	
		
		
	// div_clk
	// #(.MAX_CNT(100))
	//  disp_clk(
	// 	.clk(clk),
	// 	.rstn(rstn),
	// 	.clk_sec(clk_disp)
	// 	);	



	

	

endmodule