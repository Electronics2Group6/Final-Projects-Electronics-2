`define clkperiodby2 10
`define clkby2 10
`include "SatRAM.v"
module SatRAM_testbench(dout);
output [127:0] dout;
reg clk;
reg rnw;
reg [4:0] ra, wa;
reg [31:0] tim;
reg [31:0] xpos;
reg [31:0] ypos;
reg [31:0] zpos;


SatRAM u1(
	.clk(clk),
	.rnw(rnw),
	.ra(ra),
	.wa(wa),
	.tim(tim),
	.xpos(xpos),
	.ypos(ypos),
	.zpos(zpos),
	.dout(dout)
);

initial
begin
	clk = 1'b0;
	rnw = 1'b0;
	wa = 5'd0; tim = 32'h0; xpos = 32'h0; ypos = 32'h0; zpos = 32'h0;
	#17 wa = 5'd1; tim = 32'h10; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	
	// Write first block of data into ram1.
	#20 wa = 5'd2; tim = 32'h40; xpos = 32'hF; ypos = 32'hF; zpos = 32'hF;
	#20 wa = 5'd3; tim = 32'h160; xpos = 32'hAA; ypos = 32'hBB; zpos = 32'hCC;
	#20 wa = 5'd4; tim = 32'h200; xpos = 32'hFF; ypos = 32'hFF; zpos = 32'hFF;
	#20 wa = 5'd5; tim = 32'h300; xpos = 32'hAAA; ypos = 32'hAAA; zpos = 32'hAAA;
	#20 wa = 5'd6; tim = 32'h700; xpos = 32'h1000; ypos = 32'h1000; zpos = 32'h1000;
	#20 wa = 5'd7; tim = 32'h6000; xpos = 32'h0; ypos = 32'h50000; zpos = 32'h40;
	#20 wa = 5'd8; tim = 32'h10000; xpos = 32'hBB; ypos = 32'hBC; zpos = 32'hBCB;
	#20 wa = 5'd9; tim = 32'h1; xpos = 32'h500; ypos = 32'h600; zpos = 32'h1000;
	#20 wa = 5'd10; tim = 32'h30000; xpos = 32'h78; ypos = 32'h4645; zpos = 32'h4877;
	#20 wa = 5'd11; tim = 32'h40000; xpos = 32'hBBBBBB; ypos = 32'hCCCCC; zpos = 32'hDDDDDD;
	#20 wa = 5'd12; tim = 32'hCCCCC; xpos = 32'h2353; ypos = 32'h374364; zpos = 32'h893487;
	#20 wa = 5'd13; tim = 32'h0; xpos = 32'hABCDEF; ypos = 32'hACACACA; zpos = 32'hABABA;
	#20 wa = 5'd14; tim = 32'h800000; xpos = 32'h132; ypos = 32'hA457E; zpos = 32'hA975E;
	#20 wa = 5'd15; tim = 32'h9000; xpos = 32'h354676; ypos = 32'h785EE; zpos = 32'h88879E;
	#20 wa = 5'd16; tim = 32'h4000; xpos = 32'hA000; ypos = 32'hABBBBB; zpos = 32'hACCCCC;
	#20 wa = 5'd17; tim = 32'h800000; xpos = 32'hAAAAAAA; ypos = 32'hAAAAAAA; zpos = 32'hAAA;
	#20 wa = 5'd18; tim = 32'h40A8A8; xpos = 32'h8484; ypos = 32'h434; zpos = 32'h474738;
	#20 wa = 5'd19; tim = 32'h499999; xpos = 32'hABBBB; ypos = 32'hACBD; zpos = 32'hABEFA;
	#20 wa = 5'd20; tim = 32'h40; xpos = 32'hA0000; ypos = 32'hA80000; zpos = 32'h800345A;
	#20 wa = 5'd21; tim = 32'h8000000; xpos = 32'h80000; ypos = 32'h80000; zpos = 32'h80000;
	#20 wa = 5'd22; tim = 32'h800; xpos = 32'hEEE; ypos = 32'hEEE; zpos = 32'hEEE;
	#20 wa = 5'd23; tim = 32'h60000; xpos = 32'h8000; ypos = 32'hDDDD; zpos = 32'hDDDD;
	#20 wa = 5'd24; tim = 32'h8; xpos = 32'h50; ypos = 32'h60; zpos = 32'h70;
	#20 wa = 5'd25; tim = 32'h4F; xpos = 32'hAF; ypos = 32'hAF; zpos = 32'hAF;
	#20 wa = 5'd26; tim = 32'h40F; xpos = 32'hAFF; ypos = 32'hAFF; zpos = 32'hAFF;
	#20 wa = 5'd27; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 wa = 5'd28; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 wa = 5'd29; tim = 32'h5000; xpos = 32'h500000; ypos = 32'h50000; zpos = 32'h50000;
	#20 wa = 5'd30; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 wa = 5'd31; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#80 rnw = 1'b1;
	#20 ra = 5'd0; wa = 5'd0; tim = 32'h50000; xpos = 32'hAAAA; ypos = 32'h346E; zpos = 32'h45654E;
	
	// Write second block of data into ram2.
	// Simultaneously read from ram1.
	#20 ra = 5'd1; wa = 5'd1; tim = 32'h45600A; xpos = 32'hFEAAAA; ypos = 32'h3E46E2; zpos = 32'h4545654E;
	#20 ra = 5'd2; wa = 5'd2; tim = 32'h40; xpos = 32'hF; ypos = 32'hF; zpos = 32'hF;
	#20 ra = 5'd3; wa = 5'd3; tim = 32'h40000; xpos = 32'hBBBBBB; ypos = 32'hCCCCC; zpos = 32'hDDDDDD;
	#20 ra = 5'd4; wa = 5'd4; tim = 32'h8000000; xpos = 32'h80000; ypos = 32'h80000; zpos = 32'h80000;
	#20 ra = 5'd5; wa = 5'd5; tim = 32'h300; xpos = 32'hAAA; ypos = 32'hAAA; zpos = 32'hAAA;
	#20 ra = 5'd6; wa = 5'd6; tim = 32'h700; xpos = 32'h1000; ypos = 32'h1000; zpos = 32'h1000;
	#20 ra = 5'd7; wa = 5'd7; tim = 32'h40F; xpos = 32'hAFF; ypos = 32'hAFF; zpos = 32'hAFF;
	#20 ra = 5'd8; wa = 5'd8; tim = 32'h10000; xpos = 32'hBB; ypos = 32'hBC; zpos = 32'hBCB;
	#20 ra = 5'd9; wa = 5'd9; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd10; wa = 5'd10; tim = 32'h30000; xpos = 32'h78; ypos = 32'h4645; zpos = 32'h4877;
	#20 ra = 5'd11; wa = 5'd11; tim = 32'h5000; xpos = 32'h500000; ypos = 32'h50000; zpos = 32'h50000;
	#20 ra = 5'd12; wa = 5'd12; tim = 32'h1; xpos = 32'h500; ypos = 32'h600; zpos = 32'h1000;
	#20 ra = 5'd13; wa = 5'd13; tim = 32'h0; xpos = 32'hABCDEF; ypos = 32'hACACACA; zpos = 32'hABABA;
	#20 ra = 5'd14; wa = 5'd14; tim = 32'h800000; xpos = 32'h132; ypos = 32'hA457E; zpos = 32'hA975E;
	#20 ra = 5'd15; wa = 5'd15; tim = 32'h800000; xpos = 32'hAAAAAAA; ypos = 32'hAAAAAAA; zpos = 32'hAAA;
	#20 ra = 5'd16; wa = 5'd16; tim = 32'h9000; xpos = 32'h354676; ypos = 32'h785EE; zpos = 32'h88879E;
	#20 ra = 5'd17; wa = 5'd17; tim = 32'hCCCCC; xpos = 32'h2353; ypos = 32'h374364; zpos = 32'h893487;
	#20 ra = 5'd18; wa = 5'd18; tim = 32'h4000; xpos = 32'hA000; ypos = 32'hABBBBB; zpos = 32'hACCCCC;
	#20 ra = 5'd19; wa = 5'd19; tim = 32'h499999; xpos = 32'hABBBB; ypos = 32'hACBD; zpos = 32'hABEFA;
	#20 ra = 5'd20; wa = 5'd20; tim = 32'h40; xpos = 32'hA0000; ypos = 32'hA80000; zpos = 32'h800345A;
	#20 ra = 5'd21; wa = 5'd21; tim = 32'h200; xpos = 32'hFF; ypos = 32'hFF; zpos = 32'hFF;
	#20 ra = 5'd22; wa = 5'd22; tim = 32'h40A8A8; xpos = 32'h8484; ypos = 32'h434; zpos = 32'h474738;
	#20 ra = 5'd23; wa = 5'd23; tim = 32'h60000; xpos = 32'h8000; ypos = 32'hDDDD; zpos = 32'hDDDD;
	#20 ra = 5'd24; wa = 5'd24; tim = 32'h8; xpos = 32'h50; ypos = 32'h60; zpos = 32'h70;
	#20 ra = 5'd25; wa = 5'd25; tim = 32'h4F; xpos = 32'hAF; ypos = 32'hAF; zpos = 32'hAF;
	#20 ra = 5'd26; wa = 5'd26; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd27; wa = 5'd27; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd28; wa = 5'd28; tim = 32'h800; xpos = 32'hEEE; ypos = 32'hEEE; zpos = 32'hEEE;
	#20 ra = 5'd29; wa = 5'd29; tim = 32'h6000; xpos = 32'h0; ypos = 32'h50000; zpos = 32'h40;
	#20 ra = 5'd30; wa = 5'd30; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd31; wa = 5'd31; tim = 32'h160; xpos = 32'hAA; ypos = 32'hBB; zpos = 32'hCC;
	#80 rnw = 1'b0; ra = 5'd0; wa = 5'd0; tim = 32'h8000000; xpos = 32'h800000; ypos = 32'h80000; zpos = 32'h80000;
	
	// Write third block of data into ram1
	// and simultaneously read from ram2.
	#20 ra = 5'd1; wa = 5'd1; tim = 32'h45600A; xpos = 32'hFEAAAA; ypos = 32'h3E46E2; zpos = 32'h4545654E;
	#20 ra = 5'd2; wa = 5'd2; tim = 32'h40; xpos = 32'hF; ypos = 32'hF; zpos = 32'hF;
	#20 ra = 5'd3; wa = 5'd3; tim = 32'h40000; xpos = 32'hBBBBBB; ypos = 32'hCCCCC; zpos = 32'hDDDDDD;
	#20 ra = 5'd4; wa = 5'd4; tim = 32'h8000000; xpos = 32'h80000; ypos = 32'h80000; zpos = 32'h80000;
	#20 ra = 5'd5; wa = 5'd5; tim = 32'h300; xpos = 32'hAAA; ypos = 32'hAAA; zpos = 32'hAAA;
	#20 ra = 5'd6; wa = 5'd6; tim = 32'h700; xpos = 32'h1000; ypos = 32'h1000; zpos = 32'h1000;
	#20 ra = 5'd7; wa = 5'd7; tim = 32'h40F; xpos = 32'hAFF; ypos = 32'hAFF; zpos = 32'hAFF;
	#20 ra = 5'd8; wa = 5'd8; tim = 32'h10000; xpos = 32'hBB; ypos = 32'hBC; zpos = 32'hBCB;
	#20 ra = 5'd9; wa = 5'd9; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd10; wa = 5'd10; tim = 32'h30000; xpos = 32'h78; ypos = 32'h4645; zpos = 32'h4877;
	#20 ra = 5'd11; wa = 5'd11; tim = 32'h5000; xpos = 32'h500000; ypos = 32'h50000; zpos = 32'h50000;
	#20 ra = 5'd12; wa = 5'd12; tim = 32'h1; xpos = 32'h500; ypos = 32'h600; zpos = 32'h1000;
	#20 ra = 5'd13; wa = 5'd13; tim = 32'h0; xpos = 32'hABCDEF; ypos = 32'hACACACA; zpos = 32'hABABA;
	#20 ra = 5'd14; wa = 5'd14; tim = 32'h800000; xpos = 32'h132; ypos = 32'hA457E; zpos = 32'hA975E;
	#20 ra = 5'd15; wa = 5'd15; tim = 32'h800000; xpos = 32'hAAAAAAA; ypos = 32'hAAAAAAA; zpos = 32'hAAA;
	#20 ra = 5'd16; wa = 5'd16; tim = 32'h9000; xpos = 32'h354676; ypos = 32'h785EE; zpos = 32'h88879E;
	#20 ra = 5'd17; wa = 5'd17; tim = 32'hCCCCC; xpos = 32'h2353; ypos = 32'h374364; zpos = 32'h893487;
	#20 ra = 5'd18; wa = 5'd18; tim = 32'h4000; xpos = 32'hA000; ypos = 32'hABBBBB; zpos = 32'hACCCCC;
	#20 ra = 5'd19; wa = 5'd19; tim = 32'h499999; xpos = 32'hABBBB; ypos = 32'hACBD; zpos = 32'hABEFA;
	#20 ra = 5'd20; wa = 5'd20; tim = 32'h40; xpos = 32'hA0000; ypos = 32'hA80000; zpos = 32'h800345A;
	#20 ra = 5'd21; wa = 5'd21; tim = 32'h200; xpos = 32'hFF; ypos = 32'hFF; zpos = 32'hFF;
	#20 ra = 5'd22; wa = 5'd22; tim = 32'h40A8A8; xpos = 32'h8484; ypos = 32'h434; zpos = 32'h474738;
	#20 ra = 5'd23; wa = 5'd23; tim = 32'h60000; xpos = 32'h8000; ypos = 32'hDDDD; zpos = 32'hDDDD;
	#20 ra = 5'd24; wa = 5'd24; tim = 32'h8; xpos = 32'h50; ypos = 32'h60; zpos = 32'h70;
	#20 ra = 5'd25; wa = 5'd25; tim = 32'h4F; xpos = 32'hAF; ypos = 32'hAF; zpos = 32'hAF;
	#20 ra = 5'd26; wa = 5'd26; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd27; wa = 5'd27; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd28; wa = 5'd28; tim = 32'h800; xpos = 32'hEEE; ypos = 32'hEEE; zpos = 32'hEEE;
	#20 ra = 5'd29; wa = 5'd29; tim = 32'h6000; xpos = 32'h0; ypos = 32'h50000; zpos = 32'h40;
	#20 ra = 5'd30; wa = 5'd30; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd31; wa = 5'd31; tim = 32'h160; xpos = 32'hAA; ypos = 32'hBB; zpos = 32'hCC;
	#80 rnw = 1'b1; ra = 5'd0; wa = 5'd0; tim = 32'h0; xpos = 32'h0; ypos = 32'h0; zpos = 32'h0;
	// Switch the roles of the RAM banks again.
	// Write fourth block of data into ram2 and
	// simultaneously read from ram1.
	#20 ra = 5'd1; wa = 5'd1; tim = 32'h10; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd2; wa = 5'd2; tim = 32'h40; xpos = 32'hF; ypos = 32'hF; zpos = 32'hF;
	#20 ra = 5'd3; wa = 5'd3; tim = 32'h160; xpos = 32'hAA; ypos = 32'hBB; zpos = 32'hCC;
	#20 ra = 5'd4; wa = 5'd4; tim = 32'h200; xpos = 32'hFF; ypos = 32'hFF; zpos = 32'hFF;
	#20 ra = 5'd5; wa = 5'd5; tim = 32'h300; xpos = 32'hAAA; ypos = 32'hAAA; zpos = 32'hAAA;
	#20 ra = 5'd6; wa = 5'd6; tim = 32'h700; xpos = 32'h1000; ypos = 32'h1000; zpos = 32'h1000;
	#20 ra = 5'd7; wa = 5'd7; tim = 32'h6000; xpos = 32'h0; ypos = 32'h50000; zpos = 32'h40;
	#20 ra = 5'd8; wa = 5'd8; tim = 32'h10000; xpos = 32'hBB; ypos = 32'hBC; zpos = 32'hBCB;
	#20 ra = 5'd9; wa = 5'd9; tim = 32'h1; xpos = 32'h500; ypos = 32'h600; zpos = 32'h1000;
	#20 ra = 5'd10; wa = 5'd10; tim = 32'h30000; xpos = 32'h78; ypos = 32'h4645; zpos = 32'h4877;
	#20 ra = 5'd11; wa = 5'd11; tim = 32'h40000; xpos = 32'hBBBBBB; ypos = 32'hCCCCC; zpos = 32'hDDDDDD;
	#20 ra = 5'd12; wa = 5'd12; tim = 32'hCCCCC; xpos = 32'h2353; ypos = 32'h374364; zpos = 32'h893487;
	#20 ra = 5'd13; wa = 5'd13; tim = 32'h0; xpos = 32'hABCDEF; ypos = 32'hACACACA; zpos = 32'hABABA;
	#20 ra = 5'd14; wa = 5'd14; tim = 32'h800000; xpos = 32'h132; ypos = 32'hA457E; zpos = 32'hA975E;
	#20 ra = 5'd15; wa = 5'd15; tim = 32'h9000; xpos = 32'h354676; ypos = 32'h785EE; zpos = 32'h88879E;
	#20 ra = 5'd16; wa = 5'd16; tim = 32'h4000; xpos = 32'hA000; ypos = 32'hABBBBB; zpos = 32'hACCCCC;
	#20 ra = 5'd17; wa = 5'd17; tim = 32'h800000; xpos = 32'hAAAAAAA; ypos = 32'hAAAAAAA; zpos = 32'hAAA;
	#20 ra = 5'd18; wa = 5'd18; tim = 32'h40A8A8; xpos = 32'h8484; ypos = 32'h434; zpos = 32'h474738;
	#20 ra = 5'd19; wa = 5'd19; tim = 32'h499999; xpos = 32'hABBBB; ypos = 32'hACBD; zpos = 32'hABEFA;
	#20 ra = 5'd20; wa = 5'd20; tim = 32'h40; xpos = 32'hA0000; ypos = 32'hA80000; zpos = 32'h800345A;
	#20 ra = 5'd21; wa = 5'd21; tim = 32'h8000000; xpos = 32'h80000; ypos = 32'h80000; zpos = 32'h80000;
	#20 ra = 5'd22; wa = 5'd22; tim = 32'h800; xpos = 32'hEEE; ypos = 32'hEEE; zpos = 32'hEEE;
	#20 ra = 5'd23; wa = 5'd23; tim = 32'h60000; xpos = 32'h8000; ypos = 32'hDDDD; zpos = 32'hDDDD;
	#20 ra = 5'd24; wa = 5'd24; tim = 32'h8; xpos = 32'h50; ypos = 32'h60; zpos = 32'h70;
	#20 ra = 5'd25; wa = 5'd25; tim = 32'h4F; xpos = 32'hAF; ypos = 32'hAF; zpos = 32'hAF;
	#20 ra = 5'd26; wa = 5'd26; tim = 32'h40F; xpos = 32'hAFF; ypos = 32'hAFF; zpos = 32'hAFF;
	#20 ra = 5'd27; wa = 5'd27; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd28; wa = 5'd28; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd29; wa = 5'd29; tim = 32'h5000; xpos = 32'h500000; ypos = 32'h50000; zpos = 32'h50000;
	#20 ra = 5'd30; wa = 5'd30; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#20 ra = 5'd31; wa = 5'd31; tim = 32'h40; xpos = 32'hA; ypos = 32'hA; zpos = 32'hA;
	#80 rnw = 0; ra = 3'd0;
	#20 ra = 3'd1;
	#20 ra = 3'd2;
	#20 ra = 3'd3;
	#20 ra = 3'd4;
	#20 ra = 3'd5;
	#20 ra = 3'd6;
	#20 ra = 3'd7;
	#20 ra = 3'd8;
	#20 ra = 3'd9;
	#20 ra = 3'd10;
	#20 ra = 3'd11;
	#20 ra = 3'd12;
	#20 ra = 3'd13;
	#20 ra = 3'd14;
	#20 ra = 3'd15;
	#20 ra = 3'd16;
	#20 ra = 3'd17;
	#20 ra = 3'd18;
	#20 ra = 3'd19;
	#20 ra = 3'd20;
	#20 ra = 3'd21;
	#20 ra = 3'd22;
	#20 ra = 3'd23;
	#20 ra = 3'd24;
	#20 ra = 3'd25;
	#20 ra = 3'd26;
	#20 ra = 3'd27;
	#20 ra = 3'd28;
	#20 ra = 3'd29;
	#20 ra = 3'd30;
	#20 ra = 3'd31;
	#100
	$stop;

end

always
	#`clkperiodby2 clk <= ~clk;
endmodule
