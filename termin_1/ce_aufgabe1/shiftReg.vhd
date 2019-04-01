-- ShiftReg entity for driving the four seven segment displays on the Xynergy-Board.
-- Authors: Ömer Kirdas, Jakob Otto
-- Version: 0.1 (28.03.2018)
library work;
    use work.all;
library ieee;
use ieee.std_logic_1164.all;

entity ShiftReg is
    port(
        regOut : out std_logic_vector(3 downto 0);    -- signals for the segments of the chosen nibble
		
		tick : in std_logic;
        clk : in std_logic;                             -- clk signal. should be around 62.5Hz to 1000Hz
        nres : in std_logic                             -- low active reset
    );
end entity ShiftReg;


architecture beh of ShiftReg is 
    signal shiftRegister_cs : std_logic_vector(3 downto 0) := "1110";
    signal shiftRegister_ns : std_logic_vector(3 downto 0);
begin
    sequlo:
    process (clk) is
    begin 
        if (rising_edge(clk)) then
            if (nres = '0') then 
                shiftRegister_cs <= "1110";
            elsif(tick = '1') then
                shiftRegister_cs <= shiftRegister_ns;
            end if;
        end if;
    end process sequlo;
    --
    regOut <= shiftRegister_cs; 
    
    
    shift:
    process(shiftRegister_cs) is 
    begin
        shiftRegister_ns <= shiftRegister_cs(shiftRegister_cs'left-1 downto 0) & shiftRegister_cs(shiftRegister_cs'left); -- shift all bits to the left and add the old MSB to the right again.
    end process shift;

end architecture beh;