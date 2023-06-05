module div_clk
#(parameter MAX_CNT = 10000)

(
	input clk,
	input rstn,
	output logic clk_sec
		);
	
	logic [13:0] clk_cntr;
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