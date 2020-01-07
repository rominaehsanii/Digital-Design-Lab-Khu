module registerbank(clk, read_register1, read_register2, write_register, write_data, write, read_data1, read_data2);
	
	input clk;
	input [4:0] read_register1;
	input [4:0] read_register2;
	input [4:0] write_register;
	input [63:0] write_data;
	input write;
	output [63:0] read_data1;
	output [63:0] read_data2;
	
	reg [63:0] registers  [0:31];

	//fetch data from registerbank  and assign to 
	assign  read_data1 = registers [read_register1];
	assign  read_data2 = registers [read_register2];

	integer i;
	initial begin
		for(i=0;i<32;i=i+1)
			registers[i] = i;
			end

	
	always @(posedge clk)begin
		if(write==1'b1)begin
			 registers [write_register] <= write_data;
		end
	end
	
endmodule
