`include "rle2.v"
module rle2_tb();

//wires
reg clock;
reg [31:0] datain;
reg sysres;
wire [31:0] outdata;


initial begin
	$dumpfile("rle2.vcd");
	$dumpvars(0,rle2_tb);
	
	clock = 1'b1;
	sysres = 1'b0;
	datain = 32'h00000000;
	
	
	#50 sysres = 1'b1;
	#100 sysres = 1'b0;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hA0A0A0A0;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hA0A0A0A0;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hCCCCCCCC;
	#20	datain = 32'hA0A0A0A0;
	#50 sysres = 1'b1;
	#100 sysres = 1'b0;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20 datain = 32'hDEADBEEF;
	#20	datain = 32'hFFFFFFFF;
	#20	datain = 32'hFFFFFFFF;
	
	#20 $finish;
end

always begin
	#10 clock = ~clock;
end

rle2 U_rle2(
clock,
datain,
sysres,
outdata
);

endmodule
