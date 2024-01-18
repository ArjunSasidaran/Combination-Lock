module register(D, clock, new, Reset, Q);

input [3:0] D;
input clock, Reset, new;
output reg [3:0] Q;

always @(posedge clock, negedge Reset)
if (Reset == 0)
	Q <= 4'b0110;
else if (new == 1)
	Q <= D;

endmodule