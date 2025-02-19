# VHDL Simulation Guide

This document provides step-by-step instructions to run the VHDL simulation in both **GUI and Console modes** using **Cygwin** and **QuestaSim** software.

## Running the Simulation

### **1. Navigate to the Simulation Folder**
Before running the simulation, navigate to the `sim` directory:

cd /cygdrive/c/path/to/your/project/sim


### **2. Running in GUI Mode**
To launch the simulation in **GUI mode**, run:

vsim -do bin/<your_do_file.do>

Replace `<your_do_file.do>` with the actual `.do` script name.

### **3. Running in Console Mode**
For **console mode** (without GUI), use:

vsim -c -do bin/<your_do_file.do>

This runs the simulation in command-line mode.

### **4. Running the Script Directly in QuestaSim**
Alternatively, you can open QuestaSim and run the following command in the **Transcript window**:

do bin/<your_do_file.do>

This executes the `.do` script inside the simulator.

## Notes
- Ensure **QuestaSim** is correctly installed and added to your system's PATH while running via cygwin
- Modify `<your_do_file.do>` with the actual script name you are using.
- Use `pwd` in Cygwin to check the current directory before running the simulation.

Command to set the Cygwin environment 
export PATH=$PATH:/cygdrive/c/questasim/bin
export LM_LICENSE_FILE=27000@<your-license-server>
---

