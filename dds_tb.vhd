--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:35:57 05/16/2016
-- Design Name:   
-- Module Name:   /home/timo/vhdl-yasg/dds_tb.vhd
-- Project Name:  yasg
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dds
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
         amp : OUT  signed(11 downto 0);
         update : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal freq : unsigned(16 downto 0) := (others => '0');
   signal form : unsigned(1 downto 0) := (others => '0');

 	--Outputs
   signal amp : signed(11 downto 0);
   signal update : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns; --50mhz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dds PORT MAP (
          clk => clk,
          freq => freq,
          form => form,
          amp => amp,
          update => update
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

   
      freq <= to_unsigned(100000,17);
      wait for 2000 ms;
      
      freq <= to_unsigned(10,17);
       wait for 200 ms;
       
      freq <= to_unsigned(100,17);
       wait for 20 ms;
        
      freq <= to_unsigned(1000,17);
      wait for 2 ms;
      
      freq <= to_unsigned(10000,17);
      wait for 1 ms;
      
      freq <= to_unsigned(50000,17);
      wait for 1 ms;
      
      freq <= to_unsigned(100000,17);
      wait for 1 ms;
      -- insert stimulus here 

      wait;
   end process;

END;
