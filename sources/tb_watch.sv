`timescale 1ns/1ps

module tb_watch();


	logic clk, rstn;
	logic [7:0]AN;
	logic CA,CB,CC,CE,CD,CF,CG;

	top_artyx top(
		.CLK100MHZ(clk),
		.BTNC(rstn),
		.*
		);

	task waitin(input integer num_clk);
		integer i;
		for(i = 0; i<num_clk; i=i+1) begin
			@(posedge clk);

		end

	endtask

	always #5 clk=~clk;

	initial begin
		clk = 0;
		rstn =01;
		waitin(2);
		rstn = 1;
		waitin(2);
		rstn = 0;



	end

endmodule