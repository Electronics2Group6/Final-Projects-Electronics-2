module linear_solver(clk,x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4,c1,c2,c3,done,state);

input clk;
input wire[63:0] x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4;
//reg [63:0]A[2:0][2:0];//[row][column]
real A[2:0][2:0];

//reg [63:0]AI[2:0][2:0];//[row][column] Inverse matrix
real AI[2:0][2:0];

//reg [63:0]B[2:0];
real B[2:0];
output reg[63:0] c1,c2,c3;
real cc1,cc2,cc3;
//output real c1,c2,c3;
reg out;
output reg done;
real temp1,temp2,temps;

output reg[2:0]state;
parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;

real determinant;

initial begin
	state = s4;
	done = 0;
end	 
	 
always @ (state) begin
//inside here we do all of the stuff needed
case (state)

	s0:
	begin
	//$stop;
	done <= 0;
	
	//create A Matrix
	   /*A[0][0] <= 2 * (x2-x1);
	   A[0][1] <= 2 * (y2-y1);
	   A[0][2] <= 2 * (z2-z1);
	   
	   A[1][0] <= 2 * (x3-x1);
	   A[1][1] <= 2 * (y3-y1);
	   A[1][2] <= 2 * (z3-z1);
	   
	   A[2][0] <= 2 * (x4-x1);
	   A[2][1] <= 2 * (y4-y1);
	   A[2][2] <= 2 * (z4-z1);*/
	   
	   A[0][0] <= 2 * ($bitstoreal(x2)-$bitstoreal(x1));
	   A[0][1] <= 2 * ($bitstoreal(y2)-$bitstoreal(y1));
	   A[0][2] <= 2 * ($bitstoreal(z2)-$bitstoreal(z1));
	   
	   A[1][0] <= 2 * ($bitstoreal(x3)-$bitstoreal(x1));
	   A[1][1] <= 2 * ($bitstoreal(y3)-$bitstoreal(y1));
	   A[1][2] <= 2 * ($bitstoreal(z3)-$bitstoreal(z1));
	   
	   A[2][0] <= 2 * ($bitstoreal(x4)-$bitstoreal(x1));
	   A[2][1] <= 2 * ($bitstoreal(y4)-$bitstoreal(y1));
	   A[2][2] <= 2 * ($bitstoreal(z4)-$bitstoreal(z1));
   
	//create B matrix
	
		B[0] <= $bitstoreal(r1)**2 - $bitstoreal(x1)**2 - $bitstoreal(r2)**2 + $bitstoreal(x2)**2;
		B[1] <= $bitstoreal(r1)**2 - $bitstoreal(x1)**2 - $bitstoreal(r3)**2 + $bitstoreal(x3)**2;
		B[2] <= $bitstoreal(r1)**2 - $bitstoreal(x1)**2 - $bitstoreal(r4)**2 + $bitstoreal(x4)**2;
	end
	s1:
	begin
	//calculate the determinant of the matrix
	determinant = A[0][0]*((A[1][1] * A[2][2]) - (A[1][2] * A[2][1])) - A[0][1]*((A[1][0] * A[2][2]) - (A[1][2] * A[2][0])) + (A[0][2]*(A[1][0] * A[2][1]) - (A[1][1] * A[2][0]));
	end
	s2:
	begin
	//invert the A matrix
		AI[0][0] <= ((A[1][1] * A[2][2]) - (A[1][2] * A[2][1])) / determinant;
		AI[0][1] <= -((A[1][0] * A[2][2]) - (A[1][2] * A[2][0])) / determinant;
		AI[0][2] <= ((A[0][1] * A[2][1]) - (A[2][0] * A[1][1])) / determinant;
		
		AI[1][0] <= -((A[1][2] * A[2][0]) - (A[1][0] * A[2][2])) / determinant;
		AI[1][1] <= ((A[0][0] * A[2][2]) - (A[0][2] * A[2][0])) / determinant;
		AI[1][2] <= -((A[0][2] * A[1][0]) - (A[0][0] * A[1][2])) / determinant;
		
		AI[2][0] <= ((A[1][0] * A[2][1]) - (A[1][1] * A[2][0])) / determinant;
		AI[2][1] <= -((A[0][1] * A[2][0]) - (A[0][0] * A[2][1])) / determinant;
		AI[2][2] <= ((A[0][0] * A[1][1]) - (A[0][1] * A[1][0])) / determinant;
		
	end
	s3:
	begin
	//$stop;
	//compute AI * B = C
		c1 <= AI[0][0] * B[0] + AI[0][1] * B[1] + AI[0][2] * B[2];
		c2 <= AI[1][0] * B[0] + AI[1][1] * B[1] + AI[2][2] * B[2];
		c3 <= AI[2][0] * B[0] + AI[2][1] * B[1] + AI[2][2] * B[2];
		cc1 <= AI[0][0] * B[0] + AI[0][1] * B[1] + AI[0][2] * B[2];
		cc2 <= AI[1][0] * B[0] + AI[1][1] * B[1] + AI[2][2] * B[2];
		cc3 <= AI[2][0] * B[0] + AI[2][1] * B[1] + AI[2][2] * B[2];
		$stop;
	end
	//now we're done
	s4:
		done <= 1;
	s5:
		done <=0;
endcase
end
always @ (posedge clk) begin
case (state)
   s0:
		state <= s1;
   s1:
		state <= s2;
   s2:
        state <= s3;
   s3:
        state <= s4;
   s4:
         state <= s0;
   s5:
		state <= s0;
endcase
end


endmodule