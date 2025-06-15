-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Apr  8 15:25:14 2025
-- Host        : AmirTJ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_stub.vhdl
-- Design      : iF_ARM
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity iF_ARM is
  Port ( 
    clk_0 : in STD_LOGIC;
    enable_0 : in STD_LOGIC;
    flush_0 : in STD_LOGIC;
    freeze_0 : in STD_LOGIC;
    in2_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    instruction : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pc : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rst_0 : in STD_LOGIC;
    select_0 : in STD_LOGIC
  );

end iF_ARM;

architecture stub of iF_ARM is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_0,enable_0,flush_0,freeze_0,in2_0[31:0],instruction[31:0],pc[31:0],rst_0,select_0";
begin
end;
