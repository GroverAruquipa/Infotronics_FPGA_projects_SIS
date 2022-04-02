LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY affichage is
PORT ( code : in std_logic_vector (3 downto 0);
segments : OUT std_logic_vector (1 to 7));
END affichage;
ARCHITECTURE a OF affichage IS
SIGNAL abcdefg : STD_LOGIC_vector (1 to 7);
BEGIN
WITH code (3 downto 0) select
abcdefg <= "1111110" WHEN "0000",
"0110000" WHEN "0001",
"1101101" WHEN "0010",
"1111001" WHEN "0011",
"0110011" WHEN "0100",
"1011011" WHEN "0101",
"1011111" WHEN "0110",
"1110000" WHEN "0111",
"1111111" WHEN "1000",
"1110011" WHEN "1001",
"1110111" WHEN "1010",
"0011111" WHEN "1011",
"1001110" WHEN "1100",
"0111101" WHEN "1101",
"1001111" WHEN "1110",
"1000111" WHEN OTHERS;
segments <= NOT abcdefg;
END a;