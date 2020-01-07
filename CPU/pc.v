module pc(clk, reset, old_pc, new_pc);
	input clk;
	input reset;
	input  [63:0] old_pc;
	output reg [63:0] new_pc;

	always @ (posedge clk) begin
		if(reset==1) 
			new_pc = 0;
		else 
			new_pc = old_pc;
	end

endmodule

