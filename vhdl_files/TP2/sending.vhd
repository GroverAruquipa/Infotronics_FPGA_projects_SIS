LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;

ENTITY sending IS 

GENERIC ( N : POSITIVE :=10 ;
			 tscale : POSITIVE :=10);
			 
PORT(
		Clk,ena: IN STD_LOGIC;
		data: IN STD_LOGIC_vector( N-1 DOWNTO 0 );
		dataout,SCLK,FLAG:OUT STD_LOGIC;
		counter: OUT INTEGER RANGE 0 TO N-1);
		
END sending;

ARCHITECTURE send OF sending IS 
	signal FLAGsig: STD_LOGIC:='0';
	signal SCLKsig: STD_LOGIC:='1';
	signal bitcounter,freqcounter: INTEGER RANGE 0 TO N-1;
BEGIN

		PROCESS
		BEGIN
		WAIT UNTIL clk='1';
				IF (ena='0') THEN SCLKsig<='1';bitcounter <= 0; FLAGsig <= '0';
				
				ELSE
							
					IF (freqcounter < (tscale/2)-1) 
							THEN 
								SCLKsig<='1'; 
								freqcounter<=freqcounter+1;
								FLAGsig<=FLAGsig;
								bitcounter <= bitcounter;
									
					ELSIF (freqcounter < tscale - 1) 
							THEN 
								SCLKsig<='0';
								freqcounter<=freqcounter+1;
								FLAGsig<=FLAGsig;
								bitcounter <= bitcounter;
					
					ELSE 
							freqcounter<=0;
							SCLKsig<='1';
							
							IF (bitcounter < N-1) 
							
								then	
								
										bitcounter <= bitcounter+1;
										FLAGsig <= '0';
							ELSE
										bitcounter <= bitcounter;
										FLAGsig<='1';
					
							END IF; 
						
					
					END IF;
				END IF;
				
		END PROCESS;
		
dataout<=data(N-1-bitcounter); 		
FLAG<=FLAGsig;
SCLK<=SCLKsig;
counter <= bitcounter;
		
END send;
					