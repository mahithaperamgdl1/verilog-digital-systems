module lcd5409 (
    input clk,          // 50 MHz clock
    output reg rs,
    output rw,
    output reg en,
    output reg [7:0] data
);

assign rw = 0;

// Slow clock (~5 Hz)
reg [25:0] div = 0;
reg slow = 0;

always @(posedge clk) begin
    if (div == 25000000) begin
        div <= 0;
        slow <= ~slow;
    end else
        div <= div + 1;
end

// FSM
reg [5:0] state = 0;

always @(posedge slow) begin
    case(state)

    // INIT
    0: begin rs<=0; data<=8'h38; en<=1; state<=1; end
    1: begin en<=0; state<=2; end

    2: begin rs<=0; data<=8'h0C; en<=1; state<=3; end
    3: begin en<=0; state<=4; end

    4: begin rs<=0; data<=8'h06; en<=1; state<=5; end
    5: begin en<=0; state<=6; end

    6: begin rs<=0; data<=8'h01; en<=1; state<=7; end
    7: begin en<=0; state<=8; end

    // LINE 1 → DIGITAL SYSTEMS LAB
    8: begin rs<=0; data<=8'h80; en<=1; state<=9; end
    9: begin en<=0; state<=10; end

    10: begin rs<=1; data<="D"; en<=1; state<=11; end
    11: begin en<=0; state<=12; end

    12: begin rs<=1; data<="I"; en<=1; state<=13; end
    13: begin en<=0; state<=14; end

    14: begin rs<=1; data<="G"; en<=1; state<=15; end
    15: begin en<=0; state<=16; end

    16: begin rs<=1; data<="I"; en<=1; state<=17; end
    17: begin en<=0; state<=18; end

    18: begin rs<=1; data<="T"; en<=1; state<=19; end
    19: begin en<=0; state<=20; end

    20: begin rs<=1; data<="A"; en<=1; state<=21; end
    21: begin en<=0; state<=22; end

    22: begin rs<=1; data<="L"; en<=1; state<=23; end
    23: begin en<=0; state<=24; end

    24: begin rs<=1; data<=" "; en<=1; state<=25; end
    25: begin en<=0; state<=26; end

    26: begin rs<=1; data<="S"; en<=1; state<=27; end
    27: begin en<=0; state<=28; end

    28: begin rs<=1; data<="Y"; en<=1; state<=29; end
    29: begin en<=0; state<=30; end

    30: begin rs<=1; data<="S"; en<=1; state<=31; end
    31: begin en<=0; state<=32; end

    32: begin rs<=1; data<="T"; en<=1; state<=33; end
    33: begin en<=0; state<=34; end

    34: begin rs<=1; data<="E"; en<=1; state<=35; end
    35: begin en<=0; state<=36; end

    36: begin rs<=1; data<="M"; en<=1; state<=37; end
    37: begin en<=0; state<=38; end

    38: begin rs<=1; data<="S"; en<=1; state<=39; end
    39: begin en<=0; state<=40; end

    40: begin rs<=1; data<=" "; en<=1; state<=41; end
    41: begin en<=0; state<=42; end

    42: begin rs<=1; data<="L"; en<=1; state<=43; end
    43: begin en<=0; state<=44; end

    44: begin rs<=1; data<="A"; en<=1; state<=45; end
    45: begin en<=0; state<=46; end

    46: begin rs<=1; data<="B"; en<=1; state<=47; end
    47: begin en<=0; state<=48; end

    // LINE 2 → DATE
    48: begin rs<=0; data<=8'hC0; en<=1; state<=49; end
    49: begin en<=0; state<=50; end

    50: begin rs<=1; data<="0"; en<=1; state<=51; end
    51: begin en<=0; state<=52; end

    52: begin rs<=1; data<="7"; en<=1; state<=53; end
    53: begin en<=0; state<=54; end

    54: begin rs<=1; data<="/"; en<=1; state<=55; end
    55: begin en<=0; state<=56; end

    56: begin rs<=1; data<="0"; en<=1; state<=57; end
    57: begin en<=0; state<=58; end

    58: begin rs<=1; data<="4"; en<=1; state<=59; end
    59: begin en<=0; state<=60; end

    60: begin rs<=1; data<="/"; en<=1; state<=61; end
    61: begin en<=0; state<=62; end

    62: begin rs<=1; data<="2"; en<=1; state<=63; end
    63: begin en<=0; state<=64; end

    64: begin rs<=1; data<="0"; en<=1; state<=65; end
    65: begin en<=0; state<=66; end

    66: begin rs<=1; data<="2"; en<=1; state<=67; end
    67: begin en<=0; state<=68; end

    68: begin rs<=1; data<="6"; en<=1; state<=68; end

    endcase
end

endmodule