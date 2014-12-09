module linear_solver(clk,x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4,c1,c2,c3,done,state,en);

input clk;
input en;
input wire[63:0] x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4;
//reg [63:0]A[2:0][2:0];//[row][column]
real A[2:0][2:0];

//reg [63:0]AI[2:0][2:0];//[row][column] Inverse matrix
real AI[2:0][2:0];

//reg [63:0]B[2:0];
real B[2:0];
output reg signed [63:0] c1,c2,c3;
real cc1,cc2,cc3;
//output real c1,c2,c3;
reg out;
output reg done;
real temp1,temp2,temps;

output reg[4:0]state;

//parameter s0 = 0, s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;
parameter s0_1 = 1,s0_2 = 2,s0_3 = 3, s1_1 = 4, s1_2 = 5, s1_3 = 6, s1_4 = 7, s1_5 = 8, s2_1 = 9, s2_2 = 10, s2_3 = 11, s2_4 = 12,s3_1 = 13, s3_2 = 14,s3_3 = 15, s4 = 16, s5 = 17;


//internal declarations
real determinant;

//stage 0
	real B0_0;
	real B0_1;
	real B0_2;
	real B0_3;
	
	real B1_0;
	real B1_1;
	real B1_2;
	real B1_3;
	
	real B2_0;
	real B2_1;
	real B2_2;
	real B2_3;
	
	
	real B0_s;
	real B0_a;
	
	real B1_s;
	real B1_a;
	
	real B2_s;
	real B2_a;
	
//stage 1

	real D_In_s_0;
	real D_In_s_1;
	real D_In_s_2;
	
	real D_S_0;
	real D_S_1;
	real D_S_2;
	
	real D_final_subtract;
	
	real D_In_0_l;
	real D_In_0_r;
	
	real D_In_1_l;
	real D_In_1_r;
	
	real D_In_2_l;
	real D_In_2_r;
	
//stage 2

	real A_M1_00;
	real A_M2_00;
	
	real A_M1_01;
	real A_M2_01;
	
	real A_M1_02;
	real A_M2_02;
	
	
	real A_M1_10;
	real A_M2_10;
	
	real A_M1_11;
	real A_M2_11;
	
	real A_M1_12;
	real A_M2_12;
	
	
	real A_M1_20;
	real A_M2_20;
	
	real A_M1_21;
	real A_M2_21;
	
	real A_M1_22;
	real A_M2_22;
	
	real A_S_00;
	real A_S_01;
	real A_S_02;
	
	real A_S_10;
	real A_S_11;
	real A_S_12;
	
	real A_S_20;
	real A_S_21;
	real A_S_22;
	
//stage 3

	real C1_M1;
	real C1_M2;
	real C1_M3;

	real C2_M1;
	real C2_M2;
	real C2_M3;

	real C3_M1;
	real C3_M2;
	real C3_M3;

	real C1_A;
	real C2_A;
	real C3_A;


initial begin
	state = s5;
	done = 0;
end	 
	 
