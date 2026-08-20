module bcd_counter (
    input MAX10_CLK1_50,    // 50 MHz Clock from Board
    input sw_start,         // Slide Switch (SW0)
    output reg led_done,    // LEDR0
    output [6:0] hex0, hex1, hex2, hex3 // 7-segments
);

    // --- CLOCK DIVIDER (50MHz to 1Hz) ---
    reg [25:0] count_50;
    reg clk_1hz = 0;

    always @(posedge MAX10_CLK1_50) begin
        if (count_50 == 25000000 - 1) begin
            count_50 <= 0;
            clk_1hz <= ~clk_1hz;
        end else begin
            count_50 <= count_50 + 1;
        end
    end

    // --- TIMER LOGIC ---
    reg [3:0] min_u = 4'd3;
    reg [3:0] sec_t = 4'd0;
    reg [3:0] sec_u = 4'd0;
    reg running = 0;

    always @(posedge clk_1hz) begin
        // If switch is ON (High) and timer hasn't started yet
        if (sw_start && !running && !led_done) begin
            running <= 1;
        end 
        
        // If switch is OFF (Low), reset the timer
        else if (!sw_start) begin
            running <= 0;
            led_done <= 0;
            min_u <= 4'd3;
            sec_t <= 4'd0;
            sec_u <= 4'd0;
        end

        // Countdown sequence
        else if (running) begin
            if (min_u == 0 && sec_t == 0 && sec_u == 0) begin
                running <= 0;
                led_done <= 1;
            end else begin
                if (sec_u == 0) begin
                    sec_u <= 4'd9;
                    if (sec_t == 0) begin
                        sec_t <= 4'd5;
                        min_u <= min_u - 1;
                    end else begin
                        sec_t <= sec_t - 1;
                    end
                end else begin
                    sec_u <= sec_u - 1;
                end
            end
        end
    end

    // Seven Segment Display Mapping
    bcd_to_7seg s0 (sec_u, hex0);
    bcd_to_7seg s1 (sec_t, hex1);
    bcd_to_7seg s2 (min_u, hex2);
    assign hex3 = 7'b1111111; // Off

endmodule

// BCD to 7-Segment Decoder
module bcd_to_7seg (input [3:0] bcd, output reg [6:0] seg);
    always @(*) begin
        case (bcd)
            4'h0: seg = 7'b1000000; 4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100; 4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001; 4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010; 4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000; 4'h9: seg = 7'b0010000;
            default: seg = 7'b1111111;
        endcase
    end
endmodule