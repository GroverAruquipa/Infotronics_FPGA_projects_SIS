LIBRARY ieee;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity slicer is
port(
	data: in std_logic_vector(32 downto 0);
	Xs,Ys,R,L: out std_logic;
	Xdis,Ydis: out std_logic_vector (7 downto 0));
end slicer;

architecture a of slicer is
begin 								
Xs<=data(5);
Ys<=data(6);
R<=data(2);
L<=data(1);
Xdis<=data(19 downto 12);
Ydis<=data(30 downto 23);
end a;