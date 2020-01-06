module immediate_generator(instruction, output_data);

	input [31:0] instruction;
	output reg [63:0] output_data;
	wire key_id = instruction[6:5];

	always @ (instruction) begin
		case(key_id)
			2'b00: output_data = {{52{instruction[11]}}, instruction[11:0]};
			2'b01: output_data = {{52{instruction[11]}}, instruction[11:5], instruction[4:0]};
			2'b11: output_data = {{52{instruction[12]}}, instruction[12], instruction[10:5], instruction[4:1], instruction[11]};
		endcase
	end

endmodule
