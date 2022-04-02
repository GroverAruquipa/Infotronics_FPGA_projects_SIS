LIBRARY ieee;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity TP3M is
 port(
		clk,Mclk,clear: in std_logic;
		out_enable: out  std_logic);
end TP3M;

architecture a of TP3M is
	signal shiftreg: std_logic_vector(6 downto 0);
	signal ensig : std_logic:='0';
begin
		process
		begin
		wait until clk='1';
			if clear='1' then shiftreg(6 downto 0) <="0000000";
			else
				shiftreg(6 downto 1)<=shiftreg(5 downto 0);
				shiftreg(0)<= Mclk;
				if (shiftreg(5 downto 0)="111000") then ensig<='1';
				else ensig<='0';
				end if;
			end if;
		end process;
	out_enable<= ensig;
end a;
		
		

