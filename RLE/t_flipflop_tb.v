`include "t_flipflop.v"
module t_flipflop_tb();

reg clock;
reg toggle;
reg reset;
wire q;
wire not_q;

initial begin
	$dumpfile("tff.vcd");
	$dumpvars(0,t_flipflop_tb);
	
	reset = 0;
	clock = 1;
	toggle = 0;
	
	#1 reset = 1;
	#2 reset = 0;
	#1 toggle = 1;
	#1 toggle = 0;
	#1 toggle = 1;
	#3 toggle = 0;
	#3 toggle = 1;
	#2 toggle = 0;
	#10 $finish;
end

always begin
 #1 clock = ~clock;
end

t_flipflop tff (
clock,
toggle,
reset,
q,
not_q
);

endmodule