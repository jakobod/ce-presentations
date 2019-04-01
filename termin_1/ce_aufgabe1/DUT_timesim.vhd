--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: DUT_timesim.vhd
-- /___/   /\     Timestamp: Tue Apr 10 09:08:03 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -s 3 -pcf DUT.pcf -rpw 100 -tpw 0 -ar Structure -tm DUT -insert_pp_buffers true -w -dir netgen/par -ofmt vhdl -sim DUT.ncd DUT_timesim.vhd 
-- Device	: 6slx16csg324-3 (PRODUCTION 1.23 2013-10-13)
-- Input file	: DUT.ncd
-- Output file	: \\filer2.is.haw-hamburg.de\user\ace044\CE\A1\ise14x7_v1\CE_A1\netgen\par\DUT_timesim.vhd
-- # of Entities	: 1
-- Design Name	: DUT
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

-- entity DUT is
  -- port (
    -- valLd : in STD_LOGIC := 'X'; 
    -- idLd : in STD_LOGIC := 'X'; 
    -- clk : in STD_LOGIC := 'X'; 
    -- nres : in STD_LOGIC := 'X'; 
    -- valueIn : in STD_LOGIC_VECTOR ( 3 downto 0 ); 
    -- id : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    -- ledOut : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    -- anode : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    -- segments : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  -- );
-- end DUT;

