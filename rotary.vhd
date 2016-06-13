-----------------------------------------------------------------------------
--
-- Decoder für Drehgeber
--
-----------------------------------------------------------------------------
 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
 
entity rotary_dec is
    Port ( clk      : in std_logic;         -- Systemtakt
           A        : in std_logic;         -- Spur A
           B        : in std_logic;         -- Spur B
           right    : out std_logic;        -- Zaehlrichtung
           ce       : out std_logic);        -- Clock Enable

end rotary_dec;
 
architecture Behavioral of rotary_dec is
 
signal a_old, b_old: std_logic := '0';
signal a_debounced_reg, a_debounced_next, b_debounced_reg, b_debounced_next : std_logic := '0';
signal counter_a_reg, counter_a_next, counter_b_reg, counter_b_next: unsigned(23 downto 0) := (others => '0');
constant count_max: unsigned(23 downto 0) := to_unsigned(500000,24); --10ms
 
begin
 
process(clk)
begin
  if rising_edge(clk) then
    counter_a_reg <= counter_a_next;
	 counter_b_reg <= counter_b_next;
	 a_debounced_reg <= a_debounced_next;
	 b_debounced_reg <= b_debounced_next;
    a_old <= a_debounced_reg;
    b_old <= b_debounced_reg;
  end if;
end process;


process(A,B, a_debounced_reg, b_debounced_reg, counter_a_reg, counter_b_reg) 
begin
	
	if(A /= a_debounced_reg and counter_a_reg > count_max) then
		a_debounced_next <= A;
		counter_a_next <= (others => '0');
	else
		a_debounced_next <= a_debounced_reg;
		counter_a_next <= counter_a_reg + 1;
	end if;
	
	if(B /= b_debounced_reg and counter_b_reg > count_max) then
		b_debounced_next <= B;
		counter_b_next <= (others => '0');
	else
		b_debounced_next <= b_debounced_reg;
		counter_b_next <= counter_b_reg + 1;
	end if;

end process;

 
-- Dekodierung der Ausgaenge
 
process(a_debounced_reg, b_debounced_reg, a_old, b_old)
variable state: std_logic_vector(3 downto 0);
begin
  state := a_debounced_reg & b_debounced_reg & a_old & b_old;
  case state is
    when "0001" => right <= '0'; ce <= '1';
    when "0010" => right <= '1'; ce <= '1';
    when others => right <= '0'; ce <= '0';
  end case;
end process;
 
end Behavioral;

