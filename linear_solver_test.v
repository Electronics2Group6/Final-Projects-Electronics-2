module linear_solver_test();

reg clk;
wire done;
real x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4,c1,c2,c3;
reg [3:0] a;
wire[3:0]state;
reg en;

integer i = 0;

linear_solver linear_solver(clk,x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4,c1,c2,c3,done,state,en);

initial begin
	en = 1;
	x1 = 2088202.299;
	x2 = 11092568.240;
	x3 = 35606984.591;
	x4 = 3966929.048;
	
	y1 = -11757191.370;
	y2 = -14198201.090;
	y3 = 94447027.237;
	y4 = 7362851.831;
	
	z1 = 25391471.881;
	z2 = 21471165.950;
	z3 = 9101378.572;
	z4 = 26388447.172;
	
	r1 = 23204698.51;
	r2 = 21585835.37;
	r3 = 31364260.01;
	r4 = 24966798.73;
	
	
	for(i = 0; i <= 15; i = i + 1)
	begin
		clk = 0;
		#10;
		clk = 1;
		#10;
	end

	
	$stop;
	
end

endmodule