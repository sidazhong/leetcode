// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Fri Oct 29 19:40:46 2021
// Host        : sida running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/sida/workspace/local.sida.com/class247/project/cs247/cs247.gen/sources_1/ip/ProgramMemory/ProgramMemory_stub.v
// Design      : ProgramMemory
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1.1" *)
module ProgramMemory(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[3:0],douta[9:0]" */;
  input clka;
  input [3:0]addra;
  output [9:0]douta;
endmodule
