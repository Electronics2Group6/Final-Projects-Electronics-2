module linear_solver_test();

reg clk;
reg done;
real x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4,c1,c2,c3;

linear_solver linear_solver(clk,x1,x2,x3,x4,y1,y2,y3,y4,z1,z2,z3,z4,r1,r2,r3,r4,c1,c2,c3,done);

initial begin
	x1 = 2088202.299;
end

endmodule