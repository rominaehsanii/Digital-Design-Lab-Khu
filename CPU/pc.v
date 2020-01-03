module PC(clock, write, reset, old_pc, new_pc);
	input clock;
	input write;
	input reset;
	input [63:0] old_pc;
	output reg [63:0] new_pc;

	always @ (posedge clock) begin

		if(reset==1) begin
			new_pc = 0;
		end
		else if(write==1 && reset==0) begin
			new_pc = old_pc;
		end
	end

endmodule
