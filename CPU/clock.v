module clock(clk);
	output reg clk = 1;
	always #300 clk = ~clk;
endmodule

