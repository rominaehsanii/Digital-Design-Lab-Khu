module alu #(parameter n = 64,parameter delay = 100)(input_a, input_b, opcode, output_z, output_data);
	input [n-1:0] input_a;
	input [n-1:0] input_b;
	input [3:0] opcode;
	output reg [63:0]output_data;
	output output_z;

assign output_z = output_data ? 0 : 1 ;
always @(*)begin
	output_data = 64'hz;
	case(opcode)
		4'b0000: output_data = input_a & input_b;
		4'b0001: output_data = input_a | input_b;
		4'b0010: output_data = input_a + input_b;
		4'b0110: output_data = input_a - input_b;

	endcase
end


endmodule
