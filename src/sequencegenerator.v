module top(
    input CLOCK_50,
    input RESET,
    output SEQ_OUT
);

wire slow_clk;


clk_div16 divider(
    .clk(CLOCK_50),
    .reset(RESET),
    .clk_out(slow_clk)
);


seq1101 generator(
    .clk(slow_clk),
    .reset(RESET),
    .out(SEQ_OUT)
);

endmodule