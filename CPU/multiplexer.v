module mux(a, b, select, out);
	parameter n=64;
	parameter delay = 50;
	
	input [n-1:0] a;
	input [n-1:0] b;
	input select;
	output [n-1:0] out;
	
	assign #delay out = select ? b : a;
endmodule
