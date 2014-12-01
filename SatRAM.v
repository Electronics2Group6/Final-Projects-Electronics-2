
module SatRAM(clk,pci_clk,rnw,din_valid,be,ra,wa,tim,xpos,ypos,zpos,satID,dout);

input clk;
input pci_clk;
input rnw;
input din_valid;
input [16:0] be;
input [2:0] ra,wa;
input [63:0] tim;
input [63:0] xpos;
input [63:0] ypos;
input [63:0] zpos;
input [7:0] satID;

output reg [263:0] dout;

//wires

wire [263:0] mem_data,do_next;
wire [4:0] addr;
wire [263:0] loc0;
wire [263:0] loc1;
wire [263:0] loc2;
wire [263:0] loc3;
wire [263:0] loc4;
wire [263:0] loc5;
wire [263:0] loc6;
wire [263:0] loc7;
wire [263:0] loc8;
wire [263:0] loc9;
wire [263:0] loc10;
wire [263:0] loc11;
wire [263:0] loc12;
wire [263:0] loc13;
wire [263:0] loc14;
wire [263:0] loc15;
wire [263:0] loc16;

wire be0;
wire be1;
wire be2;
wire be3;
wire be4;
wire be5;
wire be6;
wire be7;
wire be8;
wire be9;
wire be10;
wire be11;
wire be12;
wire be13;
wire be14;
wire be15;
wire be16;

reg [263:0] column;
reg [263:0] mem[16:0];


assign addr = (rnw) ? wa : ra;

assign mem_data = mem[addr];

//temporarily storing data
assign loc0 = mem[0];
assign loc1 = mem[1];
assign loc2 = mem[2];
assign loc3 = mem[3];
assign loc4 = mem[4];
assign loc5 = mem[5];
assign loc6 = mem[6];
assign loc7 = mem[7];
assign loc8 = mem[8];
assign loc9 = mem[9];
assign loc10 = mem[10];
assign loc11 = mem[11];
assign loc12 = mem[12];
assign loc13 = mem[13];
assign loc14 = mem[14];
assign loc15 = mem[15];
assign loc16 = mem[16];

//always whenever something changes
//in this, we get the RAM via column
always @( addr or loc0 or loc1 or loc2 or loc3 or loc4 or loc5 or loc6 or loc7 
		or loc8 or loc9 or loc10 or loc11 or loc12 or loc13 or loc14 or loc15 or loc16)
begin
case(addr)

//TODO UPDATE THIS
5'b00000:
column = {loc0[263:248],loc1[263:248],loc2[263:248],loc3[263:248],loc4[263:248],loc5[263:248],loc6[263:248],loc7[263:248],loc8[263:248],loc9[263:248],loc10[263:248],loc11[263:248],loc12[263:248],loc13[263:248],loc14[263:248],loc15[263:248],loc16[263:248]};

5'b00001:
column = {loc0[247:232],loc1[247:232],loc2[247:232],loc3[247:232],loc4[247:232],loc5[247:232],loc6[247:232],loc7[247:232],loc8[247:232],loc9[247:232],loc10[247:232],loc11[247:232],loc12[247:232],loc13[247:232],loc14[247:232],loc15[247:232],loc16[247:232]};

5'b00010:
column = {loc0[231:216],loc1[231:216],loc2[231:216],loc3[231:216],loc4[231:216],loc5[231:216],loc6[231:216],loc7[231:216],loc8[231:216],loc9[231:216],loc10[231:216],loc11[231:216],loc12[231:216],loc13[231:216],loc14[231:216],loc15[231:216],loc16[231:216]};

5'b00011:
column = {loc0[215:200],loc1[215:200],loc2[215:200],loc3[215:200],loc4[215:200],loc5[215:200],loc6[215:200],loc7[215:200],loc8[215:200],loc9[215:200],loc10[215:200],loc11[215:200],loc12[215:200],loc13[215:200],loc14[215:200],loc15[215:200],loc16[215:200]};

5'b00100:
column = {loc0[199:184],loc1[199:184],loc2[199:184],loc3[199:184],loc4[199:184],loc5[199:184],loc6[199:184],loc7[199:184],loc8[199:184],loc9[199:184],loc10[199:184],loc11[199:184],loc12[199:184],loc13[199:184],loc14[199:184],loc15[199:184],loc16[199:184]};

5'b00101:
column = {loc0[183:168],loc1[183:168],loc2[183:168],loc3[183:168],loc4[183:168],loc5[183:168],loc6[183:168],loc7[183:168],loc8[183:168],loc9[183:168],loc10[183:168],loc11[183:168],loc12[183:168],loc13[183:168],loc14[183:168],loc15[183:168],loc16[183:168]};

5'b00110:
column = {loc0[167:152],loc1[167:152],loc2[167:152],loc3[167:152],loc4[167:152],loc5[167:152],loc6[167:152],loc7[167:152],loc8[167:152],loc9[167:152],loc10[167:152],loc11[167:152],loc12[167:152],loc13[167:152],loc14[167:152],loc15[167:152],loc16[167:152]};

5'b00111:
column = {loc0[151:136],loc1[151:136],loc2[151:136],loc3[151:136],loc4[151:136],loc5[151:136],loc6[151:136],loc7[151:136],loc8[151:136],loc9[151:136],loc10[151:136],loc11[151:136],loc12[151:136],loc13[151:136],loc14[151:136],loc15[151:136],loc16[151:136]};

