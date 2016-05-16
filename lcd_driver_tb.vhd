--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:11:41 05/16/2016
-- Design Name:   
-- Module Name:   /home/aaron/Dokumente/STUDIUM/SEM6/EloSys/EloSysDigital/Projekt/vhdl-yasg/lcd_driver_tb.vhd
-- Project Name:  yasg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lcd_driver
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY lcd_driver_tb IS
END lcd_driver_tb;
 
ARCHITECTURE behavior OF lcd_driver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lcd_driver
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         data : IN  std_logic_vector(7 downto 0);
         new_character : IN  std_logic;
         new_pos : IN  std_logic;
         auto_incr_cursor : IN  std_logic;
         lcd_db : OUT  std_logic_vector(7 downto 0);
         lcd_en : OUT  std_logic;
         lcd_rw : OUT  std_logic;
         lcd_rs : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data : std_logic_vector(7 downto 0) := (others => '0');
   signal new_character : std_logic := '0';
   signal new_pos : std_logic := '0';
   signal auto_incr_cursor : std_logic := '0';

 	--Outputs
   signal lcd_db : std_logic_vector(7 downto 0);
   signal lcd_en : std_logic;
   signal lcd_rw : std_logic;
   signal lcd_rs : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns; -- 50MHz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lcd_driver PORT MAP (
          clk => clk,
          reset => reset,
          data => data,
          new_character => new_character,
          new_pos => new_pos,
          auto_incr_cursor => auto_incr_cursor,
          lcd_db => lcd_db,
          lcd_en => lcd_en,
          lcd_rw => lcd_rw,
          lcd_rs => lcd_rs
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
   
      reset <= '1';
      
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      
      reset <= '0';

      wait for clk_period*10;
      

      -- insert stimulus here 

      wait;
   end process;

END;