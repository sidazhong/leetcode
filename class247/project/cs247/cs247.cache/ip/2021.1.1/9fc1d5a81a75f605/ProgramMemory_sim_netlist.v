// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1.1 (lin64) Build 3286242 Wed Jul 28 13:09:46 MDT 2021
// Date        : Fri Oct 29 19:40:45 2021
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
8zxhvjmen8UkC4jdTPJ0hCw=
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
