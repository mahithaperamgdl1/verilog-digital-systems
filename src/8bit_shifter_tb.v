`timescale 1ns/1ps

module barrel_shifter_tb;

reg  [7:0] IN;
reg  [2:0] S;
wire [7:0] OUT;

barrel_shifter_8bit uut (
    .IN(IN),
    .S(S),
    .OUT(OUT)
);

initial
begin

    $monitor("Time=%0t | IN=%b | Shift=%b | OUT=%b",
              $time, IN, S, OUT);


    IN = 8'b10101010;

    S = 3'b000; #10;   
    S = 3'b001; #10;   
    S = 3'b010; #10;   
    S = 3'b011; #10;   
    S = 3'b100; #10;   
    S = 3'b101; #10;   
    S = 3'b110; #10;   
    S = 3'b111; #10;  

    IN = 8'b11110000;

    S = 3'b001; #10;
    S = 3'b010; #10;
    S = 3'b100; #10;

    $finish;
end

endmodule
