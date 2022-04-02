LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
Use ieee.numeric_std.all;

entity linker is
port (
		Xdis,Ydis: in std_logic_vector(7 downto 0);
		Xs,Ys:in std_logic;
		Xpos: out integer RANGE 0 TO 799;
		Ypos: out integer range 0 to 599);
end linker;

architecture a of linker is
	signal Xsig: integer RANGE 0 TO 799;
	signal Ysig: integer RANGE 0 TO 599;
begin 
	process(Xdis,Ydis)
	begin
			if Xs='0' then 
				Xsig <= Xsig + (to_integer(unsigned(Xdis)));
				if Xsig>799 then Xsig<=799;
				else Xsig<=Xsig;
				end if;
			elsif Xs='1' then Xsig <= Xsig - (to_integer(unsigned(Xdis)));
				if Xsig<0 then Xsig<=0;
				else Xsig<=Xsig;
				end if;
			else Xsig<=Xsig;
			end if;
			
			
			if Ys='0' then 
				Ysig <= Ysig + (to_integer(unsigned(Ydis)));
				if Ysig>599 then Ysig<=599;
				else Ysig<=Ysig;
				end if;
			elsif Ys='1' then Ysig <= Ysig - (to_integer(unsigned(Ydis)));
				if Ysig<0 then Ysig<=0;
				else Ysig<=Ysig;
				end if;
			else Xsig<=Xsig;
			end if;
			
end process;
Xpos<=Xsig;
Ypos<=Ysig;
end a;