# Digital Systems in Verilog

Combinational and sequential digital circuits written in Verilog, simulated against testbenches and
synthesised onto a Terasic DE10-Lite (Intel MAX 10) FPGA board.

Built for the Digital Systems lab at IIT Dharwad.

## Modules

| Module | File | Description |
|--------|------|-------------|
| **2×1 Multiplexer** | `Mux_2X1.v` | Combinational two-input mux with select line |
| **8-bit Shifter** | `8bit_shifter.v` | Eight-bit shift register |
| **BCD Counter** | `bcd_counter.v` | Binary-coded-decimal counter, wrapping at 9 |
| **Sequence Generator** | `seq_gen.v`, `sequencegenerator.v` | Sequential circuit producing a fixed output sequence |
| **D Flip-Flop** | `dff.v` | Edge-triggered D flip-flop |
| **T Flip-Flop** | `tff.v` | Toggle flip-flop |
| **Clock** | `clk.v` | Clock generator for simulation |
| **LCD Driver** | `lcd5409.v` | FSM driving a 16x2 character LCD, with a 50 MHz -> ~5 Hz clock divider |

Testbenches are provided for the multiplexer, shifter and sequence generator
(`*_tb.v`), driving the inputs and checking outputs over a simulated waveform.

## Simulating

With Icarus Verilog:

```bash
cd src
iverilog -o mux_tb Mux_2X1.v Mux_2X1_tb.v
vvp mux_tb
```

Or open the design in Vivado / ModelSim and run the corresponding testbench as the simulation
top module.

## Notes

Coursework. Each design was verified in simulation against its testbench before being synthesised
and tested on the FPGA board.

## Lab reports

Written reports for each lab live in [`docs/`](docs/), covering the design, simulation waveforms and
board results. Lab 10 is recorded as a photo of the DE10-Lite showing its seven-segment output
rather than a written report, and lab 6 has no report in this repo.
