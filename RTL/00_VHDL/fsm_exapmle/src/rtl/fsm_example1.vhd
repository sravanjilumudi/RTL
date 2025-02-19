-- ============================================================================
-- Title       : FSM Example 1
-- Description : A simple FSM with three states: IDLE, NXT, and STOP.
--              The FSM transitions based on input conditions.
-- Author      : [Your Name]
-- Date        : [Date]
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity fsm_example1 is 
    port (
        clk          : in std_logic;
        nrst         : in std_logic;
        move_to_next : in std_logic;
        move_to_stop : in std_logic
    );
end entity;

architecture rtl of fsm_example1 is
    -- Define state type
    type state_type is (IDLE, NXT, STOP);
    signal curr_state : state_type;
    signal nxt_state  : state_type;
begin 

    -- Sequential process: Updates state on clock edge
    process(clk)
    begin 
        if rising_edge(clk) then
            if nrst = '0' then 
                curr_state <= IDLE;
            else
                curr_state <= nxt_state;
            end if;
        end if;
    end process;

    -- Combinational process: Determines next state
	--Here, Even if we remove the esle section in the case state machine behaves in the same way.
    process(curr_state, move_to_next, move_to_stop)
    begin 
        case curr_state is 
            when IDLE => 
                if move_to_next = '1' then 
                    nxt_state <= NXT;
                --else 
                  --  nxt_state <= IDLE;
                end if;
                
            when NXT => 
                if move_to_stop = '1' then 
                    nxt_state <= STOP;
               -- else 
               --     nxt_state <= NXT;
                end if;

            when STOP => 
                nxt_state <= IDLE;

            when others => 
                nxt_state <= IDLE;
        end case;
    end process;


end architecture rtl;
