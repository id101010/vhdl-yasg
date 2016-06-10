-----------------------------------------------------------------------------
--
-- Decoder für Drehgeber
--
-----------------------------------------------------------------------------
 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity rotary_dec is
    Port ( clk      : in std_logic;         -- Systemtakt
           A        : in std_logic;         -- Spur A
           B        : in std_logic;         -- Spur B
           right    : out std_logic;        -- Zaehlrichtung
           ce       : out std_logic);        -- Clock Enable

end rotary_dec;
 
architecture Behavioral of rotary_dec is
 
signal a_in, b_in, a_old, b_old: std_logic;
 
begin
 
-- Abtastung und Verzoegerung der Quadratursignale
 
process(clk)
begin
  if rising_edge(clk) then
    a_old <= a_in;
    a_in  <= A;
    b_old <= b_in;
    b_in  <= B;
  end if;
end process;
 
-- Dekodierung der Ausgaenge
 
process(a_in, b_in, a_old, b_old)
variable state: std_logic_vector(3 downto 0);
begin
  state := a_in & b_in & a_old & b_old;
  case state is
    when "0001" => right <= '0'; ce <= '1';
    when "0010" => right <= '1'; ce <= '1';
    when others => right <= '0'; ce <= '0';
  end case;
end process;
 
end Behavioral;

