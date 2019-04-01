-- Authors: Oemer Kirdas, Jakob Otto
-- Version: 0.1 (28.03.2018)

library ieee;
use ieee.std_logic_1164.all;

entity TB is
end entity TB;

architecture testing of TB is
    component DUT
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
    end component DUT;
    --
    for all : DUT use entity work.DUT(wrapping);
    
	--for all : DUT use entity work.DUT(Structure);
    
    component SG
        port (
            -- nibble value
            values : out std_logic_vector(3 downto 0);
            valLd : out std_logic;
            
            -- nibble selection
            id : out std_logic_vector(1 downto 0);
            idLd : out std_logic;
            
            clk    : out std_logic;                         -- CLocK
            nres   : out std_logic                          -- Not RESet ; low active reset
        );--]port
    end component SG;
    --
    for all : SG use entity work.SG(beh);

    
    component TickGen
        port(
            tick : out std_logic;
            clk : in std_logic
        );
    end component TickGen;
    --
    for all : TickGen use entity work.TickGen(beh);
    
    
    --signals for testbench
    signal clk_s : std_logic;
    signal nres_s : std_logic;
    
    signal segments_s : std_logic_vector(7 downto 0);
    signal anode_s : std_logic_vector(3 downto 0);
    signal ledOut_s : std_logic_vector(7 downto 0);
    signal values_s : std_logic_vector(3 downto 0);
    signal valLd_s : std_logic;
    signal id_s : std_logic_vector(1 downto 0);
    signal idLd_s : std_logic;
    
    signal tick_s : std_logic;
begin
    
    signals : SG port map(
        clk => clk_s,
        nres => nres_s,
        values => values_s,
        valLd => valLd_s,
        id => id_s,
        idLd => idLd_s
    );
    

    device : DUT port map(
        -- dbg outputs for led's
        ledOut => ledOut_s,
        anode => anode_s,
        segments => segments_s,
        valueIn => values_s,
        valLd => valLd_s,
        id => id_s,
        idLd => idLd_s,
        clk => clk_s,
        nres => nres_s
    );
    
    tick : TickGen port map(
        clk => clk_s,
        tick => tick_s
    );    
    
end architecture testing;
