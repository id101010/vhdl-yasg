----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:        GPL v3
-- Create Date:    21:11:41 05/16/2016
----------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY lcd_driver_tb IS
END lcd_driver_tb;
 
ARCHITECTURE behavior OF lcd_driver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lcd_driver
    PORT(
         clk : IN  std_logic;
         busy : out STD_LOGIC; 
         reset : IN  std_logic;
         data : IN  std_logic_vector(7 downto 0);
         new_character : IN  std_logic;
         new_pos : IN  std_logic;
         lcd_db : OUT  std_logic_vector(7 downto 0);
         lcd_en : OUT  std_logic;
         lcd_rs : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data : std_logic_vector(7 downto 0) := (others => '0');
   signal new_character : std_logic := '0';
   signal new_pos : std_logic := '0';

    --Outputs
   signal lcd_db : std_logic_vector(7 downto 0);
   signal lcd_en : std_logic;
   signal lcd_rs : std_logic;
   signal busy : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: lcd_driver PORT MAP (
          clk => clk,
          reset => reset,
          data => data,
          new_character => new_character,
          new_pos => new_pos,
          lcd_db => lcd_db,
          lcd_en => lcd_en,
          lcd_rs => lcd_rs,
          busy => busy
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
      wait for 100 ns;  -- hold reset state for 100 ns.
      reset <= '0';

      wait for 50ms;
      

      -- test sending character
      data <= "11111111";
      new_character <= '1';
      new_pos <= '0';

      wait until busy = '0';
      wait for 10ms;
      
      -- test sending character
      data <= "10101010";
      new_character <= '0';
      new_pos <= '1';
      
      wait until busy = '0';
      wait for 10ms;
      
      -- Reset
      data <= "00000000";
      new_character <= '0';
      new_pos <= '0';
      
      wait;
   end process;

END;
