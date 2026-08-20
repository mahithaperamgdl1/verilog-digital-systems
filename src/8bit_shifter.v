module barrel_shifter_8bit(
    input [7:0] IN,
    input [2:0] S,    
    output [7:0] OUT
);

wire [7:0] stage1;
wire [7:0] stage2;

// shift by 1
mux2x1_structural m0(IN[0], IN[1], S[0], stage1[0]);
mux2x1_structural m1(IN[1], IN[2], S[0], stage1[1]);
mux2x1_structural m2(IN[2], IN[3], S[0], stage1[2]);
mux2x1_structural m3(IN[3], IN[4], S[0], stage1[3]);
mux2x1_structural m4(IN[4], IN[5], S[0], stage1[4]);
mux2x1_structural m5(IN[5], IN[6], S[0], stage1[5]);
mux2x1_structural m6(IN[6], IN[7], S[0], stage1[6]);
mux2x1_structural m7(IN[7], 1'b0, S[0], stage1[7]);

// shift by 2
mux2x1_structural m8(stage1[0], stage1[2], S[1], stage2[0]);
mux2x1_structural m9(stage1[1], stage1[3], S[1], stage2[1]);
mux2x1_structural m10(stage1[2], stage1[4], S[1], stage2[2]);
mux2x1_structural m11(stage1[3], stage1[5], S[1], stage2[3]);
mux2x1_structural m12(stage1[4], stage1[6], S[1], stage2[4]);
mux2x1_structural m13(stage1[5], stage1[7], S[1], stage2[5]);
mux2x1_structural m14(stage1[6], 1'b0, S[1], stage2[6]);
mux2x1_structural m15(stage1[7], 1'b0, S[1], stage2[7]);

// shift by 4
mux2x1_structural m16(stage2[0], stage2[4], S[2], OUT[0]);
mux2x1_structural m17(stage2[1], stage2[5], S[2], OUT[1]);
mux2x1_structural m18(stage2[2], stage2[6], S[2], OUT[2]);
mux2x1_structural m19(stage2[3], stage2[7], S[2], OUT[3]);
mux2x1_structural m20(stage2[4], 1'b0, S[2], OUT[4]);
mux2x1_structural m21(stage2[5], 1'b0, S[2], OUT[5]);
mux2x1_structural m22(stage2[6], 1'b0, S[2], OUT[6]);
mux2x1_structural m23(stage2[7], 1'b0, S[2], OUT[7]);

endmodule
