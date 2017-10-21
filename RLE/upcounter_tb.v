`include "upcounter.v"
module upcounter_tb();

reg clock;
reg reset;
wire [7:0] count;
wire overflow;

initial begin
	$dumpfile("upcounter.vcd");
	$dumpvars(0,upcounter_tb);
	
	clock = 1;
	reset = 0;
	
	#3 reset = 1;
	#2 reset = 0;	
	#600 $finish;
	
end

always begin
	#1 clock = ~clock;
end

upcounter U_upcounter(
clock,
reset,
count,
overflow
);

endmodule