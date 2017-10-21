`include "selmux.v"
module selmux_tb();

//wires
reg [31:0] data;
reg [7:0] count;
reg selector;
wire [31:0] muxout;

initial begin
	$dumpfile("selmux.vcd");
	$dumpvars(0,selmux_tb);
	data = 32'h00000000;
	count = 7'b0000000;
	selector = 0;
	
	#5 data = 32'hA0A0A0A0;
	#5 data = 32'hFFFFFFFF;
	#5 count = 7'b0001111;
	#5 selector = 1;
	#5 count = 7'b1111111;
	#5 data = 32'h00000000;
	#5 selector = 0;
	#5 $finish;
end

selmux U_mux(
data,
count,
selector,
muxout
);

endmodule