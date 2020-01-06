module Control (inputs,ALUSrc, MemtoReg, RegWrite,MemRead, MemWrite, Branch, ALUOp1, ALUOp0);

    input [6:0] inputs;
    output ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0;
    reg [7:0] outputs;

    assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} = outputs;
     

    always @ (inputs) begin
    
        casex(inputs)
            7'b0110011: outputs = 8'b00100010;	//R-format
            7'b0000011: outputs = 8'b11110000;	//ld
            7'b0100011: outputs = 8'b10001000;	//sd
            7'b1100011: outputs = 8'b00000101;	//beq           
        endcase

    end

endmodule
