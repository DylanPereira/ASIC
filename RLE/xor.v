module xor_gate(
in1	,
in2	,
out	
);

//input ports
input in1;
input in2;

//output ports
output out;

//internal variable
wire in1;
wire in2;
wire out;

//code
out = in1 ^ in2;

endmodule
