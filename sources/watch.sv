module watch(
	input 					clk,
	input 					rstn,
	/*input 	[10:0]	time_init,
	output 	[16:0]	time_now*/
	input 					tim_over,
	input 			[4:0]	hour_init,
	input 			[5:0]	min_init,
	output logic	[4:0]	hour_now,
	output logic 	[5:0]	min_now,
	output logic			tim_en,
	output logic 			CA,CB,CC,CE,CF,CG
);
	
	logic [5:0] counter_sec;

	logic [3:0] counter_sec_one;
	logic [3:0] counter_sec_dec;

	logic [3:0] counter_min_one;

	logic [5:0] counter_min;

	always@(negedge rstn) begin:init
		hour_now <= hour_init;
		min_now <= min_init;
		tim_en <= 1;
		counter_sec<=0;
	end:init

	always@(posedge rstn) begin
		tim_en<=0;
	end

	always@(posedge clk) begin
		if(tim_over) begin
			tim_en<=1;
			if(counter_sec==59) begin
				counter_sec<=0;
				if(min_now==59) begin
					min_now<=0;
					if(hour_now==23) hour_now<=0;
					else hour_now<=hour_now+1;
				end else min_now<=min_now+1;
			end else begin
				counter_sec<=counter_sec+1;

			end

		end
	end

	logic [3:0] num_now;

	display7(
		.num(num_now), 
		.*
		);

	always@(posedge clk) begin:pwm_disp



	end: pwm_disp


endmodule