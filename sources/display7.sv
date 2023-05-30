module display7(
	input [3:0] num,
	output logic CA,CB,CC,CD,CE,CF, CG
	//output logic [6:0] num_seg
);
    logic [6:0] num_seg;

	typedef enum logic [6:0] {
		L0 = 7'b100_0000,
		L1 = 7'b111_1001,
		L2 = 7'b011_0100,
		
		L3 = 7'b011_0000,
		L4 = 7'b001_1001,
		L5 = 7'b001_0010,
		
		L6 = 7'b000_0010,
		L7 = 7'b111_1000,
		L8 = 7'b000_0000,
		L9 = 7'b001_0000
	} seg_ret;
	

	always_comb begin
		case(num)
			4'b0: 		num_seg=L0;
			4'b1: 		num_seg=L1;
			4'b10:		num_seg=L2;
			4'b11:		num_seg=L3;
			4'b100:		num_seg=L4;
			4'b101:		num_seg=L5;
			4'b110:		num_seg=L6;
			4'b111:		num_seg=L7;
			4'b1000:	num_seg=L8;
			4'b1001:	num_seg=L9;
		endcase
        
        CA=num_seg[0];
        CB=num_seg[1];
        CC=num_seg[2];
        CD=num_seg[3];
        CE=num_seg[4];
        CF=num_seg[5];
        CG=num_seg[6];
        
	end


endmodule