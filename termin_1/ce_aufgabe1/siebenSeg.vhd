-- Authors: Oemer Kirdas, Jakob Otto
-- Version: 0.1 (28.03.2018)

library ieee;
use ieee.std_logic_1164.all;

entity siebenSeg is
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
end entity siebenSeg;


architecture beh of siebenSeg is
  component shiftReg
    port(
      regOut : out std_logic_vector(3 downto 0);      -- signals for the segments of the chosen nibble
      tick : in std_logic;
      clk : in std_logic;                             -- clk signal. should be around 62.5Hz to 1000Hz
      nres : in std_logic                             -- low active reset
    );
  end component shiftReg;
  --
  for all : shiftReg use entity work.shiftReg(beh);
  
  component TickGen
    port(
      tick : out std_logic;
      clk : in std_logic
    );
  end component TickGen;
  --
  for all : TickGen use entity work.TickGen(beh);

  signal tick_s : std_logic;
  
  -- input signals
  signal id_cs : std_logic_vector(1 downto 0) := (others=>'0');
  signal idLd_cs : std_logic := '1';
  signal value_cs : std_logic_vector(3 downto 0) := (others=>'0');
  signal valLd_cs : std_logic := '1';
  
  -- internal signals
  signal nibbleValues_ns : std_logic_vector(15 downto 0);
  signal nibbleValues_cs : std_logic_vector(15 downto 0) := (others=>'0');
  
  signal ledOut_ns : std_logic_vector(7 downto 0);
  signal ledOut_cs : std_logic_vector(7 downto 0) := (others=>'0');
  
  signal segments_ns : std_logic_vector(7 downto 0);
  signal segments_cs : std_logic_vector(7 downto 0) := (others=>'1');
  
  signal anode_s : std_logic_vector(3 downto 0);
  signal anode_ns : std_logic_vector(3 downto 0);
  signal anode_cs : std_logic_vector(3 downto 0) := (others=>'1');

begin
  sequlo:
  process (clk) is
  begin
    if (rising_edge(clk)) then 
      if (nres = '0') then 
        idLd_cs <= '1';
        valLd_cs <= '1';
        id_cs <= (others=>'1');
        ledOut_cs <= (others=>'0');
        nibbleValues_cs <= (others=>'0');
        segments_cs <= (others=>'1');
        anode_cs <= (others=>'1');
        value_cs <= (others=>'1');
      else                
        -- id-Register
        if (idLd_cs = '0') then 
          id_cs <= not id;
        end if;
        value_cs <= not valueIn;
        valLd_cs <= valLd;
        idLd_cs <= idLd;
        ledOut_cs <= ledOut_ns;
        nibbleValues_cs <= nibbleValues_ns;
        segments_cs <= segments_ns;
        anode_cs <= anode_ns;
      end if;
    end if;
  end process sequlo;
  ledOut <= ledOut_cs;
  segments <= segments_cs;
  anode <= anode_cs;
  
  inputValue:
  process (nibbleValues_cs, value_cs, valLd_cs, id_cs) is 
    variable nibbleValues_v : std_logic_vector(15 downto 0);
  begin
    nibbleValues_v := nibbleValues_cs;
    if valLd_cs = '0' then
      case id_cs is
        when "00" =>
          nibbleValues_v(3 downto 0) := value_cs;
        when "01" => 
          nibbleValues_v(7 downto 4) := value_cs;
        when "10" =>
          nibbleValues_v(11 downto 8) := value_cs;
        when "11" =>
          nibbleValues_v(15 downto 12) := value_cs;
        when others =>
          -- nothing should happen
      end case;
    end if;
    nibbleValues_ns <= nibbleValues_v;
  end process inputValue;
  
  ledOutProc:
  process (nibbleValues_cs, id_cs) is
    variable ledOut_v : std_logic_vector(7 downto 0);
  begin 
    case id_cs is
      when "00" =>
        ledOut_v(7 downto 4) := "0001";
        ledOut_v(3 downto 0) := nibbleValues_cs(3 downto 0);
      when "01" => 
        ledOut_v(7 downto 4) := "0010";
        ledOut_v(3 downto 0) := nibbleValues_cs(7 downto 4);                
      when "10" =>
        ledOut_v(7 downto 4) := "0100";
        ledOut_v(3 downto 0) := nibbleValues_cs(11 downto 8);
      when "11" =>
        ledOut_v(7 downto 4) := "1000";
        ledOut_v(3 downto 0) := nibbleValues_cs(15 downto 12);   
      when others =>
        ledOut_v := (others=>'0');
        -- nothing should happen
    end case;
    ledOut_ns <= ledOut_v;
  end process ledOutProc;
  
  siebenSegOut:
  process (nibbleValues_cs, anode_s) is
    variable nibVal_v : std_logic_vector(3 downto 0);
    variable segments_v : std_logic_vector(7 downto 0);
  begin
    case anode_s is
      when "1110" =>
          nibVal_v := nibbleValues_cs(3 downto 0);
      when "1101" =>
          nibVal_v := nibbleValues_cs(7 downto 4);
      when "1011" =>
          nibVal_v := nibbleValues_cs(11 downto 8);
      when "0111" =>
          nibVal_v := nibbleValues_cs(15 downto 12);
      when others =>
          nibVal_v := (others=>'0');
    end case;
    case nibVal_v is
      when "0000" => 
        segments_v := "10000001";
      when "0001" => 
        segments_v := "11001111";
      when "0010" => 
        segments_v := "10010010";          
      when "0011" => 
        segments_v := "10000110";
      when "0100" => 
        segments_v := "11001100";
      when "0101" => 
        segments_v := "10100100";
      when "0110" => 
        segments_v := "10100000";
      when "0111" => 
        segments_v := "10001111";
      when "1000" => 
        segments_v := "10000000";
      when "1001" => 
        segments_v := "10000100";
      when "1010" => 
        segments_v := "10001000";
      when "1011" => 
        segments_v := "11100000";
      when "1100" => 
        segments_v := "10110001";
      when "1101" => 
        segments_v := "11000010";
      when "1110" => 
        segments_v := "10110000";
      when "1111" => 
        segments_v := "10111000";
      when others =>
        segments_v := (others => '1');
    end case;
    anode_ns <= anode_s;
    segments_ns <= segments_v;
  end process siebenSegOut;

  -- components
  tickGenerator : TickGen port map(
    clk => clk,
    tick => tick_s
  );
  
  shiftRegister : shiftReg port map(
    regOut => anode_s,
    clk => clk,
    tick => tick_s,
    nres => nres
  );
end architecture beh;