5'b01000:
column = {loc0[135:120],loc1[135:120],loc2[135:120],loc3[135:120],loc4[135:120],loc5[135:120],loc6[135:120],loc7[135:120],loc8[135:120],loc9[135:120],loc10[135:120],loc11[135:120],loc12[135:120],loc13[135:120],loc14[135:120],loc15[135:120],loc16[135:120]};

5'b01001:
column = {loc0[119:104],loc1[119:104],loc2[119:104],loc3[119:104],loc4[119:104],loc5[119:104],loc6[119:104],loc7[119:104],loc8[119:104],loc9[119:104],loc10[119:104],loc11[119:104],loc12[119:104],loc13[119:104],loc14[119:104],loc15[119:104],loc16[119:104]};

5'b01010:
column = {loc0[103:88],loc1[103:88],loc2[103:88],loc3[103:88],loc4[103:88],loc5[103:88],loc6[103:88],loc7[103:88],loc8[103:88],loc9[103:88],loc10[103:88],loc11[103:88],loc12[103:88],loc13[103:88],loc14[103:88],loc15[103:88],loc16[103:88]};

5'b01011:
column = {loc0[87:72],loc1[87:72],loc2[87:72],loc3[87:72],loc4[87:72],loc5[87:72],loc6[87:72],loc7[87:72],loc8[87:72],loc9[87:72],loc10[87:72],loc11[87:72],loc12[87:72],loc13[87:72],loc14[87:72],loc15[87:72],loc16[87:72]};

5'b01100:
column = {loc0[71:56],loc1[71:56],loc2[71:56],loc3[71:56],loc4[71:56],loc5[71:56],loc6[71:56],loc7[71:56],loc8[71:56],loc9[71:56],loc10[71:56],loc11[71:56],loc12[71:56],loc13[71:56],loc14[71:56],loc15[71:56],loc16[71:56]};

5'b01101:
column = {loc0[55:40],loc1[55:40],loc2[55:40],loc3[55:40],loc4[55:40],loc5[55:40],loc6[55:40],loc7[55:40],loc8[55:40],loc9[55:40],loc10[55:40],loc11[55:40],loc12[55:40],loc13[55:40],loc14[55:40],loc15[55:40],loc16[55:40]};

5'b01110:
column = {loc0[39:24],loc1[39:24],loc2[39:24],loc3[39:24],loc4[39:24],loc5[39:24],loc6[39:24],loc7[39:24],loc8[39:24],loc9[39:24],loc10[39:24],loc11[39:24],loc12[39:24],loc13[39:24],loc14[39:24],loc15[39:24],loc16[39:24]};

5'b01111:
column = {loc0[23:8],loc1[23:8],loc2[23:8],loc3[23:8],loc4[23:8],loc5[23:8],loc6[23:8],loc7[23:8],loc8[23:8],loc9[23:8],loc10[23:8],loc11[23:8],loc12[23:8],loc13[23:8],loc14[23:8],loc15[23:8],loc16[23:8]};

5'b10000:
column = {loc0[7:0],loc1[7:0],loc2[7:0],loc3[7:0],loc4[7:0],loc5[7:0],loc6[7:0],loc7[7:0],loc8[7:0],loc9[7:0],loc10[7:0],loc11[7:0],loc12[7:0],loc13[7:0],loc14[7:0],loc15[7:0],loc16[7:0]};

endcase
end

//enabling write only for particular bit
assign be16 = (!be[16]) & rnw & din_valid;
assign be15 = (!be[15]) & rnw & din_valid;
assign be14 = (!be[14]) & rnw & din_valid;
assign be13 = (!be[13]) & rnw & din_valid;
assign be12 = (!be[12]) & rnw & din_valid;
assign be11 = (!be[11]) & rnw & din_valid;
assign be10 = (!be[10]) & rnw & din_valid;
assign be9 = (!be[9]) & rnw & din_valid;
assign be8 = (!be[8]) & rnw & din_valid;
assign be7 = (!be[7]) & rnw & din_valid;
assign be6 = (!be[6]) & rnw & din_valid;
assign be5 = (!be[5]) & rnw & din_valid;
assign be4 = (!be[4]) & rnw & din_valid;
assign be3 = (!be[3]) & rnw & din_valid;
assign be2 = (!be[2]) & rnw & din_valid;
assign be1 = (!be[1]) & rnw & din_valid;
assign be0 = (!be[0]) & rnw & din_valid;

always @(posedge pci_clk)
begin

mem[addr] <= {((be16)?tim[63:48] : mem_data[263:248]),
				((be15)?tim[47:32] : mem_data[247:232]),
				((be14)?tim[31:16] : mem_data[231:216]),
				((be13)?tim[15:0] : mem_data[215:200]),
				((be12)?xpos[63:48] : mem_data[199:184]),
				((be11)?xpos[47:32] : mem_data[183:168]),
				((be10)?xpos[31:16] : mem_data[167:152]),
				((be9)?xpos[15:0] : mem_data[151:136]),
				((be8)?ypos[63:48] : mem_data[135:120]),
				((be7)?ypos[47:32] : mem_data[119:104]),
				((be6)?ypos[31:16] : mem_data[103:88]),
				((be5)?ypos[15:0] : mem_data[87:72]),
				((be4)?zpos[63:48] : mem_data[71:56]),
				((be3)?zpos[47:32] : mem_data[55:40]),
				((be2)?zpos[31:16] : mem_data[39:24]),
				((be1)?zpos[15:0] : mem_data[23:8]),
				((be0)?satID[7:0] : mem_data[7:0])};
end

assign do_next = (rnw) ? dout:column;

always@(posedge clk)
begin
	dout <= do_next;
end

endmodule
