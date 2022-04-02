LIBRARY ieee;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity shiftreg33 is
 port(
		data: in std_logic;
		en,clk,clear: in std_logic;
		shiftout: out std_logic_vector(32 downto 0));
end ;

architecture a of shiftreg33 is
	signal shiftreg: std_logic_vector(32 downto 0);

begin
		process
		begin
		wait until clk='1';
			if clear='1' then shiftreg(31 downto 0) <="00000000000000000000000000000000";
			elsif en='1' 
				then shiftreg(32)<=data;
					 shiftreg(31 downto 0) <= shiftreg(32 downto 1);

			end if;
		end process;
	shiftout<= shiftreg;
end a;
		
		