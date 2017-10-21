`include "t_flipflop.v"
`include "t_flipflop_alt.v"

module bicounter(
clock,
dir,
reset,
count,
overflow
);

//input ports
input clock;
input dir;
input reset;

//output ports
output [7:0] count;
output overflow;

//internals
wire clock;
wire dir;
wire reset;
reg [7:0] toggle;
wire [7:0] count;
wire [7:0] ncount;
wire tempcount;
reg [6:0] top;
reg [6:0] bot;
reg overflow;

//code

always @ (posedge top or bot or count or ncount or toggle or reset)
begin : BICOUNTER
	if (reset == 1) begin
		top [6:0] = 7'b0000000;
		bot[6:0] = 7'b0000000; //was previously 00000000
		toggle[7:0] = 7'b0000011;		
		overflow = 1'b0;		
	end 
	else if (reset == 0) begin
		
		toggle[0] = 1'b1;						//bit 0
		top[0] = (count[0] & dir);			
		bot[0] = (ncount[0] & ~dir);
		toggle[1] = top[0]|bot[0];			//bit 1

		top[1] = (count[1] & top[0]); 
		bot[1] = (ncount[1] & bot[0]);
		toggle[2] = top[1]|bot[1];			//bit 2
		
		top[2] = (count[2] & top[1]); 
		bot[2] = (ncount[2] & bot[1]);
		toggle[3] = top[2]|bot[2];			//bit 3
		
		top[3] = (count[3] & top[2]); 
		bot[3] = (ncount[3] & bot[2]);
		toggle[4] = top[3]|bot[3];			//bit 4
		
		top[4] = (count[4] & top[3]); 
		bot[4] = (ncount[4] & bot[3]);
		toggle[5] = top[4]|bot[4];			//bit 5
		
		top[5] = (count[5] & top[4]); 
		bot[5] = (ncount[5] & bot[4]);
		toggle[6] = top[5]|bot[5];			//bit 6
		
		top[6] = (count[6] & top[5]); 
		bot[6] = (ncount[6] & bot[5]);
		toggle[7] = top[6]|bot[6];			//bit 7
		
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