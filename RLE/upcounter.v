`include "t_flipflop.v"

module upcounter(
clock,
reset,
count,
overflow
);

//input ports
input clock;
input reset;

//output ports
output [7:0] count;
output overflow;

//internals
wire clock;
wire reset;
reg [7:0] toggle;
wire [7:0] count;
wire [7:0] ncount;
reg overflow;

//code

always @ (posedge count or ncount or toggle or reset)
begin : BICOUNTER
	if (reset == 1) begin			
		toggle[7:0] = 7'b0000011;		
		overflow = 1'b0;		
	end 
	else if (reset == 0) begin
		
		toggle[0] = 1'b1;					//bit 0
		toggle[1] = count[0];  				//bit 1
		toggle[2] = toggle[1]&count[1];
		toggle[3] = toggle[2]&count[2];
		toggle[4] = toggle[3]&count[3];
		toggle[5] = toggle[4]&count[4];
		toggle[6] = toggle[5]&count[5];
		toggle[7] = toggle[6]&count[6];		
		overflow = &count;

	end
end

t_flipflop tff0(
clock,
toggle[0],
reset,
ncount[0],
count[0]
);

t_flipflop tff1(
clock,
toggle[1],
reset,
count[1],
ncount[1]
);

t_flipflop tff2(
clock,
toggle[2],
reset,
count[2],
ncount[2]
);

t_flipflop tff3(
clock,
toggle[3],
reset,
count[3],
ncount[3]
);

t_flipflop tff4(
clock,
toggle[4],
reset,
count[4],
ncount[4]
);

t_flipflop tff5(
clock,
toggle[5],
reset,
count[5],
ncount[5]
);

t_flipflop tff6(
clock,
toggle[6],
reset,
count[6],
ncount[6]
);

t_flipflop tff7(
clock,
toggle[7],
reset,
count[7],
ncount[7]
);


endmodule