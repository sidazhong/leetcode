// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Sun Oct 31 17:47:55 2021
// Host        : sida running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ ProgramMemory_sim_netlist.v
// Design      : ProgramMemory
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ProgramMemory,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19568)
`pragma protect data_block
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
qZ/7rkSdSYTSc6oVEPS7V14=
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
