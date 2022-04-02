LIBRARY ieee;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity counter_33 is
port(
		clk,en,clear: in std_logic;
		out_enable: out  std_logic);
end counter_33;

architecture a of counter_33 is
	signal counter: integer range 0 to 32;
	signal ensig: std_logic;
begin 		
	process
	begin
	wait until clk='1';
		if clear='1' then ensig<='0';
		elsif en='1' then
				if (counter < 32) then 	counter<=counter+1; ensig<='0';
				else ensig<='1';counter<=0;
				end if;
		else ensig<='0';--memory latch for counter
		end if;
	end process;
out_enable<=ensig;
end a;