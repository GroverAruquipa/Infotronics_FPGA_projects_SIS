-- SVGA avec VESA timing : 800x600 @ 72 Hz, clk = 50 MHz
-- SE 2013

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ecran_svga IS
PORT(	
		iCLK_50		   	: IN STD_LOGIC;
		rouge, vert, bleu	: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		oVGA_R, oVGA_G,oVGA_B : OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		oVGA_HS, oVGA_VS 	: OUT STD_LOGIC;
		oVGA_CLOCK			: OUT STD_LOGIC; 
		pixel_ligne	: OUT integer range 0 to 599;
		pixel_colonne	: OUT integer range 0 to 799
);
END ecran_svga;

ARCHITECTURE a OF ecran_svga  IS
	SIGNAL video_ok, video_ok_v, video_ok_h 	: STD_LOGIC;
	SIGNAL h_pos		 								: integer range 0 to 1039 :=0;
	SIGNAL v_pos		 								: integer range 0 to 665 :=0;	

BEGIN
	oVGA_CLOCK <= iCLK_50;
	
	PROCESS
	BEGIN	
		WAIT UNTIL rising_edge(iCLK_50);
		-- signal synchro horizontal et vertical 
		
	-- h_pos  : colonnes pixel (800 + extra)
	--  horiz  ------------------------------------__________--------
	--  h_pos  0                          799      856    975     1039
	--
		IF (h_pos >= 1039) THEN
				h_pos <= 0;
		ELSE
				h_pos <= h_pos + 1;
		END IF;
	
	-- signal synchro Horizontal 
		IF (h_pos <= 975) AND (h_pos >= 856) THEN
			oVGA_HS <= '0';
		ELSE
			oVGA_HS <= '1';
		END IF;
	
	-- v_pos  :  lignes (600 + extra) 
	--  vert      -----------------------------------------------_______------------
	--  v_pos   0                                        599     637-642         665
	--
		IF (v_pos >= 665) AND (h_pos = 800) THEN
				v_pos <= 0;
		ELSIF (h_pos = 800) THEN
				v_pos <= v_pos + 1;
		END IF;
	
	-- signal synchro vertical 
		IF (v_pos <= 642) AND (v_pos >= 637) THEN
				oVGA_VS <= '0';
		ELSE
			oVGA_VS <= '1';
		END IF;
	
	-- signaux video sur les pixels visibles
		IF (h_pos <= 799) THEN
				video_ok_h <= '1';
				pixel_colonne <= h_pos;
		ELSE
				video_ok_h <= '0';
				pixel_colonne <= 0;
		END IF;
	
		IF (v_pos <= 599) THEN
				video_ok_v <= '1';
				pixel_ligne <= v_pos;
		ELSE
				video_ok_v <= '0';
				pixel_ligne <= 0;
		END IF;		
	END PROCESS;
	video_ok <= video_ok_h AND video_ok_v; -- video_ok  = 1 pour la partie visible
	
	oVGA_R <= rouge when video_ok ='1' else (others =>'0');
	oVGA_G <= vert when video_ok ='1' else (others =>'0');
	oVGA_B <= bleu when video_ok ='1' else (others =>'0');

END a;


