module t_flipflop(
clock ,
toggle ,
reset ,
q ,
not_q
);

//input ports
input clock;
input toggle;
input reset; 

//output ports
output q;
output not_q;

//internals 
wire clock;
wire toggle;
wire reset;
reg q;
reg not_q;

//code
always @ (posedge clock or posedge reset)
begin: FLIPFLOP
	if (reset == 1'b1) begin
		q = 1'b0;
		not_q = 1'b1;
	end
		
	else if (reset == 1'b0) begin
		not_q = (~toggle & ~q)|(toggle & q);
		q = (toggle & ~q)|(q & ~toggle);	
	end
end
endmodule
