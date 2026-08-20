module clk_div16(
input clk,
input reset,
output clk_out
);

wire q1,q2,q3,q4;

my_tff t1(clk,reset,q1);
my_tff t2(q1,reset,q2);
my_tff t3(q2,reset,q3);
my_tff t4(q3,reset,q4);

assign clk_out = q4;

endmodule