architecture Structure of DUT is
  signal nibbles_valLd_cs_inv : STD_LOGIC; 
  signal clk_BUFGP : STD_LOGIC; 
  signal nibbles_value_cs_0_0 : STD_LOGIC; 
  signal nibbles_nres_inv : STD_LOGIC; 
  signal nibbles_value_cs_2_0 : STD_LOGIC; 
  signal nibbles_ledOut_cs_5_0 : STD_LOGIC; 
  signal nibbles_ledOut_cs_7_0 : STD_LOGIC; 
  signal valueIn_2_IBUF_0 : STD_LOGIC; 
  signal valueIn_3_IBUF_0 : STD_LOGIC; 
  signal valueIn_0_IBUF_0 : STD_LOGIC; 
  signal valueIn_1_IBUF_0 : STD_LOGIC; 
  signal nibbles_Result_0_0 : STD_LOGIC; 
  signal nibbles_Result_1_0 : STD_LOGIC; 
  signal nibbles_Result_2_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_3_Q_742 : STD_LOGIC; 
  signal nibbles_Result_3_0 : STD_LOGIC; 
  signal nibbles_Result_4_0 : STD_LOGIC; 
  signal nibbles_Result_5_0 : STD_LOGIC; 
  signal nibbles_Result_6_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_7_Q_751 : STD_LOGIC; 
  signal nibbles_Result_7_0 : STD_LOGIC; 
  signal nibbles_Result_8_0 : STD_LOGIC; 
  signal nibbles_Result_9_0 : STD_LOGIC; 
  signal nibbles_Result_10_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_11_Q_760 : STD_LOGIC; 
  signal nibbles_Result_11_0 : STD_LOGIC; 
  signal nibbles_Result_12_0 : STD_LOGIC; 
  signal nibbles_Result_13_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_0_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_1_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_2_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_Q_770 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_3_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_4_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_5_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_6_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_Q_775 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_7_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_8_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_9_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_10_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_Q_780 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0 : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_0 : STD_LOGIC; 
  signal valLd_IBUF_0 : STD_LOGIC; 
  signal id_0_IBUF_0 : STD_LOGIC; 
  signal id_1_IBUF_0 : STD_LOGIC; 
  signal idLd_IBUF_0 : STD_LOGIC; 
  signal nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal nibbles_idLd_cs_814 : STD_LOGIC; 
  signal nibbles_Mmux_siebenSegOut_nibVal_v_0_1 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_tick_v_816 : STD_LOGIC; 
  signal nibbles_Mmux_siebenSegOut_nibVal_v_2_1 : STD_LOGIC; 
  signal nibbles_Mmux_siebenSegOut_nibVal_v_3_1 : STD_LOGIC; 
  signal nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_1_819 : STD_LOGIC; 
  signal nibbles_Mmux_siebenSegOut_nibVal_v_1_1 : STD_LOGIC; 
  signal nibbles_valLd_cs_821 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_3_rt_10 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_1_rt_6 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_2_rt_3 : STD_LOGIC; 
  signal ProtoComp7_CYINITGND_0 : STD_LOGIC; 
  signal id_1_IBUF_185 : STD_LOGIC; 
  signal id_0_IBUF_180 : STD_LOGIC; 
  signal idLd_IBUF_202 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_9_rstpot_295 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_10_rstpot_273 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_8_rstpot_272 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_11_rstpot_405 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_rstpot_394 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_12_rstpot_388 : STD_LOGIC; 
  signal nibbles_Mram_siebenSegOut_segments_v2 : STD_LOGIC; 
  signal nibbles_Mram_siebenSegOut_segments_v3 : STD_LOGIC; 
  signal nibbles_Mram_siebenSegOut_segments_v4 : STD_LOGIC; 
  signal nibbles_Mram_siebenSegOut_segments_v5 : STD_LOGIC; 
  signal nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_0_rstpot_337 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_3_rstpot_328 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_2_rstpot_320 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_1_rstpot_318 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_4_rstpot_370 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_7_rstpot_361 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_6_rstpot_353 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_5_rstpot_351 : STD_LOGIC; 
  signal nibbles_Mram_siebenSegOut_segments_v6 : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_0_pack_7 : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_0_Q : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_1_pack_9 : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_12_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_1_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_13_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_2_Q : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_11_pack_13 : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_14_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_11_Q : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_2_pack_11 : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_15_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_rt_145 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_12_rt_143 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_8_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_9_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_8_rt_133 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_10_rt_129 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_9_rt_128 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_11_rt_124 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_10_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_Q : STD_LOGIC; 
  signal clk_BUFGP_IBUFG_150 : STD_LOGIC; 
  signal valLd_IBUF_153 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_4_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_5_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_4_rt_111 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_6_rt_107 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_5_rt_106 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_7_rt_102 : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_6_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_7_Q : STD_LOGIC; 
  signal nibbles_nres_inv_non_inverted : STD_LOGIC; 
  signal ProtoComp11_IINV_OUT : STD_LOGIC; 
  signal valueIn_1_IBUF_159 : STD_LOGIC; 
  signal valueIn_2_IBUF_162 : STD_LOGIC; 
  signal valueIn_0_IBUF_156 : STD_LOGIC; 
  signal valueIn_3_IBUF_165 : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_8_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_10_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_9_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_11_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_lut_0_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_0_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_3_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_3_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_2_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_1_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_2_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_1_Q : STD_LOGIC; 
  signal nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_ProtoComp7_CYINITGND_0 : STD_LOGIC; 
  signal nibbles_Result_13_nibbles_tickGenerator_tickGen_count_13_rt : STD_LOGIC; 
  signal nibbles_Result_13_nibbles_tickGenerator_tickGen_count_12_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_4_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_6_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_5_rt : STD_LOGIC; 
  signal nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_7_rt : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_10_pack_13 : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_10_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_6_Q : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_7_pack_7 : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_7_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_8_Q : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_8_pack_9 : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_3_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_4_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_5_Q : STD_LOGIC; 
  signal nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_9_Q : STD_LOGIC; 
  signal nibbles_nibbleValues_cs_9_pack_11 : STD_LOGIC; 
  signal nibbles_Mram_siebenSegOut_segments_v : STD_LOGIC; 
  signal nibbles_Mram_siebenSegOut_segments_v1 : STD_LOGIC; 
  signal nibbles_id_cs_0_glue_set_665 : STD_LOGIC; 
  signal nibbles_id_cs_1_glue_set_656 : STD_LOGIC; 
  signal nibbles_value_cs_1_glue_set_640 : STD_LOGIC; 
  signal nibbles_value_cs_0_glue_set_639 : STD_LOGIC; 
  signal nibbles_value_cs_2_glue_set_637 : STD_LOGIC; 
  signal nibbles_value_cs_3_glue_set_635 : STD_LOGIC; 
  signal NlwBufferSignal_anode_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anode_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segments_5_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_7_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segments_4_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anode_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_anode_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_ledOut_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segments_6_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_1_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_0_IN : STD_LOGIC; 
  signal NlwBufferSignal_clk_BUFGP_BUFG_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_2_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_anode_cs_3_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_10_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_9_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_8_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_13_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_12_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_11_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_segments_cs_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_segments_cs_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_segments_cs_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_segments_cs_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_tick_v_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_tickGenerator_tickGen_count_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_segments_cs_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_15_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_11_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_14_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_13_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_12_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_segments_1_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segments_3_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segments_2_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_segments_0_OBUF_I : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_valLd_cs_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_valLd_cs_IN : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_6_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_10_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_5_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_9_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_4_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_8_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_nibbleValues_cs_7_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_segments_cs_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_segments_cs_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_id_cs_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_id_cs_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_ledOut_cs_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_value_cs_3_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_value_cs_2_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_value_cs_1_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_value_cs_0_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_idLd_cs_CLK : STD_LOGIC; 
  signal NlwBufferSignal_nibbles_idLd_cs_IN : STD_LOGIC; 
  signal NLW_N0_10_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_11_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_12_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_segments_7_OBUF_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal VCC : STD_LOGIC; 
  signal GND : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_DI_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_DI_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_DI_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_S_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_S_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_15_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_16_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_17_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_18_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_19_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_20_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_21_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_22_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_23_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_2_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_3_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_4_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_5_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_24_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_25_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_26_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_segments_7_OBUF_1_2_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_DI_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_DI_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_DI_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_O_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_O_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_S_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_S_3_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_6_D5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_CO_0_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_CO_1_UNCONNECTED : STD_LOGIC; 
  signal NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_CO_2_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_7_C5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_8_B5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_N0_9_A5LUT_O_UNCONNECTED : STD_LOGIC; 
  signal nibbles_nibbleValues_cs : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal nibbles_id_cs : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal nibbles_value_cs : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal nibbles_ledOut_cs : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal nibbles_tickGenerator_tickGen_count : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal nibbles_segments_cs : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal nibbles_anode_cs : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal nibbles_shiftRegister_shiftRegister_cs : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal nibbles_siebenSegOut_nibVal_v : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal nibbles_tickGenerator_Mcount_tickGen_count_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal nibbles_Result : STD_LOGIC_VECTOR ( 13 downto 0 ); 
  signal nibbles_ledOutProc_ledOut_v : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  nibbles_tickGenerator_Mcount_tickGen_count_cy_3_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(3),
      O => nibbles_Result_3_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_3_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(2),
      O => nibbles_Result_2_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_3_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(1),
      O => nibbles_Result_1_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_3_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(0),
      O => nibbles_Result_0_0
    );
  nibbles_tickGenerator_tickGen_count_3_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(3),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_3_rt_10
    );
  N0_10_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_10_D5LUT_O_UNCONNECTED
    );
  ProtoComp7_CYINITGND : X_ZERO
    generic map(
      LOC => "SLICE_X22Y20"
    )
    port map (
      O => ProtoComp7_CYINITGND_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X22Y20"
    )
    port map (
      CI => '0',
      CYINIT => ProtoComp7_CYINITGND_0,
      CO(3) => nibbles_tickGenerator_Mcount_tickGen_count_cy_3_Q_742,
      CO(2) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_3_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => nibbles_Result(3),
      O(2) => nibbles_Result(2),
      O(1) => nibbles_Result(1),
      O(0) => nibbles_Result(0),
      S(3) => nibbles_tickGenerator_tickGen_count_3_rt_10,
      S(2) => nibbles_tickGenerator_tickGen_count_2_rt_3,
      S(1) => nibbles_tickGenerator_tickGen_count_1_rt_6,
      S(0) => nibbles_tickGenerator_Mcount_tickGen_count_lut(0)
    );
  nibbles_tickGenerator_tickGen_count_2_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"AAAAAAAAAAAAAAAA"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => nibbles_tickGenerator_tickGen_count(2),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_2_rt_3
    );
  N0_11_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_11_C5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_1_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"AAAAAAAAAAAAAAAA"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => nibbles_tickGenerator_tickGen_count(1),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_1_rt_6
    );
  N0_12_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_12_B5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Mcount_tickGen_count_lut_0_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"3333333333333333"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(0),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_lut(0)
    );
  segments_7_OBUF_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y20",
      INIT => X"FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_segments_7_OBUF_A5LUT_O_UNCONNECTED
    );
  anode_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD159"
    )
    port map (
      I => NlwBufferSignal_anode_1_OBUF_I,
      O => anode(1)
    );
  id_1_IBUF : X_BUF
    generic map(
      LOC => "PAD63",
      PATHPULSE => 115 ps
    )
    port map (
      O => id_1_IBUF_185,
      I => id(1)
    );
  ProtoComp10_IMUX_7 : X_BUF
    generic map(
      LOC => "PAD63",
      PATHPULSE => 115 ps
    )
    port map (
      I => id_1_IBUF_185,
      O => id_1_IBUF_0
    );
  ledOut_4_OBUF : X_OBUF
    generic map(
      LOC => "PAD39"
    )
    port map (
      I => NlwBufferSignal_ledOut_4_OBUF_I,
      O => ledOut(4)
    );
  ledOut_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD43"
    )
    port map (
      I => NlwBufferSignal_ledOut_2_OBUF_I,
      O => ledOut(2)
    );
  ledOut_5_OBUF : X_OBUF
    generic map(
      LOC => "PAD40"
    )
    port map (
      I => NlwBufferSignal_ledOut_5_OBUF_I,
      O => ledOut(5)
    );
  anode_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD160"
    )
    port map (
      I => NlwBufferSignal_anode_0_OBUF_I,
      O => anode(0)
    );
  segments_5_OBUF : X_OBUF
    generic map(
      LOC => "PAD134"
    )
    port map (
      I => NlwBufferSignal_segments_5_OBUF_I,
      O => segments(5)
    );
  ledOut_6_OBUF : X_OBUF
    generic map(
      LOC => "PAD33"
    )
    port map (
      I => NlwBufferSignal_ledOut_6_OBUF_I,
      O => ledOut(6)
    );
  ledOut_7_OBUF : X_OBUF
    generic map(
      LOC => "PAD34"
    )
    port map (
      I => NlwBufferSignal_ledOut_7_OBUF_I,
      O => ledOut(7)
    );
  id_0_IBUF : X_BUF
    generic map(
      LOC => "PAD58",
      PATHPULSE => 115 ps
    )
    port map (
      O => id_0_IBUF_180,
      I => id(0)
    );
  ProtoComp10_IMUX_6 : X_BUF
    generic map(
      LOC => "PAD58",
      PATHPULSE => 115 ps
    )
    port map (
      I => id_0_IBUF_180,
      O => id_0_IBUF_0
    );
  idLd_IBUF : X_BUF
    generic map(
      LOC => "PAD64",
      PATHPULSE => 115 ps
    )
    port map (
      O => idLd_IBUF_202,
      I => idLd
    );
  ProtoComp10_IMUX_8 : X_BUF
    generic map(
      LOC => "PAD64",
      PATHPULSE => 115 ps
    )
    port map (
      I => idLd_IBUF_202,
      O => idLd_IBUF_0
    );
  segments_7_OBUF : X_OBUF
    generic map(
      LOC => "PAD142"
    )
    port map (
      I => '1',
      O => segments(7)
    );
  ledOut_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD44"
    )
    port map (
      I => NlwBufferSignal_ledOut_3_OBUF_I,
      O => ledOut(3)
    );
  ledOut_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD60"
    )
    port map (
      I => NlwBufferSignal_ledOut_1_OBUF_I,
      O => ledOut(1)
    );
  segments_4_OBUF : X_OBUF
    generic map(
      LOC => "PAD137"
    )
    port map (
      I => NlwBufferSignal_segments_4_OBUF_I,
      O => segments(4)
    );
  anode_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD153"
    )
    port map (
      I => NlwBufferSignal_anode_3_OBUF_I,
      O => anode(3)
    );
  anode_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD154"
    )
    port map (
      I => NlwBufferSignal_anode_2_OBUF_I,
      O => anode(2)
    );
  ledOut_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD59"
    )
    port map (
      I => NlwBufferSignal_ledOut_0_OBUF_I,
      O => ledOut(0)
    );
  segments_6_OBUF : X_OBUF
    generic map(
      LOC => "PAD133"
    )
    port map (
      I => NlwBufferSignal_segments_6_OBUF_I,
      O => segments(6)
    );
  nibbles_anode_cs_0 : X_SFF
    generic map(
      LOC => "OLOGIC_X8Y2",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_anode_cs_0_CLK,
      I => NlwBufferSignal_nibbles_anode_cs_0_IN,
      O => nibbles_anode_cs(0),
      SRST => GND,
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND
    );
  nibbles_anode_cs_1 : X_SFF
    generic map(
      LOC => "OLOGIC_X8Y3",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_anode_cs_1_CLK,
      I => NlwBufferSignal_nibbles_anode_cs_1_IN,
      O => nibbles_anode_cs(1),
      SRST => GND,
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND
    );
  nibbles_shiftRegister_shiftRegister_cs_3 : X_SFF
    generic map(
      LOC => "SLICE_X21Y20",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_3_CLK,
      I => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_3_IN,
      O => nibbles_shiftRegister_shiftRegister_cs(3),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_shiftRegister_shiftRegister_cs_2 : X_SFF
    generic map(
      LOC => "SLICE_X21Y20",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_2_CLK,
      I => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_2_IN,
      O => nibbles_shiftRegister_shiftRegister_cs(2),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_shiftRegister_shiftRegister_cs_1 : X_SFF
    generic map(
      LOC => "SLICE_X21Y20",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_1_CLK,
      I => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_1_IN,
      O => nibbles_shiftRegister_shiftRegister_cs(1),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_shiftRegister_shiftRegister_cs_0 : X_SFF
    generic map(
      LOC => "SLICE_X21Y20",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_0_CLK,
      I => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_0_IN,
      O => nibbles_shiftRegister_shiftRegister_cs(0),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  clk_BUFGP_BUFG : X_CKBUF
    generic map(
      LOC => "BUFGMUX_X3Y13",
      PATHPULSE => 115 ps
    )
    port map (
      I => NlwBufferSignal_clk_BUFGP_BUFG_IN,
      O => clk_BUFGP
    );
  nibbles_anode_cs_2 : X_SFF
    generic map(
      LOC => "OLOGIC_X9Y0",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_anode_cs_2_CLK,
      I => NlwBufferSignal_nibbles_anode_cs_2_IN,
      O => nibbles_anode_cs(2),
      SRST => GND,
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND
    );
  nibbles_anode_cs_3 : X_SFF
    generic map(
      LOC => "OLOGIC_X9Y1",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_anode_cs_3_CLK,
      I => NlwBufferSignal_nibbles_anode_cs_3_IN,
      O => nibbles_anode_cs(3),
      SRST => GND,
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND
    );
  nibbles_tickGenerator_tickGen_count_10 : X_FF
    generic map(
      LOC => "SLICE_X21Y22",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_10_CLK,
      I => nibbles_tickGenerator_tickGen_count_10_rstpot_273,
      O => nibbles_tickGenerator_tickGen_count(10),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_10_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X21Y22",
      INIT => X"FFFFDFFF00000000"
    )
    port map (
      ADR5 => nibbles_Result_10_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR3 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR1 => N30,
      O => nibbles_tickGenerator_tickGen_count_10_rstpot_273
    );
  nibbles_tickGenerator_tickGen_count_9 : X_FF
    generic map(
      LOC => "SLICE_X21Y22",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_9_CLK,
      I => nibbles_tickGenerator_tickGen_count_9_rstpot_295,
      O => nibbles_tickGenerator_tickGen_count(9),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_9_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X21Y22",
      INIT => X"F0B0F0F0F0F0F0F0"
    )
    port map (
      ADR2 => nibbles_Result_9_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR1 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR3 => N30,
      O => nibbles_tickGenerator_tickGen_count_9_rstpot_295
    );
  nibbles_tickGenerator_tickGen_count_8_rstpot_SW0 : X_LUT6
    generic map(
      LOC => "SLICE_X21Y22",
      INIT => X"FFFFFDFDFFFFFFFF"
    )
    port map (
      ADR3 => '1',
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_6_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_7_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_8_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_9_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_10_0,
      O => N30
    );
  nibbles_tickGenerator_tickGen_count_8 : X_FF
    generic map(
      LOC => "SLICE_X21Y22",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_8_CLK,
      I => nibbles_tickGenerator_tickGen_count_8_rstpot_272,
      O => nibbles_tickGenerator_tickGen_count(8),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_8_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X21Y22",
      INIT => X"FFFFDFFF00000000"
    )
    port map (
      ADR5 => nibbles_Result_8_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR0 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR4 => N30,
      O => nibbles_tickGenerator_tickGen_count_8_rstpot_272
    );
  nibbles_tickGenerator_tickGen_count_13 : X_FF
    generic map(
      LOC => "SLICE_X23Y23",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_13_CLK,
      I => nibbles_tickGenerator_tickGen_count_13_rstpot_394,
      O => nibbles_tickGenerator_tickGen_count(13),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_13_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y23",
      INIT => X"AAAAAAAAAA2AAAAA"
    )
    port map (
      ADR0 => nibbles_Result_13_0,
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR2 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR3 => N30,
      O => nibbles_tickGenerator_tickGen_count_13_rstpot_394
    );
  nibbles_tickGenerator_tickGen_count_12 : X_FF
    generic map(
      LOC => "SLICE_X23Y23",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_12_CLK,
      I => nibbles_tickGenerator_tickGen_count_12_rstpot_388,
      O => nibbles_tickGenerator_tickGen_count(12),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_12_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y23",
      INIT => X"CCCCCCCCCC4CCCCC"
    )
    port map (
      ADR1 => nibbles_Result_12_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR0 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR5 => N30,
      O => nibbles_tickGenerator_tickGen_count_12_rstpot_388
    );
  nibbles_tickGenerator_tickGen_count_11 : X_FF
    generic map(
      LOC => "SLICE_X23Y23",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_11_CLK,
      I => nibbles_tickGenerator_tickGen_count_11_rstpot_405,
      O => nibbles_tickGenerator_tickGen_count(11),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_11_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y23",
      INIT => X"AAAA8AAAAAAAAAAA"
    )
    port map (
      ADR0 => nibbles_Result_11_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR5 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR4 => N30,
      O => nibbles_tickGenerator_tickGen_count_11_rstpot_405
    );
  nibbles_segments_cs_5 : X_SFF
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_segments_cs_5_CLK,
      I => nibbles_Mram_siebenSegOut_segments_v5,
      O => nibbles_segments_cs(5),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_Mram_siebenSegOut_segments_v51 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => X"F0FF0FF0F0000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR5 => nibbles_siebenSegOut_nibVal_v(2),
      ADR3 => nibbles_siebenSegOut_nibVal_v(0),
      ADR4 => nibbles_siebenSegOut_nibVal_v(1),
      ADR2 => nibbles_siebenSegOut_nibVal_v(3),
      O => nibbles_Mram_siebenSegOut_segments_v5
    );
  nibbles_segments_cs_4 : X_SFF
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_segments_cs_4_CLK,
      I => nibbles_Mram_siebenSegOut_segments_v4,
      O => nibbles_segments_cs(4),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_Mram_siebenSegOut_segments_v41 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => X"F0000000F0F00F00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR5 => nibbles_siebenSegOut_nibVal_v(0),
      ADR3 => nibbles_siebenSegOut_nibVal_v(1),
      ADR4 => nibbles_siebenSegOut_nibVal_v(2),
      ADR2 => nibbles_siebenSegOut_nibVal_v(3),
      O => nibbles_Mram_siebenSegOut_segments_v4
    );
  nibbles_segments_cs_3 : X_SFF
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_segments_cs_3_CLK,
      I => nibbles_Mram_siebenSegOut_segments_v3,
      O => nibbles_segments_cs(3),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_Mram_siebenSegOut_segments_v31 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => X"F00000F0F00F0F00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => nibbles_siebenSegOut_nibVal_v(1),
      ADR3 => nibbles_siebenSegOut_nibVal_v(2),
      ADR4 => nibbles_siebenSegOut_nibVal_v(0),
      ADR5 => nibbles_siebenSegOut_nibVal_v(3),
      O => nibbles_Mram_siebenSegOut_segments_v3
    );
  nibbles_segments_cs_2 : X_SFF
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_segments_cs_2_CLK,
      I => nibbles_Mram_siebenSegOut_segments_v2,
      O => nibbles_segments_cs(2),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_Mram_siebenSegOut_segments_v21 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y11",
      INIT => X"3333003333FF0000"
    )
    port map (
      ADR0 => '1',
      ADR2 => '1',
      ADR4 => nibbles_siebenSegOut_nibVal_v(0),
      ADR3 => nibbles_siebenSegOut_nibVal_v(1),
      ADR5 => nibbles_siebenSegOut_nibVal_v(2),
      ADR1 => nibbles_siebenSegOut_nibVal_v(3),
      O => nibbles_Mram_siebenSegOut_segments_v2
    );
  nibbles_ledOut_cs_6_nibbles_ledOut_cs_6_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(7),
      O => nibbles_ledOut_cs_7_0
    );
  nibbles_ledOut_cs_6_nibbles_ledOut_cs_6_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(5),
      O => nibbles_ledOut_cs_5_0
    );
  nibbles_ledOut_cs_6 : X_SFF
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_6_CLK,
      I => nibbles_ledOutProc_ledOut_v(6),
      O => nibbles_ledOut_cs(6),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_ledOutProc_ledOut_v71 : X_LUT6
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => X"0000FF000000FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => nibbles_id_cs(0),
      ADR3 => nibbles_id_cs(1),
      ADR5 => '1',
      O => nibbles_ledOutProc_ledOut_v(6)
    );
  nibbles_Mmux_ledOutProc_ledOut_v81 : X_LUT5
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => X"FF000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => nibbles_id_cs(0),
      ADR3 => nibbles_id_cs(1),
      O => nibbles_ledOutProc_ledOut_v(7)
    );
  nibbles_ledOut_cs_7 : X_SFF
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_7_CLK,
      I => nibbles_ledOutProc_ledOut_v(7),
      O => nibbles_ledOut_cs(7),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_ledOut_cs_4 : X_SFF
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_4_CLK,
      I => nibbles_ledOutProc_ledOut_v(4),
      O => nibbles_ledOut_cs(4),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_ledOutProc_ledOut_v51 : X_LUT6
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => X"0000333300003333"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR4 => nibbles_id_cs(1),
      ADR1 => nibbles_id_cs(0),
      ADR5 => '1',
      O => nibbles_ledOutProc_ledOut_v(4)
    );
  nibbles_Mmux_ledOutProc_ledOut_v61 : X_LUT5
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => X"0000CCCC"
    )
    port map (
      ADR0 => '1',
      ADR3 => '1',
      ADR2 => '1',
      ADR4 => nibbles_id_cs(1),
      ADR1 => nibbles_id_cs(0),
      O => nibbles_ledOutProc_ledOut_v(5)
    );
  nibbles_ledOut_cs_5 : X_SFF
    generic map(
      LOC => "SLICE_X22Y63",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_5_CLK,
      I => nibbles_ledOutProc_ledOut_v(5),
      O => nibbles_ledOut_cs(5),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_2 : X_LUT6
    generic map(
      LOC => "SLICE_X21Y21",
      INIT => X"000000A0000000A0"
    )
    port map (
      ADR5 => '1',
      ADR1 => '1',
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_6_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_7_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_8_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_9_0,
      O => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_1_819
    );
  nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_1 : X_LUT6
    generic map(
      LOC => "SLICE_X21Y21",
      INIT => X"0000000000000200"
    )
    port map (
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_0_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_1_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_2_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_3_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_4_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_5_0,
      O => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q
    );
  nibbles_tickGenerator_tickGen_tick_v : X_FF
    generic map(
      LOC => "SLICE_X21Y21",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_tick_v_CLK,
      I => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o,
      O => nibbles_tickGenerator_tickGen_tick_v_816,
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_3 : X_LUT6
    generic map(
      LOC => "SLICE_X21Y21",
      INIT => X"0000000040000000"
    )
    port map (
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_10_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR1 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_1_819,
      ADR4 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      O => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o
    );
  nibbles_tickGenerator_tickGen_count_3 : X_FF
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_3_CLK,
      I => nibbles_tickGenerator_tickGen_count_3_rstpot_328,
      O => nibbles_tickGenerator_tickGen_count(3),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_3_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => X"FF00DF00FF00FF00"
    )
    port map (
      ADR3 => nibbles_Result_3_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR2 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR1 => N30,
      O => nibbles_tickGenerator_tickGen_count_3_rstpot_328
    );
  nibbles_tickGenerator_tickGen_count_2 : X_FF
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_2_CLK,
      I => nibbles_tickGenerator_tickGen_count_2_rstpot_320,
      O => nibbles_tickGenerator_tickGen_count(2),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_2_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => X"F0D0F0F0F0F0F0F0"
    )
    port map (
      ADR2 => nibbles_Result_2_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR0 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR3 => N30,
      O => nibbles_tickGenerator_tickGen_count_2_rstpot_320
    );
  nibbles_tickGenerator_tickGen_count_1 : X_FF
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_1_CLK,
      I => nibbles_tickGenerator_tickGen_count_1_rstpot_318,
      O => nibbles_tickGenerator_tickGen_count(1),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_1_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => X"F0F0F0F0F0F070F0"
    )
    port map (
      ADR2 => nibbles_Result_1_0,
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR0 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR4 => N30,
      O => nibbles_tickGenerator_tickGen_count_1_rstpot_318
    );
  nibbles_tickGenerator_tickGen_count_0 : X_FF
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_0_CLK,
      I => nibbles_tickGenerator_tickGen_count_0_rstpot_337,
      O => nibbles_tickGenerator_tickGen_count(0),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_0_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y20",
      INIT => X"FFFFDFFF00000000"
    )
    port map (
      ADR5 => nibbles_Result_0_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR3 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR0 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR4 => N30,
      O => nibbles_tickGenerator_tickGen_count_0_rstpot_337
    );
  nibbles_tickGenerator_tickGen_count_7 : X_FF
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_7_CLK,
      I => nibbles_tickGenerator_tickGen_count_7_rstpot_361,
      O => nibbles_tickGenerator_tickGen_count(7),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_7_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => X"FFBFFFFF00000000"
    )
    port map (
      ADR5 => nibbles_Result_7_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR4 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR3 => N30,
      O => nibbles_tickGenerator_tickGen_count_7_rstpot_361
    );
  nibbles_tickGenerator_tickGen_count_6 : X_FF
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_6_CLK,
      I => nibbles_tickGenerator_tickGen_count_6_rstpot_353,
      O => nibbles_tickGenerator_tickGen_count(6),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_6_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => X"F0F0F070F0F0F0F0"
    )
    port map (
      ADR2 => nibbles_Result_6_0,
      ADR4 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR5 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR3 => N30,
      O => nibbles_tickGenerator_tickGen_count_6_rstpot_353
    );
  nibbles_tickGenerator_tickGen_count_5 : X_FF
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_5_CLK,
      I => nibbles_tickGenerator_tickGen_count_5_rstpot_351,
      O => nibbles_tickGenerator_tickGen_count(5),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_5_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => X"F0F0B0F0F0F0F0F0"
    )
    port map (
      ADR2 => nibbles_Result_5_0,
      ADR0 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR3 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR4 => N30,
      O => nibbles_tickGenerator_tickGen_count_5_rstpot_351
    );
  nibbles_tickGenerator_tickGen_count_4 : X_FF
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_4_CLK,
      I => nibbles_tickGenerator_tickGen_count_4_rstpot_370,
      O => nibbles_tickGenerator_tickGen_count(4),
      RST => GND,
      SET => GND
    );
  nibbles_tickGenerator_tickGen_count_4_rstpot : X_LUT6
    generic map(
      LOC => "SLICE_X23Y21",
      INIT => X"EFFF0000FFFF0000"
    )
    port map (
      ADR4 => nibbles_Result_4_0,
      ADR1 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0,
      ADR2 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0,
      ADR5 => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0,
      ADR3 => nibbles_tickGenerator_PWR_5_o_tickGen_count_13_equal_2_o_13_Q,
      ADR0 => N30,
      O => nibbles_tickGenerator_tickGen_count_4_rstpot_370
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_1_11 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y23",
      INIT => X"6828480860204000"
    )
    port map (
      ADR2 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR4 => nibbles_nibbleValues_cs(13),
      ADR3 => nibbles_nibbleValues_cs(9),
      ADR5 => nibbles_nibbleValues_cs(5),
      O => nibbles_Mmux_siebenSegOut_nibVal_v_1_1
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_1_12 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y23",
      INIT => X"F8F0F0F008000000"
    )
    port map (
      ADR2 => nibbles_shiftRegister_shiftRegister_cs(0),
      ADR4 => nibbles_nibbleValues_cs(1),
      ADR3 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR5 => nibbles_Mmux_siebenSegOut_nibVal_v_1_1,
      O => nibbles_siebenSegOut_nibVal_v(1)
    );
  nibbles_segments_cs_6 : X_SFF
    generic map(
      LOC => "SLICE_X26Y23",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_segments_cs_6_CLK,
      I => nibbles_Mram_siebenSegOut_segments_v6,
      O => nibbles_segments_cs(6),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_Mram_siebenSegOut_segments_v61 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y23",
      INIT => X"00CC0033CC0000CC"
    )
    port map (
      ADR0 => '1',
      ADR2 => '1',
      ADR1 => nibbles_siebenSegOut_nibVal_v(0),
      ADR3 => nibbles_siebenSegOut_nibVal_v(1),
      ADR5 => nibbles_siebenSegOut_nibVal_v(2),
      ADR4 => nibbles_siebenSegOut_nibVal_v(3),
      O => nibbles_Mram_siebenSegOut_segments_v6
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_3_12 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y23",
      INIT => X"FF80FF0000800000"
    )
    port map (
      ADR3 => nibbles_shiftRegister_shiftRegister_cs(0),
      ADR4 => nibbles_nibbleValues_cs(3),
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR2 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR5 => nibbles_Mmux_siebenSegOut_nibVal_v_3_1,
      O => nibbles_siebenSegOut_nibVal_v(3)
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_2_11 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y39",
      INIT => X"6828602048084000"
    )
    port map (
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR2 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR3 => nibbles_nibbleValues_cs(14),
      ADR4 => nibbles_nibbleValues_cs(10),
      ADR5 => nibbles_nibbleValues_cs(6),
      O => nibbles_Mmux_siebenSegOut_nibVal_v_2_1
    );
  nibbles_nibbleValues_cs_15_nibbles_nibbleValues_cs_15_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_11_pack_13,
      O => nibbles_nibbleValues_cs(11)
    );
  nibbles_nibbleValues_cs_15_nibbles_nibbleValues_cs_15_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_2_pack_11,
      O => nibbles_nibbleValues_cs(2)
    );
  nibbles_nibbleValues_cs_15_nibbles_nibbleValues_cs_15_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_1_pack_9,
      O => nibbles_nibbleValues_cs(1)
    );
  nibbles_nibbleValues_cs_15_nibbles_nibbleValues_cs_15_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_0_pack_7,
      O => nibbles_nibbleValues_cs(0)
    );
  nibbles_nibbleValues_cs_15 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_15_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_15_Q,
      O => nibbles_nibbleValues_cs(15),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT71 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"CFC0FF00CFC0FF00"
    )
    port map (
      ADR0 => '1',
      ADR2 => nibbles_id_cs(0),
      ADR4 => nibbles_id_cs(1),
      ADR3 => nibbles_nibbleValues_cs(15),
      ADR1 => nibbles_value_cs(3),
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_15_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT31 : X_LUT5
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"ACACAAAA"
    )
    port map (
      ADR0 => nibbles_nibbleValues_cs(11),
      ADR2 => nibbles_id_cs(0),
      ADR4 => nibbles_id_cs(1),
      ADR3 => '1',
      ADR1 => nibbles_value_cs(3),
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_11_Q
    );
  nibbles_nibbleValues_cs_11 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_11_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_11_Q,
      O => nibbles_nibbleValues_cs_11_pack_13,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_nibbleValues_cs_14 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_14_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_14_Q,
      O => nibbles_nibbleValues_cs(14),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT61 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"CFFFC000CFFFC000"
    )
    port map (
      ADR0 => '1',
      ADR2 => nibbles_id_cs(0),
      ADR3 => nibbles_id_cs(1),
      ADR4 => nibbles_nibbleValues_cs(14),
      ADR1 => nibbles_value_cs_2_0,
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_14_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT91 : X_LUT5
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"AAACAAAC"
    )
    port map (
      ADR0 => nibbles_nibbleValues_cs(2),
      ADR2 => nibbles_id_cs(0),
      ADR3 => nibbles_id_cs(1),
      ADR4 => '1',
      ADR1 => nibbles_value_cs_2_0,
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_2_Q
    );
  nibbles_nibbleValues_cs_2 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_2_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_2_Q,
      O => nibbles_nibbleValues_cs_2_pack_11,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_nibbleValues_cs_13 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_13_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_13_Q,
      O => nibbles_nibbleValues_cs(13),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT51 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"FC30F0F0FC30F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => nibbles_id_cs(0),
      ADR4 => nibbles_id_cs(1),
      ADR2 => nibbles_nibbleValues_cs(13),
      ADR3 => nibbles_value_cs(1),
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_13_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT81 : X_LUT5
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"AAAABB88"
    )
    port map (
      ADR0 => nibbles_nibbleValues_cs(1),
      ADR1 => nibbles_id_cs(0),
      ADR4 => nibbles_id_cs(1),
      ADR2 => '1',
      ADR3 => nibbles_value_cs(1),
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_1_Q
    );
  nibbles_nibbleValues_cs_1 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_1_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_1_Q,
      O => nibbles_nibbleValues_cs_1_pack_9,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_nibbleValues_cs_12 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_12_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_12_Q,
      O => nibbles_nibbleValues_cs(12),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT41 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"F3C0FF00F3C0FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => nibbles_id_cs(0),
      ADR4 => nibbles_id_cs(1),
      ADR3 => nibbles_nibbleValues_cs(12),
      ADR2 => nibbles_value_cs_0_0,
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_12_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT17 : X_LUT5
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => X"AAAAB8B8"
    )
    port map (
      ADR0 => nibbles_nibbleValues_cs(0),
      ADR1 => nibbles_id_cs(0),
      ADR4 => nibbles_id_cs(1),
      ADR3 => '1',
      ADR2 => nibbles_value_cs_0_0,
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_0_Q
    );
  nibbles_nibbleValues_cs_0 : X_SFF
    generic map(
      LOC => "SLICE_X26Y41",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_0_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_0_Q,
      O => nibbles_nibbleValues_cs_0_pack_7,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_3_11 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y40",
      INIT => X"6288620040884000"
    )
    port map (
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR3 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR2 => nibbles_nibbleValues_cs(15),
      ADR4 => nibbles_nibbleValues_cs(11),
      ADR5 => nibbles_nibbleValues_cs(7),
      O => nibbles_Mmux_siebenSegOut_nibVal_v_3_1
    );
  nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_0
    );
  nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X20Y23"
    )
    port map (
      CI => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_Q_780,
      CYINIT => '0',
      CO(3) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_3_UNCONNECTED,
      CO(2) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_CO_0_UNCONNECTED,
      DI(3) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_DI_3_UNCONNECTED,
      DI(2) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_DI_2_UNCONNECTED,
      DI(1) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_DI_1_UNCONNECTED,
      DI(0) => '0',
      O(3) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_O_3_UNCONNECTED,
      O(2) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_O_2_UNCONNECTED,
      O(1) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_13_Q,
      O(0) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_12_Q,
      S(3) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_S_3_UNCONNECTED,
      S(2) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_xor_13_S_2_UNCONNECTED,
      S(1) => nibbles_tickGenerator_tickGen_count_13_rt_145,
      S(0) => nibbles_tickGenerator_tickGen_count_12_rt_143
    );
  nibbles_tickGenerator_tickGen_count_13_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y23",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR5 => '1',
      ADR3 => '1',
      ADR4 => '1',
      ADR2 => nibbles_tickGenerator_tickGen_count(13),
      O => nibbles_tickGenerator_tickGen_count_13_rt_145
    );
  nibbles_tickGenerator_tickGen_count_12_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y23",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => nibbles_tickGenerator_tickGen_count(12),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_12_rt_143
    );
  N0_15_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y23",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_15_A5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_10_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_10_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_9_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_9_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_8_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_8_0
    );
  nibbles_tickGenerator_tickGen_count_11_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR3 => nibbles_tickGenerator_tickGen_count(11),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_11_rt_124
    );
  N0_16_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_16_D5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X20Y22"
    )
    port map (
      CI => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_Q_775,
      CYINIT => '0',
      CO(3) => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_Q_780,
      CO(2) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_11_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_11_Q,
      O(2) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_10_Q,
      O(1) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_9_Q,
      O(0) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_8_Q,
      S(3) => nibbles_tickGenerator_tickGen_count_11_rt_124,
      S(2) => nibbles_tickGenerator_tickGen_count_10_rt_129,
      S(1) => nibbles_tickGenerator_tickGen_count_9_rt_128,
      S(0) => nibbles_tickGenerator_tickGen_count_8_rt_133
    );
  nibbles_tickGenerator_tickGen_count_10_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => nibbles_tickGenerator_tickGen_count(10),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_10_rt_129
    );
  N0_17_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_17_C5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_9_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR3 => nibbles_tickGenerator_tickGen_count(9),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_9_rt_128
    );
  N0_18_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_18_B5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_8_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(8),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_8_rt_133
    );
  N0_19_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_19_A5LUT_O_UNCONNECTED
    );
  clk_BUFGP_IBUFG : X_BUF
    generic map(
      LOC => "PAD156",
      PATHPULSE => 115 ps
    )
    port map (
      O => clk_BUFGP_IBUFG_150,
      I => clk
    );
  ProtoComp10_IMUX : X_BUF
    generic map(
      LOC => "PAD156",
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP_IBUFG_150,
      O => clk_BUFGP_IBUFG_0
    );
  valLd_IBUF : X_BUF
    generic map(
      LOC => "PAD57",
      PATHPULSE => 115 ps
    )
    port map (
      O => valLd_IBUF_153,
      I => valLd
    );
  ProtoComp10_IMUX_1 : X_BUF
    generic map(
      LOC => "PAD57",
      PATHPULSE => 115 ps
    )
    port map (
      I => valLd_IBUF_153,
      O => valLd_IBUF_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_7_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_7_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_6_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_6_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_5_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_5_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_4_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_4_0
    );
  nibbles_tickGenerator_tickGen_count_7_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => '1',
      ADR3 => '1',
      ADR2 => nibbles_tickGenerator_tickGen_count(7),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_7_rt_102
    );
  N0_20_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_20_D5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X20Y21"
    )
    port map (
      CI => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_Q_770,
      CYINIT => '0',
      CO(3) => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_Q_775,
      CO(2) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_7_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_7_Q,
      O(2) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_6_Q,
      O(1) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_5_Q,
      O(0) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_4_Q,
      S(3) => nibbles_tickGenerator_tickGen_count_7_rt_102,
      S(2) => nibbles_tickGenerator_tickGen_count_6_rt_107,
      S(1) => nibbles_tickGenerator_tickGen_count_5_rt_106,
      S(0) => nibbles_tickGenerator_tickGen_count_4_rt_111
    );
  nibbles_tickGenerator_tickGen_count_6_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(6),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_6_rt_107
    );
  N0_21_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_21_C5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_5_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR4 => '1',
      ADR3 => nibbles_tickGenerator_tickGen_count(5),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_5_rt_106
    );
  N0_22_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_22_B5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_4_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => '1',
      ADR3 => '1',
      ADR2 => nibbles_tickGenerator_tickGen_count(4),
      ADR5 => '1',
      O => nibbles_tickGenerator_tickGen_count_4_rt_111
    );
  N0_23_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_23_A5LUT_O_UNCONNECTED
    );
  segments_1_OBUF : X_OBUF
    generic map(
      LOC => "PAD152"
    )
    port map (
      I => NlwBufferSignal_segments_1_OBUF_I,
      O => segments(1)
    );
  nres_IBUF : X_BUF
    generic map(
      LOC => "PAD136",
      PATHPULSE => 115 ps
    )
    port map (
      O => nibbles_nres_inv_non_inverted,
      I => nres
    );
  ProtoComp11_IMUX : X_BUF
    generic map(
      LOC => "PAD136",
      PATHPULSE => 115 ps
    )
    port map (
      I => ProtoComp11_IINV_OUT,
      O => nibbles_nres_inv
    );
  ProtoComp11_IINV : X_INV
    generic map(
      LOC => "PAD136",
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nres_inv_non_inverted,
      O => ProtoComp11_IINV_OUT
    );
  segments_3_OBUF : X_OBUF
    generic map(
      LOC => "PAD138"
    )
    port map (
      I => NlwBufferSignal_segments_3_OBUF_I,
      O => segments(3)
    );
  segments_2_OBUF : X_OBUF
    generic map(
      LOC => "PAD151"
    )
    port map (
      I => NlwBufferSignal_segments_2_OBUF_I,
      O => segments(2)
    );
  valueIn_1_IBUF : X_BUF
    generic map(
      LOC => "PAD66",
      PATHPULSE => 115 ps
    )
    port map (
      O => valueIn_1_IBUF_159,
      I => valueIn(1)
    );
  ProtoComp10_IMUX_3 : X_BUF
    generic map(
      LOC => "PAD66",
      PATHPULSE => 115 ps
    )
    port map (
      I => valueIn_1_IBUF_159,
      O => valueIn_1_IBUF_0
    );
  valueIn_2_IBUF : X_BUF
    generic map(
      LOC => "PAD61",
      PATHPULSE => 115 ps
    )
    port map (
      O => valueIn_2_IBUF_162,
      I => valueIn(2)
    );
  ProtoComp10_IMUX_4 : X_BUF
    generic map(
      LOC => "PAD61",
      PATHPULSE => 115 ps
    )
    port map (
      I => valueIn_2_IBUF_162,
      O => valueIn_2_IBUF_0
    );
  valueIn_0_IBUF : X_BUF
    generic map(
      LOC => "PAD65",
      PATHPULSE => 115 ps
    )
    port map (
      O => valueIn_0_IBUF_156,
      I => valueIn(0)
    );
  ProtoComp10_IMUX_2 : X_BUF
    generic map(
      LOC => "PAD65",
      PATHPULSE => 115 ps
    )
    port map (
      I => valueIn_0_IBUF_156,
      O => valueIn_0_IBUF_0
    );
  valueIn_3_IBUF : X_BUF
    generic map(
      LOC => "PAD62",
      PATHPULSE => 115 ps
    )
    port map (
      O => valueIn_3_IBUF_165,
      I => valueIn(3)
    );
  ProtoComp10_IMUX_5 : X_BUF
    generic map(
      LOC => "PAD62",
      PATHPULSE => 115 ps
    )
    port map (
      I => valueIn_3_IBUF_165,
      O => valueIn_3_IBUF_0
    );
  segments_0_OBUF : X_OBUF
    generic map(
      LOC => "PAD141"
    )
    port map (
      I => NlwBufferSignal_segments_0_OBUF_I,
      O => segments(0)
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(11),
      O => nibbles_Result_11_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(10),
      O => nibbles_Result_10_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(9),
      O => nibbles_Result_9_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(8),
      O => nibbles_Result_8_0
    );
  nibbles_tickGenerator_tickGen_count_11_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => nibbles_tickGenerator_tickGen_count(11),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_11_rt
    );
  N0_2_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_2_D5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_11_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X22Y22"
    )
    port map (
      CI => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_Q_751,
      CYINIT => '0',
      CO(3) => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_Q_760,
      CO(2) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_11_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => nibbles_Result(11),
      O(2) => nibbles_Result(10),
      O(1) => nibbles_Result(9),
      O(0) => nibbles_Result(8),
      S(3) => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_11_rt,
      S(2) => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_10_rt,
      S(1) => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_9_rt,
      S(0) => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_8_rt
    );
  nibbles_tickGenerator_tickGen_count_10_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => '1',
      ADR3 => '1',
      ADR2 => nibbles_tickGenerator_tickGen_count(10),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_10_rt
    );
  N0_3_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_3_C5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_9_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"F0F0F0F0F0F0F0F0"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR4 => '1',
      ADR3 => '1',
      ADR2 => nibbles_tickGenerator_tickGen_count(9),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_9_rt
    );
  N0_4_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_4_B5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_8_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => nibbles_tickGenerator_tickGen_count(8),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_nibbles_tickGenerator_tickGen_count_8_rt
    );
  N0_5_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y22",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_5_A5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_DMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_3_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_3_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_CMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_2_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_2_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_BMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_1_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_1_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_AMUX_Delay : 
