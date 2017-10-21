`include "control.v"

module control_tb();

reg [31:0] inA;
reg [31:0] inB;
reg clock;
reg overflow;
wire inc;
wire reset; 

initial begin
	$dumpfile("control.vcd");
	$dumpvars(0,control_tb);
	
	clock = 1;
	inA = 0;
	inB = 0;
	overflow = 0;
	
	#5 inA = 32'hFFFFFFFF;
	#10 inB = 32'hAAAAAAAA; 
	#15 inA = 32'hAAAAAAAA;
	#20 inB = 32'h00000000;
	#25 inA = 32'h00000000;
	#20 inB = 32'hA0A0A0A0;
	#10 overflow = 1;
	#50 $finish;
end

always begin
	#1 clock = ~clock;	//toggle every 1 ticks
end

control controlA (
inA,
inB,
clock,
overflow,
inc,
reset
);

endmodule