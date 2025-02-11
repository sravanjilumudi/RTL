# Delete existing work directory if it exists
if [file exists work] {
    file delete -force work
}

# Create and map work library
vlib work
vmap work work

# Compile VHDL files
vcom -2008 freq_divider.vhd
vcom -2008 freq_divide_tb.vhd

# Load simulation
vsim -voptargs="+acc" work.freq_divide_tb

# Add signals to waveform
log -r /*
add wave -r sim:/freq_divide_tb/*

# Run simulation for 100 ns
run 100ns

# Zoom to show waveform properly
wave zoom full
