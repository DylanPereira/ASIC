//Author - Dylan P.
//RLE version 1.
//uses bidirectional counter with direction signal
//requires additional circuitry for decode
//tested up to bicounter unit
//exe scrip comp.bat

`include "colorbuff.v"
`include "bicounter.v"
`include "control.v"
`include "selmux.v"

module rle(
clock,
indata,
sysres,
dir,
outdata
);

//inputs 
input clock;
input [31:0] indata;
input sysres;
input dir;

//outputs
output [31:0] outdata;

//wire internal vars
wire clock;			//master system clock
wire [31:0] indata;	//Enters RLE into color buffer 0
wire sysres;		//full system reset	
wire [31:0] outdata;	//leaves RLE

wire [31:0] buff0;	//into color buffer 1	and controller 'inA'
wire [31:0] buff1;	//into mux 'data'		and controller 'inB'
wire overflow; 		//out of bicounter into controller
wire inc;			//out of controller into bicounter
wire reset; 		//out of controller into bicounter and selmux
wire dir;			//RLE encode decode selector counter direction (currently only 1****)
wire [7:0] count;	//counter count value into mux 'count'
wire [31:0] muxout; //output of mux into color buffer 2


colorbuff cb0 (
clock,
sysres,
indata,
buff0
);

colorbuff cb1 (
clock,
sysres,
buff0,
buff1
);

colorbuff cb2 (
clock,
sysres,
muxout,
outdata
);

control ctr(
buff0,
buff1,
clock,
overflow,
sysres,
inc,
reset
);

bicounter bicount(
inc,
dir,
reset,
count,
overflow
);

selmux mux(
buff1,
count,
selector,
muxout
);

endmodule