-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
-- Date        : Fri Oct 29 19:40:46 2021
-- Host        : sida running 64-bit Ubuntu 20.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/sida/workspace/local.sida.com/class247/project/cs247/cs247.gen/sources_1/ip/ProgramMemory/ProgramMemory_stub.vhdl
-- Design      : ProgramMemory
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramMemory is
  Port ( 
    clka : in STD_LOGIC;
    addra : in STD_LOGIC_VECTOR ( 3 downto 0 );
    douta : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );

end ProgramMemory;

architecture stub of ProgramMemory is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,addra[3:0],douta[9:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_4,Vivado 2021.1.1";
begin
end;
