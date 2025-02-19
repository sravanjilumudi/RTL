-- ============================================================================
-- Title       : Testbench for Combinational Logic Example
-- Description : This testbench verifies that:
--               - process_out_f updates based on a process.
--               - immediate_out_z updates immediately via concurrent assignment.
-- Author      : [Your Name]
-- Date        : [Date]
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity combo_logic_example_tb is
end entity;

architecture tb of combo_logic_example_tb is
    -- DUT (Device Under Test) component
    component combo_logic_example
        port (
            input_x       : in std_logic;
            input_y       : in std_logic;
            process_out_f : out std_logic;
            immediate_out_z : out std_logic
        );
    end component;

    -- Signals for connecting to DUT
    signal input_x       : std_logic := '0';
    signal input_y       : std_logic := '0';
    signal process_out_f : std_logic;
    signal immediate_out_z : std_logic;

begin 
    -- Instantiate DUT
    uut: combo_logic_example
        port map (
            input_x       => input_x,
            input_y       => input_y,
            process_out_f => process_out_f,
            immediate_out_z => immediate_out_z
        );

    -- Stimulus process
    process
    begin
        -- Initial values
        report "Starting Simulation...";
        
        -- Test Case 1: 00 → Expect process_out_f = 0, immediate_out_z = 0
        input_x <= '0';
        input_y <= '0';
        wait for 10 ns;

        -- Test Case 2: 01 → Expect process_out_f = 0, immediate_out_z = 0
        input_x <= '0';
        input_y <= '1';
        wait for 10 ns;

        -- Test Case 3: 10 → Expect process_out_f = 0, immediate_out_z = 0
        input_x <= '1';
        input_y <= '0';
        wait for 10 ns;

        -- Test Case 4: 11 → Expect process_out_f = 1, immediate_out_z = 1
        input_x <= '1';
        input_y <= '1';
        wait for 10 ns;

        -- Test Case 5: Toggle back to 00
        input_x <= '0';
        input_y <= '0';
        wait for 10 ns;

        report "Simulation Completed!";
        wait;  -- Stop simulation
    end process;
end architecture tb;
