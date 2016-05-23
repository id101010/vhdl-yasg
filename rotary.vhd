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
           up_down  : out std_logic;        -- Zaehlrichtung
           ce       : out std_logic;        -- Clock Enable
           error    : out std_logic);       -- illegaler Signalübergang
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
    when "0000" => up_down <= '0'; ce <= '0'; error <= '0';
    when "0001" => up_down <= '1'; ce <= '1'; error <= '0';
    when "0010" => up_down <= '0'; ce <= '1'; error <= '0';
    when "0011" => up_down <= '0'; ce <= '0'; error <= '1';
    when "0100" => up_down <= '0'; ce <= '1'; error <= '0';
    when "0101" => up_down <= '0'; ce <= '0'; error <= '0';
    when "0110" => up_down <= '0'; ce <= '0'; error <= '1';
    when "0111" => up_down <= '1'; ce <= '1'; error <= '0';
    when "1000" => up_down <= '1'; ce <= '1'; error <= '0';
    when "1001" => up_down <= '0'; ce <= '0'; error <= '1';
    when "1010" => up_down <= '0'; ce <= '0'; error <= '0';
    when "1011" => up_down <= '0'; ce <= '1'; error <= '0';
    when "1100" => up_down <= '0'; ce <= '0'; error <= '1';
    when "1101" => up_down <= '0'; ce <= '1'; error <= '0';
    when "1110" => up_down <= '1'; ce <= '1'; error <= '0';
    when "1111" => up_down <= '0'; ce <= '0'; error <= '0';
    when others => null;
  end case;
end process;
 
end Behavioral;

