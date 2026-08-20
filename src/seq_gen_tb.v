module tb_seq1101;

reg clk;
reg reset;
wire out;

seq1101 uut(clk,reset,out);

always #5 clk = ~clk;

initial
begin
clk = 0;
reset = 1;

#10 reset = 0;

#200 $stop;
end

endmodule
