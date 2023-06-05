module sec_cntr(
	input clk,
	input rstn,
	output clk_sec
		);
	localparam MAX_CNT = 10000;
	logic [13:0] clk_cntr;
	logic state;

	always@(posedge clk or negedge rstn) begin
		if(rstn) begin
			if(clk_counter<MAX_CNT) begin
				clk_cntr<=clk_cntr+1;
			end else begin
				clk_counter<=0;
				clk_sec<=state;
				state<=~state;
			end
		end else begin
			clk_counter <= 0;
			state<=0;
		end


endmodule