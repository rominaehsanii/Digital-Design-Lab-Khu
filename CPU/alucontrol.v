module alucontrol(input [1:0] ALUOp,input Funct7,input [14:12] Funct3,output reg [3:0] operation);
    
    assign key_bits = {ALUOp, Funct7, Funct3};
    
    always @(key_bits) begin
      operation = 4'bz;

      casex(key_bits)
        6'b00xxxx: operation = 4'b0010;
        6'bx1xxxx: operation = 4'b0110;
        6'b1x0000: operation = 4'b0010;
        6'b1x1000: operation = 4'b0110;
        6'b1x0111: operation = 4'b0000;
        6'b1x0110: operation = 4'b0001;
      endcase
    end
  
endmodule
