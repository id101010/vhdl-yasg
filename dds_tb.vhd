----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:		    GPL v3
-- Create Date:    11:35:57 05/16/2016
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY dds_tb IS
END dds_tb;
 
ARCHITECTURE behavior OF dds_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dds
    PORT(
         clk : IN  std_logic;
         freq : IN  unsigned(16 downto 0);
         form : IN  unsigned(1 downto 0);
         amp : OUT  unsigned(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal freq : unsigned(16 downto 0) := (others => '0');
   signal form : unsigned(1 downto 0) := (others => '0');

 	--Outputs
   signal amp : unsigned(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns; --50mhz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dds PORT MAP (
          clk => clk,
          freq => freq,
          form => form,
          amp => amp
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

   
 
      form <= "00";
      freq <= to_unsigned(50000,17);
      wait for 40 us;     
      freq <= to_unsigned(100000,17);
      wait for 20 us;
      
      form <= "01";
      freq <= to_unsigned(50000,17);
      wait for 40 us;     
      freq <= to_unsigned(100000,17);
      wait for 20 us;
      
      form <= "10";
      freq <= to_unsigned(50000,17);
      wait for 40 us;     
      freq <= to_unsigned(100000,17);
      wait for 20 us;
      
      form <= "11";
      freq <= to_unsigned(50000,17);
      wait for 40 us;     
      freq <= to_unsigned(100000,17);
      wait for 20 us;


      wait;
   end process;

END;
