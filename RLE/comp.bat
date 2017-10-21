cls
title Execute complete design
::see title at top
iverilog -o bicounter bicounter.v
iverilog -o selmux selmux.v
iverilog -o control control.v
iverilog -o colorbuff colorbuff.v
iverilog -o and32 and32.v
iverilog -o xor_gate xor_gate.v
iverilog -o tff t_flipflop.v
iverilog -o tff t_flipflop_alt.v
iverilog -o rle rle.v
iverilog -o rle_tb rle_tb.v
vvp rle_tb
gtkwave rle.vcd view1.gtkw

