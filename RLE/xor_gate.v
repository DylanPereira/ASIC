module xor_gate (
in1	,
in2	,
out	
);

//input ports
input [31:0] in1  ;
input [31:0] in2 ;

//output ports
output [31:0] out ;

//internal variable
wire [31:0] in1 ;
wire [31:0] in2 ;
reg [31:0] out ;

//code
always @ (in1 or in2)
begin: XORGATE
	out <= in1 ^ in2;
end

endmodule
