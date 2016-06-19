----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:        GPL v3
-- Create Date:    18:02:40 06/19/2016
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 

ENTITY controller_tb IS
END controller_tb;
 
ARCHITECTURE behavior OF controller_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT controller
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         enc_right : IN  std_logic;
         enc_ce : IN  std_logic;
         enc_btn : IN  std_logic;
         form : IN  unsigned(1 downto 0);
         lcd_busy : IN  std_logic;
         lcd_data : OUT  unsigned(7 downto 0);
         lcd_newchar : OUT  std_logic;
         lcd_newpos : OUT  std_logic;
         freq_out : OUT  unsigned(16 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enc_right : std_logic := '0';
   signal enc_ce : std_logic := '0';
   signal enc_btn : std_logic := '0';
   signal form : unsigned(1 downto 0) := (others => '0');
   signal lcd_busy : std_logic := '0';

 	--Outputs
   signal lcd_data : unsigned(7 downto 0);
   signal lcd_newchar : std_logic;
   signal lcd_newpos : std_logic;
   signal freq_out : unsigned(16 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns; --50mhz
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: controller PORT MAP (
          clk => clk,
          rst => rst,
          enc_right => enc_right,
          enc_ce => enc_ce,
          enc_btn => enc_btn,
          form => form,
          lcd_busy => lcd_busy,
          lcd_data => lcd_data,
          lcd_newchar => lcd_newchar,
          lcd_newpos => lcd_newpos,
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
      rst <= '1';
      wait for 100 ns;	
      rst <= '0';
      
      lcd_busy<='1'; --simulate lcd busy
      wait for 200 ns;
      lcd_busy<='0'; 
      
      wait for 1000 ns;
      wait until lcd_newchar = '1';
      lcd_busy<='1'; --simulate lcd busy
      wait for 150 ns;
      lcd_busy<='0'; 
      
      wait for 400 ns;
      --init should be finished here
      
      --Test encoder turn right
      enc_right <='1';
      enc_ce <= '1';
      wait for clk_period;
      enc_ce <= '0';
      wait for 300 ns; 
     
      -- Now the same but with lcd_busy
      enc_ce <= '1';
      wait for clk_period;
      enc_ce <= '0';
      wait until lcd_newpos = '1';
      lcd_busy<='1'; --simulate lcd busy
      wait for 150 ns;
      lcd_busy<='0'; 
      wait for 300 ns;
      
      --Test encoder turn left
      enc_right <= '0';
      enc_ce <= '1';
      wait for clk_period;
      enc_ce <= '0';
      wait until lcd_newpos = '1';
      lcd_busy<='1'; --simulate lcd busy
      wait for 150 ns;
      lcd_busy<='0'; 
      wait for 300 ns;
      
      --Test button press
      enc_btn <= '1';
      wait for clk_period;
      enc_btn <= '0';
      wait for 150 ns;
      
      --Test another turn left
      enc_ce <= '1';
      wait for clk_period;
      enc_ce <= '0';
      wait until lcd_newpos = '1';
      lcd_busy<='1'; --simulate lcd busy
      wait for 150 ns;
      lcd_busy<='0'; 
      wait for 300 ns;
      
      
      
      
      
      
      
      
      

      

      -- insert stimulus here 

      wait;
   end process;

END;
