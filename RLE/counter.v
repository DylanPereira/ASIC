module counter (
clock ,
reset ,
enable ,
counter_out	//4 bit out
);
//input ports
input clock ;
input reset ;
input enable ;

//output ports
output [3:0] counter_out ;

//wires
wire clock ;
wire reset ;
wire enable ;
reg [3:0] counter_out ;

// code
always @ (posedge clock)
begin : COUNTER
	if (reset == 1'b1)begin
		counter_out <= #1 4'b0000;
	end
	else if (enable == 1'b1) begin
		counter_out <= #1 counter_out + 1;
	end
end

endmodule


