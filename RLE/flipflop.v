module flipflop (
clock ,
reset ,
data ,
q 
);
//input ports
input clock ;
input data ;
input reset ;
//output ports
output q ;

// internal variable
wire clock ;
wire reset ;
reg q ;

//code
always @ (posedge clock)
begin: FLIPFLOP
	if (reset == 1'b1)begin
		q <= 1'b0;
	end
	else begin
		q <= data;	
	end
end

endmodule