if { [file exists work] } {
    vdel -lib work -all
}

vlib work
vlib custom_library
vmap work work
vmap custom_library custom_library
# Compile design files
vcom -work custom_library ../src/rtl/combo_logic_example.vhd
vcom -work work ./rtl/combo_logic_example_tb.vhd

# Simulate testbench
vsim -voptargs=+acc work.combo_logic_example_tb

# Add all DUT signals explicitly for better waveform visibility
add wave -r /combo_logic_example_tb/uut/*

# Run the simulation for 200 ns
run 200ns
