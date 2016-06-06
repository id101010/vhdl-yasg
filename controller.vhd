----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:47:36 05/23/2016 
-- Design Name: 
-- Module Name:    controller - Behavioral 
-- Project Name: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controller is
    Port ( clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           enc_updown : in  STD_LOGIC;
           enc_ce : in  STD_LOGIC;
			  enc_btn: in STD_LOGIC;
           enc_err : in  STD_LOGIC;
			  lcd_busy: in STD_LOGIC;
			  lcd_data: out unsigned(7 downto 0);
			  lcd_newchar: out STD_LOGIC;
           freq_out : out  unsigned (16 downto 0));
end controller;

architecture Behavioral of controller is
	--digitnr which is currently edited 0-4
	signal digpos_reg, digpos_next : unsigned(2 downto 0)  := (others => '0');
	-- for edge detection on btn
	signal btn_old_reg, btn_old_next : std_logic := '0';
	
	-- array 5x 4bit(0-9)
	type storage_digit is array (0 to 7) of unsigned (3 downto 0);
	signal digit_reg, digit_next : storage_digit := (others => (others => '0'));

	signal charcnt_reg, charcnt_next : unsigned(3 downto 0) := (others => '0');
	signal lcd_newchar_reg,lcd_newchar_next : std_logic := '0';
	signal lcd_data_reg, lcd_data_next: unsigned(7 downto 0) :=(others => '0');
	
	type character_array is array (0 to 15) of character;
	constant line1 : character_array := ( 'h', 'e', 'l','l','o',' ', 'A', 'a', 'r', 'o', 'n', others=> ' ' );
	
	-- for edge detection on lcd_busy
	signal busy_old_reg, busy_old_next : std_logic := '0';
	
	signal freq_out_reg, freq_out_next : unsigned (16 downto 0) := (others => '0');


begin

	proc1: process(clk,rst) 
	begin
		if(rst='1') then
			digpos_reg <= (others => '0');
			digit_reg <=  (others => (others => '0'));
			btn_old_reg <= '0';
			
			charcnt_reg <= (others => '0');
			lcd_newchar_reg <= '0';
			lcd_data_reg <= (others => '0');
			busy_old_reg <= '0';
			freq_out_reg <=(others => '0');
		
		elsif(rising_edge(clk)) then
			digpos_reg <= digpos_next;
			digit_reg <= digit_next;
			btn_old_reg <= btn_old_next;
			
			charcnt_reg <= charcnt_next;
			lcd_newchar_reg<= lcd_newchar_next;
			lcd_data_reg <= lcd_data_next;
			busy_old_reg <= busy_old_next;
			freq_out_reg <= freq_out_next;
			
		end if;
	end process proc1;
	
 
	
	freq_out <= freq_out_reg;
	lcd_data <= lcd_data_reg;
	lcd_newchar <= lcd_newchar_reg;
	
	proc2: process(digit_reg,enc_updown,enc_ce,enc_err,enc_btn,digpos_reg,btn_old_reg, charcnt_reg, lcd_busy, lcd_data_reg, lcd_newchar_reg, busy_old_reg) 
	begin
		digit_next <= digit_reg;
		digpos_next <= digpos_reg;
		btn_old_next <= enc_btn;
		
		charcnt_next <= charcnt_reg;
		lcd_newchar_next <= '0';
		lcd_data_next <= lcd_data_reg;
		busy_old_next <= lcd_busy;
		
		-- The next statement produces two warnings which can be safely ignored:
		-- xst:643 - The result of a <...>-bit multiplication is partially used...
		freq_out_next <= resize(
				  resize(digit_reg(0), 4) 
			   + resize(digit_reg(1) ,4)* 10
				+ resize(digit_reg(2) ,7)* 100
		    	+ resize(digit_reg(3) ,10) * 1000
				+ resize(digit_reg(4) ,14) * 10000
				, 17);
		
		if(enc_ce='1' and enc_err='0') then
			if(enc_updown='1') then
				digit_next(to_integer(digpos_reg)) <= digit_reg(to_integer(digpos_reg)) + 1;
			else
				digit_next(to_integer(digpos_reg)) <= digit_reg(to_integer(digpos_reg)) -1;
			end if;
		elsif(enc_btn ='1' and btn_old_reg='0') then
			if(digpos_reg = to_unsigned(4,3)) then
				digpos_next <= to_unsigned(0,3);
			else
				digpos_next <= digpos_reg + 1;
			end if;
		end if;
		
		if(lcd_busy = '0' and busy_old_reg ='1' and charcnt_reg < 15) then
				lcd_data_next <= to_unsigned(character'pos(line1(to_integer(charcnt_reg))),8);
				lcd_newchar_next <= '1';
				charcnt_next <= charcnt_reg + 1;
		end if;
	
	end process proc2;
	
end Behavioral;

