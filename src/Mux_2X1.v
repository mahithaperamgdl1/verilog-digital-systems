module mux2x1_structural (
    input A,
    input B,
    input S,
    output Y
);

wire nS;
wire w1;
wire w2;

not  G1(nS, S);       
and  G2(w1, A, nS);   
and  G3(w2, B, S);    
or   G4(Y, w1, w2);   

endmodule