always @ (state) begin
//inside here we do all of the stuff needed
case (state)

	s0_1:
	//needs to get broken up into two states
	//1: A- subtraction. B- Squaring
	//2: A- multiplication by 2. B- two subtractions
	//3: B- final subtraction
	begin
	
	done <= 0;
	
	//create A Matrix
	   
	   /*A[0][0] <= 2 * ($bitstoreal(x2)-$bitstoreal(x1));
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
		B[2] <= $bitstoreal(r1)**2 - $bitstoreal(x1)**2 - $bitstoreal(r4)**2 + $bitstoreal(x4)**2;*/
	
		A[0][0] <= ($bitstoreal(x2)-$bitstoreal(x1));
		A[0][1] <= ($bitstoreal(y2)-$bitstoreal(y1));
		A[0][2] <= ($bitstoreal(z2)-$bitstoreal(z1));
	   
	    A[1][0] <= ($bitstoreal(x3)-$bitstoreal(x1));
	    A[1][1] <= ($bitstoreal(y3)-$bitstoreal(y1));
	    A[1][2] <= ($bitstoreal(z3)-$bitstoreal(z1));
	   
	    A[2][0] <= ($bitstoreal(x4)-$bitstoreal(x1));
	    A[2][1] <= ($bitstoreal(y4)-$bitstoreal(y1));
	    A[2][2] <= ($bitstoreal(z4)-$bitstoreal(z1));
		
		
		B0_0 <=  $bitstoreal(r1)**2;
		B0_1 <=  $bitstoreal(x1)**2;
		B0_2 <=  $bitstoreal(r2)**2;
		B0_3 <=  $bitstoreal(x2)**2;
		
		B1_0 <= $bitstoreal(r1)**2;
		B1_1 <= $bitstoreal(x1)**2;
		B1_2 <= $bitstoreal(r3)**2;
		B1_3 <= $bitstoreal(x3)**2;
		
		B2_0 <= $bitstoreal(r1)**2;
		B2_1 <= $bitstoreal(x1)**2;
		B2_2 <= $bitstoreal(r4)**2;
		B2_3 <= $bitstoreal(x4)**2;
		
		
		
	end
	
	s0_2:
	begin
		A[0][0] <= A[0][0] * 2;
		A[0][1] <= A[0][1] * 2;
		A[0][2] <= A[0][2] * 2;
	   
	    A[1][0] <= A[1][0] * 2;
	    A[1][1] <= A[1][1] * 2;
	    A[1][2] <= A[1][2] * 2;
	   
	    A[2][0] <= A[2][0] * 2;
	    A[2][1] <= A[2][1] * 2;
	    A[2][2] <= A[2][2] * 2;
		
		B0_s <= B0_0 - B0_1;
		B0_a <= -B0_2 + B0_3;
		
		B1_s <= B1_0 - B1_1;
		B1_a <= -B1_2 + B1_3;
		
		B2_s <= B2_0 - B2_1;
		B2_a <= -B2_2 + B2_3;
		
		
	
	end
	
	s0_3:
	begin
		
		B[0] <= B0_s + B0_a;
		B[1] <= B1_s + B1_a;
		B[2] <= B2_s + B2_a;
	end
	s1_1:
	//needs to get broken up into 5 states
	//1: multiply inners
	//2: subtract inners
	//3: multiply result with outside
	//4: subtract 1 and 2 sets
	//5: add 3 set
	begin
	//calculate the determinant of the matrix
	//determinant = A[0][0]*((A[1][1] * A[2][2]) - (A[1][2] * A[2][1])) - A[0][1]*((A[1][0] * A[2][2]) - (A[1][2] * A[2][0])) + (A[0][2]*(A[1][0] * A[2][1]) - (A[1][1] * A[2][0]));
	
	D_In_0_l <= A[1][1] * A[2][2];
	D_In_0_r <= A[1][2] * A[2][1];
	
	D_In_1_l <= A[1][0] * A[2][2];
	D_In_1_r <= A[1][2] * A[2][0];
	
	D_In_2_l <= A[1][0] * A[2][1];
	D_In_2_r <= A[1][1] * A[2][0];
	

	
	end
	
	s1_2:
	begin
		
		D_In_s_0 <= D_In_0_l - D_In_0_r;
		D_In_s_1 <= D_In_1_l - D_In_1_r;
		D_In_s_2 <= D_In_2_l - D_In_2_r;
		
		
	end
	
	s1_3:
	begin
		D_S_0 <= A[0][0] * D_In_s_0;
		D_S_1 <= A[0][1] * D_In_s_1;
		D_S_2 <= A[0][2] * D_In_s_2;
		
		
	end
	
	s1_4:
	begin
		D_final_subtract <= D_S_0 - D_S_1;
	end
	
	s1_5:
	begin
		determinant <= D_final_subtract + D_S_2;
	end
	s2_1:
	//need to seperate into 3 states
	//1: multiplications
	//2: subtraction
	//3: divide entire matrix by determinant
	begin
	
	//invert the A matrix
		/*AI[0][0] <= ((A[1][1] * A[2][2]) - (A[1][2] * A[2][1])) / determinant;
		AI[0][1] <= -((A[1][0] * A[2][2]) - (A[1][2] * A[2][0])) / determinant;
		AI[0][2] <= ((A[0][1] * A[2][1]) - (A[2][0] * A[1][1])) / determinant;
		
		AI[1][0] <= -((A[1][2] * A[2][0]) - (A[1][0] * A[2][2])) / determinant;
		AI[1][1] <= ((A[0][0] * A[2][2]) - (A[0][2] * A[2][0])) / determinant;
		AI[1][2] <= -((A[0][2] * A[1][0]) - (A[0][0] * A[1][2])) / determinant;
		
		AI[2][0] <= ((A[1][0] * A[2][1]) - (A[1][1] * A[2][0])) / determinant;
		AI[2][1] <= -((A[0][1] * A[2][0]) - (A[0][0] * A[2][1])) / determinant;
		AI[2][2] <= ((A[0][0] * A[1][1]) - (A[0][1] * A[1][0])) / determinant;*/
		
		
		A_M1_00 <=  A[1][1] * A[2][2];
		A_M2_00 <=  A[1][2] * A[2][1];
		
		A_M1_01 <=  A[0][1] * A[2][2];
		A_M2_01 <=  A[0][2] * A[2][1];
		
		A_M1_02 <=  A[0][1] * A[1][2];
		A_M2_02 <=  A[0][2] * A[1][1];
		
		
		A_M1_10 <=  A[1][0] * A[2][2];
		A_M2_10 <=  A[1][2] * A[2][0];
		
		A_M1_11 <=  A[0][0] * A[2][2];
		A_M2_11 <=  A[0][2] * A[2][0];
		
		A_M1_12 <=  A[0][0] * A[1][2];
		A_M2_12 <=  A[0][2] * A[1][0];
		
		
		A_M1_20 <=  A[1][0] * A[2][1];
		A_M2_20 <=  A[1][1] * A[2][0];
		
		A_M1_21 <=  A[0][0] * A[2][1];
		A_M2_21 <=  A[0][1] * A[2][0];
		
		A_M1_22 <=  A[0][0] * A[1][1];
		A_M2_22 <=  A[0][1] * A[1][0];
		

		
	end
	
	s2_2:
	begin
	
		A_S_00 <= A_M1_00 - A_M2_00;
		A_S_01 <= A_M1_01 - A_M2_01;
		A_S_02 <= A_M1_02 - A_M2_02;
		
		A_S_10 <= A_M1_10 - A_M2_10;
		A_S_11 <= A_M1_11 - A_M2_11;
		A_S_12 <= A_M1_12 - A_M2_12;
		
		A_S_20 <= A_M1_20 - A_M2_20;
		A_S_21 <= A_M1_21 - A_M2_21;
		A_S_22 <= A_M1_22 - A_M2_22;
		

	end
	
	s2_3:
	begin
		AI[0][0] = A_S_00 / determinant;
		AI[0][1] = -A_S_01 / determinant;
		AI[0][2] = A_S_02 / determinant;
		
		AI[1][0] = -A_S_10 / determinant;
		AI[1][1] = A_S_11 / determinant;
		AI[1][2] = -A_S_12 / determinant;
		
		AI[2][0] = A_S_20 / determinant;
		AI[2][1] = -A_S_21 / determinant;
		AI[2][2] = A_S_22 / determinant;
		
	end
	s3_1:
	//need to be broken into 3 states
	//1: multiplications
	//2: add 1 and 2 sets
	//3: add 3rd set
	begin
	
	//compute AI * B = C
		/*c1 <= AI[0][0] * B[0] + AI[0][1] * B[1] + AI[0][2] * B[2];
		c2 <= AI[1][0] * B[0] + AI[1][1] * B[1] + AI[2][2] * B[2];
		c3 <= AI[2][0] * B[0] + AI[2][1] * B[1] + AI[2][2] * B[2];*/
		
		/*cc1 <= AI[0][0] * B[0] + AI[0][1] * B[1] + AI[0][2] * B[2];
		cc2 <= AI[1][0] * B[0] + AI[1][1] * B[1] + AI[2][2] * B[2];
		cc3 <= AI[2][0] * B[0] + AI[2][1] * B[1] + AI[2][2] * B[2];*/
		
		
	C1_M1 <= AI[0][0] * B[0];
	C1_M2 <= AI[0][1] * B[1];
	C1_M3 <= AI[0][2] * B[2];
	
	C2_M1 <= AI[1][0] * B[0];
	C2_M2 <= AI[1][1] * B[1];
	C2_M3 <= AI[1][2] * B[2];
	
	C3_M1 <= AI[2][0] * B[0];
	C3_M3 <= AI[2][1] * B[1];
	C3_M2 <= AI[2][2] * B[2];
	

	end
	s3_2:
	begin
	
		C1_A <= C1_M1 + C1_M2;
		C2_A <= C2_M1 + C2_M2;
		C3_A <= C3_M1 + C3_M2;
	end
	
	s3_3:
	begin
	
		c1 <= C1_A + C1_M3;
		c2 <= C2_A + C2_M3;
		c3 <= C3_A + C3_M3;
		cc1 <= C1_A + C1_M3;
		cc2 <= C2_A + C2_M3;
		cc3 <= C3_A + C3_M3;
	end
	//now we're done
	s4:
	begin
	$stop;
		done <= 1;
	end
	s5:
		done <=0;
endcase
end
always @ (posedge clk & en) begin
case (state)
    s0_1:
		state <= s0_2;
	s0_2:
		state <= s0_3;
	s0_3:
		state <= s1_1;
    s1_1:
		state <= s1_2;
    s1_2:
		state <= s1_3;	
	s1_3:
		state <= s1_4;
	s1_4:
		state <= s1_5;
    s1_5:
		state <= s2_1;		
    s2_1:
        state <= s2_2;
    s2_2:
        state <= s2_3;
    s2_3:
        state <= s3_1;
   s3_1:
        state <= s3_2;
   s3_2:
        state <= s3_3;
   s3_3:
        state <= s4;		
   s4:
        state <= s0_1;
   s5:
		state <= s0_1;
endcase
end


endmodule