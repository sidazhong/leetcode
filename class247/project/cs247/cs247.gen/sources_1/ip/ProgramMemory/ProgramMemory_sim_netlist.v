// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Fri Oct 29 19:40:46 2021
// Host        : sida running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/sida/workspace/local.sida.com/class247/project/cs247/cs247.gen/sources_1/ip/ProgramMemory/ProgramMemory_sim_netlist.v
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
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19536)
`pragma protect data_block
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
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
