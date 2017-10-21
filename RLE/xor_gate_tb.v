`include "xor_gate.v"

module xor_gate_tb();

reg [31:0] in1;
reg [31:0] in2;
wire [31:0] out;

initial begin
	$dumpfile("xorgate.vcd");
	$dumpvars(0,xor_gate_tb);
	
	in1 = 32'h0000;
	in2 = 32'h0000;
	
	#5 in1 = 32'h0000;
	#5 in2 = 32'h1111;
	#5 in1 = 32'h1111;
	#5 in2 = 32'h0000;	
	#5 in1 = 32'h0000;
	#5 in2 = 32'b01010101010101010101010101010101;
end

xor_gate U_xor_gate(
in1,
in2,
out
);

endmodule