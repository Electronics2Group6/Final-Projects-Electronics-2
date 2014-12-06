module adc ( clk, analog1, analogcompare, dout1, trustbit);
		input 			    clk;
		input	  [6:0] 	analog1;// 7 bit (128) resolution
		input	  [6:0] 	analogcompare; //same as analog1
		
		output	  [6:0] 	dout1;
		output reg			trustbit; 
		
		reg 	  [6:0] 	dout1;		
		reg 	  [6:0] 	dout1_reg;
		reg 				LEG;

		always @ (posedge clk)
		begin
		  if (analogcompare >= analog1)
				LEG <= 1;
		  else
				LEG <= 0;
		end
		
		always @ (posedge clk)
		begin
				trustbit 	<= LEG;
				dout1 	<= dout1_reg;
		end
		endmodule
