// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Sun Oct 31 17:47:56 2021
// Host        : sida running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sida/workspace/local.sida.com/class247/project/cs247/cs247.gen/sources_1/ip/ProgramMemory_1/ProgramMemory_sim_netlist.v
// Design      : ProgramMemory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ProgramMemory,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1.1" *) 
(* NotValidForBitStream *)
module ProgramMemory
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [9:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [9:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [9:0]NLW_U0_doutb_UNCONNECTED;
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.459999 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "ProgramMemory.mem" *) 
  (* C_INIT_FILE_NAME = "ProgramMemory.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "10" *) 
  (* C_READ_WIDTH_B = "10" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "10" *) 
  (* C_WRITE_WIDTH_B = "10" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  ProgramMemory_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[9:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[9:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
AkuQNVPNY9+9shMIkhpLTksKYrmlYMDGELxZLzmEPmLmFFG9PK80BYONcHXcZt8RiZ9O4/CnrQBC
CVpNwGDzEFNEWb1E+sBT/kwiiPAYmNaiRmMA5uIjzREW9RN/QihrFSNbz9zPzQr9UXcnxR3GSqWN
lwBLZZXmEQKLijApRzA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
uGvdVCe9dp9nrbuubxG4+gQOK8OqdFhfcZHi5WZh5LUwYFXWH/D9RZ2OIoa/GNhkIOKyLOd09nUA
CjPJL1Nnl1l77ChKwzIi3B+v7DkXtXmf86gR6YYyR7az2jc4B3YMVYPNvhfV0zLRWZe9c5Chjj0W
wVmfrgc9GFBoKXG9SyXTNJy2RU68/gTNie3vug3tpc22+aT8NrQpWHH8WA9zIHKTZmW18Ul5Mpks
SeoknAEaZSK7eRFnpVgIYTvtL4CnspbFX8GGCj099WRZFkdAp0NrxlMJ5Gf0w4p+2RGGX7vdNCcU
zcV5qRtwLGYeKoO2fDGSiXlO1R2b6xeGr3vj4w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
tpswLO8DyUkGLxrQBs3HsoCtlUARDpnz+ZPysfe04xgDUSvShZeLQRsfide+SSGU0zlcxgqmMx7/
sTH+YWieiyzXUqv56irKwHA0AJ9wS6qNQFoZWsP4prhN937PdsveCnzPbNhOydY+1/g9Acyf1Yfa
yKmBMA36vbj+Kxb4Ipc=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
AEY57OZMes7pulhuoLcYvSAS+/aEhKjZLskUu4V7Qt6I/eANyPs8vD4J9UVBPuToMfvwCjBI9yUY
mYBT28pBr293y15iVzjM7U+o6HwIGHULsfRqT1KVwFdraGywVWN/3+qZhvBIPDaA+4Px2sjTEgnu
kNzWyI2HIdbACM2ack1JQBmEr4k0KLI9PuV59OSOZwjtC7D6oDBUKg/RvN8FSv8Q9XANV03FQ67X
qP9ahH0HKuC7cr9KZFpqS+R2ULWwnBF/q98CuEAzPbTct7xFb+pvzrA5NND7EqBa0lJwlpDsALOE
w7L/EWa5qbTyryNZGhLM/A3uPeyIlo/pD3dVrg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XNTUosZBY5NKWe2dKcWY9/oG7CSX05DvgGf/33143aPkF7YqCLfxQH12oX+QkD25LDeH4/pCDZoQ
kfG/BpYQsbRjQJ3qwMirs/YOWG18OyvBWmLYyiMSxmrFUISda4GbymyfLybE0CeUYI1POTpUPMhF
kjoBBalr4I61BvCIztfFjQ2Y1F3JePYHe6+7Neb3cMwk+/DX976CxQ20Js9GcWA/2KD2Yz0fn9UH
FTcl8C+Q8IJJTgD3HwEhbAfnKjjY8aqqMa5Iq5bvmjy2WLHDeoSfpQqYT4jrbeAD/ZkqHfGaxvm0
s7c6aaymQIJLM0WiWbuBRf7b38vwav8SWIDaLQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CLboCUCRaPMUWmMgyNL7H93EZP6I4nnXrzkfrbP/rTungNHg9RpJ1qyE5kM+ywUKYufMY0AZtlSW
8HIBWuYCXK0QNt1HNyd/twqV1VT1dmVvjuPgbw6BSNH/iPx2qCO1U33Gieqh2S36LEWMRd3cW0gi
Lq6JrEtuqdIbFHzjU+8hGXefnaat161MGp61BJkNHiMg7yh36dg1AAXEaxT0zHQQtVusUvrrdDUN
zQ9TRiJCOxjx8iSrWizGNZlzBQLbD3l1iX5R9GnLbJC2fvrFLGY3Rywc3VTTTNGKMPSL7wXHnlPm
05R7GJOob3f8EkqncfqDDp8otA4ov4sJ1i2WSQ==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PbAQGy4IhNDuhR8PCDbgGk3HDa4XnOAIouyGUyEHL8cTh4UJAseSGUwW1sKr7gq3+Gmob6NOpt0u
dTuHVGxvQ4LnINyUUSelFaKv6JB21ows4FQ4TwvsKCpMHRJuZwQf+590t+TstWEIGfdcyOT6+abG
1nllgTprfFdtSsjmJ8rd52PaWNfBrmGaUwPud/ecnyojtfMpKbio6ZuqdO7qe/nf/R5Zvifh/eNg
gFBfKqmAXGeGRD86VfWt7vuPSkzNysLL2YJ3l/fkuItmMhQhOjzHeYWBQSrB914OxjlKplIB4FLq
YepxejZubRUADKaJq10UAQtWULSJAI/qV7w2UQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
PskPdtTd7KI9QcaMe/NiJfTBEYITLKIdUHDNINhTMdlNiMBqltYAbQmcGvos7o3y0BU7X+4d8O8X
ZjTN2mRBqbUQFwd8AHDNIBv2LL3WWX7vYXCYneRyl2MVrHCCTDpMsjx637Pv11Yy4WKDrpJMHY5I
4fbL+sJbViJY5oYxwNc9bMyoTs/AVNB65Mmm2efzBHaLoQXLYh8tpPmRkYvch2zIOhwXH7QyoAHJ
2PKRhlCz7e39svplWvfFzQubaNEmrMbIp9p3YyBL/1Tyzj6H6PlemVM9+j8vWKDqFOOWHtobQfWX
q8ijm2GV9t7lKgxbo6NNAylMBtyzYF6MjfTwBPDQ7gOx6BqHmPf6V0zvB4Y4F7MVgt4SSmZHZD9t
jTshmVJ+V9o47R7NlH7lJ5dHRf5u3p/S5KjbYrhf6UYCyNJ0tn6RMTVGec+j/GCyMI53SkT4NLFa
fQXfm1FBcXL6SJ0umRSTmMx09BDtyfW0SgUZBuqXbkCutrwrTh2MEtkk

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DEeTNgyxYOF3lbvn0F9RsjOAmrZ+YNXOCSQTbK3G4fn9fY5wWq3QlHc08tvj9DscqvTuKY5tcuO2
/I+uczqNJ8bPDC0KfoGBaSKWO0YqsRZiuMCJMxehhSMs2fJrQNjUOffpMOYFN3Wwq2rQwoJ0/5sv
ch2vmDdsOqby6rxFXn64ox5KKGYhpF5a32zr/6QaVQrfr2CvXJcMsGFfFx9VatfHkYVFaD0Ib5Je
4GFAm6Qp7TqL100np135fnbUiSeCk1VkUkpzQpWSi55E1ppywrsaW+LxRSbX1u5BVmnSkKfbNnVJ
jtTWZvAHLkNPaa/K2U/zUji8wkMZ0XAGkjWuWA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19552)
`pragma protect data_block
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
Tg==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
