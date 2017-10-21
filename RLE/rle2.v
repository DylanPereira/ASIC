//Author - Dylan P.
//RLE version 2.
//uses upcounter with no direction
//requires additional circuitry for decode 
//exe script comp1.bat

`include "colorbuff.v"
`include "upcounter.v"
`include "control.v"
`include "selmux.v"
`include "delay5.v"

module rle2(
clock,
indata,
sysres,
outdata
);

//inputs 
input clock;
input [31:0] indata;
input sysres;

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
wire [7:0] count;	//counter count value into mux 'count'
wire [31:0] muxout; //output of mux into color buffer 2
wire clock2;
wire clock3;

delay5 buff2(
clock,
clock2
);

delay5 del3(
clock2,
clock3
);

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
clock3,
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

upcounter upcount(
inc,
reset,
count,
overflow
);

selmux mux(
clock,
buff0,
count,
reset,
muxout
);


endmodule