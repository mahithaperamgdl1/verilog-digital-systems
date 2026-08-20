module mux2x1_tb;

reg A;
reg B;
reg S;
wire Y;

mux2x1_structural uut (
    .A(A),
    .B(B),
    .S(S),
    .Y(Y)
);

initial
begin
    $monitor("Time=%0t | A=%b B=%b S=%b | Y=%b", $time, A, B, S, Y);

    A=0; B=0; S=0; #10;
    A=0; B=1; S=0; #10;
    A=1; B=0; S=0; #10;
    A=1; B=1; S=0; #10;

    A=0; B=0; S=1; #10;
    A=0; B=1; S=1; #10;
    A=1; B=0; S=1; #10;
    A=1; B=1; S=1; #10;

    $finish;
end

endmodule