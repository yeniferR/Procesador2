
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY signExtensionUnit_TB IS
END signExtensionUnit_TB;
 
ARCHITECTURE behavior OF signExtensionUnit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SignExtensionUnit
    PORT(
         simm13 : IN  std_logic_vector(12 downto 0);
         simm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal simm13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal simm32 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SignExtensionUnit PORT MAP (
          simm13 => simm13,
          simm32 => simm32
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
--    simm13 <= "0000000000101";
----	wait for 100 ns;
--	simm13 <= "1111111111001";
--     

      -- insert stimulus here 

      wait;
   end process;

END;
