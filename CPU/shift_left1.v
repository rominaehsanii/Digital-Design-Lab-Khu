module Shift_Left1 (shift_in , shift_out);

input [63:0] shift_in;
output [63:0] shift_out;

assign shift_out = shift_in << 1 ;

endmodule
