LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY moore IS -- finite state machine
PORT (
	clk,flag,PB: IN STD_LOGIC; 
	enable,SS : OUT STD_LOGIC);
END moore; 

ARCHITECTURE archi OF moore IS
		TYPE STATE_TYPE IS (s0,s1,s2,s3);
		SIGNAL etat : STATE_TYPE;
 
	BEGIN
		PROCESS 
			BEGIN
			WAIT UNTIL clk = '1';
				CASE etat IS
				
					WHEN s0 => IF PB= '0' AND flag= '0' THEN etat <= s1;
						ELSE etat <= s0;
						END IF;
						
					WHEN s1 => etat <= s2;
					
					WHEN s2 => IF flag ='1' THEN etat <= s3;
						ELSE etat <= s2;
					END IF;
					
					WHEN s3 => IF PB ='1' THEN etat <= s0;
						ELSE etat <= s3;
					END IF;

					WHEN OTHERS => etat <=s0; -- pour envisager les etats non décrits
					END CASE;
		END PROCESS;
		
-- Equation des sorties
enable <= '1' WHEN etat = s2 else '0';
SS <= '1' WHEN etat = s0 OR etat = s2 OR etat = s3  ELSE '0';

END archi;
