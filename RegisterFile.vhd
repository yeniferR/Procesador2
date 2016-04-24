library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity RegisterFile is
    Port ( 
			  Reset : in STD_LOGIC;
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0); --registerSource1
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);  --registerSource2
           rd : in  STD_LOGIC_VECTOR (4 downto 0);  --registerDestination
			  DWR : in  STD_LOGIC_VECTOR (31 downto 0);  --dataToWrite
			  Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);  --contentRegisterSource1
			  Crs2 : out  STD_LOGIC_VECTOR (31 downto 0));  --contentRegisterSource2
end RegisterFile;

architecture ArquitecturaRegisterFile of RegisterFile is
	type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	
	signal registro : ram_type := (
			  	 "00000000000000000000000000000000","00000000000000000000000000000000",
	   		 "00000000000000000000000000000000","00000000000000000000000000000000",
 				 "00000000000000000000000000000000","00000000000000000000000000000000",
	 			 "00000000000000000000000000000000","00000000000000000000000000000000",
		   	 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "11111111111111111111111111111000","00000000000000000000000000000100",
		 		 "00000000000000000000000000000111","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
	 			 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000",
		 		 "00000000000000000000000000000000","00000000000000000000000000000000"
	); 
	
begin
	process(reset,rs1,rs2,rd,DWR)
		begin
			    registro(0)<="00000000000000000000000000000000";
				if(Reset = '1')then
					Crs1 <= (others=>'0');
					Crs2 <= (others=>'0');
					registro <=(others => "00000000000000000000000000000000");
				else
					Crs1 <= registro(conv_integer(rs1));
					Crs2 <= registro(conv_integer(rs2));
				if (rd/= "00000" )then
						registro(conv_integer(rd)) <= DWR ;
					end if;

			end if;
		end process;
end ArquitecturaRegisterFile;


