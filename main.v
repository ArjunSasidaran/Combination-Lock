module main(SW, CLOCK_50, KEY,HEX5);
	
	input CLOCK_50;
	input[9:6]SW;
	input[2:0]KEY;
	
	output[0:6] HEX5;
	reg [1:0] hex;
	
	assign X[3] = SW[9];
	assign X[2] = SW[8];
	assign X[1] = SW[7];
	assign X[0] = SW[6];
	assign Clock = CLOCK_50;
	assign Reset = KEY[2];
	assign Change = KEY[1];
	assign Enter = KEY[0];
	
	wire Clock,Enter,Reset,Change;
	wire[3:0] X;
	wire Password;
   wire Alarm, New, Open;
   wire cpulse,epulse;
	wire[3:0] lock;
	 
	register lock_combination(X, Clock, New, Reset, lock);
	comparator check_combination(X, lock, Password);

   input_condition enter_condition(Clock,epulse,Enter);
   input_condition change_condition(Clock,cpulse,Change);
   combo_lock combination_lock(Alarm,New,Open,Clock,cpulse,epulse,Reset,Password);
	 
	 
	always @(Alarm,New,Open)
	begin
		if (Open == 1)
			hex <= 2'b01;
		else if (Alarm == 1)
			hex <= 2'b11;
		else if (New == 1)
			hex <= 2'b10;
		else
			hex <= 2'b00;
	end

	hexdisp display(hex, HEX5);

endmodule