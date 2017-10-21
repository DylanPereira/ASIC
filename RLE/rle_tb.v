`include "rle.v"
module rle_tb();

//wires
reg clock;
reg [31:0] datain;
reg sysres;
reg dir;
wire [31:0] outdata;


initial begin
	$dumpfile("rle.vcd");
	$dumpvars(0,rle_tb);
	
	dir = 1'b1;
	clock = 1'b1;
	sysres = 1'b0;
	datain = 32'h00000000;
	
	
	#5 sysres = 1'b1;
	#10 sysres = 1'b0;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'hA0A0A0A0;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'hA0A0A0A0;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'h00000000;
	#2	datain = 32'hA0A0A0A0;
	#5 sysres = 1'b1;
	#10 sysres = 1'b0;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2 datain = 32'hDEADBEEF;
	#2	datain = 32'hFFFFFFFF;
	#2	datain = 32'hFFFFFFFF;
	
	#10 $finish;
end

always begin
	#1 clock = ~clock;
end

rle U_rle(
clock,
datain,
sysres,
dir,
outdata
);

endmodule
