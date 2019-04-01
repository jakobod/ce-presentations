-- Authors: Oemer Kirdas, Jakob Otto
-- Version: 0.1 (28.03.2018)

library ieee;
use ieee.std_logic_1164.all;

entity DUT is
    port(
            -- dbg outputs for led's
            ledOut : out std_logic_vector(7 downto 0);     -- (bits 7-4) -> selected segment-display, (bits 0-3) -> value of selected display

            -- real outputs for choosing and setting nibble values
            anode : out std_logic_vector(3 downto 0);         -- load intern nibble ID for SCREEN
            segments : out std_logic_vector(7 downto 0);   -- nibble  -> Segments: a=0,b=1,c=2...g=6
            
            -- nibble value
            valueIn : in std_logic_vector(3 downto 0);       -- HEX VALue ->S1-S4
            valLd : in std_logic;                        -- VALue LoaD -> S5
			
            -- nibble selection
            id : in std_logic_vector(1 downto 0);        -- ID of the nibble S6-S7
            idLd : in std_logic;                         -- ID LoaD, -> S8
            
            clk : in std_logic;                             -- CLocK
            nres : in std_logic                             -- Not RESet
        );
end entity DUT;


architecture wrapping of DUT is
    component siebenSeg
        port(
            -- dbg outputs for led's
            ledOut : out std_logic_vector(7 downto 0);     -- (bits 7-4) -> selected segment-display, (bits 0-3) -> value of selected display

            -- real outputs for choosing and setting nibble values
            anode : out std_logic_vector(3 downto 0);         -- load intern nibble ID for SCREEN
            segments : out std_logic_vector(7 downto 0);   -- nibble  -> Segments: a=0,b=1,c=2...g=6
            
            -- nibble value
            valueIn : in std_logic_vector(3 downto 0);       -- HEX VALue ->S1-S4
            valLd : in std_logic;                        -- VALue LoaD -> S5
			
            -- nibble selection
            id : in std_logic_vector(1 downto 0);        -- ID of the nibble S6-S7
            idLd : in std_logic;                         -- ID LoaD, -> S8
            
            clk : in std_logic;                             -- CLocK
            nres : in std_logic                             -- Not RESet
        );
    end component siebenSeg;
    --
    for all : siebenSeg use entity work.siebenSeg(beh);
	
begin
    
    nibbles : siebenSeg port map(
        ledOut => ledOut,
        anode => anode,
        segments => segments,
        valueIn => valueIn,
        valLd => valLd,
        id => id,
        idLd => idLd,
        clk => clk,
        nres => nres
    );
    
    
    
end architecture wrapping;