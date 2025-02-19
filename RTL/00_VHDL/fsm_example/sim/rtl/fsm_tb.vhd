-- ============================================================================
-- Title       : FSM Example 2
-- Description : A simple FSM with three states: IDLE, NXT, and STOP.
--              The FSM transitions based on input conditions.
-- Author      : [Your Name]
-- Date        : [Date]
-- ============================================================================


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity fsm_tb is
end entity;

architecture tb of fsm_tb is
    signal clk          : std_logic := '0';
    signal nrst         : std_logic := '0';
    signal move_to_next : std_logic := '0';
    signal move_to_stop : std_logic := '0';

    constant clk_period : time := 10 ns;

begin
    -- Instantiate FSM
    uut: entity work.fsm_example1
        port map (
            clk          => clk,
            nrst         => nrst,
            move_to_next => move_to_next,
            move_to_stop => move_to_stop
        );

    -- Clock process
    process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    process
    begin
        -- Reset
        nrst <= '0';
        wait for 20 ns;
        nrst <= '1';

        -- Move from IDLE to NXT
        wait for clk_period;
        move_to_next <= '1';
        wait for clk_period;
        move_to_next <= '0';

        -- Move from NXT to STOP
        wait for 3 * clk_period;
        move_to_stop <= '1';
        wait for clk_period;
        move_to_stop <= '0';

        -- Let simulation run for some time
        wait for 50 ns;

        -- Stop simulation
        report "Simulation completed";
        wait;
    end process;
end architecture tb;









