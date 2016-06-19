----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:        GPL v3
-- Create Date:    18:47:36 05/23/2016 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controller is
    Port ( clk : in  STD_LOGIC;                      -- Clock Input
           rst: in STD_LOGIC;                        -- High active, async reset
           enc_right : in  STD_LOGIC;                -- Encoder Input: 1= Direction Right, 0 = Direction Left
           enc_ce : in  STD_LOGIC;                   -- Encoder Input: Clock Enable for Signal above
           enc_btn: in STD_LOGIC;                    -- Encoder Input: Debounced Button (High active)
           form : in unsigned(1 downto 0);           -- Form selection (mapping see dds.vhd)
           lcd_busy: in STD_LOGIC;                   -- LCD Feedback: Busy Signal: 1= LCD is currently busy
           lcd_data: out unsigned(7 downto 0);       -- LCD Output: Data output
           lcd_newchar: out STD_LOGIC;               -- LCD Output: Send a new character to the lcd
           lcd_newpos : out STD_LOGIC;               -- LCD Output: Send a new position/adress to the lcd
           freq_out : out  unsigned (16 downto 0));  -- Frequency Ouput (Treshould in Hz)
end controller;

architecture Behavioral of controller is
   type states is(S_WAIT, 
                  S_FORM_PREF,    -- prints the form prefix ("Form:")
                  S_FREQ_PREF,    -- frequenz prefix ("Freq: 00000 Hz")
                  S_FORM_CONT,    -- form content ("Rechteck, Sinus...")
                  S_FREQ_CONT,    -- frequenz content ("-----")
                  S_IDLE );
                  
   signal state_reg, state_next : states := S_WAIT;
   signal ret_state_reg, ret_state_next: states := S_FORM_PREF; 

   ----- Edge detection registers -----
   signal btn_old_reg, btn_old_next : std_logic := '0';
   signal enc_old_reg, enc_old_next: std_logic :='0';
   signal busy_old_reg, busy_old_next : std_logic := '0';
   signal form_old_reg, form_old_next : unsigned (1 downto 0) := (others => '0');
   
   --digitnr which is currently edited 0-4
   signal digpos_reg, digpos_next : unsigned(2 downto 0)  := (others => '0');
   signal charcnt_reg, charcnt_next : unsigned(3 downto 0) := (others => '0');
   
   -- array 5x 4bit(0-9)
   type storage_digit is array (0 to 7) of unsigned (3 downto 0);
   signal digit_reg, digit_next : storage_digit := (others => (others => '0'));

   signal lcd_newchar_reg,lcd_newchar_next : std_logic := '0';
   signal lcd_newpos_reg,lcd_newpos_next : std_logic := '0';
   signal lcd_data_reg, lcd_data_next: unsigned(7 downto 0) :=(others => '0');
   
   signal freq_out_reg, freq_out_next : unsigned (16 downto 0) := (others => '0');
   
   ----------------Constants---------------------------------
   
   type character_array_short is array (0 to 7) of character;
   constant str_form_pref : character_array_short := ( 'F', 'o', 'r','m',':', others => ' ' );
   
   type character_array_long is array (0 to 15) of character;
   constant str_freq_pref : character_array_long := ( 'F', 'r', 'e','q',':',' ','0','0','0','0','0',' ','H','z', others => ' ' );
   
   type character_form_array is array (0 to 3, 0 to 7) of character;
   constant str_form : character_form_array := (
       ('S','q','u','a','r','e',' ',' '),
       ('S','a','w','t','o','o','t','h'),
       ('T','r','i','a','n','g','l','e'),
       ('S','i','n','e',' ',' ',' ',' ')
      );
      

