LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY curseur IS
PORT(	
		iCLK_50		   	: IN STD_LOGIC;
		xcurseur :	in integer range 0 to 799;
		ycurseur :	in integer range 0 to 599;
		couleurcurseur_R, couleurcurseur_V, couleurcurseur_B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		couleurfond_R, couleurfond_V, couleurfond_B : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		oVGA_R, oVGA_G,oVGA_B : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		oVGA_HS, oVGA_VS 	: OUT STD_LOGIC;
		oVGA_CLOCK			: OUT STD_LOGIC 
);
END curseur;

ARCHITECTURE a OF curseur  IS
	component ecran_svga IS
	PORT(	
			iCLK_50		   	: IN STD_LOGIC;
			rouge, vert, bleu	: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
			oVGA_R, oVGA_G,oVGA_B : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
			oVGA_HS, oVGA_VS 	: OUT STD_LOGIC;
			oVGA_CLOCK			: OUT STD_LOGIC; 
			pixel_ligne	: OUT integer range 0 to 799;
			pixel_colonne	: OUT integer range 0 to 599
	);
	END component;
	
	constant size : integer := 5;
	signal rouge, vert, bleu : STD_LOGIC_VECTOR(9 DOWNTO 0);
	signal pixel_ligne, pixel_colonne : integer;
begin
	ecran: ecran_svga PORT MAP(iCLK_50 => iCLK_50, rouge => rouge, vert => vert, bleu => bleu,
		oVGA_R => oVGA_R, oVGA_G => oVGA_G, oVGA_B => oVGA_B, oVGA_HS => oVGA_HS, oVGA_VS => oVGA_VS, oVGA_CLOCK	=> oVGA_CLOCK,
		pixel_ligne	=> pixel_ligne, pixel_colonne	=> pixel_colonne); 

	process
	begin
		wait until rising_edge(iclK_50);
		if (((pixel_colonne + size) > xcurseur) and ((xcurseur + size) > pixel_colonne) and
			((pixel_ligne + size) > ycurseur) and ((ycurseur + size) > pixel_ligne))
		then rouge <= couleurcurseur_R;
				vert <= couleurcurseur_V;
				bleu <= couleurcurseur_B;
		else rouge <= couleurfond_R;
				vert <= couleurfond_V;
				bleu <= couleurfond_B;
		end if;
	end process;
end a;