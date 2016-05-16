
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package helpers is
    --helper function to calculate the log2 (truncated) of a integer
    function log2_int(n:natural) return natural; 
    function divide  (a : UNSIGNED; b : UNSIGNED) return UNSIGNED;
end helpers;



package body helpers is
    function log2_int(n:natural) return natural is
        begin
          if(n>1) then --we can stil divide n by 2
                return 1+log2_int(n/2); --recursivly call log2_int for the by two divided number.
          end if;
          return 1; --since we can no longer divide n, return 1
    end log2_int;
    
    --Source: http://vhdlguru.blogspot.ch/2010/03/vhdl-function-for-division-two-signed.html
    function  divide  (a : UNSIGNED; b : UNSIGNED) return UNSIGNED is
    variable a1 : unsigned(a'length-1 downto 0):=a;
    variable b1 : unsigned(b'length-1 downto 0):=b;
    variable p1 : unsigned(b'length downto 0):= (others => '0');
    variable i : integer:=0;

    begin
        for i in 0 to b'length-1 loop
            p1(b'length-1 downto 1) := p1(b'length-2 downto 0);
            p1(0) := a1(a'length-1);
            a1(a'length-1 downto 1) := a1(a'length-2 downto 0);
            p1 := p1-b1;
            if(p1(b'length-1) ='1') then
                a1(0) :='0';
                p1 := p1+b1;
            else
                a1(0) :='1';
            end if;
        end loop;
        return a1;
    end divide;
end helpers;

