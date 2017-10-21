`include "counter.v"
module counter_tb();

reg clock, reset, enable;
wire [3:0] counter_out;

initial begin
	$dumpfile("counter_dump.vcd");
	$dumpvars(0,counter_tb);
	$display ("time\t clk reset enable counter");
	$monitor ("%g\t %b %b %b ",
			$time, clock, reset, enable, counter_out);
	
	clock = 1;
	reset = 0;
	enable = 0;
	#5 reset = 1;
	#10 reset = 0;
	#10 enable = 1;
	#180 enable = 0;
	#5 $finish;
end

// Clock gen
always begin
	#5 clock = ~clock;	//toggle every 5 ticks
end

//connect DUT to TB
counter U_counter (
clock,
reset,
enable,
counter_out
);

endmodule
