# compile.do - Compilation Script for QuestaSim

# Delete the existing 'work' library if it exists
if [file exists work] {
    vdel -all
}

# Create a new work library
vlib work
vmap work work

# Compile VHDL source files
vcom -2008 freq_divider.vhd
vcom -2008 freq_divide_tb.vhd

# Print success message
puts "✅ Compilation completed successfully!"
