module and32(
in ,
out
);

//input ports
input [31:0] in;

//output ports
output out;

//internal variable
wire [31:0] in;
reg out;

//code
always @ (in)
begin: AND32
out = &in;
end
	
endmodule

