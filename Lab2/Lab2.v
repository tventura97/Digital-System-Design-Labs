module Lab2(clk, sw1, sw0, onesPlace, tensPlace);

input clk, sw1, sw0;
output [6:0] onesPlace, tensPlace;

wire [3:0] Number0, Number1;
wire inClk;

FreqDivider Divider(.clkin(clk), .clkout(inClk));
Controller MainController(.clk(inClk), .sw0(sw0), .sw1(sw1), .tens(Number1), .ones(Number0));



LED ones(.clk(inClk), .LEDPin(onesPlace), .Number(Number0));
LED tens(.clk(inClk), .LEDPin(tensPlace), .Number(Number1));
endmodule



module LED(clk, LEDPin, Number);
input clk;
input [3:0] Number;
output [6:0] LEDPin;
reg [6:0] LEDPin;

always @ (posedge clk)
begin 
  case (Number)
  4'b0000: LEDPin=7'b1000000;
  4'b0001: LEDPin=7'b1111001;
  4'b0010: LEDPin=7'b0100100;
  4'b0011: LEDPin=7'b0110000;
  4'b0100: LEDPin=7'b0011001;
  4'b0101: LEDPin=7'b0010010;
  4'b0110: LEDPin=7'b0000010;
  4'b0111: LEDPin=7'b1111000;
  4'b1000: LEDPin=7'b0000000;
  4'b1001: LEDPin=7'b0010000;
  endcase 
end
endmodule 


module Controller(clk, sw0, sw1, tens, ones);
	//switch 0 controls the counter.
	//switch 1 is reset
	
	input sw0, sw1, clk;
	integer counter = 0;
	output [3:0]tens, ones;
	reg [3:0] tens, ones;
	always@(posedge clk)
		begin
			if (sw1 == 1)
			begin
				counter = 0;
			end
			else if (sw0 == 1)
			begin
				counter = counter + 1;
			end
			else if (counter > 60)
			begin
				counter = 0;
			end
		
			case(counter % 10)
				
				0: ones = 4'b0000;
				1: ones = 4'b0001;
				2: ones = 4'b0010;
				3: ones = 4'b0011;
				4: ones = 4'b0100;
				5: ones = 4'b0101;
				6: ones = 4'b0110;
				7: ones = 4'b0111;
				8: ones = 4'b1000;
				9:	ones = 4'b1001;	
				default: ones = 4'b0000;
			endcase
			
			case(counter/10)
			
				0: tens = 4'b0000;
				1: tens = 4'b0001;
				2: tens = 4'b0010;
				3: tens = 4'b0011;
				4: tens = 4'b0100;
				5: tens = 4'b0101;
				6: tens = 4'b0110;
				default: tens = 4'b0000;
			endcase			
		end	
endmodule


module FreqDivider(clkin, clkout);
	input clkin;
	output clkout;
	reg clkout;
	integer counter = 0;
	integer clock_tracker = 1;
	always @ (posedge clkin)
	begin
		counter = counter + 1;
		
		if (counter == 1000000) //For the sake of the simulation, we're just gonna leave the clock signal as is and adjust this value for the actual lab sim
		begin
			counter = 0;
			clock_tracker = clock_tracker*-1;
		end
		
		if (clock_tracker == 1)
			clkout = 1;
		else
			clkout = 0;
	end
	
endmodule