X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_0_Q,
      O => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_0_0
    );
  nibbles_tickGenerator_tickGen_count_3_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(3),
      ADR5 => '1',
      O => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_3_rt
    );
  N0_24_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_24_D5LUT_O_UNCONNECTED
    );
  ProtoComp7_CYINITGND_1 : X_ZERO
    generic map(
      LOC => "SLICE_X20Y20"
    )
    port map (
      O => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_ProtoComp7_CYINITGND_0
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X20Y20"
    )
    port map (
      CI => '0',
      CYINIT => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_ProtoComp7_CYINITGND_0,
      CO(3) => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_Q_770,
      CO(2) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_3_Q,
      O(2) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_2_Q,
      O(1) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_1_Q,
      O(0) => nibbles_tickGenerator_tickGen_count_13_GND_5_o_add_0_OUT_0_Q,
      S(3) => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_3_rt,
      S(2) => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_2_rt,
      S(1) => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_1_rt,
      S(0) => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_lut_0_Q
    );
  nibbles_tickGenerator_tickGen_count_2_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(2),
      ADR5 => '1',
      O => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_2_rt
    );
  N0_25_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_25_C5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_1_rt_1 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(1),
      ADR5 => '1',
      O => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_cy_3_nibbles_tickGenerator_tickGen_count_1_rt
    );
  N0_26_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_26_B5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_lut_0_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"3333333333333333"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(0),
      ADR5 => '1',
      O => nibbles_tickGenerator_Madd_tickGen_count_13_GND_5_o_add_0_OUT_lut_0_Q
    );
  segments_7_OBUF_1_2_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X20Y20",
      INIT => X"FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_segments_7_OBUF_1_2_A5LUT_O_UNCONNECTED
    );
  nibbles_Result_13_nibbles_Result_13_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(13),
      O => nibbles_Result_13_0
    );
  nibbles_Result_13_nibbles_Result_13_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(12),
      O => nibbles_Result_12_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_xor_13_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X22Y23"
    )
    port map (
      CI => nibbles_tickGenerator_Mcount_tickGen_count_cy_11_Q_760,
      CYINIT => '0',
      CO(3) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_3_UNCONNECTED,
      CO(2) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_CO_0_UNCONNECTED,
      DI(3) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_DI_3_UNCONNECTED,
      DI(2) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_DI_2_UNCONNECTED,
      DI(1) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_DI_1_UNCONNECTED,
      DI(0) => '0',
      O(3) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_O_3_UNCONNECTED,
      O(2) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_O_2_UNCONNECTED,
      O(1) => nibbles_Result(13),
      O(0) => nibbles_Result(12),
      S(3) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_S_3_UNCONNECTED,
      S(2) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_xor_13_S_2_UNCONNECTED,
      S(1) => nibbles_Result_13_nibbles_tickGenerator_tickGen_count_13_rt,
      S(0) => nibbles_Result_13_nibbles_tickGenerator_tickGen_count_12_rt
    );
  nibbles_tickGenerator_tickGen_count_13_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y23",
      INIT => X"FF00FF00FF00FF00"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR5 => '1',
      ADR4 => '1',
      ADR3 => nibbles_tickGenerator_tickGen_count(13),
      O => nibbles_Result_13_nibbles_tickGenerator_tickGen_count_13_rt
    );
  nibbles_tickGenerator_tickGen_count_12_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y23",
      INIT => X"FFFF0000FFFF0000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => nibbles_tickGenerator_tickGen_count(12),
      ADR5 => '1',
      O => nibbles_Result_13_nibbles_tickGenerator_tickGen_count_12_rt
    );
  N0_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y23",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_A5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(7),
      O => nibbles_Result_7_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(6),
      O => nibbles_Result_6_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(5),
      O => nibbles_Result_5_0
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_Result(4),
      O => nibbles_Result_4_0
    );
  nibbles_tickGenerator_tickGen_count_7_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(7),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_7_rt
    );
  N0_6_D5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_6_D5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_Mcount_tickGen_count_cy_7_Q : X_CARRY4
    generic map(
      LOC => "SLICE_X22Y21"
    )
    port map (
      CI => nibbles_tickGenerator_Mcount_tickGen_count_cy_3_Q_742,
      CYINIT => '0',
      CO(3) => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_Q_751,
      CO(2) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_CO_2_UNCONNECTED,
      CO(1) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_CO_1_UNCONNECTED,
      CO(0) => NLW_nibbles_tickGenerator_Mcount_tickGen_count_cy_7_CO_0_UNCONNECTED,
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => nibbles_Result(7),
      O(2) => nibbles_Result(6),
      O(1) => nibbles_Result(5),
      O(0) => nibbles_Result(4),
      S(3) => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_7_rt,
      S(2) => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_6_rt,
      S(1) => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_5_rt,
      S(0) => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_4_rt
    );
  nibbles_tickGenerator_tickGen_count_6_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"AAAAAAAAAAAAAAAA"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => nibbles_tickGenerator_tickGen_count(6),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_6_rt
    );
  N0_7_C5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_7_C5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_5_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"AAAAAAAAAAAAAAAA"
    )
    port map (
      ADR4 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR0 => nibbles_tickGenerator_tickGen_count(5),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_5_rt
    );
  N0_8_B5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_8_B5LUT_O_UNCONNECTED
    );
  nibbles_tickGenerator_tickGen_count_4_rt : X_LUT6
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"CCCCCCCCCCCCCCCC"
    )
    port map (
      ADR0 => '1',
      ADR4 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR1 => nibbles_tickGenerator_tickGen_count(4),
      ADR5 => '1',
      O => nibbles_tickGenerator_Mcount_tickGen_count_cy_7_nibbles_tickGenerator_tickGen_count_4_rt
    );
  N0_9_A5LUT : X_LUT5
    generic map(
      LOC => "SLICE_X22Y21",
      INIT => X"00000000"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR3 => '1',
      ADR4 => '1',
      O => NLW_N0_9_A5LUT_O_UNCONNECTED
    );
  nibbles_valLd_cs : X_SFF
    generic map(
      LOC => "SLICE_X32Y60",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_valLd_cs_CLK,
      I => NlwBufferSignal_nibbles_valLd_cs_IN,
      O => nibbles_valLd_cs_821,
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_valLd_cs_inv1_INV_0 : X_LUT6
    generic map(
      LOC => "SLICE_X32Y60",
      INIT => X"00000000FFFFFFFF"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR5 => nibbles_valLd_cs_821,
      ADR4 => '1',
      ADR3 => '1',
      O => nibbles_valLd_cs_inv
    );
  nibbles_nibbleValues_cs_6_nibbles_nibbleValues_cs_6_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_10_pack_13,
      O => nibbles_nibbleValues_cs(10)
    );
  nibbles_nibbleValues_cs_6_nibbles_nibbleValues_cs_6_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_9_pack_11,
      O => nibbles_nibbleValues_cs(9)
    );
  nibbles_nibbleValues_cs_6_nibbles_nibbleValues_cs_6_BMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_8_pack_9,
      O => nibbles_nibbleValues_cs(8)
    );
  nibbles_nibbleValues_cs_6_nibbles_nibbleValues_cs_6_AMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_nibbleValues_cs_7_pack_7,
      O => nibbles_nibbleValues_cs(7)
    );
  nibbles_nibbleValues_cs_6 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_6_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_6_Q,
      O => nibbles_nibbleValues_cs(6),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT131 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"FFF50A00FFF50A00"
    )
    port map (
      ADR1 => '1',
      ADR2 => nibbles_id_cs(1),
      ADR0 => nibbles_id_cs(0),
      ADR4 => nibbles_nibbleValues_cs(6),
      ADR3 => nibbles_value_cs_2_0,
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_6_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT21 : X_LUT5
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"DC8CDC8C"
    )
    port map (
      ADR1 => nibbles_nibbleValues_cs(10),
      ADR2 => nibbles_id_cs(1),
      ADR0 => nibbles_id_cs(0),
      ADR4 => '1',
      ADR3 => nibbles_value_cs_2_0,
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_10_Q
    );
  nibbles_nibbleValues_cs_10 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_10_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_10_Q,
      O => nibbles_nibbleValues_cs_10_pack_13,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_nibbleValues_cs_5 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_5_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_5_Q,
      O => nibbles_nibbleValues_cs(5),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT121 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"FFF500A0FFF500A0"
    )
    port map (
      ADR1 => '1',
      ADR3 => nibbles_id_cs(1),
      ADR0 => nibbles_id_cs(0),
      ADR4 => nibbles_nibbleValues_cs(5),
      ADR2 => nibbles_value_cs(1),
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_5_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT161 : X_LUT5
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"D8CCD8CC"
    )
    port map (
      ADR1 => nibbles_nibbleValues_cs(9),
      ADR3 => nibbles_id_cs(1),
      ADR0 => nibbles_id_cs(0),
      ADR4 => '1',
      ADR2 => nibbles_value_cs(1),
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_9_Q
    );
  nibbles_nibbleValues_cs_9 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_9_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_9_Q,
      O => nibbles_nibbleValues_cs_9_pack_11,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_nibbleValues_cs_4 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_4_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_4_Q,
      O => nibbles_nibbleValues_cs(4),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT111 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"FFAF00A0FFAF00A0"
    )
    port map (
      ADR1 => '1',
      ADR3 => nibbles_id_cs(1),
      ADR2 => nibbles_id_cs(0),
      ADR4 => nibbles_nibbleValues_cs(4),
      ADR0 => nibbles_value_cs_0_0,
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_4_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT151 : X_LUT5
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"CACCCACC"
    )
    port map (
      ADR1 => nibbles_nibbleValues_cs(8),
      ADR3 => nibbles_id_cs(1),
      ADR2 => nibbles_id_cs(0),
      ADR4 => '1',
      ADR0 => nibbles_value_cs_0_0,
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_8_Q
    );
  nibbles_nibbleValues_cs_8 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_8_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_8_Q,
      O => nibbles_nibbleValues_cs_8_pack_9,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_nibbleValues_cs_3 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_3_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_3_Q,
      O => nibbles_nibbleValues_cs(3),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT101 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"FFFA0500FFFA0500"
    )
    port map (
      ADR1 => '1',
      ADR0 => nibbles_id_cs(0),
      ADR2 => nibbles_id_cs(1),
      ADR4 => nibbles_nibbleValues_cs(3),
      ADR3 => nibbles_value_cs(3),
      ADR5 => '1',
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_3_Q
    );
  nibbles_Mmux_id_cs_1_value_cs_3_wide_mux_18_OUT141 : X_LUT5
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => X"CEC4CEC4"
    )
    port map (
      ADR1 => nibbles_nibbleValues_cs(7),
      ADR0 => nibbles_id_cs(0),
      ADR2 => nibbles_id_cs(1),
      ADR4 => '1',
      ADR3 => nibbles_value_cs(3),
      O => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_7_Q
    );
  nibbles_nibbleValues_cs_7 : X_SFF
    generic map(
      LOC => "SLICE_X27Y42",
      INIT => '0'
    )
    port map (
      CE => nibbles_valLd_cs_inv,
      CLK => NlwBufferSignal_nibbles_nibbleValues_cs_7_CLK,
      I => nibbles_id_cs_1_value_cs_3_wide_mux_18_OUT_7_Q,
      O => nibbles_nibbleValues_cs_7_pack_7,
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_segments_cs_1 : X_SFF
    generic map(
      LOC => "SLICE_X27Y23",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_segments_cs_1_CLK,
      I => nibbles_Mram_siebenSegOut_segments_v1,
      O => nibbles_segments_cs(1),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_Mram_siebenSegOut_segments_v111 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y23",
      INIT => X"6060323260603232"
    )
    port map (
      ADR3 => '1',
      ADR5 => '1',
      ADR1 => nibbles_siebenSegOut_nibVal_v(3),
      ADR0 => nibbles_siebenSegOut_nibVal_v(1),
      ADR2 => nibbles_siebenSegOut_nibVal_v(0),
      ADR4 => nibbles_siebenSegOut_nibVal_v(2),
      O => nibbles_Mram_siebenSegOut_segments_v1
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_2_12 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y23",
      INIT => X"ECCCCCCC20000000"
    )
    port map (
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(0),
      ADR3 => nibbles_nibbleValues_cs(2),
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR2 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR4 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR5 => nibbles_Mmux_siebenSegOut_nibVal_v_2_1,
      O => nibbles_siebenSegOut_nibVal_v(2)
    );
  nibbles_segments_cs_0 : X_SFF
    generic map(
      LOC => "SLICE_X27Y23",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_segments_cs_0_CLK,
      I => nibbles_Mram_siebenSegOut_segments_v,
      O => nibbles_segments_cs(0),
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  nibbles_Mram_siebenSegOut_segments_v11 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y23",
      INIT => X"2211221144114411"
    )
    port map (
      ADR2 => '1',
      ADR4 => '1',
      ADR0 => nibbles_siebenSegOut_nibVal_v(1),
      ADR3 => nibbles_siebenSegOut_nibVal_v(2),
      ADR1 => nibbles_siebenSegOut_nibVal_v(3),
      ADR5 => nibbles_siebenSegOut_nibVal_v(0),
      O => nibbles_Mram_siebenSegOut_segments_v
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_0_12 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y23",
      INIT => X"EAAAAAAA40000000"
    )
    port map (
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(0),
      ADR3 => nibbles_nibbleValues_cs(0),
      ADR4 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR2 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR5 => nibbles_Mmux_siebenSegOut_nibVal_v_0_1,
      O => nibbles_siebenSegOut_nibVal_v(0)
    );
  nibbles_id_cs_1 : X_FF
    generic map(
      LOC => "SLICE_X32Y61",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_id_cs_1_CLK,
      I => nibbles_id_cs_1_glue_set_656,
      O => nibbles_id_cs(1),
      RST => GND,
      SET => GND
    );
  nibbles_id_cs_1_glue_set : X_LUT6
    generic map(
      LOC => "SLICE_X32Y61",
      INIT => X"FFFFAAAAAFAFAFAF"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR0 => nibbles_nres_inv,
      ADR4 => nibbles_id_cs(1),
      ADR5 => nibbles_idLd_cs_814,
      ADR2 => id_1_IBUF_0,
      O => nibbles_id_cs_1_glue_set_656
    );
  nibbles_id_cs_0 : X_FF
    generic map(
      LOC => "SLICE_X32Y61",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_id_cs_0_CLK,
      I => nibbles_id_cs_0_glue_set_665,
      O => nibbles_id_cs(0),
      RST => GND,
      SET => GND
    );
  nibbles_id_cs_0_glue_set : X_LUT6
    generic map(
      LOC => "SLICE_X32Y61",
      INIT => X"FDFDFDFDF1F1F1F1"
    )
    port map (
      ADR4 => '1',
      ADR3 => '1',
      ADR2 => nibbles_nres_inv,
      ADR5 => nibbles_id_cs(0),
      ADR1 => nibbles_idLd_cs_814,
      ADR0 => id_0_IBUF_0,
      O => nibbles_id_cs_0_glue_set_665
    );
  nibbles_ledOut_cs_3 : X_SFF
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_3_CLK,
      I => nibbles_ledOutProc_ledOut_v(3),
      O => nibbles_ledOut_cs(3),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_ledOutProc_ledOut_v41 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => X"AAAAFF00CCCCF0F0"
    )
    port map (
      ADR4 => nibbles_id_cs(0),
      ADR5 => nibbles_id_cs(1),
      ADR1 => nibbles_nibbleValues_cs(7),
      ADR0 => nibbles_nibbleValues_cs(15),
      ADR3 => nibbles_nibbleValues_cs(11),
      ADR2 => nibbles_nibbleValues_cs(3),
      O => nibbles_ledOutProc_ledOut_v(3)
    );
  nibbles_ledOut_cs_2 : X_SFF
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_2_CLK,
      I => nibbles_ledOutProc_ledOut_v(2),
      O => nibbles_ledOut_cs(2),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_ledOutProc_ledOut_v31 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => X"FEF45E54AEA40E04"
    )
    port map (
      ADR0 => nibbles_id_cs(0),
      ADR2 => nibbles_id_cs(1),
      ADR3 => nibbles_nibbleValues_cs(6),
      ADR4 => nibbles_nibbleValues_cs(14),
      ADR5 => nibbles_nibbleValues_cs(10),
      ADR1 => nibbles_nibbleValues_cs(2),
      O => nibbles_ledOutProc_ledOut_v(2)
    );
  nibbles_ledOut_cs_1 : X_SFF
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_1_CLK,
      I => nibbles_ledOutProc_ledOut_v(1),
      O => nibbles_ledOut_cs(1),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_ledOutProc_ledOut_v21 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => X"FFF0CACA0F00CACA"
    )
    port map (
      ADR4 => nibbles_id_cs(0),
      ADR2 => nibbles_id_cs(1),
      ADR3 => nibbles_nibbleValues_cs(5),
      ADR5 => nibbles_nibbleValues_cs(13),
      ADR1 => nibbles_nibbleValues_cs(9),
      ADR0 => nibbles_nibbleValues_cs(1),
      O => nibbles_ledOutProc_ledOut_v(1)
    );
  nibbles_ledOut_cs_0 : X_SFF
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_ledOut_cs_0_CLK,
      I => nibbles_ledOutProc_ledOut_v(0),
      O => nibbles_ledOut_cs(0),
      SRST => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SSET => GND
    );
  nibbles_Mmux_ledOutProc_ledOut_v11 : X_LUT6
    generic map(
      LOC => "SLICE_X26Y42",
      INIT => X"FAFCFA0C0AFC0A0C"
    )
    port map (
      ADR2 => nibbles_id_cs(0),
      ADR3 => nibbles_id_cs(1),
      ADR4 => nibbles_nibbleValues_cs(4),
      ADR5 => nibbles_nibbleValues_cs(12),
      ADR0 => nibbles_nibbleValues_cs(8),
      ADR1 => nibbles_nibbleValues_cs(0),
      O => nibbles_ledOutProc_ledOut_v(0)
    );
  nibbles_Mmux_siebenSegOut_nibVal_v_0_11 : X_LUT6
    generic map(
      LOC => "SLICE_X27Y41",
      INIT => X"6680228044800080"
    )
    port map (
      ADR0 => nibbles_shiftRegister_shiftRegister_cs(1),
      ADR1 => nibbles_shiftRegister_shiftRegister_cs(3),
      ADR3 => nibbles_shiftRegister_shiftRegister_cs(2),
      ADR5 => nibbles_nibbleValues_cs(12),
      ADR2 => nibbles_nibbleValues_cs(8),
      ADR4 => nibbles_nibbleValues_cs(4),
      O => nibbles_Mmux_siebenSegOut_nibVal_v_0_1
    );
  nibbles_value_cs_3_nibbles_value_cs_3_DMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_value_cs(2),
      O => nibbles_value_cs_2_0
    );
  nibbles_value_cs_3_nibbles_value_cs_3_CMUX_Delay : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_value_cs(0),
      O => nibbles_value_cs_0_0
    );
  nibbles_value_cs_3 : X_FF
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_value_cs_3_CLK,
      I => nibbles_value_cs_3_glue_set_635,
      O => nibbles_value_cs(3),
      RST => GND,
      SET => GND
    );
  nibbles_value_cs_3_glue_set : X_LUT6
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => X"FFFF0F0FFFFF0F0F"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR3 => '1',
      ADR2 => valueIn_3_IBUF_0,
      ADR4 => nibbles_nres_inv,
      ADR5 => '1',
      O => nibbles_value_cs_3_glue_set_635
    );
  nibbles_value_cs_2_glue_set : X_LUT5
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => X"FFFF3333"
    )
    port map (
      ADR0 => '1',
      ADR2 => '1',
      ADR1 => valueIn_2_IBUF_0,
      ADR3 => '1',
      ADR4 => nibbles_nres_inv,
      O => nibbles_value_cs_2_glue_set_637
    );
  nibbles_value_cs_2 : X_FF
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_value_cs_2_CLK,
      I => nibbles_value_cs_2_glue_set_637,
      O => nibbles_value_cs(2),
      RST => GND,
      SET => GND
    );
  nibbles_value_cs_1 : X_FF
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_value_cs_1_CLK,
      I => nibbles_value_cs_1_glue_set_640,
      O => nibbles_value_cs(1),
      RST => GND,
      SET => GND
    );
  nibbles_value_cs_1_glue_set : X_LUT6
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => X"FFFF5555FFFF5555"
    )
    port map (
      ADR3 => '1',
      ADR1 => '1',
      ADR2 => '1',
      ADR0 => valueIn_1_IBUF_0,
      ADR4 => nibbles_nres_inv,
      ADR5 => '1',
      O => nibbles_value_cs_1_glue_set_640
    );
  nibbles_value_cs_0_glue_set : X_LUT5
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => X"FFFF0F0F"
    )
    port map (
      ADR0 => '1',
      ADR1 => '1',
      ADR2 => valueIn_0_IBUF_0,
      ADR3 => '1',
      ADR4 => nibbles_nres_inv,
      O => nibbles_value_cs_0_glue_set_639
    );
  nibbles_value_cs_0 : X_FF
    generic map(
      LOC => "SLICE_X31Y51",
      INIT => '0'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_value_cs_0_CLK,
      I => nibbles_value_cs_0_glue_set_639,
      O => nibbles_value_cs(0),
      RST => GND,
      SET => GND
    );
  nibbles_idLd_cs : X_SFF
    generic map(
      LOC => "SLICE_X33Y61",
      INIT => '1'
    )
    port map (
      CE => VCC,
      CLK => NlwBufferSignal_nibbles_idLd_cs_CLK,
      I => NlwBufferSignal_nibbles_idLd_cs_IN,
      O => nibbles_idLd_cs_814,
      SSET => nibbles_nres_inv,
      SET => GND,
      RST => GND,
      SRST => GND
    );
  NlwBufferBlock_anode_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_anode_cs(1),
      O => NlwBufferSignal_anode_1_OBUF_I
    );
  NlwBufferBlock_ledOut_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(4),
      O => NlwBufferSignal_ledOut_4_OBUF_I
    );
  NlwBufferBlock_ledOut_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(2),
      O => NlwBufferSignal_ledOut_2_OBUF_I
    );
  NlwBufferBlock_ledOut_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs_5_0,
      O => NlwBufferSignal_ledOut_5_OBUF_I
    );
  NlwBufferBlock_anode_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_anode_cs(0),
      O => NlwBufferSignal_anode_0_OBUF_I
    );
  NlwBufferBlock_segments_5_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_segments_cs(5),
      O => NlwBufferSignal_segments_5_OBUF_I
    );
  NlwBufferBlock_ledOut_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(6),
      O => NlwBufferSignal_ledOut_6_OBUF_I
    );
  NlwBufferBlock_ledOut_7_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs_7_0,
      O => NlwBufferSignal_ledOut_7_OBUF_I
    );
  NlwBufferBlock_ledOut_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(3),
      O => NlwBufferSignal_ledOut_3_OBUF_I
    );
  NlwBufferBlock_ledOut_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(1),
      O => NlwBufferSignal_ledOut_1_OBUF_I
    );
  NlwBufferBlock_segments_4_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_segments_cs(4),
      O => NlwBufferSignal_segments_4_OBUF_I
    );
  NlwBufferBlock_anode_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_anode_cs(3),
      O => NlwBufferSignal_anode_3_OBUF_I
    );
  NlwBufferBlock_anode_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_anode_cs(2),
      O => NlwBufferSignal_anode_2_OBUF_I
    );
  NlwBufferBlock_ledOut_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_ledOut_cs(0),
      O => NlwBufferSignal_ledOut_0_OBUF_I
    );
  NlwBufferBlock_segments_6_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_segments_cs(6),
      O => NlwBufferSignal_segments_6_OBUF_I
    );
  NlwBufferBlock_nibbles_anode_cs_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_anode_cs_0_CLK
    );
  NlwBufferBlock_nibbles_anode_cs_0_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(0),
      O => NlwBufferSignal_nibbles_anode_cs_0_IN
    );
  NlwBufferBlock_nibbles_anode_cs_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_anode_cs_1_CLK
    );
  NlwBufferBlock_nibbles_anode_cs_1_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(1),
      O => NlwBufferSignal_nibbles_anode_cs_1_IN
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_3_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_tick_v_816,
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_3_CLK
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_3_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(2),
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_3_IN
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_2_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_tick_v_816,
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_2_CLK
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_2_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(1),
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_2_IN
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_tick_v_816,
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_1_CLK
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_1_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(0),
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_1_IN
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_tickGenerator_tickGen_tick_v_816,
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_0_CLK
    );
  NlwBufferBlock_nibbles_shiftRegister_shiftRegister_cs_0_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(3),
      O => NlwBufferSignal_nibbles_shiftRegister_shiftRegister_cs_0_IN
    );
  NlwBufferBlock_clk_BUFGP_BUFG_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP_IBUFG_0,
      O => NlwBufferSignal_clk_BUFGP_BUFG_IN
    );
  NlwBufferBlock_nibbles_anode_cs_2_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_anode_cs_2_CLK
    );
  NlwBufferBlock_nibbles_anode_cs_2_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(2),
      O => NlwBufferSignal_nibbles_anode_cs_2_IN
    );
  NlwBufferBlock_nibbles_anode_cs_3_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_anode_cs_3_CLK
    );
  NlwBufferBlock_nibbles_anode_cs_3_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_shiftRegister_shiftRegister_cs(3),
      O => NlwBufferSignal_nibbles_anode_cs_3_IN
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_10_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_10_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_9_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_9_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_8_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_8_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_13_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_13_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_12_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_12_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_11_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_11_CLK
    );
  NlwBufferBlock_nibbles_segments_cs_5_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_segments_cs_5_CLK
    );
  NlwBufferBlock_nibbles_segments_cs_4_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_segments_cs_4_CLK
    );
  NlwBufferBlock_nibbles_segments_cs_3_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_segments_cs_3_CLK
    );
  NlwBufferBlock_nibbles_segments_cs_2_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_segments_cs_2_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_6_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_6_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_7_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_7_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_4_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_4_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_5_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_5_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_tick_v_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_tick_v_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_3_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_3_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_2_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_2_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_1_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_0_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_7_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_7_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_6_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_6_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_5_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_5_CLK
    );
  NlwBufferBlock_nibbles_tickGenerator_tickGen_count_4_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_tickGenerator_tickGen_count_4_CLK
    );
  NlwBufferBlock_nibbles_segments_cs_6_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_segments_cs_6_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_15_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_15_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_11_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_11_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_14_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_14_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_2_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_2_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_13_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_13_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_1_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_12_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_12_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_0_CLK
    );
  NlwBufferBlock_segments_1_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_segments_cs(1),
      O => NlwBufferSignal_segments_1_OBUF_I
    );
  NlwBufferBlock_segments_3_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_segments_cs(3),
      O => NlwBufferSignal_segments_3_OBUF_I
    );
  NlwBufferBlock_segments_2_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_segments_cs(2),
      O => NlwBufferSignal_segments_2_OBUF_I
    );
  NlwBufferBlock_segments_0_OBUF_I : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => nibbles_segments_cs(0),
      O => NlwBufferSignal_segments_0_OBUF_I
    );
  NlwBufferBlock_nibbles_valLd_cs_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_valLd_cs_CLK
    );
  NlwBufferBlock_nibbles_valLd_cs_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => valLd_IBUF_0,
      O => NlwBufferSignal_nibbles_valLd_cs_IN
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_6_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_6_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_10_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_10_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_5_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_5_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_9_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_9_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_4_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_4_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_8_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_8_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_3_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_3_CLK
    );
  NlwBufferBlock_nibbles_nibbleValues_cs_7_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_nibbleValues_cs_7_CLK
    );
  NlwBufferBlock_nibbles_segments_cs_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_segments_cs_1_CLK
    );
  NlwBufferBlock_nibbles_segments_cs_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_segments_cs_0_CLK
    );
  NlwBufferBlock_nibbles_id_cs_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_id_cs_1_CLK
    );
  NlwBufferBlock_nibbles_id_cs_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_id_cs_0_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_3_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_3_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_2_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_2_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_1_CLK
    );
  NlwBufferBlock_nibbles_ledOut_cs_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_ledOut_cs_0_CLK
    );
  NlwBufferBlock_nibbles_value_cs_3_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_value_cs_3_CLK
    );
  NlwBufferBlock_nibbles_value_cs_2_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_value_cs_2_CLK
    );
  NlwBufferBlock_nibbles_value_cs_1_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_value_cs_1_CLK
    );
  NlwBufferBlock_nibbles_value_cs_0_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_value_cs_0_CLK
    );
  NlwBufferBlock_nibbles_idLd_cs_CLK : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => clk_BUFGP,
      O => NlwBufferSignal_nibbles_idLd_cs_CLK
    );
  NlwBufferBlock_nibbles_idLd_cs_IN : X_BUF
    generic map(
      PATHPULSE => 115 ps
    )
    port map (
      I => idLd_IBUF_0,
      O => NlwBufferSignal_nibbles_idLd_cs_IN
    );
  NlwBlock_DUT_VCC : X_ONE
    port map (
      O => VCC
    );
  NlwBlock_DUT_GND : X_ZERO
    port map (
      O => GND
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;

