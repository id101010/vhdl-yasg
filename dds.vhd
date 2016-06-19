----------------------------------------------------------------------------------
-- Project:        YASG (Yet another signal generator)
-- Project Page:   https://github.com/id101010/vhdl-yasg/
-- Authors:        Aaron Schmocker & Timo Lang
-- License:		    GPL v3
-- Create Date:    11:09:53 05/16/2016 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;
use work.helpers.all;

entity dds is
    Generic (clk_freq: natural:= 50000000;
             freq_res: natural:=17; -- width of frequency input (log2(max_freq))
             adc_res: natural:=12; -- width of the ouput signal (=adc resolution)
             acc_res: natural:=32; -- width of the phase accumulator
             phase_res: natural:=10); -- effective phase resolution for sin lookup table
    Port ( clk : in  STD_LOGIC;
           freq : in  unsigned (freq_res-1 downto 0);
           form : in  unsigned (1 downto 0);
           amp : out  unsigned (adc_res-1 downto 0));
end dds;

architecture Behavioral of dds is   
    signal m, idx : unsigned(acc_res -1  downto 0):= (others => '0');   
    signal idx_phase : unsigned(phase_res-1 downto 0) := (others => '0');  
    signal amp_rect, amp_saw, amp_tria, amp_sin : unsigned (adc_res-1 downto 0);
    
    type storage is array (((2**phase_res)/4)-1 downto 0) of unsigned (adc_res-2 downto 0);
	 --type storage is array (((2**phase_res))-1 downto 0) of unsigned (adc_res-1 downto 0);
    function gen_sin_wave return storage is
        variable temp : storage;
        begin
            forLoop: for i in 0 to temp'high loop
               temp(i) := to_unsigned(integer(real((2**(adc_res-1))-1)*sin((real(i)*MATH_PI/2.0)/real(temp'high))),adc_res-1);
					--temp(i) := to_unsigned(integer(real(2**(adc_res-1) -1)  + real((2**(adc_res-1))-1)*sin((real(i)*MATH_PI*2.0)/real(temp'high))),adc_res);
            	
				end loop;
        return temp;
    end function gen_sin_wave;
    constant sin_wave : storage := gen_sin_wave;
   
begin

    -- m = fout*(2^n)/fclk = fout*((2^n)*(2^k)/fclk)/(2^k)   with k=ceil(log2(fclk)), n=acc_res
	 m <= resize(  (resize(freq,64) 
					   * 
					   (shift_left(to_unsigned(1,64),acc_res + log2_int(clk_freq)) / clk_freq)) 
					  /to_unsigned(2**log2_int(clk_freq),64),acc_res);


    amp_rect <= to_unsigned(0,adc_res) when idx(acc_res-1)='0' else 
                to_unsigned((2**adc_res)-1,adc_res);
    
    amp_saw <=  idx(acc_res -1 downto acc_res - adc_res);
	 
	
	 amp_tria <= idx(acc_res -2 downto acc_res - adc_res) & "0"
                 when idx(acc_res-1)='0' else 
					  ((2**adc_res)-1)- (idx(acc_res -2 downto acc_res - adc_res) & "0");

	 
	 
	 idx_phase <= idx(acc_res -1 downto acc_res - phase_res);
	 
	 --amp_sin <= sin_wave(to_integer(idx_phase));
	 amp_sin <=  to_unsigned((2**(adc_res-1)) - 1,adc_res) + sin_wave(to_integer(idx_phase(phase_res-3 downto 0))) when idx_phase(phase_res-1 downto phase_res-2)="00" else
                to_unsigned((2**(adc_res-1)) - 1,adc_res) + sin_wave(to_integer(((2**(phase_res-2))-1) - idx_phase(phase_res-3 downto 0))) when idx_phase(phase_res-1 downto phase_res-2)="01" else
                to_unsigned((2**(adc_res-1)) - 1,adc_res) - sin_wave(to_integer(idx_phase(phase_res-3 downto 0))) when idx_phase(phase_res-1 downto phase_res-2)="10" else
                to_unsigned((2**(adc_res-1)) - 1,adc_res) - sin_wave(to_integer(((2**(phase_res-2))-1) - idx_phase(phase_res-3 downto 0)));
					 
	 amp <= to_unsigned(0,adc_res)  when freq = to_unsigned(0,freq_res) else 				 
									 amp_rect when form = "00" else
                            amp_saw when form ="01" else
                            amp_tria when form = "10" else
                            amp_sin;
                            
    P1: process(clk) 
    begin
        if(rising_edge(clk)) then
            idx <= (idx+m);
        end if;
    end process P1;


end Behavioral;

