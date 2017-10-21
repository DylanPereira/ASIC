`include "xor_gate.v"
`include "and32.v"

module control(
inA ,
inB ,
clock ,
overflow ,
sysres,
inc ,
reset
);

//input ports
input [31:0] inA ;
input [31:0] inB ;
input clock ;
input overflow;
input sysres;

//output ports
output inc ;
output reset ;

//internal variables
wire [31:0] inA ;
wire [31:0] inB ;
wire [31:0] xor_out ;
wire and_out ;
wire buff_out ;
wire overflow;
wire sysers;
reg inc ;
reg reset ;

//code
xor_gate xg1 (
inA,
inB,
xor_out
);

and32 andg1 (
~xor_out,
and_out
);

buf clock_del (buffout, clock);

always @ (buffout or and_out or overflow or sysres) 
begin:CONTROL

inc = (buffout & and_out)&(~sysres);
reset = ((buffout & ~and_out)|overflow)|(sysres);

end

endmodule
