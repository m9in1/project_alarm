module div_clk
#(parameter MAX_CNT = 1000000)

(
	input clk,
	input rstn,
	output logic clk_sec
		);
	
	logic [$clog2(MAX_CNT):0] clk_cntr;
	logic state;

	always@(posedge clk or negedge rstn) begin
		if(rstn) begin
			if(clk_cntr<MAX_CNT) begin
				clk_cntr<=clk_cntr+1;
			end else begin
				clk_cntr<=0;
				clk_sec<=state;
				state<=~state;
			end
		end else begin
			clk_cntr <= 0;
			clk_sec<=state;
			state<=0;
		end
		
		end


endmodule