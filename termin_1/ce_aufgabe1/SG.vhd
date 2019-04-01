-- Code belongs to TI3 DT WS 11/12
-- Demo für Z1
-- History:
--  111212: 1st version for TI3 DT WS11/12  by Michael Schaefers 



library work;
    use work.all;
    
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.math_real.all;                             -- für random / uniform()
    
    
    
-- sg ::= Stimuli Generator    
entity sg is                                            -- Stimuli Generator
    port (
        -- nibble value
        values : out std_logic_vector(3 downto 0);       -- HEX VALue ->S1-S4
        valLd : out std_logic;                        -- VALue LoaD -> S5
        
        -- nibble selection
        id : out std_logic_vector(1 downto 0);        -- ID of the nibble
        idLd : out std_logic;                         -- ID LoaD, -> S8
        
        clk    : out std_logic;                         -- CLocK
        nres   : out std_logic                          -- Not RESet ; low active reset
    );--]port
end entity sg;



architecture beh of sg is
    
    constant quarterClockCycle   : time := 25 ns;
    constant halfClockCycle      : time := 2*quarterClockCycle;
    constant fullClockCycle      : time := 2*halfClockCycle;
    
    signal   simulationRunning_s : boolean := true;
    
begin
    
    sg:                                                -- Stimuli Generator
    process is
       
    begin
        simulationRunning_s <= true;
        
        report "synchronous reset is coming now" severity note;
        
        -- reset all outgoing signals before starting the signal generation
        wait for halfClockCycle;                       -- setup time
        values <= (others=>'0');
        valLd <= '1';
        id <= (others=>'0');
        idLd <= '1';
        wait for halfClockCycle;                       -- synchronous reset gone (see "resGen")
        wait for fullClockCycle;
        wait for quarterClockCycle;                    -- "align" after rising clock edge

        report "design should be resetted" severity note;
        -- All signals should be initialized here components should be resetted
        
        for ids in 0 to 3 loop
            --select one nibble first:
            id <= std_logic_vector(to_unsigned(ids, 2));
            idLd <= '0';
            wait for fullClockCycle;
            idLd <= '1';
            
            -- then put the 16 different values into the design:
            for nibbleValue in 0 to 15 loop
                values <= not std_logic_vector(to_unsigned(nibbleValue, 4));
                valLd <= '0';
                wait for fullClockCycle;
                valLd <= '1';
                
                wait for 4*125000*fullClockCycle; -- wait for nibble signals to come out
            end loop;
            
            for i in 0 to 3 loop 
                id <= std_logic_vector(to_unsigned(i, 2));
                idLd <= '0';
                wait for fullClockCycle;
                idLd <= '1';
                wait for fullClockCycle;
            end loop;
            
        end loop;
        
        -- sg soll stoppen, sobald alle Testmuster abgearbeitet
        wait for 10*fullClockCycle;                     -- noch 10 Takte warten
        simulationRunning_s <= false;                  -- Stoppen
        wait;
    end process sg;
    
    
    
    clkGen:                                            -- CLocK GENerator
    process is
    begin
        clk <= '0';
        wait for fullClockCycle;
        while simulationRunning_s loop
            clk <= '1';
            wait for halfClockCycle;
            clk <= '0';
            wait for halfClockCycle;
        end loop;
        wait;
    end process clkGen;
    
    
    
    resGen:                                            -- RESet GENerator
    process is
    begin
        nres <= '0';
        wait for 5*quarterClockCycle;
        nres <= '1';
        wait;
    end process resGen;
    
end architecture beh;