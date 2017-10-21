`include "bicounter.v"
module bicounter_tb();

reg clock;
reg dir;
reg reset;
wire [7:0] count;
wire overflow;

initial begin
	$dumpfile("bicounter.vcd");
	$dumpvars(0,bicounter_tb);
	
	clock = 1;
	reset = 0;
	dir = 1;
	
	#3 reset = 1;
	#2 reset = 0;
	#600 dir = 0;
	#600 $finish;
	
end

always begin
	#1 clock = ~clock;
end

bicounter U_bicounter(
clock,
dir,
reset,
count,
overflow
);

endmodule