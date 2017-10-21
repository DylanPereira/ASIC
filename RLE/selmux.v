module selmux(
clock,
data,
count,
selector,
muxout
);

//inputs
input clock;
input [31:0] data;
input [7:0] count;
input selector;

//outputs
output [31:0] muxout;

//internals
wire clock;
wire [31:0] data;
wire [7:0] count;
wire selector;
reg [31:0] muxout;
wire clock2;

//code
always @ (posedge clock2 )
begin:SELMUX
	if (selector == 1'b1) begin
		muxout = data;
	end
	else if (selector == 1'b0) begin
		muxout[31:8] = 0;
		muxout [7:0] = count;
	end
end

delay5 buff1(
clock,
clock2
);


endmodule
