module delay5(
in,
out
);

input in;
output out;

reg out;

always @ (in) begin
	#5 out = in;
end

endmodule

