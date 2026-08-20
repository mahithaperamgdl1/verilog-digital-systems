module seq1101(
input clk,
input reset,
output out
);

wire q1,q0;
wire d1,d0;

/* instantiate flip-flops */

my_dff FF1(clk,reset,d1,q1);
my_dff FF0(clk,reset,d0,q0);

/* next state logic */

assign d1 = q1 ^ q0;
assign d0 = ~q0;

/* output logic (Moore machine) */

assign out = (~q1 & ~q0) | (~q1 & q0) | (q1 & q0);

endmodule
