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
			  lcd_newpos : out STD_LOGIC;
           freq_out : out  unsigned (16 downto 0));
end controller;

architecture Behavioral of controller is
	type states is(S_WAIT, 
						S_FORM_PREF, 	-- prints the form prefix ("Form:")
						S_FREQ_PREF,  	-- frequenz prefix ("Freq: 00000 Hz")
						S_FORM_CONT, 	-- form content ("Rechteck, Sinus...")
						S_FREQ_CONT,  -- frequenz content ("-----")
						S_IDLE );
						
	signal state_reg, state_next : states := S_WAIT;
	signal ret_state_reg, ret_state_next: states := S_FORM_PREF; 



	--digitnr which is currently edited 0-4
	signal digpos_reg, digpos_next : unsigned(2 downto 0)  := (others => '0');
	-- for edge detection on btn
	signal btn_old_reg, btn_old_next : std_logic := '0';
	
	-- array 5x 4bit(0-9)
	type storage_digit is array (0 to 7) of unsigned (3 downto 0);
	signal digit_reg, digit_next : storage_digit := (others => (others => '0'));

	signal charcnt_reg, charcnt_next : unsigned(3 downto 0) := (others => '0');
	signal lcd_newchar_reg,lcd_newchar_next : std_logic := '0';
	signal lcd_newpos_reg,lcd_newpos_next : std_logic := '0';
	signal lcd_data_reg, lcd_data_next: unsigned(7 downto 0) :=(others => '0');
	
	
	type character_array1 is array (0 to 7) of character;
	constant str_form_pref : character_array1 := ( 'F', 'o', 'r','m',':', others => ' ' );
	
	type character_array2 is array (0 to 15) of character;
	constant str_freq_pref : character_array2 := ( 'F', 'r', 'e','q',':',' ','0','0','0','0','0',' ','H','z', others => ' ' );
	
	
	
	--type character_array is array (0 to 15) of character;
	--constant line1 : character_array := ( 'h', 'e', 'l','l','o',' ', 'A', 'a', 'r', 'o', 'n', others=> ' ' );
	
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
			lcd_newpos_reg <= '0';
			lcd_data_reg <= (others => '0');
			busy_old_reg <= '0';
			freq_out_reg <=(others => '0');
			
			state_reg <= S_WAIT;
			ret_state_reg <= S_FORM_PREF;
			
		elsif(rising_edge(clk)) then
			digpos_reg <= digpos_next;
			digit_reg <= digit_next;
			btn_old_reg <= btn_old_next;
			
			charcnt_reg <= charcnt_next;
			lcd_newchar_reg<= lcd_newchar_next;
			lcd_newpos_reg<= lcd_newpos_next;
			lcd_data_reg <= lcd_data_next;
			busy_old_reg <= busy_old_next;
			freq_out_reg <= freq_out_next;
			
			state_reg <= state_next;
			ret_state_reg <= ret_state_next;
			
		end if;
	end process proc1;
	
 
	
	freq_out <= freq_out_reg;
	lcd_data <= lcd_data_reg;
	lcd_newchar <= lcd_newchar_reg;
	lcd_newpos <= lcd_newpos_reg;
	
	NSL: process(digit_reg,enc_updown,enc_ce,enc_err,enc_btn,digpos_reg,btn_old_reg, charcnt_reg, lcd_busy, lcd_data_reg, busy_old_reg, state_reg, ret_state_reg) 
	begin
		digit_next <= digit_reg;
		digpos_next <= digpos_reg;
		btn_old_next <= enc_btn;
		
		charcnt_next <= charcnt_reg;
		lcd_newchar_next <= '0';
		lcd_newpos_next <= '0';
		lcd_data_next <= lcd_data_reg;
		busy_old_next <= lcd_busy;
		
		state_next <= state_reg;
		ret_state_next <= ret_state_reg;
		
		-- The next statement produces two warnings which can be safely ignored:
		-- xst:643 - The result of a <...>-bit multiplication is partially used...
		freq_out_next <= resize(
				  resize(digit_reg(0), 4) 
			   + resize(digit_reg(1) ,4)* 10
				+ resize(digit_reg(2) ,7)* 100
		    	+ resize(digit_reg(3) ,10) * 1000
				+ resize(digit_reg(4) ,14) * 10000
				, 17);
				
				
		case state_reg is
            when S_WAIT => -- switch on current state
					if(lcd_busy = '0' and busy_old_reg ='1' ) then
						state_next<= ret_state_reg;
					end if;
					
				when S_FORM_PREF =>
						state_next <= S_WAIT;
					if(charcnt_reg < 7 ) then
						charcnt_next <= charcnt_reg + 1;
						ret_state_next <= S_FORM_PREF;
						lcd_data_next <= to_unsigned(character'pos(str_form_pref(to_integer(charcnt_reg))),8);
						lcd_newchar_next <= '1';
					else
						charcnt_next <= (others => '0');
						lcd_data_next <= x"C0";
						lcd_newpos_next <= '1';
						ret_state_next <= S_FREQ_PREF;
					end if;
				when S_FREQ_PREF =>
					if(charcnt_reg < 15 ) then
						charcnt_next <= charcnt_reg + 1;
						state_next <= S_WAIT;
						ret_state_next <= S_FREQ_PREF;
						lcd_data_next <= to_unsigned(character'pos(str_freq_pref(to_integer(charcnt_reg))),8);
						lcd_newchar_next <= '1';
					else
						charcnt_next <= (others => '0');
						state_next <= S_IDLE;
					end if;
				
				
				when S_FORM_CONT => 
			
				state_next <= S_WAIT;
				when S_FREQ_CONT =>
					state_next <= S_WAIT;
					if(charcnt_reg < 1 ) then
						charcnt_next <= charcnt_reg + 1;
						ret_state_next <= S_FREQ_CONT;
						lcd_data_next <= x"4A" - digpos_reg;
						lcd_newpos_next <= '1';
					else 
						ret_state_next <= S_IDLE;
						charcnt_next <= (others => '0');
						lcd_data_next <= to_unsigned(character'pos('0'),8) + digit_reg(to_integer(digpos_reg));
						lcd_newchar_next <= '1';
					end if;
				when S_IDLE =>
				
					if(enc_ce='1' and enc_err='0') then
						if(enc_updown='1') then
							digit_next(to_integer(digpos_reg)) <= digit_reg(to_integer(digpos_reg)) + 1;
						else
							digit_next(to_integer(digpos_reg)) <= digit_reg(to_integer(digpos_reg)) -1;
						end if;
						state_next <= S_FREQ_CONT;
					elsif(enc_btn ='1' and btn_old_reg='0') then
						if(digpos_reg = to_unsigned(4,3)) then
							digpos_next <= to_unsigned(0,3);
						else
							digpos_next <= digpos_reg + 1;
						end if;
						state_next <= S_FREQ_CONT;
					end if;
					
                     
            when others => null; -- do nothing, if we are in a different state
        end case;		
		
		
		
--		if(lcd_busy = '0' and busy_old_reg ='1' and charcnt_reg < 15) then
--				lcd_data_next <= to_unsigned(character'pos(line1(to_integer(charcnt_reg))),8);
--				lcd_newchar_next <= '1';
--				charcnt_next <= charcnt_reg + 1;
--		end if;
	
	end process NSL;
	
end Behavioral;

