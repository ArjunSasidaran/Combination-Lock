module hexdisp (state, hex);
	input [1:0] state;
	output reg [0:6] hex;
	
	always @(state)
	begin
		case(state)
			2'b00: hex = 7'b1111110; //-
			2'b01: hex = 7'b1100010; //open
			2'b10: hex = 7'b1101010; //new
			2'b11: hex = 7'b0001000; //Alarm
		endcase
	end
endmodule

