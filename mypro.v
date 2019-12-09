module mypro(A,B,C,F);
input A,B,C;
output F;
wire W1,W2,W3,W4;

and(W1,A,B);
not(w2,A);
and(W3,W2,B);
and(W4,B,C);
or(F,W1,W3,W4);

endmodule