`include "and32.v"

module and32_tb();

//input ports
reg [31:0] in;
wire out;

initial begin
	$dumpfile("and32.vcd");
	$dumpvars(0,and32_tb);
	in = 32'h00000000;
	
	#5 in = 32'hFFFFFFFF;
	#5 in = 32'h0FFFFFFF;
	#5 in = 32'h0000000F;
	#5 in = 32'h00000000;
	#5 in = 32'h00000001;	
	#50 $finish;
end

and32 U_and32 (
in ,
out
);

endmodule