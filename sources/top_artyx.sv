module top_artyx(input CLK100MHZ, 
	input BTNC, 
	output CA,CB,CC,CD,CE,CF,CG,
	output [6:0] AN);
	
	localparam MAX_CNT = 10000;

	logic [13:0] clk_counter;
    
    logic [3:0] hourdec_init, hourone_init, mindec_init, minone_init;
	logic [3:0] hourdec_now, hourone_now, mindec_now, minone_now;
	logic tim_over, tim_en;


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

		.tim_over(tim_over),//input 				tim_over,
		.tim_en(tim_en),//output logic		tim_en,
		.*
		//.CA(),CB(),.CC(),.CD(), .CE(),.CF(),.CG(),//output logic 		CA,CB,CC,CE,CF,CG,
		//.AN()//output logic [6:0]	AN
		);


	assign {hourdec_init, hourone_init, mindec_init, minone_init} = {'0,'0,'0,'0};

	always@(posedge CLK100MHZ or negedge BTNC) begin
		if(BTNC) begin
			if(clk_counter<MAX_CNT) begin
				clk_counter<=clk_counter+1;
				tim_over<=0;
				tim_en<=1;
			end else begin
				clk_counter<=0;
				tim_over<=1;
			end
		end else clk_counter <= 0;


	end


endmodule