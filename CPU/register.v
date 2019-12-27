module register #(parameter n = 64) (Clock, D, Reset, Q);
	input [n - 1 : 0] D;
	input Clock;
	input Reset;
	output reg [n - 1 : 0] Q;

	always @ (posedge Clock) begin
		if(Reset == 1'b1)
			Q <= 64'b0;
		else 
			Q <= D;
	end
endmodule
