----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:        GPL v3
-- Create Date:    13:41:21 06/19/2016
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY rotary_tb IS
END rotary_tb;
 
ARCHITECTURE behavior OF rotary_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rotary_dec
    PORT(
         clk : IN  std_logic;
         A : IN  std_logic;
         B : IN  std_logic;
         btn : IN  std_logic;
         btn_deb : OUT  std_logic;
         enc_right : OUT  std_logic;
         enc_ce : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal btn : std_logic := '0';

    --Outputs
   signal btn_deb : std_logic;
   signal enc_right : std_logic;
   signal enc_ce : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: rotary_dec PORT MAP (
          clk => clk,
          A => A,
          B => B,
          btn => btn,
          btn_deb => btn_deb,
          enc_right => enc_right,
          enc_ce => enc_ce
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
    

      wait;
   end process;

END;
