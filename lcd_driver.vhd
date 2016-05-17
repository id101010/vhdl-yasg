----------------------------------------------------------------------------------
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------------
-- Company:         Berner Fachhochschule
-- Engineer:        Aaron Schmocker
-- 
-- Create Date:     19:29:54 05/09/2016 
-- Design Name: 
-- Module Name:     lcddriver - Behavioral 
-- Project Name:    yasg
-- Target Devices:  Spartan-3am Board
-- Tool versions: 
-- Description:     This file is part of the yasg project
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lcd_driver is
    generic (   NBITS           : natural := 16;        -- counter bit size
                clk_freq        : natural := 50000000;  -- frequency of clk (50MHz) in hz
                wait_40000us    : natural := 40000;     -- wait 40ms
                wait_37us       : natural := 37;        -- wait 37us
                wait_1520us     : natural := 1520);     -- wait 1.52ms
                
    Port (  clk : in STD_LOGIC; -- Systemclock (50MHz)
            reset : in STD_LOGIC; -- Initialize display controller
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

    -- type definitions
    type display_state is (
        INIT, -- initialization, wait for 40ms to pass
        SEND_FS, -- send the function set
        SEND_SD, -- send the display ON/OFF control
        SEND_CD, -- send a clear
        SEND_ES, -- send entry mode set
        SEND_SA, -- send the starting address
        PAUSE, -- wait for 1.52ms
        COUNT, -- wait and toggle lcd_en
        DONE); -- initialization done
        
    -- signals
    signal init_done : STD_LOGIC := '0'; -- 1 when initialization done, else 0
    
    signal cur_state : display_state := INIT; -- cur_state register
    signal next_state : display_state := INIT; -- next_state register
    signal ret_state : display_state := INIT; -- ret_state register
    signal next_ret_state : display_state := INIT; -- next_ret_state register
    
    signal cur_counter : unsigned(NBITS-1 downto 0) := (others => '0'); -- 10bit counter signal
    signal next_counter : unsigned(NBITS-1 downto 0) := (others => '0');
    signal ret_counter : unsigned(NBITS-1 downto 0) := (others => '0'); -- 10bit counter signal
    signal next_ret_counter : unsigned(NBITS-1 downto 0) := (others => '0'); 
    
    signal next_lcd_db : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- next lcd databus
    signal next_lcd_en : STD_LOGIC := '0'; -- next lcd enable
    signal next_lcd_rw : STD_LOGIC := '0'; -- next lcd read/write
    signal next_lcd_rs : STD_LOGIC := '0'; -- next lcd register select
    
    signal cur_lcd_db : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); -- next lcd databus
    signal cur_lcd_en : STD_LOGIC := '0'; -- next lcd enable
    signal cur_lcd_rw : STD_LOGIC := '0'; -- next lcd read/write
    signal cur_lcd_rs : STD_LOGIC := '0'; -- next lcd register select
    
    -- constants
    constant  INIT_COUNT : natural := clk_freq / (1000000 / wait_40000us); -- number of clock cycles for 40us
    constant  PAUSE_COUNT : natural := clk_freq / (1000000 / wait_37us); -- number of clock cycles for 37us
    constant  CLEAR_DISPLAY_COUNT : natural := clk_freq / (1000000 / wait_1520us); -- number of clock cycles for 1.52ms

begin

    -- purpose  : state register
    -- type     : sequential
    -- inputs   : clk, reset, next_state
    -- outputs  : cur_state
    REGS: process (clk, reset) is
    begin
        if(reset = '1') then -- asynchronous reset
            cur_state <= INIT;
            ret_state <= INIT;
            cur_counter <= (others => '0');
            ret_counter <= (others => '0');
            cur_lcd_db <= (others => '0');
            cur_lcd_en <= '0';
            cur_lcd_rw <= '0';
            cur_lcd_rs <= '0';
        elsif rising_edge(clk) then -- synchronous on clk
            cur_state <= next_state;
            ret_state <= next_ret_state;
            cur_counter <= next_counter;
            ret_counter <= next_ret_counter;
            cur_lcd_db <= next_lcd_db;
            cur_lcd_en <= next_lcd_en;
            cur_lcd_rw <= next_lcd_rw;
            cur_lcd_rs <= next_lcd_rs;
        end if;
    end process REGS;
    
    -- purpose : Finite state machine next state logic
    -- type    : sequential
    -- inputs  : clk, cur_state
    -- outputs : none
    NSL: process(clk, cur_state, cur_counter, cur_lcd_db, cur_lcd_en, cur_lcd_rw, cur_lcd_rs, ret_state, ret_counter) is
    begin
    
        next_state <= cur_state; -- state stays the same
        next_counter <= cur_counter + 1; -- increment counter
        next_lcd_db <= cur_lcd_db;
        next_lcd_en <= cur_lcd_en;
        next_lcd_rw <= cur_lcd_rw;
        next_lcd_rs <= cur_lcd_rs;
        next_ret_state <= ret_state;
        next_ret_counter <= ret_counter;
        
        case cur_state is -- switch on current state
            when INIT =>
            
                next_lcd_db <= "00000000";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '1';
                
                next_counter <= (others => '0');
                next_ret_state <= SEND_FS;
                next_ret_counter <= to_unsigned(INIT_COUNT,NBITS);
                next_state <= COUNT;
                
            when SEND_FS => 
            
                next_lcd_db <= "00110000";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '0';
                
                next_counter <= (others => '0');
                next_ret_state <= SEND_SD;
                next_ret_counter <= to_unsigned(PAUSE_COUNT,NBITS);
                next_state <= COUNT;
                
            when SEND_SD =>
            
                next_lcd_db <= "00001111";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '0';
                
                next_counter <= (others => '0');
                next_ret_state <= SEND_CD;
                next_ret_counter <= to_unsigned(PAUSE_COUNT,NBITS);
                next_state <= COUNT;

            when SEND_CD => 

                next_lcd_db <= "00000001";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '0';   
                
                next_counter <= (others => '0');
                next_ret_state <= PAUSE; 
                next_ret_counter <= to_unsigned(PAUSE_COUNT,NBITS);
                next_state <= COUNT;

            when PAUSE =>
            
                next_lcd_db <= "00000000";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '1';
                
                next_counter <= (others => '0');
                next_ret_state <= SEND_ES;
                next_ret_counter <= to_unsigned(CLEAR_DISPLAY_COUNT,NBITS);
                next_state <= COUNT;

            when SEND_ES =>
            
                next_lcd_db <= "00000110";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '0';
                
                next_counter <= (others => '0');
                next_ret_state <= SEND_SA;
                next_ret_counter <= to_unsigned(PAUSE_COUNT,NBITS);
                next_state <= COUNT;

            when SEND_SA =>
            
                next_lcd_db <= "10000000";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '0';
                
                next_counter <= (others => '0');
                next_ret_state <= DONE;
                next_ret_counter <= to_unsigned(PAUSE_COUNT,NBITS);
                next_state <= COUNT;

            when COUNT =>

                if(cur_counter >= ret_counter) then
                    next_state <= ret_state;
                end if;
                
            when DONE =>
            
                next_lcd_db <= "10000000";
                next_lcd_en <= '0';
                next_lcd_rw <= '0';
                next_lcd_rs <= '0';
                init_done <= '1';
                
            when others => null; -- do nothing, if we are in a different state
        end case;
    end process NSL;
    
    -- Output logic
    lcd_db <= cur_lcd_db;
    lcd_en <= cur_lcd_en;
    lcd_rw <= cur_lcd_rw;
    lcd_rs <= cur_lcd_rs;

end Behavioral;

