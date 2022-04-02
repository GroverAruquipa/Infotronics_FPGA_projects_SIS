Library IEEE;  
 USE IEEE.Std_logic_1164.all;   
 USE IEEE.Std_logic_signed.all;   
   
 entity Filter_N_bits is 
 generic (  
           input_width :integer :=16  ;
           output_width:integer :=16      ;
           coef_width : integer :=16 ;
           tap  : integer :=16      ;  
           guard : integer:=0)  ;  
 port(  
      Din : in  std_logic_vector(input_width-1 downto 0) ;
      Clk : in  std_logic                   ; 
      reset : in std_logic     ;  
      Dout : out std_logic_vector(output_width-1 downto 0))    ;  
 end Filter_N_bits; 
 ------------------------------------------------------------- 
 architecture behaivioral of Filter_N_bits is  

component N_bit_Reg   
 generic (  
           input_width          : integer     :=16  
           );  
   port(  
    Q : out std_logic_vector(input_width-1 downto 0);     
    Clk :in std_logic;    
    reset :in std_logic;   
    D :in std_logic_vector(input_width-1 downto 0)    
   );  
 end component;


----------------------------

 
 type Coeficient_type is array (1 to tap) of std_logic_vector(coef_width-1 downto 0);  
 -----------------------------------FIR filter coefficients----------------------------------------------------------------  
 constant coeficient: coeficient_type :=   
                               (     X"12",  
                                    X"7B",  
                                    X"E6",  
                                    X"7B",  
                                    X"12",
			            X"7B",  
                                    X"E6",  
                                    X"7B",  
                                    X"12",
			            X"7B",  
                                    X"E6",  
                                    X"7B",  
                                    X"12",
			            X"7B",  
                                    X"E6",  
                                    X"7B",  
                                    X"12",
                                    
                                    );                                         
 ----------------------------------------------------------------------------------------------                                     
 type shift_reg_type is array (0 to tap-1) of std_logic_vector(input_width-1 downto 0);  
 signal shift_reg : shift_reg_type;  
 type mult_type is array (0 to tap-1) of std_logic_vector(input_width+coef_width-1 downto 0);  
 signal mult : mult_type;  
 type ADD_type is array (0 to tap-1) of std_logic_vector(input_width+coef_width-1 downto 0);  
 signal ADD: ADD_type;  
 begin  
 
        shift_reg(0) <= Din;  
           mult(0)<= Din*coeficient(1);  
           ADD(0)<= Din*coeficient(1);  
           GEN_FIR:  
           for i in 0 to tap-2 generate  
           begin    
		N_bit_Reg_unit : N_bit_Reg generic map (input_width => 16)   
                 port map ( Clk => Clk,   
                                    reset => reset,  
                                    D => shift_reg(i),  
                                    Q => shift_reg(i+1)  
                                    ); 


                -- filter multiplication  
                mult(i+1)<= shift_reg(i+1)*coeficient(i+2);  
                -- filter conbinational addition  
                ADD(i+1)<=ADD(i)+mult(i+1);  
           end generate GEN_FIR;  
           Dout <= ADD(tap-1);  
 end Architecture;  
