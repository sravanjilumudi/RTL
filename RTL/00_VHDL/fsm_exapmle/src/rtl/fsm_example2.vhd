-- ============================================================================
-- Title       : FSM Example 2
-- Description : A simple FSM with three states: IDLE, NXT, and STOP.
--              The FSM transitions based on input conditions.
-- 
-- Note        : The next state (curr_state <= …) is only updated on the clock edge,  
--              meaning the FSM relies only on sequential logic.  
--              This works fine, but debugging is harder if state transitions have issues.  
--              If a Mealy-type FSM is required (where outputs depend on both state and inputs),  
--              having next-state logic inside a clocked process limits flexibility.  
-- 
-- Author      : [Your Name]
-- Date        : [Date]
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity fsm_example2 is 
    port (
        clk          : in std_logic;    -- Clock input
        nrst         : in std_logic;    -- Active-low reset
        move_to_next : in std_logic;    -- Signal to transition from IDLE to NXT
        move_to_stop : in std_logic    -- Signal to transition from NXT to STOP
    );
end entity;

architecture rtl of fsm_example2 is
    -- Define state type
    type state_type is (IDLE, NXT, STOP);
    signal curr_state : state_type;    -- Holds the current state

begin 

  process(clk)
begin
    if rising_edge(clk) then
        if nrst = '0' then 
            curr_state <= IDLE;
        else
            -- Next state logic inside the same process
            case curr_state is 
                when IDLE => 
                    if move_to_next = '1' then 
                        curr_state <= NXT;
                    end if;
                    
                when NXT => 
                    if move_to_stop = '1' then 
                        curr_state <= STOP;
                    end if;

                when STOP => 
                    curr_state <= IDLE;

                when others => 
                    curr_state <= IDLE;
            end case;
        end if;
    end if;
end process;

end rtl;
