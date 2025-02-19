
-- ============================================================================
-- Title       : Combinational Logic Example
-- Description : The example helps in understanding the immediate effect of 
--               output based on input change. 
--               - `process_out_f` is assigned inside a process.
--               - `immediate_out_z` is assigned directly as concurrent logic.
-- Author      : [Your Name]
-- Date        : [Date]
-- ============================================================================

library ieee;
use ieee.std_logic_1164.all;

entity combo_logic_example is
    port (
        input_x       : in std_logic;
        input_y       : in std_logic;
        process_out_f : out std_logic;
        immediate_out_z : out std_logic
    );
end entity;

architecture rtl of combo_logic_example is
begin 
    -- Process ensures combinational behavior, so all inputs affecting the output
    -- must be in the sensitivity list.
    process(input_x, input_y)
    begin
        process_out_f <= input_x and input_y;	 
    end process;
  
    -- Concurrent assignment for immediate effect.
    immediate_out_z <= input_x and input_y;
  
end architecture rtl;
