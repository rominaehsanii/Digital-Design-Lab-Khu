module registerbank(clock, read_register1, read_register2, write_register, write_data, write, read_data1, read_data2);
	parameter delay = 100;
	
	input clock;
	input [4:0] read_register1;
	input [4:0] read_register2;
	input [4:0] write_register;
	input [63:0] write_data;
	input write;
	output [63:0] read_data1;
	output [63:0] read_data2;
	
	reg [63:0] registerbank  [0:31];

	//fetch data from registerbank  and assign to 
	assign #delay read_data1 = registerbank [read_register1];
	assign #delay read_data2 = registerbank [read_register2];

	integer i;
	initial begin
		for(i=0;i<32;i=i+1)
			registerbank[i] = i;
			end

	
	always @(posedge clock)begin
		if(write==1'b1)begin
			#delay registerbank [write_register] <= write_data;
		end
	end
	
endmodule
