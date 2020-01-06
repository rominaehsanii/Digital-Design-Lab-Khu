module control(inputs,ALUSrc, MemtoReg, RegWrite,MemRead, MemWrite, Branch, ALUOperation);

    input [6:0] inputs;
    output ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch;
    reg [7:0] outputs;
    output [1 : 0] ALUOperation;

    assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOperation[1], ALUOperation[0]} = outputs;
     

    always @ (inputs) begin
    
        casex(inputs)
            7'b0110011: outputs = 8'b00100010;	//R-format
            7'b0000011: outputs = 8'b11110000;	//ld
            7'b0100011: outputs = 8'b10001000;	//sd
            7'b1100011: outputs = 8'b00000101;	//beq           
        endcase

    end

endmodule
