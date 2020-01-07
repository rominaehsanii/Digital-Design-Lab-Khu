module immediate_generator(instruction, output_data);

	input [31:0] instruction;
	output reg [63:0] output_data;
	wire key_id = instruction[6:5];

	always @ (instruction) begin
		case(key_id)
			2'b00: output_data = {{52{instruction[31]}}, instruction[31:20]};
			2'b01: output_data = {{52{instruction[31]}}, instruction[31:25], instruction[11:7]};
			2'b11: output_data = {{52{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
		endcase
	end

endmodule
