`include "flipflop.v"

module colorbuff (
clock ,
reset ,
data ,
out 
);

//input ports
input clock ;
input reset ;
input [31:0] data ;

//output ports
output [31:0] out	;

//wire
wire clock ;
wire reset ;
wire [31:0] data ;
wire [31:0] out	;

//code
flipflop ff[31:0] (
clock, 
reset,
data[31:0],
out[31:0]
);

endmodule