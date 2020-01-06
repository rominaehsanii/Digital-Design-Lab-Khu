module datamemory(clk, input_address, input_data, read, write, output_data);

	input clk;
	input read;
	input write;

	input [63:0] input_address;
	input [63:0] input_data;

	output [63:0] output_data;

	reg [63:0] memory [0:127];

	assign output_data = read ? memory[input_address] : 64'bz;

	always @(posedge clk) begin
		if(write == 1'b1) begin
			memory[input_address] <= input_data;
		end
	end 
endmodule 