begin

   proc1: process(clk,rst) 
   begin
      if(rst='1') then
         digpos_reg <= (others => '0');
         digit_reg <=  (others => (others => '0'));
         
         btn_old_reg <= '0';
         enc_old_reg <='0';
         busy_old_reg <= '0';
         form_old_reg <= "00";
         
         charcnt_reg <= (others => '0');
         lcd_newchar_reg <= '0';
         lcd_newpos_reg <= '0';
         lcd_data_reg <= (others => '0');

         freq_out_reg <=(others => '0');
         
         state_reg <= S_WAIT;
         ret_state_reg <= S_FORM_PREF;
         
      elsif(rising_edge(clk)) then
         digpos_reg <= digpos_next;
         digit_reg <= digit_next;
         
         btn_old_reg <= btn_old_next;
         enc_old_reg <= enc_old_next;
         busy_old_reg <= busy_old_next;
         form_old_reg <= form_old_next;
         
         charcnt_reg <= charcnt_next;
         lcd_newchar_reg<= lcd_newchar_next;
         lcd_newpos_reg<= lcd_newpos_next;
         lcd_data_reg <= lcd_data_next;

         freq_out_reg <= freq_out_next;
         
         state_reg <= state_next;
         ret_state_reg <= ret_state_next;
         
      end if;
   end process proc1;
   
 
   
   freq_out <= freq_out_reg;
   lcd_data <= lcd_data_reg;
   lcd_newchar <= lcd_newchar_reg;
   lcd_newpos <= lcd_newpos_reg;
   
   NSL: process(digit_reg,enc_right,enc_ce,enc_btn,digpos_reg,btn_old_reg, charcnt_reg, lcd_busy, lcd_data_reg, busy_old_reg, state_reg, ret_state_reg, enc_ce,enc_old_reg, form_old_reg, form) 
   begin
      digit_next <= digit_reg;
      digpos_next <= digpos_reg;
      
      
      busy_old_next <= lcd_busy;
      btn_old_next <= btn_old_reg;
      enc_old_next <= enc_old_reg;
      form_old_next <= form_old_reg;

      
      charcnt_next <= charcnt_reg;
      lcd_newchar_next <= '0';
      lcd_newpos_next <= '0';
      lcd_data_next <= lcd_data_reg;

      
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
                  lcd_data_next <= to_unsigned(character'pos(str_form_pref(to_integer(resize(charcnt_reg,3)))),8);
                  lcd_newchar_next <= '1';
               else
                  charcnt_next <= (others => '0');
                  lcd_data_next <= x"40"; --Start adress for line 2
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
                  state_next <= S_FORM_CONT;
               end if;
            
            
            when S_FORM_CONT => 
               state_next <= S_WAIT;
               ret_state_next <= S_FORM_CONT;
               charcnt_next <= charcnt_reg + 1;
               if(charcnt_reg < 1 ) then
                  lcd_data_next <= x"06"; --adress character 7 on line 1
                  lcd_newpos_next <= '1';
               elsif(charcnt_reg < 9) then
                  lcd_data_next <= to_unsigned(character'pos(str_form(to_integer(form),to_integer(resize(charcnt_reg-1,3)))),8);
                  lcd_newchar_next <= '1';
               else
                  charcnt_next <= (others => '0');
                  lcd_data_next <= x"4A" - digpos_reg; -- adress character 11 on line 2 - digit position
                  lcd_newpos_next <= '1';
                  ret_state_next <=  S_IDLE;
               end if;
            when S_FREQ_CONT =>
               state_next <= S_WAIT;
               if(charcnt_reg < 1 ) then
                  charcnt_next <= charcnt_reg + 1;
                  ret_state_next <= S_FREQ_CONT;
                  lcd_data_next <= x"4A" - digpos_reg; -- adress character 11 on line 2 - digit position
                  lcd_newpos_next <= '1';
               elsif(charcnt_reg = 1) then 
                  charcnt_next <= charcnt_reg + 1;
                  ret_state_next <= S_FREQ_CONT;
                  lcd_data_next <= to_unsigned(character'pos('0'),8) + digit_reg(to_integer(digpos_reg));
                  lcd_newchar_next <= '1';
               else
                  ret_state_next <= S_IDLE;
                  charcnt_next <= (others => '0');
                  lcd_data_next <= x"4A" - digpos_reg; -- adress character 11 on line 2 - digit position
                  lcd_newpos_next <= '1';
               end if;
            when S_IDLE =>
               btn_old_next <= enc_btn;
               enc_old_next <= enc_ce;
               form_old_next <= form;

               if(form /= form_old_reg) then
                  state_next <= S_FORM_CONT;
               elsif(enc_ce='1' and enc_old_reg ='0') then
                  if(enc_right='1') then
                     if(digit_reg(to_integer(digpos_reg)) = to_unsigned(9,4)) then
                        digit_next(to_integer(digpos_reg)) <= to_unsigned(0,4);
                     else
                        digit_next(to_integer(digpos_reg)) <= digit_reg(to_integer(digpos_reg)) + 1;
                     end if;
                  else
                     if(digit_reg(to_integer(digpos_reg)) = to_unsigned(0,4)) then
                        digit_next(to_integer(digpos_reg)) <= to_unsigned(9,4);
                     else
                        digit_next(to_integer(digpos_reg)) <= digit_reg(to_integer(digpos_reg)) -1;
                     end if;
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
   
   
   end process NSL;
   
end Behavioral;

