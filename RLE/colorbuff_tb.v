`include "colorbuff.v"
module colorbuff_tb();

reg clock;
reg reset;
reg [31:0] data; 
wire [31:0] out;

initial begin
	$dumpfile("colorbuff.vcd");
	$dumpvars(0,colorbuff_tb);
	
	clock = 1;
	reset = 0;
	data = 32'h0000; //32 zeros
	
	#5 reset = 1;
	#5 reset = 0;
	#5 data = 32'hFFFF;
	#5 data = 32'h0FFF;
	#5 data = 32'h00FF;
	#5 data = 32'h000F;
	#5 data = 32'h0000;
	#5 $finish;		
end

// Clock gen
always begin
	#1 clock = ~clock;	//toggle every 1 ticks
end

colorbuff U_colorbuff(
clock,
reset,
data,
out
);

endmodule