cls
title Execute complete design
::see title at top
iverilog -o upcounter upcounter.v
iverilog -o selmux selmux.v
iverilog -o control control.v
iverilog -o colorbuff colorbuff.v
iverilog -o and32 and32.v
iverilog -o xor_gate xor_gate.v
iverilog -o tff t_flipflop.v
iverilog -o tff t_flipflop_alt.v
iverilog -o rle2 rle2.v
iverilog -o rle2_tb rle2_tb.v
vvp rle2_tb
gtkwave rle2.vcd view2.gtkw

