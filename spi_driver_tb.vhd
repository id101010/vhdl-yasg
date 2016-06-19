----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:		    GPL v3
-- Create Date:    15:38:41 05/17/2016
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY spi_driver_tb IS
END spi_driver_tb;
 
ARCHITECTURE behavior OF spi_driver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT spi_driver
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         val : IN  unsigned(11 downto 0);
         sck : OUT  std_logic;
         cs : OUT  std_logic;
         mosi : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal val : unsigned(11 downto 0) := (others => '0');

 	--Outputs
   signal sck : std_logic;
   signal cs : std_logic;
   signal mosi : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns; --50mhz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: spi_driver PORT MAP (
          clk => clk,
          rst => rst,
          val => val,
          sck => sck,
          cs => cs,
          mosi => mosi
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
		rst <= '1';
      wait for 100 ns;	
		rst <= '0';
      wait for clk_period*10;
		
		val <= to_unsigned(0,12);
		wait for clk_period*64;
		
		val <= to_unsigned(7,12);
		wait for clk_period*64;
		
		val <= to_unsigned(31,12);
		wait for clk_period*64;
		
		val <= to_unsigned(128,12);
		wait for clk_period*64;
		
		val <= to_unsigned(512,12);
		wait for clk_period*64;

      -- insert stimulus here 

      wait;
   end process;

END;
