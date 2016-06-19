----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:          GPL v3
-- Create Date:    12:59:01 05/16/2016 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package helpers is
    --helper function to calculate the log2 (truncated) of a integer
    function log2_int(n:natural) return natural; 
end helpers;


package body helpers is
    function log2_int(n:natural) return natural is
        begin
          if(n>1) then --we can stil divide n by 2
                return 1+log2_int(n/2); --recursivly call log2_int for the by two divided number.
          end if;
          return 1; --since we can no longer divide n, return 1
    end log2_int;
end helpers;

