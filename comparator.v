module comparator(A, B, output);
	input [3:0] A, B;
	output reg output ;
	
	always @(A, B)
	begin
		if (A == B)
			output = 1;
		else
			output = 0;
	end
	
endmodule