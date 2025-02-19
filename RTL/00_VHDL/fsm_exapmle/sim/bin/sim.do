


vlib work
vmap work work

vcom -work work ../src/rtl/fsm_example1.vhd
vcom -work work ../src/rtl/fsm_example2.vhd
vcom -work work ./rtl/fsm_tb.vhd

vsim  -voptargs=+acc work.fsm_tb  ;# Run in console mode for Cygwin

# Add only DUT signals
add wave -r /fsm_tb/UUT/*

run 200ns


