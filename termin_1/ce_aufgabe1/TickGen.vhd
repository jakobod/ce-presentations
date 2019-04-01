-- Tick Generator -- generates ticks in the frequency of 1000Hz
-- Authors: Oemer Kirdas, Jakob Otto
-- Version: 0.1 (28.03.2018)
library work;
    use work.all;
library ieee;
    use ieee.std_logic_1164.all;

entity TickGen is
    port(
        tick : out std_logic;
        clk : in std_logic
    );
end entity TickGen;


architecture beh of TickGen is
begin 
    
    tickGen:
    process (clk) is 
        constant maxValue : integer := 12500;
        variable count : integer range 0 to maxValue := 0;
        variable tick_v : std_logic;
    begin
        if (rising_edge(clk)) then 
            count := count + 1;
            
            if (count = maxValue) then 
                count := 0;
                tick_v := '1';
            else
                tick_v := '0';
            end if;
        end if;
        
        tick <= tick_v;
    end process tickGen;

end architecture beh;
