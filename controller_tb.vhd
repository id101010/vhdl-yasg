--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:08:51 06/06/2016
-- Design Name:   
-- Module Name:   /home/timo/workspace/vhdl-yasg/controller_tb.vhd
-- Project Name:  yasg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: controller
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
USE ieee.numeric_std.ALL;
 
ENTITY controller_tb IS
END controller_tb;
 
ARCHITECTURE behavior OF controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controller
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         enc_updown : IN  std_logic;
         enc_ce : IN  std_logic;
         enc_btn : IN  std_logic;
         enc_err : IN  std_logic;
         lcd_busy : IN  std_logic;
         lcd_data : OUT  unsigned(7 downto 0);
         lcd_newchar : OUT  std_logic;
         freq_out : OUT  unsigned(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enc_updown : std_logic := '0';
   signal enc_ce : std_logic := '0';
   signal enc_btn : std_logic := '0';
   signal enc_err : std_logic := '0';
   signal lcd_busy : std_logic := '0';

 	--Outputs
   signal lcd_data : unsigned(7 downto 0);
   signal lcd_newchar : std_logic;
   signal freq_out : unsigned(16 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          clk => clk,
          rst => rst,
          enc_updown => enc_updown,
          enc_ce => enc_ce,
          enc_btn => enc_btn,
          enc_err => enc_err,
          lcd_busy => lcd_busy,
          lcd_data => lcd_data,
          lcd_newchar => lcd_newchar,
          freq_out => freq_out
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

      wait for clk_period*10;
		
		rst<= '0';
		lcd_busy <= '0';
		

      -- insert stimulus here 

      wait;
   end process;

END;