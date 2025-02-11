--library declaration 
library ieee;
use ieee.std_logic_1164.all;
--entity declaration
entity freq_divide_tb is 
end entity freq_divide_tb;

architecture sim of freq_divide_tb is 
signal clk_tb_two : std_logic := '0';
signal clk_tb : std_logic;
constant time_period : time := 10 ns;

begin 
--clk_process 1
clk_process: process
begin 
  while true loop 
     clk_tb <= '0' ;
   wait for time_period / 2;
   clk_tb <= '1' ;
   wait for time_period / 2; 
end loop;   
end process clk_process;

--clk_process 2
clk_proces2 : process
begin 
  loop 
  clk_tb_two <= not clk_tb_two;
   wait for time_period / 2;
  end loop;
end process;

uut : entity work.freq_divider
port map (
 clk => clk_tb,
 clk_extra => clk_tb_two
);
end sim;


