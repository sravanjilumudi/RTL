# simulate.do - Simulation Script for QuestaSim

# Load the testbench
vsim work.freq_divide_tb

# Restart simulation to clear previous runs
restart -force

# Enable logging of all signals recursively
log -r /*

# Add signals to the waveform window (optional)
add wave -r /*

# Run simulation for 100ns
run 100ns

# Print success message
puts " Simulation completed successfully!"
