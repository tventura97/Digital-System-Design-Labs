module LED(clk, rst, LEDPin, Number);
	input clk, rst;
	input [3:0] Number;
	output [6:0] LEDPin;
	ref [6:0] LEDPin;

	always @ (posedge clk)
			begin 
				case (Number)
					4'b0000: LEDPin = 7'b1000000;
					4'b0001: LEDPin = 7'b1111001;
					4'b0010: LEDPin = 7'b0100100;
					4'b0011: LEDPin = 7'b0110000;
					4'b0100: LEDPin = 7'b0011001;
					4'b0101: LEDPin = 7'b0010010;
					4'b0110: LEDPin = 7'b0000010;
					4'b0111: LEDPin = 7'b1111000;
					4'b1000: LEDPin = 7'b0000000;
					4'b1001: LEDPin = 7'b0010000;
					default: LEDPin = 7'b0000000;
				endcase
			end
endmodule
module 


module Control(clk, sw0, reset, Tens, Ones)
	
	input sw0, reset, clk;
	output [3:0] Tens;
	output [3:0] Ones;

	typedef enum logic[3:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9} statetype;
	statetype [3:0] state_0, nextstate_0, state_1, nextstate_1;
	
	
	//State Register
	always_ff @(posedge clk, negedge reset)
		if (reset) 	
			state_0 <= S0;
			state_1 <= S0;
			
		else			
			state_0 <= nextstate_0;
			state_1 <= nextstate_1;

	//Next state logic for ones
	
	always_comb
		case (state_0)
			S0: 			nextstate = S1;
			S1: 			nextstate = S2;
			S2: 			nextstate = S3;
			S3: 			nextstate = S4;
			S4: 			nextstate = S5;
			S5: 			nextstate = S6;
			S6: 			nextstate = S7;
			S7: 			nextstate = S8;
			S8: 			nextstate = S9;
			S9: 			nextstate = S0; 
			default:		nextstate = S0;


			
			
	//Next state logic for tens
		always_comb
		case (state)
			S0: 			nextstate = S1;
			S1: 			nextstate = S2;
			S2: 			nextstate = S3;
			S3: 			nextstate = S4;
			S4: 			nextstate = S5;
			S5: 			nextstate = S6;
			S6: 			nextstate = S7;
			S7: 			nextstate = S8;
			S8: 			nextstate = S9;
			S9: 			nextstate = S0;
			default:		nextstate = S0;
			
			
			
			
endmodule





