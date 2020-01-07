module instruction_memory(read_address, instruction);
	
	input [63:0]read_address;
	output [31:0]instruction;
	reg [7:0]memory[0:127];

  assign instruction[7 : 0] = memory[read_address]; 
  assign instruction[15 : 8] = memory[read_address + 1];
  assign instruction[23 : 16] = memory[read_address + 2];
  assign instruction[31 : 24] = memory[read_address + 3];

	initial begin
		// assign initial data
		
	end
endmodule
