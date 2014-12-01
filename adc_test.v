`define clkperiodby2 5
module adc_test (dout, trustbit);
	output reg [6:0] dout;
	output reg trustbit;
	reg clk;
	reg [6:0] analogcompare;
	reg [6:0] analog1;
	
	adc adc1(
			.clk(clk),
			.analog1(analog1),
			.analogcompare(analogcompare),
			.dout(dout),
			.trustbit(trustbit));
	initial
	begin
	clk = 1'b0;

	#7 		analog1 = 7'b0010000; //analog1 > analogcompare
			  analogcompare = 7'b0000001;

	#10 	analog1 = 7'b0000011; //analog1 < analogcompare
			  analogcompare = 3'b0000111;
	#10 	analog1 = 7'b0010000; //analog1 > (analogcompare == 0)
			  analogcompare = 3'b0000000;
	#10 	analog1 = 7'b0010000; //Analog1 < analogcompare
			  analogcompare = 3'b0011111;
	#10 	analog1 = 7'b0000011; //analog1 == analogcompare
			  analogcompare = 3'b0000011;
	#40 					// Run for some more time
	$stop; 					// before stopping the simulation.

	end
always
 #`clkperiodby2 clk <= ~clk; // Generate 100 MHz clock.
endmodule




