----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:29:54 05/09/2016 
-- Design Name: 
-- Module Name:     lcddriver - Behavioral 
-- Project Name:    yasg
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lcd_driver is
    Port (  clk : in STD_LOGIC; -- Systemclock (~50MHz)
            data : in  STD_LOGIC_VECTOR (7 downto 0); -- either one ascii char (8bit) or new cursor position (0-31)
            new_character : in  STD_LOGIC; -- a new character is available on the data bus
            new_pos : in  STD_LOGIC; -- a new cursor position is available on the data bus
            auto_incr_cursor : in  STD_LOGIC; -- the cursor should automatically be incremented after writing a new character
            lcd_db : out  STD_LOGIC_VECTOR (7 downto 0); -- lcd databus
            lcd_en : out  STD_LOGIC; -- lcd enable
            lcd_rw : out  STD_LOGIC; -- lcd read/write
            lcd_rs : out  STD_LOGIC); -- lcd register select
end lcd_driver;

architecture Behavioral of lcd_driver is

begin


end Behavioral;

