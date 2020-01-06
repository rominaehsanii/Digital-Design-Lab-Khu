module cpu;
	//Clock
	wire clk;
	clock clock_1(clk);

	//PC
	wire pc_reset;
	wire [63:0] new_pc;
	wire [63:0] old_pc;
	pc pc_1(clk, pc_reset, old_pc, new_pc);

	//Instruction Memory
	wire [31:0] instruction;
	instruction_memory inst_mem_1(old_pc, instruction);

	//Adder for PC
	wire [63:0] pc_adder_output;
	adder pc_add_1(old_pc, 64'b100, pc_adder_output);
	
	//Control 
	wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
	wire [1:0] ALUOperation;
	control control_1(instruction[6:0], ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOperation);
	
	//Register Bank			
	wire [63:0] read_data_1;
	wire [63:0] read_data_2;
	registerbank reg_bank_1(clk, instruction[19:15], instruction[24:20], instruction[11:7], DataMemoryMuxOutput, RegWrite, read_data_1, read_data_2);
	

	//Immediate Generator
	wire [63:0] imm_output;
	immediate_generator imm_gen_1(instruction, imm_output);
	
	//ALU Control
	wire [3:0] AluControlOut;
	alucontrol alu_control_1(ALUOperation, instruction[30],instruction[14:12],  AluControlOut);
		

	//ALU SRC Mux
	wire [63:0] ALUSrcMuxOutput;
	multiplexer alusrc_mux_1(read_data_2, imm_output, ALUSrc, ALUSrcMuxOutput);
	

			
	//ALU
	wire [63:0] ALUResult;
	wire ALUZero;
	alu alu_1(read_data_1, ALUSrcMuxOutput, AluControlOut, ALUZero, ALUResult);
	
	//ShiftLeft
	wire [63:0] ShiftedAddress;
	shift_left1 shift_1(imm_output, ShiftedAddress);
	
	//Address Adder
	wire [63:0] SumAddress;
	adder address_adder_1(old_pc, ShiftedAddress, SumAddress);
	
	//Branch & ALUZero Mux
	multiplexer branch_aluzero_mux_1(pc_adder_output, SumAddress, (Branch & ALUZero), new_pc);
	
	//Data Memory
	wire [63:0] DataMemoryOut;
	datamemory datamemory_1(clk, ALUResult, read_data_2, MemRead, MemWrite, DataMemoryOut);
	
	//MemToReg Mux
	wire [63:0] DataMemoryMuxOutput;
	multiplexer memtoreg_mux_1(ALUResult, DataMemoryOut, MemToReg, DataMemoryMuxOutput);
endmodule
