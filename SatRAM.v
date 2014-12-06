module SatRAM(clk,rnw,ra,wa,tim,xpos,ypos,zpos,dout);

input clk;
input rnw;
input [4:0] ra,wa;
input [31:0] tim;
input [31:0] xpos;
input [31:0] ypos;
input [31:0] zpos;

output reg [127:0] dout;

//wires

wire [4:0] ID;
reg [127:0] loc0;
reg [127:0] loc1;
reg [127:0] loc2;
reg [127:0] loc3;
reg [127:0] loc4;
reg [127:0] loc5;
reg [127:0] loc6;
reg [127:0] loc7;
reg [127:0] loc8;
reg [127:0] loc9;
reg [127:0] loc10;
reg [127:0] loc11;
reg [127:0] loc12;
reg [127:0] loc13;
reg [127:0] loc14;
reg [127:0] loc15;
reg [127:0] loc16;
reg [127:0] loc17;
reg [127:0] loc18;
reg [127:0] loc19;
reg [127:0] loc20;
reg [127:0] loc21;
reg [127:0] loc22;
reg [127:0] loc23;
reg [127:0] loc24;
reg [127:0] loc25;
reg [127:0] loc26;
reg [127:0] loc27;
reg [127:0] loc28;
reg [127:0] loc29;
reg [127:0] loc30;
reg [127:0] loc31;

reg [127:0] mem [5:0];

assign ID = (rnw) ? wa : ra;

//always whenever something changes
//in this, we get the RAM via column
always @(posedge clk or rnw)
begin

	case(ID)

	//TODO UPDATE THIS
	5'b00000:
	loc0 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b00001:
	loc1 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b00010:
	loc2 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b00011:
	loc3 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b00100:
	loc4 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b00101:
	loc5 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b00110:
	loc6 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b00111:
	loc7 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01000:
	loc8 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01001:
	loc9 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01010:
	loc10 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01011:
	loc11 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01100:
	loc12 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01101:
	loc13 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01110:
	loc14 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b01111:
	loc15 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10000:
	loc16 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10001:
	loc17 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10010:
	loc18 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10011:
	loc19 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10100:
	loc20 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10101:
	loc21 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10110:
	loc22 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b10111:
	loc23 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11000:
	loc24 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11001:
	loc25 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11010:
	loc26 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11011:
	loc27 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11100:
	loc28 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11101:
	loc29 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11110:
	loc30 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};

	5'b11111:
	loc31 = {tim[31:0], xpos[31:0], ypos[31:0], zpos[31:0]};
	endcase
end

always @ (posedge clk or ~rnw)
begin

	case(ID)

	
	5'b00000:
	dout = loc0 ;

	5'b00001:
	dout = loc1 ;

	5'b00010:
	dout = loc2 ;

	5'b00011:
	dout = loc3 ;

	5'b00100:
	dout = loc4 ;

	5'b00101:
	dout = loc5 ;

	5'b00110:
	dout = loc6 ;

	5'b00111:
	dout = loc7 ;

	5'b01000:
	dout = loc8 ;

	5'b01001:
	dout = loc9 ;

	5'b01010:
	dout = loc10 ;

	5'b01011:
	dout = loc11 ;

	5'b01100:
	dout = loc12 ;

	5'b01101:
	dout = loc13 ;

	5'b01110:
	dout = loc14 ;

	5'b01111:
	dout = loc15 ;

	5'b10000:
	dout = loc16 ;

	5'b10001:
	dout = loc17 ;

	5'b10010:
	dout = loc18 ;

	5'b10011:
	dout = loc19 ;

	5'b10100:
	dout = loc20 ;

	5'b10101:
	dout = loc21 ;

	5'b10110:
	dout = loc22 ;

	5'b10111:
	dout = loc23 ;

	5'b11000:
	dout = loc24 ;

	5'b11001:
	dout = loc25 ;

	5'b11010:
	dout = loc26 ;

	5'b11011:
	dout = loc27 ;

	5'b11100:
	dout = loc28 ;

	5'b11101:
	dout = loc29 ;

	5'b11110:
	dout = loc30 ;

	5'b11111:
	dout = loc31 ;

endcase

end
endmodule
