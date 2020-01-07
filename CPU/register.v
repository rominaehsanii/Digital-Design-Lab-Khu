module register (clk, D, Reset, Q);
	input [63 : 0] D;
	input clk;
	input Reset;
	output reg [63 : 0] Q;

	always @ (posedge clk) begin
		if(Reset == 1'b1)
			Q <= 64'b0;
		else 
			Q <= D;
	end
endmodule
