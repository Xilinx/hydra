/*
 * Copyright 2019-2021 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

`timescale 1ns / 1ps

module noc
#(
  DATA_WIDTH = 64,
  ADDR_WIDTH = 1,
  DEPTH = 2**ADDR_WIDTH,
  N = 8,
  M = 8,
  C_nR = 1,
  C = 0,
  R = $clog2(N)
)
(
  M_AXIS_0_tdata,
  M_AXIS_0_tready,
  M_AXIS_0_tvalid,

  M_AXIS_1_tdata,
  M_AXIS_1_tready,
  M_AXIS_1_tvalid,

  M_AXIS_2_tdata,
  M_AXIS_2_tready,
  M_AXIS_2_tvalid,

  M_AXIS_3_tdata,
  M_AXIS_3_tready,
  M_AXIS_3_tvalid,

  M_AXIS_4_tdata,
  M_AXIS_4_tready,
  M_AXIS_4_tvalid,

  M_AXIS_5_tdata,
  M_AXIS_5_tready,
  M_AXIS_5_tvalid,

  M_AXIS_6_tdata,
  M_AXIS_6_tready,
  M_AXIS_6_tvalid,

  M_AXIS_7_tdata,
  M_AXIS_7_tready,
  M_AXIS_7_tvalid,

  S_AXIS_0_tdata,
  S_AXIS_0_tready,
  S_AXIS_0_tvalid,

  S_AXIS_1_tdata,
  S_AXIS_1_tready,
  S_AXIS_1_tvalid,

  S_AXIS_2_tdata,
  S_AXIS_2_tready,
  S_AXIS_2_tvalid,

  S_AXIS_3_tdata,
  S_AXIS_3_tready,
  S_AXIS_3_tvalid,

  S_AXIS_4_tdata,
  S_AXIS_4_tready,
  S_AXIS_4_tvalid,

  S_AXIS_5_tdata,
  S_AXIS_5_tready,
  S_AXIS_5_tvalid,

  S_AXIS_6_tdata,
  S_AXIS_6_tready,
  S_AXIS_6_tvalid,

  S_AXIS_7_tdata,
  S_AXIS_7_tready,
  S_AXIS_7_tvalid,

  aclk_0,
  aresetn_0
);
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TREADY" *)	  input M_AXIS_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TVALID" *)	  output M_AXIS_0_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_1 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_1,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_1_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_1 TREADY" *)	  input M_AXIS_1_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_1 TVALID" *)	  output M_AXIS_1_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_2 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_2,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_2_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_2 TREADY" *)	  input M_AXIS_2_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_2 TVALID" *)	  output M_AXIS_2_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_3 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_3,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_3_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_3 TREADY" *)	  input M_AXIS_3_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_3 TVALID" *)	  output M_AXIS_3_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_4 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_4,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_4_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_4 TREADY" *)	  input M_AXIS_4_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_4 TVALID" *)	  output M_AXIS_4_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_5 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_5,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_5_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_5 TREADY" *)	  input M_AXIS_5_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_5 TVALID" *)	  output M_AXIS_5_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_6 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_6,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_6_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_6 TREADY" *)	  input M_AXIS_6_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_6 TVALID" *)	  output M_AXIS_6_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_7 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_7,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  output [DATA_WIDTH-1:0] M_AXIS_7_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_7 TREADY" *)	  input M_AXIS_7_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_7 TVALID" *)	  output M_AXIS_7_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_0,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TREADY" *)	  output S_AXIS_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TVALID" *)	  input S_AXIS_0_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_1,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_1_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1 TREADY" *)	  output S_AXIS_1_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_1 TVALID" *)	  input S_AXIS_1_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_2,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_2_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2 TREADY" *)	  output S_AXIS_2_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_2 TVALID" *)	  input S_AXIS_2_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_3 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_3,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_3_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_3 TREADY" *)	  output S_AXIS_3_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_3 TVALID" *)	  input S_AXIS_3_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_4 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_4,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_4_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_4 TREADY" *)	  output S_AXIS_4_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_4 TVALID" *)	  input S_AXIS_4_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_5 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_5,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_5_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_5 TREADY" *)	  output S_AXIS_5_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_5 TVALID" *)	  input S_AXIS_5_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_6 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_6,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_6_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_6 TREADY" *)	  output S_AXIS_6_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_6 TVALID" *)	  input S_AXIS_6_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_7 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_7,  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)	  input [DATA_WIDTH-1:0] S_AXIS_7_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_7 TREADY" *)	  output S_AXIS_7_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_7 TVALID" *)	  input S_AXIS_7_tvalid;

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK" *)(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, ASSOCIATED_BUSIF S_AXIS_0:S_AXIS_1:S_AXIS_2:S_AXIS_3:S_AXIS_4:S_AXIS_5:S_AXIS_6:S_AXIS_7:M_AXIS_0:M_AXIS_1:M_AXIS_2:M_AXIS_3:M_AXIS_4:M_AXIS_5:M_AXIS_6:M_AXIS_7:, ASSOCIATED_RESET aresetn_0,  INSERT_VIP 0, PHASE 0.000" *)  input aclk_0;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *)   input aresetn_0;

//Row 0
 wire [DATA_WIDTH-1:0] W_0_0_to_0_1_tdata;
 wire W_0_0_to_0_1_tready;
 wire W_0_0_to_0_1_tvalid;
 wire [DATA_WIDTH-1:0] W_0_0_to_1_0_tdata;
 wire W_0_0_to_1_0_tready;
 wire W_0_0_to_1_0_tvalid;
 wire [DATA_WIDTH-1:0] W_0_1_to_0_2_tdata;
 wire W_0_1_to_0_2_tready;
 wire W_0_1_to_0_2_tvalid;
 wire [DATA_WIDTH-1:0] W_0_1_to_1_1_tdata;
 wire W_0_1_to_1_1_tready;
 wire W_0_1_to_1_1_tvalid;
 wire [DATA_WIDTH-1:0] W_0_2_to_0_3_tdata;
 wire W_0_2_to_0_3_tready;
 wire W_0_2_to_0_3_tvalid;
 wire [DATA_WIDTH-1:0] W_0_2_to_1_2_tdata;
 wire W_0_2_to_1_2_tready;
 wire W_0_2_to_1_2_tvalid;
 wire [DATA_WIDTH-1:0] W_0_3_to_0_4_tdata;
 wire W_0_3_to_0_4_tready;
 wire W_0_3_to_0_4_tvalid;
 wire [DATA_WIDTH-1:0] W_0_3_to_1_3_tdata;
 wire W_0_3_to_1_3_tready;
 wire W_0_3_to_1_3_tvalid;
 wire [DATA_WIDTH-1:0] W_0_4_to_0_5_tdata;
 wire W_0_4_to_0_5_tready;
 wire W_0_4_to_0_5_tvalid;
 wire [DATA_WIDTH-1:0] W_0_4_to_1_4_tdata;
 wire W_0_4_to_1_4_tready;
 wire W_0_4_to_1_4_tvalid;
 wire [DATA_WIDTH-1:0] W_0_5_to_0_6_tdata;
 wire W_0_5_to_0_6_tready;
 wire W_0_5_to_0_6_tvalid;
 wire [DATA_WIDTH-1:0] W_0_5_to_1_5_tdata;
 wire W_0_5_to_1_5_tready;
 wire W_0_5_to_1_5_tvalid;
 wire [DATA_WIDTH-1:0] W_0_6_to_1_7_tdata;
 wire W_0_6_to_1_7_tready;
 wire W_0_6_to_1_7_tvalid;
 wire [DATA_WIDTH-1:0] W_0_6_to_1_6_tdata;
 wire W_0_6_to_1_6_tready;
 wire W_0_6_to_1_6_tvalid;

//Row 1
 wire [DATA_WIDTH-1:0] W_1_0_to_1_1_tdata;
 wire W_1_0_to_1_1_tready;
 wire W_1_0_to_1_1_tvalid;
 wire [DATA_WIDTH-1:0] W_1_0_to_2_0_tdata;
 wire W_1_0_to_2_0_tready;
 wire W_1_0_to_2_0_tvalid;
 wire [DATA_WIDTH-1:0] W_1_1_to_1_2_tdata;
 wire W_1_1_to_1_2_tready;
 wire W_1_1_to_1_2_tvalid;
 wire [DATA_WIDTH-1:0] W_1_1_to_2_1_tdata;
 wire W_1_1_to_2_1_tready;
 wire W_1_1_to_2_1_tvalid;
 wire [DATA_WIDTH-1:0] W_1_2_to_1_3_tdata;
 wire W_1_2_to_1_3_tready;
 wire W_1_2_to_1_3_tvalid;
 wire [DATA_WIDTH-1:0] W_1_2_to_2_2_tdata;
 wire W_1_2_to_2_2_tready;
 wire W_1_2_to_2_2_tvalid;
 wire [DATA_WIDTH-1:0] W_1_3_to_1_4_tdata;
 wire W_1_3_to_1_4_tready;
 wire W_1_3_to_1_4_tvalid;
 wire [DATA_WIDTH-1:0] W_1_3_to_2_3_tdata;
 wire W_1_3_to_2_3_tready;
 wire W_1_3_to_2_3_tvalid;
 wire [DATA_WIDTH-1:0] W_1_4_to_1_5_tdata;
 wire W_1_4_to_1_5_tready;
 wire W_1_4_to_1_5_tvalid;
 wire [DATA_WIDTH-1:0] W_1_4_to_2_4_tdata;
 wire W_1_4_to_2_4_tready;
 wire W_1_4_to_2_4_tvalid;
 wire [DATA_WIDTH-1:0] W_1_5_to_1_6_tdata;
 wire W_1_5_to_1_6_tready;
 wire W_1_5_to_1_6_tvalid;
 wire [DATA_WIDTH-1:0] W_1_5_to_2_5_tdata;
 wire W_1_5_to_2_5_tready;
 wire W_1_5_to_2_5_tvalid;
 wire [DATA_WIDTH-1:0] W_1_6_to_1_7_tdata;
 wire W_1_6_to_1_7_tready;
 wire W_1_6_to_1_7_tvalid;
 wire [DATA_WIDTH-1:0] W_1_6_to_2_6_tdata;
 wire W_1_6_to_2_6_tready;
 wire W_1_6_to_2_6_tvalid;
 wire [DATA_WIDTH-1:0] W_1_7_to_2_7_tdata;
 wire W_1_7_to_2_7_tready;
 wire W_1_7_to_2_7_tvalid;

//Row 2
 wire [DATA_WIDTH-1:0] W_2_0_to_2_1_tdata;
 wire W_2_0_to_2_1_tready;
 wire W_2_0_to_2_1_tvalid;
 wire [DATA_WIDTH-1:0] W_2_0_to_3_0_tdata;
 wire W_2_0_to_3_0_tready;
 wire W_2_0_to_3_0_tvalid;
 wire [DATA_WIDTH-1:0] W_2_1_to_2_2_tdata;
 wire W_2_1_to_2_2_tready;
 wire W_2_1_to_2_2_tvalid;
 wire [DATA_WIDTH-1:0] W_2_1_to_3_1_tdata;
 wire W_2_1_to_3_1_tready;
 wire W_2_1_to_3_1_tvalid;
 wire [DATA_WIDTH-1:0] W_2_2_to_2_3_tdata;
 wire W_2_2_to_2_3_tready;
 wire W_2_2_to_2_3_tvalid;
 wire [DATA_WIDTH-1:0] W_2_2_to_3_2_tdata;
 wire W_2_2_to_3_2_tready;
 wire W_2_2_to_3_2_tvalid;
 wire [DATA_WIDTH-1:0] W_2_3_to_2_4_tdata;
 wire W_2_3_to_2_4_tready;
 wire W_2_3_to_2_4_tvalid;
 wire [DATA_WIDTH-1:0] W_2_3_to_3_3_tdata;
 wire W_2_3_to_3_3_tready;
 wire W_2_3_to_3_3_tvalid;
 wire [DATA_WIDTH-1:0] W_2_4_to_2_5_tdata;
 wire W_2_4_to_2_5_tready;
 wire W_2_4_to_2_5_tvalid;
 wire [DATA_WIDTH-1:0] W_2_4_to_3_4_tdata;
 wire W_2_4_to_3_4_tready;
 wire W_2_4_to_3_4_tvalid;
 wire [DATA_WIDTH-1:0] W_2_5_to_2_6_tdata;
 wire W_2_5_to_2_6_tready;
 wire W_2_5_to_2_6_tvalid;
 wire [DATA_WIDTH-1:0] W_2_5_to_3_5_tdata;
 wire W_2_5_to_3_5_tready;
 wire W_2_5_to_3_5_tvalid;
 wire [DATA_WIDTH-1:0] W_2_6_to_2_7_tdata;
 wire W_2_6_to_2_7_tready;
 wire W_2_6_to_2_7_tvalid;
 wire [DATA_WIDTH-1:0] W_2_6_to_3_6_tdata;
 wire W_2_6_to_3_6_tready;
 wire W_2_6_to_3_6_tvalid;
 wire [DATA_WIDTH-1:0] W_2_7_to_3_7_tdata;
 wire W_2_7_to_3_7_tready;
 wire W_2_7_to_3_7_tvalid;

//Row 3
 wire [DATA_WIDTH-1:0] W_3_0_to_3_1_tdata;
 wire W_3_0_to_3_1_tready;
 wire W_3_0_to_3_1_tvalid;
 wire [DATA_WIDTH-1:0] W_3_0_to_4_0_tdata;
 wire W_3_0_to_4_0_tready;
 wire W_3_0_to_4_0_tvalid;
 wire [DATA_WIDTH-1:0] W_3_1_to_3_2_tdata;
 wire W_3_1_to_3_2_tready;
 wire W_3_1_to_3_2_tvalid;
 wire [DATA_WIDTH-1:0] W_3_1_to_4_1_tdata;
 wire W_3_1_to_4_1_tready;
 wire W_3_1_to_4_1_tvalid;
 wire [DATA_WIDTH-1:0] W_3_2_to_3_3_tdata;
 wire W_3_2_to_3_3_tready;
 wire W_3_2_to_3_3_tvalid;
 wire [DATA_WIDTH-1:0] W_3_2_to_4_2_tdata;
 wire W_3_2_to_4_2_tready;
 wire W_3_2_to_4_2_tvalid;
 wire [DATA_WIDTH-1:0] W_3_3_to_3_4_tdata;
 wire W_3_3_to_3_4_tready;
 wire W_3_3_to_3_4_tvalid;
 wire [DATA_WIDTH-1:0] W_3_3_to_4_3_tdata;
 wire W_3_3_to_4_3_tready;
 wire W_3_3_to_4_3_tvalid;
 wire [DATA_WIDTH-1:0] W_3_4_to_3_5_tdata;
 wire W_3_4_to_3_5_tready;
 wire W_3_4_to_3_5_tvalid;
 wire [DATA_WIDTH-1:0] W_3_4_to_4_4_tdata;
 wire W_3_4_to_4_4_tready;
 wire W_3_4_to_4_4_tvalid;
 wire [DATA_WIDTH-1:0] W_3_5_to_3_6_tdata;
 wire W_3_5_to_3_6_tready;
 wire W_3_5_to_3_6_tvalid;
 wire [DATA_WIDTH-1:0] W_3_5_to_4_5_tdata;
 wire W_3_5_to_4_5_tready;
 wire W_3_5_to_4_5_tvalid;
 wire [DATA_WIDTH-1:0] W_3_6_to_3_7_tdata;
 wire W_3_6_to_3_7_tready;
 wire W_3_6_to_3_7_tvalid;
 wire [DATA_WIDTH-1:0] W_3_6_to_4_6_tdata;
 wire W_3_6_to_4_6_tready;
 wire W_3_6_to_4_6_tvalid;
 wire [DATA_WIDTH-1:0] W_3_7_to_4_7_tdata;
 wire W_3_7_to_4_7_tready;
 wire W_3_7_to_4_7_tvalid;

//Row 4
 wire [DATA_WIDTH-1:0] W_4_0_to_4_1_tdata;
 wire W_4_0_to_4_1_tready;
 wire W_4_0_to_4_1_tvalid;
 wire [DATA_WIDTH-1:0] W_4_0_to_5_0_tdata;
 wire W_4_0_to_5_0_tready;
 wire W_4_0_to_5_0_tvalid;
 wire [DATA_WIDTH-1:0] W_4_1_to_4_2_tdata;
 wire W_4_1_to_4_2_tready;
 wire W_4_1_to_4_2_tvalid;
 wire [DATA_WIDTH-1:0] W_4_1_to_5_1_tdata;
 wire W_4_1_to_5_1_tready;
 wire W_4_1_to_5_1_tvalid;
 wire [DATA_WIDTH-1:0] W_4_2_to_4_3_tdata;
 wire W_4_2_to_4_3_tready;
 wire W_4_2_to_4_3_tvalid;
 wire [DATA_WIDTH-1:0] W_4_2_to_5_2_tdata;
 wire W_4_2_to_5_2_tready;
 wire W_4_2_to_5_2_tvalid;
 wire [DATA_WIDTH-1:0] W_4_3_to_4_4_tdata;
 wire W_4_3_to_4_4_tready;
 wire W_4_3_to_4_4_tvalid;
 wire [DATA_WIDTH-1:0] W_4_3_to_5_3_tdata;
 wire W_4_3_to_5_3_tready;
 wire W_4_3_to_5_3_tvalid;
 wire [DATA_WIDTH-1:0] W_4_4_to_4_5_tdata;
 wire W_4_4_to_4_5_tready;
 wire W_4_4_to_4_5_tvalid;
 wire [DATA_WIDTH-1:0] W_4_4_to_5_4_tdata;
 wire W_4_4_to_5_4_tready;
 wire W_4_4_to_5_4_tvalid;
 wire [DATA_WIDTH-1:0] W_4_5_to_4_6_tdata;
 wire W_4_5_to_4_6_tready;
 wire W_4_5_to_4_6_tvalid;
 wire [DATA_WIDTH-1:0] W_4_5_to_5_5_tdata;
 wire W_4_5_to_5_5_tready;
 wire W_4_5_to_5_5_tvalid;
 wire [DATA_WIDTH-1:0] W_4_6_to_4_7_tdata;
 wire W_4_6_to_4_7_tready;
 wire W_4_6_to_4_7_tvalid;
 wire [DATA_WIDTH-1:0] W_4_6_to_5_6_tdata;
 wire W_4_6_to_5_6_tready;
 wire W_4_6_to_5_6_tvalid;
 wire [DATA_WIDTH-1:0] W_4_7_to_5_7_tdata;
 wire W_4_7_to_5_7_tready;
 wire W_4_7_to_5_7_tvalid;

//Row 5
 wire [DATA_WIDTH-1:0] W_5_0_to_5_1_tdata;
 wire W_5_0_to_5_1_tready;
 wire W_5_0_to_5_1_tvalid;
 wire [DATA_WIDTH-1:0] W_5_0_to_6_0_tdata;
 wire W_5_0_to_6_0_tready;
 wire W_5_0_to_6_0_tvalid;
 wire [DATA_WIDTH-1:0] W_5_1_to_5_2_tdata;
 wire W_5_1_to_5_2_tready;
 wire W_5_1_to_5_2_tvalid;
 wire [DATA_WIDTH-1:0] W_5_1_to_6_1_tdata;
 wire W_5_1_to_6_1_tready;
 wire W_5_1_to_6_1_tvalid;
 wire [DATA_WIDTH-1:0] W_5_2_to_5_3_tdata;
 wire W_5_2_to_5_3_tready;
 wire W_5_2_to_5_3_tvalid;
 wire [DATA_WIDTH-1:0] W_5_2_to_6_2_tdata;
 wire W_5_2_to_6_2_tready;
 wire W_5_2_to_6_2_tvalid;
 wire [DATA_WIDTH-1:0] W_5_3_to_5_4_tdata;
 wire W_5_3_to_5_4_tready;
 wire W_5_3_to_5_4_tvalid;
 wire [DATA_WIDTH-1:0] W_5_3_to_6_3_tdata;
 wire W_5_3_to_6_3_tready;
 wire W_5_3_to_6_3_tvalid;
 wire [DATA_WIDTH-1:0] W_5_4_to_5_5_tdata;
 wire W_5_4_to_5_5_tready;
 wire W_5_4_to_5_5_tvalid;
 wire [DATA_WIDTH-1:0] W_5_4_to_6_4_tdata;
 wire W_5_4_to_6_4_tready;
 wire W_5_4_to_6_4_tvalid;
 wire [DATA_WIDTH-1:0] W_5_5_to_5_6_tdata;
 wire W_5_5_to_5_6_tready;
 wire W_5_5_to_5_6_tvalid;
 wire [DATA_WIDTH-1:0] W_5_5_to_6_5_tdata;
 wire W_5_5_to_6_5_tready;
 wire W_5_5_to_6_5_tvalid;
 wire [DATA_WIDTH-1:0] W_5_6_to_5_7_tdata;
 wire W_5_6_to_5_7_tready;
 wire W_5_6_to_5_7_tvalid;
 wire [DATA_WIDTH-1:0] W_5_6_to_6_6_tdata;
 wire W_5_6_to_6_6_tready;
 wire W_5_6_to_6_6_tvalid;
 wire [DATA_WIDTH-1:0] W_5_7_to_6_7_tdata;
 wire W_5_7_to_6_7_tready;
 wire W_5_7_to_6_7_tvalid;

//Row 6
 wire [DATA_WIDTH-1:0] W_6_0_to_6_1_tdata;
 wire W_6_0_to_6_1_tready;
 wire W_6_0_to_6_1_tvalid;
 wire [DATA_WIDTH-1:0] W_6_0_to_7_0_tdata;
 wire W_6_0_to_7_0_tready;
 wire W_6_0_to_7_0_tvalid;
 wire [DATA_WIDTH-1:0] W_6_1_to_6_2_tdata;
 wire W_6_1_to_6_2_tready;
 wire W_6_1_to_6_2_tvalid;
 wire [DATA_WIDTH-1:0] W_6_1_to_7_1_tdata;
 wire W_6_1_to_7_1_tready;
 wire W_6_1_to_7_1_tvalid;
 wire [DATA_WIDTH-1:0] W_6_2_to_6_3_tdata;
 wire W_6_2_to_6_3_tready;
 wire W_6_2_to_6_3_tvalid;
 wire [DATA_WIDTH-1:0] W_6_2_to_7_2_tdata;
 wire W_6_2_to_7_2_tready;
 wire W_6_2_to_7_2_tvalid;
 wire [DATA_WIDTH-1:0] W_6_3_to_6_4_tdata;
 wire W_6_3_to_6_4_tready;
 wire W_6_3_to_6_4_tvalid;
 wire [DATA_WIDTH-1:0] W_6_3_to_7_3_tdata;
 wire W_6_3_to_7_3_tready;
 wire W_6_3_to_7_3_tvalid;
 wire [DATA_WIDTH-1:0] W_6_4_to_6_5_tdata;
 wire W_6_4_to_6_5_tready;
 wire W_6_4_to_6_5_tvalid;
 wire [DATA_WIDTH-1:0] W_6_4_to_7_4_tdata;
 wire W_6_4_to_7_4_tready;
 wire W_6_4_to_7_4_tvalid;
 wire [DATA_WIDTH-1:0] W_6_5_to_6_6_tdata;
 wire W_6_5_to_6_6_tready;
 wire W_6_5_to_6_6_tvalid;
 wire [DATA_WIDTH-1:0] W_6_5_to_7_5_tdata;
 wire W_6_5_to_7_5_tready;
 wire W_6_5_to_7_5_tvalid;
 wire [DATA_WIDTH-1:0] W_6_6_to_6_7_tdata;
 wire W_6_6_to_6_7_tready;
 wire W_6_6_to_6_7_tvalid;
 wire [DATA_WIDTH-1:0] W_6_6_to_7_6_tdata;
 wire W_6_6_to_7_6_tready;
 wire W_6_6_to_7_6_tvalid;
 wire [DATA_WIDTH-1:0] W_6_7_to_7_7_tdata;
 wire W_6_7_to_7_7_tready;
 wire W_6_7_to_7_7_tvalid;

//Row 7
 wire [DATA_WIDTH-1:0] W_7_0_to_7_1_tdata;
 wire W_7_0_to_7_1_tready;
 wire W_7_0_to_7_1_tvalid;
 wire [DATA_WIDTH-1:0] W_7_1_to_7_2_tdata;
 wire W_7_1_to_7_2_tready;
 wire W_7_1_to_7_2_tvalid;
 wire [DATA_WIDTH-1:0] W_7_2_to_7_3_tdata;
 wire W_7_2_to_7_3_tready;
 wire W_7_2_to_7_3_tvalid;
 wire [DATA_WIDTH-1:0] W_7_3_to_7_4_tdata;
 wire W_7_3_to_7_4_tready;
 wire W_7_3_to_7_4_tvalid;
 wire [DATA_WIDTH-1:0] W_7_4_to_7_5_tdata;
 wire W_7_4_to_7_5_tready;
 wire W_7_4_to_7_5_tvalid;
 wire [DATA_WIDTH-1:0] W_7_5_to_7_6_tdata;
 wire W_7_5_to_7_6_tready;
 wire W_7_5_to_7_6_tvalid;
 wire [DATA_WIDTH-1:0] W_7_6_to_7_7_tdata;
 wire W_7_6_to_7_7_tready;
 wire W_7_6_to_7_7_tvalid;

//Row 0
 switch_s
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_0_0
 (
   .M_AXIS_0_tdata(W_0_0_to_0_1_tdata),
   .M_AXIS_0_tready(W_0_0_to_0_1_tready),
   .M_AXIS_0_tvalid(W_0_0_to_0_1_tvalid),

   .M_AXIS_1_tdata(W_0_0_to_1_0_tdata),
   .M_AXIS_1_tready(W_0_0_to_1_0_tready),
   .M_AXIS_1_tvalid(W_0_0_to_1_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_0_tdata),
   .S_AXIS_0_tready(S_AXIS_0_tready),
   .S_AXIS_0_tvalid(S_AXIS_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_s
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_0_1
 (
   .M_AXIS_0_tdata(W_0_1_to_0_2_tdata),
   .M_AXIS_0_tready(W_0_1_to_0_2_tready),
   .M_AXIS_0_tvalid(W_0_1_to_0_2_tvalid),

   .M_AXIS_1_tdata(W_0_1_to_1_1_tdata),
   .M_AXIS_1_tready(W_0_1_to_1_1_tready),
   .M_AXIS_1_tvalid(W_0_1_to_1_1_tvalid),

   .S_AXIS_0_tdata(W_0_0_to_0_1_tdata),
   .S_AXIS_0_tready(W_0_0_to_0_1_tready),
   .S_AXIS_0_tvalid(W_0_0_to_0_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_s
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_0_2
 (
   .M_AXIS_0_tdata(W_0_2_to_0_3_tdata),
   .M_AXIS_0_tready(W_0_2_to_0_3_tready),
   .M_AXIS_0_tvalid(W_0_2_to_0_3_tvalid),

   .M_AXIS_1_tdata(W_0_2_to_1_2_tdata),
   .M_AXIS_1_tready(W_0_2_to_1_2_tready),
   .M_AXIS_1_tvalid(W_0_2_to_1_2_tvalid),

   .S_AXIS_0_tdata(W_0_1_to_0_2_tdata),
   .S_AXIS_0_tready(W_0_1_to_0_2_tready),
   .S_AXIS_0_tvalid(W_0_1_to_0_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_s
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_0_3
 (
   .M_AXIS_0_tdata(W_0_3_to_0_4_tdata),
   .M_AXIS_0_tready(W_0_3_to_0_4_tready),
   .M_AXIS_0_tvalid(W_0_3_to_0_4_tvalid),

   .M_AXIS_1_tdata(W_0_3_to_1_3_tdata),
   .M_AXIS_1_tready(W_0_3_to_1_3_tready),
   .M_AXIS_1_tvalid(W_0_3_to_1_3_tvalid),

   .S_AXIS_0_tdata(W_0_2_to_0_3_tdata),
   .S_AXIS_0_tready(W_0_2_to_0_3_tready),
   .S_AXIS_0_tvalid(W_0_2_to_0_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_s
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_0_4
 (
   .M_AXIS_0_tdata(W_0_4_to_0_5_tdata),
   .M_AXIS_0_tready(W_0_4_to_0_5_tready),
   .M_AXIS_0_tvalid(W_0_4_to_0_5_tvalid),

   .M_AXIS_1_tdata(W_0_4_to_1_4_tdata),
   .M_AXIS_1_tready(W_0_4_to_1_4_tready),
   .M_AXIS_1_tvalid(W_0_4_to_1_4_tvalid),

   .S_AXIS_0_tdata(W_0_3_to_0_4_tdata),
   .S_AXIS_0_tready(W_0_3_to_0_4_tready),
   .S_AXIS_0_tvalid(W_0_3_to_0_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_s
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_0_5
 (
   .M_AXIS_0_tdata(W_0_5_to_0_6_tdata),
   .M_AXIS_0_tready(W_0_5_to_0_6_tready),
   .M_AXIS_0_tvalid(W_0_5_to_0_6_tvalid),

   .M_AXIS_1_tdata(W_0_5_to_1_5_tdata),
   .M_AXIS_1_tready(W_0_5_to_1_5_tready),
   .M_AXIS_1_tvalid(W_0_5_to_1_5_tvalid),

   .S_AXIS_0_tdata(W_0_4_to_0_5_tdata),
   .S_AXIS_0_tready(W_0_4_to_0_5_tready),
   .S_AXIS_0_tvalid(W_0_4_to_0_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_s
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_0_6
 (
   .M_AXIS_0_tdata(W_0_6_to_1_7_tdata),
   .M_AXIS_0_tready(W_0_6_to_1_7_tready),
   .M_AXIS_0_tvalid(W_0_6_to_1_7_tvalid),

   .M_AXIS_1_tdata(W_0_6_to_1_6_tdata),
   .M_AXIS_1_tready(W_0_6_to_1_6_tready),
   .M_AXIS_1_tvalid(W_0_6_to_1_6_tvalid),

   .S_AXIS_0_tdata(W_0_5_to_0_6_tdata),
   .S_AXIS_0_tready(W_0_5_to_0_6_tready),
   .S_AXIS_0_tvalid(W_0_5_to_0_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


//Row 1
 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_0
 (
   .M_AXIS_0_tdata(W_1_0_to_1_1_tdata),
   .M_AXIS_0_tready(W_1_0_to_1_1_tready),
   .M_AXIS_0_tvalid(W_1_0_to_1_1_tvalid),

   .M_AXIS_1_tdata(W_1_0_to_2_0_tdata),
   .M_AXIS_1_tready(W_1_0_to_2_0_tready),
   .M_AXIS_1_tvalid(W_1_0_to_2_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_1_tdata),
   .S_AXIS_0_tready(S_AXIS_1_tready),
   .S_AXIS_0_tvalid(S_AXIS_1_tvalid),

   .S_AXIS_1_tdata(W_0_0_to_1_0_tdata),
   .S_AXIS_1_tready(W_0_0_to_1_0_tready),
   .S_AXIS_1_tvalid(W_0_0_to_1_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_1
 (
   .M_AXIS_0_tdata(W_1_1_to_1_2_tdata),
   .M_AXIS_0_tready(W_1_1_to_1_2_tready),
   .M_AXIS_0_tvalid(W_1_1_to_1_2_tvalid),

   .M_AXIS_1_tdata(W_1_1_to_2_1_tdata),
   .M_AXIS_1_tready(W_1_1_to_2_1_tready),
   .M_AXIS_1_tvalid(W_1_1_to_2_1_tvalid),

   .S_AXIS_0_tdata(W_1_0_to_1_1_tdata),
   .S_AXIS_0_tready(W_1_0_to_1_1_tready),
   .S_AXIS_0_tvalid(W_1_0_to_1_1_tvalid),

   .S_AXIS_1_tdata(W_0_1_to_1_1_tdata),
   .S_AXIS_1_tready(W_0_1_to_1_1_tready),
   .S_AXIS_1_tvalid(W_0_1_to_1_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_2
 (
   .M_AXIS_0_tdata(W_1_2_to_1_3_tdata),
   .M_AXIS_0_tready(W_1_2_to_1_3_tready),
   .M_AXIS_0_tvalid(W_1_2_to_1_3_tvalid),

   .M_AXIS_1_tdata(W_1_2_to_2_2_tdata),
   .M_AXIS_1_tready(W_1_2_to_2_2_tready),
   .M_AXIS_1_tvalid(W_1_2_to_2_2_tvalid),

   .S_AXIS_0_tdata(W_1_1_to_1_2_tdata),
   .S_AXIS_0_tready(W_1_1_to_1_2_tready),
   .S_AXIS_0_tvalid(W_1_1_to_1_2_tvalid),

   .S_AXIS_1_tdata(W_0_2_to_1_2_tdata),
   .S_AXIS_1_tready(W_0_2_to_1_2_tready),
   .S_AXIS_1_tvalid(W_0_2_to_1_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_3
 (
   .M_AXIS_0_tdata(W_1_3_to_1_4_tdata),
   .M_AXIS_0_tready(W_1_3_to_1_4_tready),
   .M_AXIS_0_tvalid(W_1_3_to_1_4_tvalid),

   .M_AXIS_1_tdata(W_1_3_to_2_3_tdata),
   .M_AXIS_1_tready(W_1_3_to_2_3_tready),
   .M_AXIS_1_tvalid(W_1_3_to_2_3_tvalid),

   .S_AXIS_0_tdata(W_1_2_to_1_3_tdata),
   .S_AXIS_0_tready(W_1_2_to_1_3_tready),
   .S_AXIS_0_tvalid(W_1_2_to_1_3_tvalid),

   .S_AXIS_1_tdata(W_0_3_to_1_3_tdata),
   .S_AXIS_1_tready(W_0_3_to_1_3_tready),
   .S_AXIS_1_tvalid(W_0_3_to_1_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_4
 (
   .M_AXIS_0_tdata(W_1_4_to_1_5_tdata),
   .M_AXIS_0_tready(W_1_4_to_1_5_tready),
   .M_AXIS_0_tvalid(W_1_4_to_1_5_tvalid),

   .M_AXIS_1_tdata(W_1_4_to_2_4_tdata),
   .M_AXIS_1_tready(W_1_4_to_2_4_tready),
   .M_AXIS_1_tvalid(W_1_4_to_2_4_tvalid),

   .S_AXIS_0_tdata(W_1_3_to_1_4_tdata),
   .S_AXIS_0_tready(W_1_3_to_1_4_tready),
   .S_AXIS_0_tvalid(W_1_3_to_1_4_tvalid),

   .S_AXIS_1_tdata(W_0_4_to_1_4_tdata),
   .S_AXIS_1_tready(W_0_4_to_1_4_tready),
   .S_AXIS_1_tvalid(W_0_4_to_1_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_5
 (
   .M_AXIS_0_tdata(W_1_5_to_1_6_tdata),
   .M_AXIS_0_tready(W_1_5_to_1_6_tready),
   .M_AXIS_0_tvalid(W_1_5_to_1_6_tvalid),

   .M_AXIS_1_tdata(W_1_5_to_2_5_tdata),
   .M_AXIS_1_tready(W_1_5_to_2_5_tready),
   .M_AXIS_1_tvalid(W_1_5_to_2_5_tvalid),

   .S_AXIS_0_tdata(W_1_4_to_1_5_tdata),
   .S_AXIS_0_tready(W_1_4_to_1_5_tready),
   .S_AXIS_0_tvalid(W_1_4_to_1_5_tvalid),

   .S_AXIS_1_tdata(W_0_5_to_1_5_tdata),
   .S_AXIS_1_tready(W_0_5_to_1_5_tready),
   .S_AXIS_1_tvalid(W_0_5_to_1_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_6
 (
   .M_AXIS_0_tdata(W_1_6_to_1_7_tdata),
   .M_AXIS_0_tready(W_1_6_to_1_7_tready),
   .M_AXIS_0_tvalid(W_1_6_to_1_7_tvalid),

   .M_AXIS_1_tdata(W_1_6_to_2_6_tdata),
   .M_AXIS_1_tready(W_1_6_to_2_6_tready),
   .M_AXIS_1_tvalid(W_1_6_to_2_6_tvalid),

   .S_AXIS_0_tdata(W_1_5_to_1_6_tdata),
   .S_AXIS_0_tready(W_1_5_to_1_6_tready),
   .S_AXIS_0_tvalid(W_1_5_to_1_6_tvalid),

   .S_AXIS_1_tdata(W_0_6_to_1_6_tdata),
   .S_AXIS_1_tready(W_0_6_to_1_6_tready),
   .S_AXIS_1_tvalid(W_0_6_to_1_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_m
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(7),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_1_7
 (
   .M_AXIS_1_tdata(W_1_7_to_2_7_tdata),
   .M_AXIS_1_tready(W_1_7_to_2_7_tready),
   .M_AXIS_1_tvalid(W_1_7_to_2_7_tvalid),

   .S_AXIS_0_tdata(W_1_6_to_1_7_tdata),
   .S_AXIS_0_tready(W_1_6_to_1_7_tready),
   .S_AXIS_0_tvalid(W_1_6_to_1_7_tvalid),

   .S_AXIS_1_tdata(W_0_6_to_1_7_tdata),
   .S_AXIS_1_tready(W_0_6_to_1_7_tready),
   .S_AXIS_1_tvalid(W_0_6_to_1_7_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


//Row 2
 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_0
 (
   .M_AXIS_0_tdata(W_2_0_to_2_1_tdata),
   .M_AXIS_0_tready(W_2_0_to_2_1_tready),
   .M_AXIS_0_tvalid(W_2_0_to_2_1_tvalid),

   .M_AXIS_1_tdata(W_2_0_to_3_0_tdata),
   .M_AXIS_1_tready(W_2_0_to_3_0_tready),
   .M_AXIS_1_tvalid(W_2_0_to_3_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_2_tdata),
   .S_AXIS_0_tready(S_AXIS_2_tready),
   .S_AXIS_0_tvalid(S_AXIS_2_tvalid),

   .S_AXIS_1_tdata(W_1_0_to_2_0_tdata),
   .S_AXIS_1_tready(W_1_0_to_2_0_tready),
   .S_AXIS_1_tvalid(W_1_0_to_2_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_1
 (
   .M_AXIS_0_tdata(W_2_1_to_2_2_tdata),
   .M_AXIS_0_tready(W_2_1_to_2_2_tready),
   .M_AXIS_0_tvalid(W_2_1_to_2_2_tvalid),

   .M_AXIS_1_tdata(W_2_1_to_3_1_tdata),
   .M_AXIS_1_tready(W_2_1_to_3_1_tready),
   .M_AXIS_1_tvalid(W_2_1_to_3_1_tvalid),

   .S_AXIS_0_tdata(W_2_0_to_2_1_tdata),
   .S_AXIS_0_tready(W_2_0_to_2_1_tready),
   .S_AXIS_0_tvalid(W_2_0_to_2_1_tvalid),

   .S_AXIS_1_tdata(W_1_1_to_2_1_tdata),
   .S_AXIS_1_tready(W_1_1_to_2_1_tready),
   .S_AXIS_1_tvalid(W_1_1_to_2_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_2
 (
   .M_AXIS_0_tdata(W_2_2_to_2_3_tdata),
   .M_AXIS_0_tready(W_2_2_to_2_3_tready),
   .M_AXIS_0_tvalid(W_2_2_to_2_3_tvalid),

   .M_AXIS_1_tdata(W_2_2_to_3_2_tdata),
   .M_AXIS_1_tready(W_2_2_to_3_2_tready),
   .M_AXIS_1_tvalid(W_2_2_to_3_2_tvalid),

   .S_AXIS_0_tdata(W_2_1_to_2_2_tdata),
   .S_AXIS_0_tready(W_2_1_to_2_2_tready),
   .S_AXIS_0_tvalid(W_2_1_to_2_2_tvalid),

   .S_AXIS_1_tdata(W_1_2_to_2_2_tdata),
   .S_AXIS_1_tready(W_1_2_to_2_2_tready),
   .S_AXIS_1_tvalid(W_1_2_to_2_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_3
 (
   .M_AXIS_0_tdata(W_2_3_to_2_4_tdata),
   .M_AXIS_0_tready(W_2_3_to_2_4_tready),
   .M_AXIS_0_tvalid(W_2_3_to_2_4_tvalid),

   .M_AXIS_1_tdata(W_2_3_to_3_3_tdata),
   .M_AXIS_1_tready(W_2_3_to_3_3_tready),
   .M_AXIS_1_tvalid(W_2_3_to_3_3_tvalid),

   .S_AXIS_0_tdata(W_2_2_to_2_3_tdata),
   .S_AXIS_0_tready(W_2_2_to_2_3_tready),
   .S_AXIS_0_tvalid(W_2_2_to_2_3_tvalid),

   .S_AXIS_1_tdata(W_1_3_to_2_3_tdata),
   .S_AXIS_1_tready(W_1_3_to_2_3_tready),
   .S_AXIS_1_tvalid(W_1_3_to_2_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_4
 (
   .M_AXIS_0_tdata(W_2_4_to_2_5_tdata),
   .M_AXIS_0_tready(W_2_4_to_2_5_tready),
   .M_AXIS_0_tvalid(W_2_4_to_2_5_tvalid),

   .M_AXIS_1_tdata(W_2_4_to_3_4_tdata),
   .M_AXIS_1_tready(W_2_4_to_3_4_tready),
   .M_AXIS_1_tvalid(W_2_4_to_3_4_tvalid),

   .S_AXIS_0_tdata(W_2_3_to_2_4_tdata),
   .S_AXIS_0_tready(W_2_3_to_2_4_tready),
   .S_AXIS_0_tvalid(W_2_3_to_2_4_tvalid),

   .S_AXIS_1_tdata(W_1_4_to_2_4_tdata),
   .S_AXIS_1_tready(W_1_4_to_2_4_tready),
   .S_AXIS_1_tvalid(W_1_4_to_2_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_5
 (
   .M_AXIS_0_tdata(W_2_5_to_2_6_tdata),
   .M_AXIS_0_tready(W_2_5_to_2_6_tready),
   .M_AXIS_0_tvalid(W_2_5_to_2_6_tvalid),

   .M_AXIS_1_tdata(W_2_5_to_3_5_tdata),
   .M_AXIS_1_tready(W_2_5_to_3_5_tready),
   .M_AXIS_1_tvalid(W_2_5_to_3_5_tvalid),

   .S_AXIS_0_tdata(W_2_4_to_2_5_tdata),
   .S_AXIS_0_tready(W_2_4_to_2_5_tready),
   .S_AXIS_0_tvalid(W_2_4_to_2_5_tvalid),

   .S_AXIS_1_tdata(W_1_5_to_2_5_tdata),
   .S_AXIS_1_tready(W_1_5_to_2_5_tready),
   .S_AXIS_1_tvalid(W_1_5_to_2_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_6
 (
   .M_AXIS_0_tdata(W_2_6_to_2_7_tdata),
   .M_AXIS_0_tready(W_2_6_to_2_7_tready),
   .M_AXIS_0_tvalid(W_2_6_to_2_7_tvalid),

   .M_AXIS_1_tdata(W_2_6_to_3_6_tdata),
   .M_AXIS_1_tready(W_2_6_to_3_6_tready),
   .M_AXIS_1_tvalid(W_2_6_to_3_6_tvalid),

   .S_AXIS_0_tdata(W_2_5_to_2_6_tdata),
   .S_AXIS_0_tready(W_2_5_to_2_6_tready),
   .S_AXIS_0_tvalid(W_2_5_to_2_6_tvalid),

   .S_AXIS_1_tdata(W_1_6_to_2_6_tdata),
   .S_AXIS_1_tready(W_1_6_to_2_6_tready),
   .S_AXIS_1_tvalid(W_1_6_to_2_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_m
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(7),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_2_7
 (
   .M_AXIS_1_tdata(W_2_7_to_3_7_tdata),
   .M_AXIS_1_tready(W_2_7_to_3_7_tready),
   .M_AXIS_1_tvalid(W_2_7_to_3_7_tvalid),

   .S_AXIS_0_tdata(W_2_6_to_2_7_tdata),
   .S_AXIS_0_tready(W_2_6_to_2_7_tready),
   .S_AXIS_0_tvalid(W_2_6_to_2_7_tvalid),

   .S_AXIS_1_tdata(W_1_7_to_2_7_tdata),
   .S_AXIS_1_tready(W_1_7_to_2_7_tready),
   .S_AXIS_1_tvalid(W_1_7_to_2_7_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


//Row 3
 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_0
 (
   .M_AXIS_0_tdata(W_3_0_to_3_1_tdata),
   .M_AXIS_0_tready(W_3_0_to_3_1_tready),
   .M_AXIS_0_tvalid(W_3_0_to_3_1_tvalid),

   .M_AXIS_1_tdata(W_3_0_to_4_0_tdata),
   .M_AXIS_1_tready(W_3_0_to_4_0_tready),
   .M_AXIS_1_tvalid(W_3_0_to_4_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_3_tdata),
   .S_AXIS_0_tready(S_AXIS_3_tready),
   .S_AXIS_0_tvalid(S_AXIS_3_tvalid),

   .S_AXIS_1_tdata(W_2_0_to_3_0_tdata),
   .S_AXIS_1_tready(W_2_0_to_3_0_tready),
   .S_AXIS_1_tvalid(W_2_0_to_3_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_1
 (
   .M_AXIS_0_tdata(W_3_1_to_3_2_tdata),
   .M_AXIS_0_tready(W_3_1_to_3_2_tready),
   .M_AXIS_0_tvalid(W_3_1_to_3_2_tvalid),

   .M_AXIS_1_tdata(W_3_1_to_4_1_tdata),
   .M_AXIS_1_tready(W_3_1_to_4_1_tready),
   .M_AXIS_1_tvalid(W_3_1_to_4_1_tvalid),

   .S_AXIS_0_tdata(W_3_0_to_3_1_tdata),
   .S_AXIS_0_tready(W_3_0_to_3_1_tready),
   .S_AXIS_0_tvalid(W_3_0_to_3_1_tvalid),

   .S_AXIS_1_tdata(W_2_1_to_3_1_tdata),
   .S_AXIS_1_tready(W_2_1_to_3_1_tready),
   .S_AXIS_1_tvalid(W_2_1_to_3_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_2
 (
   .M_AXIS_0_tdata(W_3_2_to_3_3_tdata),
   .M_AXIS_0_tready(W_3_2_to_3_3_tready),
   .M_AXIS_0_tvalid(W_3_2_to_3_3_tvalid),

   .M_AXIS_1_tdata(W_3_2_to_4_2_tdata),
   .M_AXIS_1_tready(W_3_2_to_4_2_tready),
   .M_AXIS_1_tvalid(W_3_2_to_4_2_tvalid),

   .S_AXIS_0_tdata(W_3_1_to_3_2_tdata),
   .S_AXIS_0_tready(W_3_1_to_3_2_tready),
   .S_AXIS_0_tvalid(W_3_1_to_3_2_tvalid),

   .S_AXIS_1_tdata(W_2_2_to_3_2_tdata),
   .S_AXIS_1_tready(W_2_2_to_3_2_tready),
   .S_AXIS_1_tvalid(W_2_2_to_3_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_3
 (
   .M_AXIS_0_tdata(W_3_3_to_3_4_tdata),
   .M_AXIS_0_tready(W_3_3_to_3_4_tready),
   .M_AXIS_0_tvalid(W_3_3_to_3_4_tvalid),

   .M_AXIS_1_tdata(W_3_3_to_4_3_tdata),
   .M_AXIS_1_tready(W_3_3_to_4_3_tready),
   .M_AXIS_1_tvalid(W_3_3_to_4_3_tvalid),

   .S_AXIS_0_tdata(W_3_2_to_3_3_tdata),
   .S_AXIS_0_tready(W_3_2_to_3_3_tready),
   .S_AXIS_0_tvalid(W_3_2_to_3_3_tvalid),

   .S_AXIS_1_tdata(W_2_3_to_3_3_tdata),
   .S_AXIS_1_tready(W_2_3_to_3_3_tready),
   .S_AXIS_1_tvalid(W_2_3_to_3_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_4
 (
   .M_AXIS_0_tdata(W_3_4_to_3_5_tdata),
   .M_AXIS_0_tready(W_3_4_to_3_5_tready),
   .M_AXIS_0_tvalid(W_3_4_to_3_5_tvalid),

   .M_AXIS_1_tdata(W_3_4_to_4_4_tdata),
   .M_AXIS_1_tready(W_3_4_to_4_4_tready),
   .M_AXIS_1_tvalid(W_3_4_to_4_4_tvalid),

   .S_AXIS_0_tdata(W_3_3_to_3_4_tdata),
   .S_AXIS_0_tready(W_3_3_to_3_4_tready),
   .S_AXIS_0_tvalid(W_3_3_to_3_4_tvalid),

   .S_AXIS_1_tdata(W_2_4_to_3_4_tdata),
   .S_AXIS_1_tready(W_2_4_to_3_4_tready),
   .S_AXIS_1_tvalid(W_2_4_to_3_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_5
 (
   .M_AXIS_0_tdata(W_3_5_to_3_6_tdata),
   .M_AXIS_0_tready(W_3_5_to_3_6_tready),
   .M_AXIS_0_tvalid(W_3_5_to_3_6_tvalid),

   .M_AXIS_1_tdata(W_3_5_to_4_5_tdata),
   .M_AXIS_1_tready(W_3_5_to_4_5_tready),
   .M_AXIS_1_tvalid(W_3_5_to_4_5_tvalid),

   .S_AXIS_0_tdata(W_3_4_to_3_5_tdata),
   .S_AXIS_0_tready(W_3_4_to_3_5_tready),
   .S_AXIS_0_tvalid(W_3_4_to_3_5_tvalid),

   .S_AXIS_1_tdata(W_2_5_to_3_5_tdata),
   .S_AXIS_1_tready(W_2_5_to_3_5_tready),
   .S_AXIS_1_tvalid(W_2_5_to_3_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_6
 (
   .M_AXIS_0_tdata(W_3_6_to_3_7_tdata),
   .M_AXIS_0_tready(W_3_6_to_3_7_tready),
   .M_AXIS_0_tvalid(W_3_6_to_3_7_tvalid),

   .M_AXIS_1_tdata(W_3_6_to_4_6_tdata),
   .M_AXIS_1_tready(W_3_6_to_4_6_tready),
   .M_AXIS_1_tvalid(W_3_6_to_4_6_tvalid),

   .S_AXIS_0_tdata(W_3_5_to_3_6_tdata),
   .S_AXIS_0_tready(W_3_5_to_3_6_tready),
   .S_AXIS_0_tvalid(W_3_5_to_3_6_tvalid),

   .S_AXIS_1_tdata(W_2_6_to_3_6_tdata),
   .S_AXIS_1_tready(W_2_6_to_3_6_tready),
   .S_AXIS_1_tvalid(W_2_6_to_3_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_m
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(7),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_3_7
 (
   .M_AXIS_1_tdata(W_3_7_to_4_7_tdata),
   .M_AXIS_1_tready(W_3_7_to_4_7_tready),
   .M_AXIS_1_tvalid(W_3_7_to_4_7_tvalid),

   .S_AXIS_0_tdata(W_3_6_to_3_7_tdata),
   .S_AXIS_0_tready(W_3_6_to_3_7_tready),
   .S_AXIS_0_tvalid(W_3_6_to_3_7_tvalid),

   .S_AXIS_1_tdata(W_2_7_to_3_7_tdata),
   .S_AXIS_1_tready(W_2_7_to_3_7_tready),
   .S_AXIS_1_tvalid(W_2_7_to_3_7_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


//Row 4
 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_0
 (
   .M_AXIS_0_tdata(W_4_0_to_4_1_tdata),
   .M_AXIS_0_tready(W_4_0_to_4_1_tready),
   .M_AXIS_0_tvalid(W_4_0_to_4_1_tvalid),

   .M_AXIS_1_tdata(W_4_0_to_5_0_tdata),
   .M_AXIS_1_tready(W_4_0_to_5_0_tready),
   .M_AXIS_1_tvalid(W_4_0_to_5_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_4_tdata),
   .S_AXIS_0_tready(S_AXIS_4_tready),
   .S_AXIS_0_tvalid(S_AXIS_4_tvalid),

   .S_AXIS_1_tdata(W_3_0_to_4_0_tdata),
   .S_AXIS_1_tready(W_3_0_to_4_0_tready),
   .S_AXIS_1_tvalid(W_3_0_to_4_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_1
 (
   .M_AXIS_0_tdata(W_4_1_to_4_2_tdata),
   .M_AXIS_0_tready(W_4_1_to_4_2_tready),
   .M_AXIS_0_tvalid(W_4_1_to_4_2_tvalid),

   .M_AXIS_1_tdata(W_4_1_to_5_1_tdata),
   .M_AXIS_1_tready(W_4_1_to_5_1_tready),
   .M_AXIS_1_tvalid(W_4_1_to_5_1_tvalid),

   .S_AXIS_0_tdata(W_4_0_to_4_1_tdata),
   .S_AXIS_0_tready(W_4_0_to_4_1_tready),
   .S_AXIS_0_tvalid(W_4_0_to_4_1_tvalid),

   .S_AXIS_1_tdata(W_3_1_to_4_1_tdata),
   .S_AXIS_1_tready(W_3_1_to_4_1_tready),
   .S_AXIS_1_tvalid(W_3_1_to_4_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_2
 (
   .M_AXIS_0_tdata(W_4_2_to_4_3_tdata),
   .M_AXIS_0_tready(W_4_2_to_4_3_tready),
   .M_AXIS_0_tvalid(W_4_2_to_4_3_tvalid),

   .M_AXIS_1_tdata(W_4_2_to_5_2_tdata),
   .M_AXIS_1_tready(W_4_2_to_5_2_tready),
   .M_AXIS_1_tvalid(W_4_2_to_5_2_tvalid),

   .S_AXIS_0_tdata(W_4_1_to_4_2_tdata),
   .S_AXIS_0_tready(W_4_1_to_4_2_tready),
   .S_AXIS_0_tvalid(W_4_1_to_4_2_tvalid),

   .S_AXIS_1_tdata(W_3_2_to_4_2_tdata),
   .S_AXIS_1_tready(W_3_2_to_4_2_tready),
   .S_AXIS_1_tvalid(W_3_2_to_4_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_3
 (
   .M_AXIS_0_tdata(W_4_3_to_4_4_tdata),
   .M_AXIS_0_tready(W_4_3_to_4_4_tready),
   .M_AXIS_0_tvalid(W_4_3_to_4_4_tvalid),

   .M_AXIS_1_tdata(W_4_3_to_5_3_tdata),
   .M_AXIS_1_tready(W_4_3_to_5_3_tready),
   .M_AXIS_1_tvalid(W_4_3_to_5_3_tvalid),

   .S_AXIS_0_tdata(W_4_2_to_4_3_tdata),
   .S_AXIS_0_tready(W_4_2_to_4_3_tready),
   .S_AXIS_0_tvalid(W_4_2_to_4_3_tvalid),

   .S_AXIS_1_tdata(W_3_3_to_4_3_tdata),
   .S_AXIS_1_tready(W_3_3_to_4_3_tready),
   .S_AXIS_1_tvalid(W_3_3_to_4_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_4
 (
   .M_AXIS_0_tdata(W_4_4_to_4_5_tdata),
   .M_AXIS_0_tready(W_4_4_to_4_5_tready),
   .M_AXIS_0_tvalid(W_4_4_to_4_5_tvalid),

   .M_AXIS_1_tdata(W_4_4_to_5_4_tdata),
   .M_AXIS_1_tready(W_4_4_to_5_4_tready),
   .M_AXIS_1_tvalid(W_4_4_to_5_4_tvalid),

   .S_AXIS_0_tdata(W_4_3_to_4_4_tdata),
   .S_AXIS_0_tready(W_4_3_to_4_4_tready),
   .S_AXIS_0_tvalid(W_4_3_to_4_4_tvalid),

   .S_AXIS_1_tdata(W_3_4_to_4_4_tdata),
   .S_AXIS_1_tready(W_3_4_to_4_4_tready),
   .S_AXIS_1_tvalid(W_3_4_to_4_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_5
 (
   .M_AXIS_0_tdata(W_4_5_to_4_6_tdata),
   .M_AXIS_0_tready(W_4_5_to_4_6_tready),
   .M_AXIS_0_tvalid(W_4_5_to_4_6_tvalid),

   .M_AXIS_1_tdata(W_4_5_to_5_5_tdata),
   .M_AXIS_1_tready(W_4_5_to_5_5_tready),
   .M_AXIS_1_tvalid(W_4_5_to_5_5_tvalid),

   .S_AXIS_0_tdata(W_4_4_to_4_5_tdata),
   .S_AXIS_0_tready(W_4_4_to_4_5_tready),
   .S_AXIS_0_tvalid(W_4_4_to_4_5_tvalid),

   .S_AXIS_1_tdata(W_3_5_to_4_5_tdata),
   .S_AXIS_1_tready(W_3_5_to_4_5_tready),
   .S_AXIS_1_tvalid(W_3_5_to_4_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_6
 (
   .M_AXIS_0_tdata(W_4_6_to_4_7_tdata),
   .M_AXIS_0_tready(W_4_6_to_4_7_tready),
   .M_AXIS_0_tvalid(W_4_6_to_4_7_tvalid),

   .M_AXIS_1_tdata(W_4_6_to_5_6_tdata),
   .M_AXIS_1_tready(W_4_6_to_5_6_tready),
   .M_AXIS_1_tvalid(W_4_6_to_5_6_tvalid),

   .S_AXIS_0_tdata(W_4_5_to_4_6_tdata),
   .S_AXIS_0_tready(W_4_5_to_4_6_tready),
   .S_AXIS_0_tvalid(W_4_5_to_4_6_tvalid),

   .S_AXIS_1_tdata(W_3_6_to_4_6_tdata),
   .S_AXIS_1_tready(W_3_6_to_4_6_tready),
   .S_AXIS_1_tvalid(W_3_6_to_4_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_m
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(7),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_4_7
 (
   .M_AXIS_1_tdata(W_4_7_to_5_7_tdata),
   .M_AXIS_1_tready(W_4_7_to_5_7_tready),
   .M_AXIS_1_tvalid(W_4_7_to_5_7_tvalid),

   .S_AXIS_0_tdata(W_4_6_to_4_7_tdata),
   .S_AXIS_0_tready(W_4_6_to_4_7_tready),
   .S_AXIS_0_tvalid(W_4_6_to_4_7_tvalid),

   .S_AXIS_1_tdata(W_3_7_to_4_7_tdata),
   .S_AXIS_1_tready(W_3_7_to_4_7_tready),
   .S_AXIS_1_tvalid(W_3_7_to_4_7_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


//Row 5
 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_0
 (
   .M_AXIS_0_tdata(W_5_0_to_5_1_tdata),
   .M_AXIS_0_tready(W_5_0_to_5_1_tready),
   .M_AXIS_0_tvalid(W_5_0_to_5_1_tvalid),

   .M_AXIS_1_tdata(W_5_0_to_6_0_tdata),
   .M_AXIS_1_tready(W_5_0_to_6_0_tready),
   .M_AXIS_1_tvalid(W_5_0_to_6_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_5_tdata),
   .S_AXIS_0_tready(S_AXIS_5_tready),
   .S_AXIS_0_tvalid(S_AXIS_5_tvalid),

   .S_AXIS_1_tdata(W_4_0_to_5_0_tdata),
   .S_AXIS_1_tready(W_4_0_to_5_0_tready),
   .S_AXIS_1_tvalid(W_4_0_to_5_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_1
 (
   .M_AXIS_0_tdata(W_5_1_to_5_2_tdata),
   .M_AXIS_0_tready(W_5_1_to_5_2_tready),
   .M_AXIS_0_tvalid(W_5_1_to_5_2_tvalid),

   .M_AXIS_1_tdata(W_5_1_to_6_1_tdata),
   .M_AXIS_1_tready(W_5_1_to_6_1_tready),
   .M_AXIS_1_tvalid(W_5_1_to_6_1_tvalid),

   .S_AXIS_0_tdata(W_5_0_to_5_1_tdata),
   .S_AXIS_0_tready(W_5_0_to_5_1_tready),
   .S_AXIS_0_tvalid(W_5_0_to_5_1_tvalid),

   .S_AXIS_1_tdata(W_4_1_to_5_1_tdata),
   .S_AXIS_1_tready(W_4_1_to_5_1_tready),
   .S_AXIS_1_tvalid(W_4_1_to_5_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_2
 (
   .M_AXIS_0_tdata(W_5_2_to_5_3_tdata),
   .M_AXIS_0_tready(W_5_2_to_5_3_tready),
   .M_AXIS_0_tvalid(W_5_2_to_5_3_tvalid),

   .M_AXIS_1_tdata(W_5_2_to_6_2_tdata),
   .M_AXIS_1_tready(W_5_2_to_6_2_tready),
   .M_AXIS_1_tvalid(W_5_2_to_6_2_tvalid),

   .S_AXIS_0_tdata(W_5_1_to_5_2_tdata),
   .S_AXIS_0_tready(W_5_1_to_5_2_tready),
   .S_AXIS_0_tvalid(W_5_1_to_5_2_tvalid),

   .S_AXIS_1_tdata(W_4_2_to_5_2_tdata),
   .S_AXIS_1_tready(W_4_2_to_5_2_tready),
   .S_AXIS_1_tvalid(W_4_2_to_5_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_3
 (
   .M_AXIS_0_tdata(W_5_3_to_5_4_tdata),
   .M_AXIS_0_tready(W_5_3_to_5_4_tready),
   .M_AXIS_0_tvalid(W_5_3_to_5_4_tvalid),

   .M_AXIS_1_tdata(W_5_3_to_6_3_tdata),
   .M_AXIS_1_tready(W_5_3_to_6_3_tready),
   .M_AXIS_1_tvalid(W_5_3_to_6_3_tvalid),

   .S_AXIS_0_tdata(W_5_2_to_5_3_tdata),
   .S_AXIS_0_tready(W_5_2_to_5_3_tready),
   .S_AXIS_0_tvalid(W_5_2_to_5_3_tvalid),

   .S_AXIS_1_tdata(W_4_3_to_5_3_tdata),
   .S_AXIS_1_tready(W_4_3_to_5_3_tready),
   .S_AXIS_1_tvalid(W_4_3_to_5_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_4
 (
   .M_AXIS_0_tdata(W_5_4_to_5_5_tdata),
   .M_AXIS_0_tready(W_5_4_to_5_5_tready),
   .M_AXIS_0_tvalid(W_5_4_to_5_5_tvalid),

   .M_AXIS_1_tdata(W_5_4_to_6_4_tdata),
   .M_AXIS_1_tready(W_5_4_to_6_4_tready),
   .M_AXIS_1_tvalid(W_5_4_to_6_4_tvalid),

   .S_AXIS_0_tdata(W_5_3_to_5_4_tdata),
   .S_AXIS_0_tready(W_5_3_to_5_4_tready),
   .S_AXIS_0_tvalid(W_5_3_to_5_4_tvalid),

   .S_AXIS_1_tdata(W_4_4_to_5_4_tdata),
   .S_AXIS_1_tready(W_4_4_to_5_4_tready),
   .S_AXIS_1_tvalid(W_4_4_to_5_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_5
 (
   .M_AXIS_0_tdata(W_5_5_to_5_6_tdata),
   .M_AXIS_0_tready(W_5_5_to_5_6_tready),
   .M_AXIS_0_tvalid(W_5_5_to_5_6_tvalid),

   .M_AXIS_1_tdata(W_5_5_to_6_5_tdata),
   .M_AXIS_1_tready(W_5_5_to_6_5_tready),
   .M_AXIS_1_tvalid(W_5_5_to_6_5_tvalid),

   .S_AXIS_0_tdata(W_5_4_to_5_5_tdata),
   .S_AXIS_0_tready(W_5_4_to_5_5_tready),
   .S_AXIS_0_tvalid(W_5_4_to_5_5_tvalid),

   .S_AXIS_1_tdata(W_4_5_to_5_5_tdata),
   .S_AXIS_1_tready(W_4_5_to_5_5_tready),
   .S_AXIS_1_tvalid(W_4_5_to_5_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_6
 (
   .M_AXIS_0_tdata(W_5_6_to_5_7_tdata),
   .M_AXIS_0_tready(W_5_6_to_5_7_tready),
   .M_AXIS_0_tvalid(W_5_6_to_5_7_tvalid),

   .M_AXIS_1_tdata(W_5_6_to_6_6_tdata),
   .M_AXIS_1_tready(W_5_6_to_6_6_tready),
   .M_AXIS_1_tvalid(W_5_6_to_6_6_tvalid),

   .S_AXIS_0_tdata(W_5_5_to_5_6_tdata),
   .S_AXIS_0_tready(W_5_5_to_5_6_tready),
   .S_AXIS_0_tvalid(W_5_5_to_5_6_tvalid),

   .S_AXIS_1_tdata(W_4_6_to_5_6_tdata),
   .S_AXIS_1_tready(W_4_6_to_5_6_tready),
   .S_AXIS_1_tvalid(W_4_6_to_5_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_m
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(7),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_5_7
 (
   .M_AXIS_1_tdata(W_5_7_to_6_7_tdata),
   .M_AXIS_1_tready(W_5_7_to_6_7_tready),
   .M_AXIS_1_tvalid(W_5_7_to_6_7_tvalid),

   .S_AXIS_0_tdata(W_5_6_to_5_7_tdata),
   .S_AXIS_0_tready(W_5_6_to_5_7_tready),
   .S_AXIS_0_tvalid(W_5_6_to_5_7_tvalid),

   .S_AXIS_1_tdata(W_4_7_to_5_7_tdata),
   .S_AXIS_1_tready(W_4_7_to_5_7_tready),
   .S_AXIS_1_tvalid(W_4_7_to_5_7_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


//Row 6
 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_0
 (
   .M_AXIS_0_tdata(W_6_0_to_6_1_tdata),
   .M_AXIS_0_tready(W_6_0_to_6_1_tready),
   .M_AXIS_0_tvalid(W_6_0_to_6_1_tvalid),

   .M_AXIS_1_tdata(W_6_0_to_7_0_tdata),
   .M_AXIS_1_tready(W_6_0_to_7_0_tready),
   .M_AXIS_1_tvalid(W_6_0_to_7_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_6_tdata),
   .S_AXIS_0_tready(S_AXIS_6_tready),
   .S_AXIS_0_tvalid(S_AXIS_6_tvalid),

   .S_AXIS_1_tdata(W_5_0_to_6_0_tdata),
   .S_AXIS_1_tready(W_5_0_to_6_0_tready),
   .S_AXIS_1_tvalid(W_5_0_to_6_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_1
 (
   .M_AXIS_0_tdata(W_6_1_to_6_2_tdata),
   .M_AXIS_0_tready(W_6_1_to_6_2_tready),
   .M_AXIS_0_tvalid(W_6_1_to_6_2_tvalid),

   .M_AXIS_1_tdata(W_6_1_to_7_1_tdata),
   .M_AXIS_1_tready(W_6_1_to_7_1_tready),
   .M_AXIS_1_tvalid(W_6_1_to_7_1_tvalid),

   .S_AXIS_0_tdata(W_6_0_to_6_1_tdata),
   .S_AXIS_0_tready(W_6_0_to_6_1_tready),
   .S_AXIS_0_tvalid(W_6_0_to_6_1_tvalid),

   .S_AXIS_1_tdata(W_5_1_to_6_1_tdata),
   .S_AXIS_1_tready(W_5_1_to_6_1_tready),
   .S_AXIS_1_tvalid(W_5_1_to_6_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_2
 (
   .M_AXIS_0_tdata(W_6_2_to_6_3_tdata),
   .M_AXIS_0_tready(W_6_2_to_6_3_tready),
   .M_AXIS_0_tvalid(W_6_2_to_6_3_tvalid),

   .M_AXIS_1_tdata(W_6_2_to_7_2_tdata),
   .M_AXIS_1_tready(W_6_2_to_7_2_tready),
   .M_AXIS_1_tvalid(W_6_2_to_7_2_tvalid),

   .S_AXIS_0_tdata(W_6_1_to_6_2_tdata),
   .S_AXIS_0_tready(W_6_1_to_6_2_tready),
   .S_AXIS_0_tvalid(W_6_1_to_6_2_tvalid),

   .S_AXIS_1_tdata(W_5_2_to_6_2_tdata),
   .S_AXIS_1_tready(W_5_2_to_6_2_tready),
   .S_AXIS_1_tvalid(W_5_2_to_6_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_3
 (
   .M_AXIS_0_tdata(W_6_3_to_6_4_tdata),
   .M_AXIS_0_tready(W_6_3_to_6_4_tready),
   .M_AXIS_0_tvalid(W_6_3_to_6_4_tvalid),

   .M_AXIS_1_tdata(W_6_3_to_7_3_tdata),
   .M_AXIS_1_tready(W_6_3_to_7_3_tready),
   .M_AXIS_1_tvalid(W_6_3_to_7_3_tvalid),

   .S_AXIS_0_tdata(W_6_2_to_6_3_tdata),
   .S_AXIS_0_tready(W_6_2_to_6_3_tready),
   .S_AXIS_0_tvalid(W_6_2_to_6_3_tvalid),

   .S_AXIS_1_tdata(W_5_3_to_6_3_tdata),
   .S_AXIS_1_tready(W_5_3_to_6_3_tready),
   .S_AXIS_1_tvalid(W_5_3_to_6_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_4
 (
   .M_AXIS_0_tdata(W_6_4_to_6_5_tdata),
   .M_AXIS_0_tready(W_6_4_to_6_5_tready),
   .M_AXIS_0_tvalid(W_6_4_to_6_5_tvalid),

   .M_AXIS_1_tdata(W_6_4_to_7_4_tdata),
   .M_AXIS_1_tready(W_6_4_to_7_4_tready),
   .M_AXIS_1_tvalid(W_6_4_to_7_4_tvalid),

   .S_AXIS_0_tdata(W_6_3_to_6_4_tdata),
   .S_AXIS_0_tready(W_6_3_to_6_4_tready),
   .S_AXIS_0_tvalid(W_6_3_to_6_4_tvalid),

   .S_AXIS_1_tdata(W_5_4_to_6_4_tdata),
   .S_AXIS_1_tready(W_5_4_to_6_4_tready),
   .S_AXIS_1_tvalid(W_5_4_to_6_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_5
 (
   .M_AXIS_0_tdata(W_6_5_to_6_6_tdata),
   .M_AXIS_0_tready(W_6_5_to_6_6_tready),
   .M_AXIS_0_tvalid(W_6_5_to_6_6_tvalid),

   .M_AXIS_1_tdata(W_6_5_to_7_5_tdata),
   .M_AXIS_1_tready(W_6_5_to_7_5_tready),
   .M_AXIS_1_tvalid(W_6_5_to_7_5_tvalid),

   .S_AXIS_0_tdata(W_6_4_to_6_5_tdata),
   .S_AXIS_0_tready(W_6_4_to_6_5_tready),
   .S_AXIS_0_tvalid(W_6_4_to_6_5_tvalid),

   .S_AXIS_1_tdata(W_5_5_to_6_5_tdata),
   .S_AXIS_1_tready(W_5_5_to_6_5_tready),
   .S_AXIS_1_tvalid(W_5_5_to_6_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_6
 (
   .M_AXIS_0_tdata(W_6_6_to_6_7_tdata),
   .M_AXIS_0_tready(W_6_6_to_6_7_tready),
   .M_AXIS_0_tvalid(W_6_6_to_6_7_tvalid),

   .M_AXIS_1_tdata(W_6_6_to_7_6_tdata),
   .M_AXIS_1_tready(W_6_6_to_7_6_tready),
   .M_AXIS_1_tvalid(W_6_6_to_7_6_tvalid),

   .S_AXIS_0_tdata(W_6_5_to_6_6_tdata),
   .S_AXIS_0_tready(W_6_5_to_6_6_tready),
   .S_AXIS_0_tvalid(W_6_5_to_6_6_tvalid),

   .S_AXIS_1_tdata(W_5_6_to_6_6_tdata),
   .S_AXIS_1_tready(W_5_6_to_6_6_tready),
   .S_AXIS_1_tvalid(W_5_6_to_6_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_m
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(7),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_6_7
 (
   .M_AXIS_1_tdata(W_6_7_to_7_7_tdata),
   .M_AXIS_1_tready(W_6_7_to_7_7_tready),
   .M_AXIS_1_tvalid(W_6_7_to_7_7_tvalid),

   .S_AXIS_0_tdata(W_6_6_to_6_7_tdata),
   .S_AXIS_0_tready(W_6_6_to_6_7_tready),
   .S_AXIS_0_tvalid(W_6_6_to_6_7_tvalid),

   .S_AXIS_1_tdata(W_5_7_to_6_7_tdata),
   .S_AXIS_1_tready(W_5_7_to_6_7_tready),
   .S_AXIS_1_tvalid(W_5_7_to_6_7_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


//Row 7
 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(0),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_0
 (
   .M_AXIS_0_tdata(W_7_0_to_7_1_tdata),
   .M_AXIS_0_tready(W_7_0_to_7_1_tready),
   .M_AXIS_0_tvalid(W_7_0_to_7_1_tvalid),

   .M_AXIS_1_tdata(M_AXIS_0_tdata),
   .M_AXIS_1_tready(M_AXIS_0_tready),
   .M_AXIS_1_tvalid(M_AXIS_0_tvalid),

   .S_AXIS_0_tdata(S_AXIS_7_tdata),
   .S_AXIS_0_tready(S_AXIS_7_tready),
   .S_AXIS_0_tvalid(S_AXIS_7_tvalid),

   .S_AXIS_1_tdata(W_6_0_to_7_0_tdata),
   .S_AXIS_1_tready(W_6_0_to_7_0_tready),
   .S_AXIS_1_tvalid(W_6_0_to_7_0_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(1),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_1
 (
   .M_AXIS_0_tdata(W_7_1_to_7_2_tdata),
   .M_AXIS_0_tready(W_7_1_to_7_2_tready),
   .M_AXIS_0_tvalid(W_7_1_to_7_2_tvalid),

   .M_AXIS_1_tdata(M_AXIS_1_tdata),
   .M_AXIS_1_tready(M_AXIS_1_tready),
   .M_AXIS_1_tvalid(M_AXIS_1_tvalid),

   .S_AXIS_0_tdata(W_7_0_to_7_1_tdata),
   .S_AXIS_0_tready(W_7_0_to_7_1_tready),
   .S_AXIS_0_tvalid(W_7_0_to_7_1_tvalid),

   .S_AXIS_1_tdata(W_6_1_to_7_1_tdata),
   .S_AXIS_1_tready(W_6_1_to_7_1_tready),
   .S_AXIS_1_tvalid(W_6_1_to_7_1_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(2),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_2
 (
   .M_AXIS_0_tdata(W_7_2_to_7_3_tdata),
   .M_AXIS_0_tready(W_7_2_to_7_3_tready),
   .M_AXIS_0_tvalid(W_7_2_to_7_3_tvalid),

   .M_AXIS_1_tdata(M_AXIS_2_tdata),
   .M_AXIS_1_tready(M_AXIS_2_tready),
   .M_AXIS_1_tvalid(M_AXIS_2_tvalid),

   .S_AXIS_0_tdata(W_7_1_to_7_2_tdata),
   .S_AXIS_0_tready(W_7_1_to_7_2_tready),
   .S_AXIS_0_tvalid(W_7_1_to_7_2_tvalid),

   .S_AXIS_1_tdata(W_6_2_to_7_2_tdata),
   .S_AXIS_1_tready(W_6_2_to_7_2_tready),
   .S_AXIS_1_tvalid(W_6_2_to_7_2_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(3),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_3
 (
   .M_AXIS_0_tdata(W_7_3_to_7_4_tdata),
   .M_AXIS_0_tready(W_7_3_to_7_4_tready),
   .M_AXIS_0_tvalid(W_7_3_to_7_4_tvalid),

   .M_AXIS_1_tdata(M_AXIS_3_tdata),
   .M_AXIS_1_tready(M_AXIS_3_tready),
   .M_AXIS_1_tvalid(M_AXIS_3_tvalid),

   .S_AXIS_0_tdata(W_7_2_to_7_3_tdata),
   .S_AXIS_0_tready(W_7_2_to_7_3_tready),
   .S_AXIS_0_tvalid(W_7_2_to_7_3_tvalid),

   .S_AXIS_1_tdata(W_6_3_to_7_3_tdata),
   .S_AXIS_1_tready(W_6_3_to_7_3_tready),
   .S_AXIS_1_tvalid(W_6_3_to_7_3_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(4),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_4
 (
   .M_AXIS_0_tdata(W_7_4_to_7_5_tdata),
   .M_AXIS_0_tready(W_7_4_to_7_5_tready),
   .M_AXIS_0_tvalid(W_7_4_to_7_5_tvalid),

   .M_AXIS_1_tdata(M_AXIS_4_tdata),
   .M_AXIS_1_tready(M_AXIS_4_tready),
   .M_AXIS_1_tvalid(M_AXIS_4_tvalid),

   .S_AXIS_0_tdata(W_7_3_to_7_4_tdata),
   .S_AXIS_0_tready(W_7_3_to_7_4_tready),
   .S_AXIS_0_tvalid(W_7_3_to_7_4_tvalid),

   .S_AXIS_1_tdata(W_6_4_to_7_4_tdata),
   .S_AXIS_1_tready(W_6_4_to_7_4_tready),
   .S_AXIS_1_tvalid(W_6_4_to_7_4_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(5),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_5
 (
   .M_AXIS_0_tdata(W_7_5_to_7_6_tdata),
   .M_AXIS_0_tready(W_7_5_to_7_6_tready),
   .M_AXIS_0_tvalid(W_7_5_to_7_6_tvalid),

   .M_AXIS_1_tdata(M_AXIS_5_tdata),
   .M_AXIS_1_tready(M_AXIS_5_tready),
   .M_AXIS_1_tvalid(M_AXIS_5_tvalid),

   .S_AXIS_0_tdata(W_7_4_to_7_5_tdata),
   .S_AXIS_0_tready(W_7_4_to_7_5_tready),
   .S_AXIS_0_tvalid(W_7_4_to_7_5_tvalid),

   .S_AXIS_1_tdata(W_6_5_to_7_5_tdata),
   .S_AXIS_1_tready(W_6_5_to_7_5_tready),
   .S_AXIS_1_tvalid(W_6_5_to_7_5_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(6),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_6
 (
   .M_AXIS_0_tdata(W_7_6_to_7_7_tdata),
   .M_AXIS_0_tready(W_7_6_to_7_7_tready),
   .M_AXIS_0_tvalid(W_7_6_to_7_7_tvalid),

   .M_AXIS_1_tdata(M_AXIS_6_tdata),
   .M_AXIS_1_tready(M_AXIS_6_tready),
   .M_AXIS_1_tvalid(M_AXIS_6_tvalid),

   .S_AXIS_0_tdata(W_7_5_to_7_6_tdata),
   .S_AXIS_0_tready(W_7_5_to_7_6_tready),
   .S_AXIS_0_tvalid(W_7_5_to_7_6_tvalid),

   .S_AXIS_1_tdata(W_6_6_to_7_6_tdata),
   .S_AXIS_1_tready(W_6_6_to_7_6_tready),
   .S_AXIS_1_tvalid(W_6_6_to_7_6_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 

 switch_m
  #(
   .DATA_WIDTH(DATA_WIDTH),
   .ADDR_WIDTH(ADDR_WIDTH),
   .DEPTH(DEPTH),
   .ID(7),
   .N(N),
   .M(M),
   .C_nR(C_nR),
   .C(C),
   .R(R)
 )
 S_7_7
 (
   .M_AXIS_1_tdata(M_AXIS_7_tdata),
   .M_AXIS_1_tready(M_AXIS_7_tready),
   .M_AXIS_1_tvalid(M_AXIS_7_tvalid),

   .S_AXIS_0_tdata(W_7_6_to_7_7_tdata),
   .S_AXIS_0_tready(W_7_6_to_7_7_tready),
   .S_AXIS_0_tvalid(W_7_6_to_7_7_tvalid),

   .S_AXIS_1_tdata(W_6_7_to_7_7_tdata),
   .S_AXIS_1_tready(W_6_7_to_7_7_tready),
   .S_AXIS_1_tvalid(W_6_7_to_7_7_tvalid),

   .aclk_0(aclk_0),
   .aresetn_0(aresetn_0)
 ); 


endmodule
