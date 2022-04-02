LIBRARY ieee;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity par_reg is
port(
	data: in std_logic_vector(32 downto 0);
	clk,clear,en: in std_logic;
	dataout : out std_logic_vector(32 downto 0));
end par_reg;

architecture a of par_reg is
	signal reg: std_logic_vector(32 downto 0);
begin 
	process 
	begin 
	wait until clk='1';
	if clear = '1' then 
					reg<=(others=>'0');
	elsif en = '1' then
					reg<=data;
	else -- memory latch for reg
		reg<=reg;
	end if;
end process;				
dataout<= reg;
end a;