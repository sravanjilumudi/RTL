 

library ieee;
use ieee.std_logic_1164.all;


entity freq_divider is 
port (
  clk : in std_logic ;
  clk_extra : in std_logic
);

end entity;
architecture rtl of freq_divider is 
 signal count_eq : integer range 0 to 10 :=0;
 signal count_ls : integer range 0 to 10 :=0;
 signal count_ls_eq : integer range 0 to 10 :=0;
begin 

count_eq_p : process (clk)
begin 
   if rising_edge(clk) then 
		if count_eq = 5 then 
		   count_eq <= 0;
		else 
		   count_eq <= count_eq + 1;
		end if;
   end if;
end process count_eq_p;

count_less_than_p : process(clk_extra)
begin 
  if rising_edge(clk_extra) then 
     if count_ls < 5 then 
	    count_ls <= count_ls + 1;
	 else 
	     count_ls <= 0;
	 end if;
  end if;
end process count_less_than_p;
count_les_eq_p : process(clk) 
begin 
 if rising_edge(clk) then 
    if count_ls_eq < 5 -1 then 
	   count_ls_eq <= count_ls_eq + 1 ;
	else 
	   count_ls_eq <= 0;
	end if;
  end if;
end process count_les_eq_p;
end rtl;