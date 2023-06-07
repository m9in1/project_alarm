module sound_control(
	input clk_sec,
	input rstn,
	input bud_on,
	input [3:0] hourdec_bud, hourone_bud, mindec_bud, minone_bud,
	input [3:0] hourdec_now, hourone_now, mindec_now, minone_now,
	output logic aud_en, 
	output logic bud_state //0 - not alarm, 1 - alarm

	);
	
	logic [2:0] counter_sec;

	always@(posedge clk or negedge rstn) begin
		if(rstn) begin
			if(bud_state) begin
				if({hourdec_now,hourone_now,mindec_now,minone_now}=={hourdec_bud, hourone_bud, mindec_bud, minone_bud}) begin
					bud_state<=0;
					aud_en<=counter_sec>2 ? 1 : 0;
					counter_sec<=counter_sec+1;
				end else begin
					aud_en<=0;
					counter<=0;
				end
			end




		end else begin
			bud_state<=bud_on;
			aud_en<=0;
			counter<=0;

		end

	end


endmodule