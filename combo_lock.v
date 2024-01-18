module combo_lock(Alarm,New,Open,Clock,Change,Enter,Reset,Password);

	input Clock,Reset,Change,Enter,Password;
	output Alarm,New,Open;

	reg[2:0]y,Y;

	parameter A= 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100; //A = default , B = open , C = failure , D = alarm, E = change state

	always @(y,Enter,Change,Password)
	begin
		case(y)
				// if the password is correct and they hit enter go to the open state
			A: if(Password == 1 & Enter == 1)
					Y = B;
				// if the password is correct and they hit change go to the change state
				else if (Password == 1 & Change == 1)
					Y = E;
				// if the password is wrong and they hit enter go to the failure state
				else if (Password == 0 & Enter == 1)
					Y = C;
				else
					Y = A;
					
			B: if (Enter == 1)
					Y = A;
				else
					Y = B;
					
			C: if (Password == 1 & Enter == 1)
					Y = B;
				// if they enter password wrong again go to alarm state
				else if (Password == 0 & Enter == 1)
					Y = D;
				else
					Y = C;
			
			D: Y = D;
				
				// if they reset password go back to default state
			E: if (Enter == 1 | Change == 1)
					Y = A;
				else
					Y = E;
					
			default: Y = 3'bxxx;
		
		endcase
	end
	
	
	always @(posedge Clock, negedge Reset)
	begin
		// if reset is ever hit go back to default state at anytime
		if(Reset == 0)
			y <= A;
		else
			y <= Y;
	end	

	assign Open = (y == B);
	assign New = (y == E);
	assign Alarm = (y == D);
	
endmodule