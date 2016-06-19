----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:        GPL v3
-- Create Date:    19:07:22 05/23/2016 
----------------------------------------------------------------------------------
 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity rotary_dec is
    Generic (clk_freq: natural:= 50000000;  -- Clock frequency in hz
             debounce_time: natural := 10);  -- Debounce time in ms
    Port ( clk      : in std_logic;         -- Clock Input
           A        : in std_logic;         -- Signal A
           B        : in std_logic;         -- Signal B
           btn      : in std_logic;         -- Button Input
           btn_deb  : out std_logic;        -- Button Output Debonced
           enc_right: out std_logic;        -- Direction Output: 1=right
           enc_ce   : out std_logic);       -- Clock Enable Output for signal above

end rotary_dec;
 
architecture Behavioral of rotary_dec is
 
signal a_old, b_old: std_logic := '0';      -- Registers for edge detection on debounced A, B signals
signal a_debounced_reg, a_debounced_next,   -- Registers for debouncing A, B signals
       b_debounced_reg, b_debounced_next : std_logic := '0';
signal btn_reg, btn_next: std_logic :='0';  -- Registers for debouncing Button Press signal
signal counter_a_reg, counter_a_next,       -- Counters to smooth chittering = debounce signals
       counter_b_reg, counter_b_next,
       counter_btn_reg, counter_btn_next: unsigned(23 downto 0) := (others => '0');
constant count_max: unsigned(23 downto 0) := to_unsigned(clk_freq / (1000 / debounce_time),24); --Number of cycles during which a signal can't change it's value 50mhz*10ms= 500000 cycles   
 
begin
 
-- State register process (sequential)
process(clk)
begin
  if rising_edge(clk) then
    counter_a_reg <= counter_a_next;
    counter_b_reg <= counter_b_next;
    counter_btn_reg <= counter_btn_next;
    
    a_debounced_reg <= a_debounced_next;
    b_debounced_reg <= b_debounced_next;
    btn_reg <= btn_next;
    
    a_old <= a_debounced_reg;
    b_old <= b_debounced_reg;
  end if;
end process;

-- Debounce process (combinational)
process(A,B, a_debounced_reg, b_debounced_reg, counter_a_reg, counter_b_reg, btn_reg, btn, counter_btn_reg) 
begin
   
   -- If signal a has changed (edge detection) and enough time passed since the last change
   if(A /= a_debounced_reg and counter_a_reg > count_max) then
      a_debounced_next <= A; -- accept change
      counter_a_next <= (others => '0'); -- reset counter
   else -- singal has not changed, or not enough time has passed
      a_debounced_next <= a_debounced_reg; -- keep old signal value
      counter_a_next <= counter_a_reg + 1; -- increase counter by one
   end if;
   
   -- Same as above for signal B
   if(B /= b_debounced_reg and counter_b_reg > count_max) then
      b_debounced_next <= B;
      counter_b_next <= (others => '0');
   else
      b_debounced_next <= b_debounced_reg;
      counter_b_next <= counter_b_reg + 1;
   end if;
   
   -- Same as above for button press signal
   if(btn /= btn_reg and counter_btn_reg > count_max) then
      btn_next <= btn;
      counter_btn_next <= (others => '0');
   else
      btn_next <= btn_reg;
      counter_btn_next <= counter_btn_reg + 1;
   end if;

end process;


btn_deb <= btn_reg; --Output debounced btn reg
 
-- Ouput decode for Rotary Signals (A,B)
process(a_debounced_reg, b_debounced_reg, a_old, b_old)
variable state: std_logic_vector(3 downto 0);
begin
  state := a_debounced_reg & b_debounced_reg & a_old & b_old; -- Concat to vector
  case state is
    when "0001" => enc_right <= '0'; enc_ce <= '1';
    when "0010" => enc_right <= '1'; enc_ce <= '1';
    when others => enc_right <= '0'; enc_ce <= '0';
    -- If you want a finer resolution you can simply add more cases here.
    -- In our case we only have 1 case for left, and one for right, which works fine.
  end case;
end process;
 
end Behavioral;

