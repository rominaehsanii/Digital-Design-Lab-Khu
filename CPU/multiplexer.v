module multiplexer(a, b, select, out);

	
	input [63:0] a;
	input [63:0] b;
	input select;
	output [63:0] out;
	
	assign out = select ? b : a;
endmodule
