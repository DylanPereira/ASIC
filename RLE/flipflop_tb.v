`include "flipflop.v"
module flipflop_tb();

reg clock, reset, data;
wire q;

initial begin
	$dumpfile("flipflop_dump.vcd");
	$dumpvars(0,flipflop_tb);
	$monitor ("%g\t %b %b %b ",
			$time, clock, reset, data, q);
	clock = 1;
	reset = 0;
	data = 0;
	#5 reset = 1;
	#5 reset = 0;
	#5 data = 1;
	#5 data = 0;
	#5 data = 1;
	#5 reset = 1;
	#5 reset = 0;
	#5 $finish;
end

//clock gen
always begin
	#1 clock = ~clock;	//toggle every tick
end

//connect DUT to TB
flipflop U_flipflop (
clock,
reset,
data,
q
);

endmodule
