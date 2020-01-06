module cpu_singlecycle;
	wire clk;
	reg pc_reset;
	wire [63:0] new_pc;
	wire [63:0] old_pc;
	wire [31:0] instruction;
	wire [63:0] pc_adder_output;
	wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
	wire [1:0] ALUOperation;
	wire [63:0] read_data_1;
	wire [63:0] read_data_2;
	wire [63:0] imm_output;
	wire [3:0] AluControlOut;
	wire [63:0] ALUSrcMuxOutput;
	wire [63:0] ALUResult;
	wire ALUZero;
	wire [63:0] ShiftedAddress;
	wire [63:0] SumAddress;
	wire [63:0] DataMemoryOut;
	wire [63:0] DataMemoryMuxOutput;

	initial begin
		pc_reset = 1;
		#210 pc_reset = 0;
	end

	//Clock	
	clock clock_1(clk);

	//PC
	pc pc_1(clk, pc_reset, old_pc, new_pc);

	//Instruction Memory
	instruction_memory inst_mem_1(old_pc, instruction);

	//Adder for PC
	adder pc_add_1(old_pc, 64'b100, pc_adder_output);
	
	//Control 
	control control_1(instruction[6:0], ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOperation);
	
	//Register Bank			
	registerbank reg_bank_1(clk, instruction[19:15], instruction[24:20], instruction[11:7], DataMemoryMuxOutput, RegWrite, read_data_1, read_data_2);
	

	//Immediate Generator
	immediate_generator imm_gen_1(instruction, imm_output);
	
	//ALU Control
	alucontrol alu_control_1(ALUOperation, instruction[30],instruction[14:12],  AluControlOut);
		

	//ALU SRC Mux
	multiplexer alusrc_mux_1(read_data_2, imm_output, ALUSrc, ALUSrcMuxOutput);
				
	//ALU
	alu alu_1(read_data_1, ALUSrcMuxOutput, AluControlOut, ALUZero, ALUResult);
	
	//ShiftLeft
	shift_left1 shift_1(imm_output, ShiftedAddress);
	
	//Address Adder
	adder address_adder_1(old_pc, ShiftedAddress, SumAddress);
	
	//Branch & ALUZero Mux
	multiplexer branch_aluzero_mux_1(pc_adder_output, SumAddress, (Branch & ALUZero), new_pc);
	
	//Data Memory
	datamemory datamemory_1(clk, ALUResult, read_data_2, MemRead, MemWrite, DataMemoryOut);
	
	//MemToReg Mux
	multiplexer memtoreg_mux_1(ALUResult, DataMemoryOut, MemToReg, DataMemoryMuxOutput);
endmodule
