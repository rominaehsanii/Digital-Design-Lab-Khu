module mypro_tb;
reg A,B,C;
wire F;
test testmycircuit(
	.A(A),
	.B(B),
	.C(C),	
	.F(F)
);

initial
begin 
	assign A=0;
	assign B=0;
	assign C=0;	
	#20
assign A=1;
	assign B=0;
	assign C=0;	
	#20
assign A=0;
	assign B=1;
	assign C=0;	
	#20
assign A=0;
	assign B=0;
	assign C=1;	
	#20
assign A=1;
	assign B=1;
	assign C=1;
#20	
	$finish;
	end
endmodule