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

module noc_wrapper
#(
  DATA_WIDTH = 64,
  ADDR_WIDTH = 1,
  DEPTH = 2**ADDR_WIDTH,
  N = 8,
  M = 8,
  C_nR = 1,
  C = 0,
  R = 16
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

 wire [DATA_WIDTH-1:0] EB_to_NOC_in_0_tdata;
 wire EB_to_NOC_in_0_tready;
 wire EB_to_NOC_in_0_tvalid;
 wire [DATA_WIDTH-1:0] EB_to_NOC_in_1_tdata;
 wire EB_to_NOC_in_1_tready;
 wire EB_to_NOC_in_1_tvalid;
 wire [DATA_WIDTH-1:0] EB_to_NOC_in_2_tdata;
 wire EB_to_NOC_in_2_tready;
 wire EB_to_NOC_in_2_tvalid;
 wire [DATA_WIDTH-1:0] EB_to_NOC_in_3_tdata;
 wire EB_to_NOC_in_3_tready;
 wire EB_to_NOC_in_3_tvalid;
 wire [DATA_WIDTH-1:0] EB_to_NOC_in_4_tdata;
 wire EB_to_NOC_in_4_tready;
 wire EB_to_NOC_in_4_tvalid;
 wire [DATA_WIDTH-1:0] EB_to_NOC_in_5_tdata;
 wire EB_to_NOC_in_5_tready;
 wire EB_to_NOC_in_5_tvalid;
 wire [DATA_WIDTH-1:0] EB_to_NOC_in_6_tdata;
 wire EB_to_NOC_in_6_tready;
 wire EB_to_NOC_in_6_tvalid;
 wire [DATA_WIDTH-1:0] EB_to_NOC_in_7_tdata;
 wire EB_to_NOC_in_7_tready;
 wire EB_to_NOC_in_7_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_0_tdata;
 wire NOC_out_to_EB_0_tready;
 wire NOC_out_to_EB_0_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_1_tdata;
 wire NOC_out_to_EB_1_tready;
 wire NOC_out_to_EB_1_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_2_tdata;
 wire NOC_out_to_EB_2_tready;
 wire NOC_out_to_EB_2_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_3_tdata;
 wire NOC_out_to_EB_3_tready;
 wire NOC_out_to_EB_3_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_4_tdata;
 wire NOC_out_to_EB_4_tready;
 wire NOC_out_to_EB_4_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_5_tdata;
 wire NOC_out_to_EB_5_tready;
 wire NOC_out_to_EB_5_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_6_tdata;
 wire NOC_out_to_EB_6_tready;
 wire NOC_out_to_EB_6_tvalid;
 wire [DATA_WIDTH-1:0] NOC_out_to_EB_7_tdata;
 wire NOC_out_to_EB_7_tready;
 wire NOC_out_to_EB_7_tvalid;

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_0
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_0_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_0_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_0_tvalid),
    .S_AXIS_0_tdata(S_AXIS_0_tdata),
    .S_AXIS_0_tready(S_AXIS_0_tready),
    .S_AXIS_0_tvalid(S_AXIS_0_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_1
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_1_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_1_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_1_tvalid),
    .S_AXIS_0_tdata(S_AXIS_1_tdata),
    .S_AXIS_0_tready(S_AXIS_1_tready),
    .S_AXIS_0_tvalid(S_AXIS_1_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_2
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_2_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_2_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_2_tvalid),
    .S_AXIS_0_tdata(S_AXIS_2_tdata),
    .S_AXIS_0_tready(S_AXIS_2_tready),
    .S_AXIS_0_tvalid(S_AXIS_2_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_3
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_3_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_3_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_3_tvalid),
    .S_AXIS_0_tdata(S_AXIS_3_tdata),
    .S_AXIS_0_tready(S_AXIS_3_tready),
    .S_AXIS_0_tvalid(S_AXIS_3_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_4
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_4_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_4_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_4_tvalid),
    .S_AXIS_0_tdata(S_AXIS_4_tdata),
    .S_AXIS_0_tready(S_AXIS_4_tready),
    .S_AXIS_0_tvalid(S_AXIS_4_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_5
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_5_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_5_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_5_tvalid),
    .S_AXIS_0_tdata(S_AXIS_5_tdata),
    .S_AXIS_0_tready(S_AXIS_5_tready),
    .S_AXIS_0_tvalid(S_AXIS_5_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_6
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_6_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_6_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_6_tvalid),
    .S_AXIS_0_tdata(S_AXIS_6_tdata),
    .S_AXIS_0_tready(S_AXIS_6_tready),
    .S_AXIS_0_tvalid(S_AXIS_6_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_input_7
  (
    .M_AXIS_0_tdata(EB_to_NOC_in_7_tdata),
    .M_AXIS_0_tready(EB_to_NOC_in_7_tready),
    .M_AXIS_0_tvalid(EB_to_NOC_in_7_tvalid),
    .S_AXIS_0_tdata(S_AXIS_7_tdata),
    .S_AXIS_0_tready(S_AXIS_7_tready),
    .S_AXIS_0_tvalid(S_AXIS_7_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_0
  (
    .M_AXIS_0_tdata(M_AXIS_0_tdata),
    .M_AXIS_0_tready(M_AXIS_0_tready),
    .M_AXIS_0_tvalid(M_AXIS_0_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_0_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_0_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_0_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_1
  (
    .M_AXIS_0_tdata(M_AXIS_1_tdata),
    .M_AXIS_0_tready(M_AXIS_1_tready),
    .M_AXIS_0_tvalid(M_AXIS_1_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_1_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_1_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_1_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_2
  (
    .M_AXIS_0_tdata(M_AXIS_2_tdata),
    .M_AXIS_0_tready(M_AXIS_2_tready),
    .M_AXIS_0_tvalid(M_AXIS_2_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_2_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_2_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_2_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_3
  (
    .M_AXIS_0_tdata(M_AXIS_3_tdata),
    .M_AXIS_0_tready(M_AXIS_3_tready),
    .M_AXIS_0_tvalid(M_AXIS_3_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_3_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_3_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_3_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_4
  (
    .M_AXIS_0_tdata(M_AXIS_4_tdata),
    .M_AXIS_0_tready(M_AXIS_4_tready),
    .M_AXIS_0_tvalid(M_AXIS_4_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_4_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_4_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_4_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_5
  (
    .M_AXIS_0_tdata(M_AXIS_5_tdata),
    .M_AXIS_0_tready(M_AXIS_5_tready),
    .M_AXIS_0_tvalid(M_AXIS_5_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_5_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_5_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_5_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_6
  (
    .M_AXIS_0_tdata(M_AXIS_6_tdata),
    .M_AXIS_0_tready(M_AXIS_6_tready),
    .M_AXIS_0_tvalid(M_AXIS_6_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_6_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_6_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_6_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_output_7
  (
    .M_AXIS_0_tdata(M_AXIS_7_tdata),
    .M_AXIS_0_tready(M_AXIS_7_tready),
    .M_AXIS_0_tvalid(M_AXIS_7_tvalid),
    .S_AXIS_0_tdata(NOC_out_to_EB_7_tdata),
    .S_AXIS_0_tready(NOC_out_to_EB_7_tready),
    .S_AXIS_0_tvalid(NOC_out_to_EB_7_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  //noc
  noc_bft_v2
  #(  .DATA_WIDTH(DATA_WIDTH),
      .ADDR_WIDTH(5),
      .DEPTH(32),
      .N(N),
      .M(M),
      .C_nR(C_nR),
      .C(C),
      .R(R)
  ) NOC 
  (
    .M_AXIS_0_tdata(NOC_out_to_EB_0_tdata),
    .M_AXIS_0_tready(NOC_out_to_EB_0_tready),
    .M_AXIS_0_tvalid(NOC_out_to_EB_0_tvalid),
    .M_AXIS_1_tdata(NOC_out_to_EB_1_tdata),
    .M_AXIS_1_tready(NOC_out_to_EB_1_tready),
    .M_AXIS_1_tvalid(NOC_out_to_EB_1_tvalid),
    .M_AXIS_2_tdata(NOC_out_to_EB_2_tdata),
    .M_AXIS_2_tready(NOC_out_to_EB_2_tready),
    .M_AXIS_2_tvalid(NOC_out_to_EB_2_tvalid),
    .M_AXIS_3_tdata(NOC_out_to_EB_3_tdata),
    .M_AXIS_3_tready(NOC_out_to_EB_3_tready),
    .M_AXIS_3_tvalid(NOC_out_to_EB_3_tvalid),
    .M_AXIS_4_tdata(NOC_out_to_EB_4_tdata),
    .M_AXIS_4_tready(NOC_out_to_EB_4_tready),
    .M_AXIS_4_tvalid(NOC_out_to_EB_4_tvalid),
    .M_AXIS_5_tdata(NOC_out_to_EB_5_tdata),
    .M_AXIS_5_tready(NOC_out_to_EB_5_tready),
    .M_AXIS_5_tvalid(NOC_out_to_EB_5_tvalid),
    .M_AXIS_6_tdata(NOC_out_to_EB_6_tdata),
    .M_AXIS_6_tready(NOC_out_to_EB_6_tready),
    .M_AXIS_6_tvalid(NOC_out_to_EB_6_tvalid),
    .M_AXIS_7_tdata(NOC_out_to_EB_7_tdata),
    .M_AXIS_7_tready(NOC_out_to_EB_7_tready),
    .M_AXIS_7_tvalid(NOC_out_to_EB_7_tvalid),
    .S_AXIS_0_tdata(EB_to_NOC_in_0_tdata),
    .S_AXIS_0_tready(EB_to_NOC_in_0_tready),
    .S_AXIS_0_tvalid(EB_to_NOC_in_0_tvalid),
    .S_AXIS_1_tdata(EB_to_NOC_in_1_tdata),
    .S_AXIS_1_tready(EB_to_NOC_in_1_tready),
    .S_AXIS_1_tvalid(EB_to_NOC_in_1_tvalid),
    .S_AXIS_2_tdata(EB_to_NOC_in_2_tdata),
    .S_AXIS_2_tready(EB_to_NOC_in_2_tready),
    .S_AXIS_2_tvalid(EB_to_NOC_in_2_tvalid),
    .S_AXIS_3_tdata(EB_to_NOC_in_3_tdata),
    .S_AXIS_3_tready(EB_to_NOC_in_3_tready),
    .S_AXIS_3_tvalid(EB_to_NOC_in_3_tvalid),
    .S_AXIS_4_tdata(EB_to_NOC_in_4_tdata),
    .S_AXIS_4_tready(EB_to_NOC_in_4_tready),
    .S_AXIS_4_tvalid(EB_to_NOC_in_4_tvalid),
    .S_AXIS_5_tdata(EB_to_NOC_in_5_tdata),
    .S_AXIS_5_tready(EB_to_NOC_in_5_tready),
    .S_AXIS_5_tvalid(EB_to_NOC_in_5_tvalid),
    .S_AXIS_6_tdata(EB_to_NOC_in_6_tdata),
    .S_AXIS_6_tready(EB_to_NOC_in_6_tready),
    .S_AXIS_6_tvalid(EB_to_NOC_in_6_tvalid),
    .S_AXIS_7_tdata(EB_to_NOC_in_7_tdata),
    .S_AXIS_7_tready(EB_to_NOC_in_7_tready),
    .S_AXIS_7_tvalid(EB_to_NOC_in_7_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  ); 
endmodule
