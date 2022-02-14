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
`define k 2**(LOGM-z-1)

module noc_bft_v2
#(
  DATA_WIDTH = 64,
  ADDR_WIDTH = 5,
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

 localparam LOGM = $clog2(M);

 wire [DATA_WIDTH-1:0] w2e_chain_tdata  [0:M-1][0:0];
 wire                  w2e_chain_tvalid [0:M-1][0:0];
 wire                  w2e_chain_tready [0:M-1][0:0];
 wire [DATA_WIDTH-1:0] n2s_chain_left_tdata  [0:LOGM-1][0:M/2-1];
 wire                  n2s_chain_left_tvalid [0:LOGM-1][0:M/2-1];
 wire                  n2s_chain_left_tready [0:LOGM-1][0:M/2-1];
 wire [DATA_WIDTH-1:0] n2s_chain_right_tdata  [0:LOGM-1][0:M/2-1];
 wire                  n2s_chain_right_tvalid [0:LOGM-1][0:M/2-1];
 wire                  n2s_chain_right_tready [0:LOGM-1][0:M/2-1];

 assign w2e_chain_tdata[0][0] = S_AXIS_0_tdata;
 assign w2e_chain_tvalid[0][0] = S_AXIS_0_tvalid;
 assign S_AXIS_0_tready = w2e_chain_tready[0][0];

 assign w2e_chain_tdata[1][0] = S_AXIS_1_tdata;
 assign w2e_chain_tvalid[1][0] = S_AXIS_1_tvalid;
 assign S_AXIS_1_tready = w2e_chain_tready[1][0];
 
 assign w2e_chain_tdata[2][0] = S_AXIS_2_tdata;
 assign w2e_chain_tvalid[2][0] = S_AXIS_2_tvalid;
 assign S_AXIS_2_tready = w2e_chain_tready[2][0];
 
 assign w2e_chain_tdata[3][0] = S_AXIS_3_tdata;
 assign w2e_chain_tvalid[3][0] = S_AXIS_3_tvalid;
 assign S_AXIS_3_tready = w2e_chain_tready[3][0];
 
 assign w2e_chain_tdata[4][0] = S_AXIS_4_tdata;
 assign w2e_chain_tvalid[4][0] = S_AXIS_4_tvalid;
 assign S_AXIS_4_tready = w2e_chain_tready[4][0];
 
 assign w2e_chain_tdata[5][0] = S_AXIS_5_tdata;
 assign w2e_chain_tvalid[5][0] = S_AXIS_5_tvalid;
 assign S_AXIS_5_tready = w2e_chain_tready[5][0];
 
 assign w2e_chain_tdata[6][0] = S_AXIS_6_tdata;
 assign w2e_chain_tvalid[6][0] = S_AXIS_6_tvalid;
 assign S_AXIS_6_tready = w2e_chain_tready[6][0];

 assign w2e_chain_tdata[7][0] = S_AXIS_7_tdata;
 assign w2e_chain_tvalid[7][0] = S_AXIS_7_tvalid;
 assign S_AXIS_7_tready = w2e_chain_tready[7][0];

 assign M_AXIS_0_tdata 		                = n2s_chain_left_tdata[LOGM-1][0]; 
 assign M_AXIS_0_tvalid 	                = n2s_chain_left_tvalid[LOGM-1][0];
 assign n2s_chain_left_tready[LOGM-1][0]  = M_AXIS_0_tready;         
 
 assign M_AXIS_1_tdata 		                = n2s_chain_right_tdata[LOGM-1][0];   
 assign M_AXIS_1_tvalid              	    = n2s_chain_right_tvalid[LOGM-1][0];  
 assign n2s_chain_right_tready[LOGM-1][0] = M_AXIS_1_tready;                       
	    
 assign M_AXIS_2_tdata                    = n2s_chain_left_tdata[LOGM-1][1];   
 assign M_AXIS_2_tvalid                   = n2s_chain_left_tvalid[LOGM-1][1];
 assign n2s_chain_left_tready[LOGM-1][1]  = M_AXIS_2_tready;         
	                                                                            
 assign M_AXIS_3_tdata                    = n2s_chain_right_tdata[LOGM-1][1]; 
 assign M_AXIS_3_tvalid                   = n2s_chain_right_tvalid[LOGM-1][1];
 assign n2s_chain_right_tready[LOGM-1][1] = M_AXIS_3_tready;                  
	    
 assign M_AXIS_4_tdata                    = n2s_chain_left_tdata[LOGM-1][2];   
 assign M_AXIS_4_tvalid                   = n2s_chain_left_tvalid[LOGM-1][2];
 assign n2s_chain_left_tready[LOGM-1][2]  = M_AXIS_4_tready;         
	                                                                            
 assign M_AXIS_5_tdata                    = n2s_chain_right_tdata[LOGM-1][2]; 
 assign M_AXIS_5_tvalid                   = n2s_chain_right_tvalid[LOGM-1][2];
 assign n2s_chain_right_tready[LOGM-1][2] = M_AXIS_5_tready;                  
	    
 assign M_AXIS_6_tdata                    = n2s_chain_left_tdata[LOGM-1][3];   
 assign M_AXIS_6_tvalid                   = n2s_chain_left_tvalid[LOGM-1][3];
 assign n2s_chain_left_tready[LOGM-1][3]  = M_AXIS_6_tready;         
	                                                                            
 assign M_AXIS_7_tdata                    = n2s_chain_right_tdata[LOGM-1][3]; 
 assign M_AXIS_7_tvalid                   = n2s_chain_right_tvalid[LOGM-1][3];
 assign n2s_chain_right_tready[LOGM-1][3] = M_AXIS_7_tready;                  
//===============================================================
// above this is static config and could be done through python
//===============================================================


genvar x, y, z;
generate
    for (x = 0; x < M/2; x = x+1) begin : xs1
        switch_bft
         #(
          .DATA_WIDTH(DATA_WIDTH),
          .ADDR_WIDTH(ADDR_WIDTH),
          .DEPTH(DEPTH),
          .ID(LOGM-1),
          .N(N),
          .M(M),
          .C_nR(C_nR),
          .C(C),
          .R(R)
        )
        S_0_0
        (
          .M_AXIS_0_tdata(n2s_chain_right_tdata[0][x]),
          .M_AXIS_0_tready(n2s_chain_right_tready[0][x]),
          .M_AXIS_0_tvalid(n2s_chain_right_tvalid[0][x]),
     
          .M_AXIS_1_tdata(n2s_chain_left_tdata[0][x]),
          .M_AXIS_1_tready(n2s_chain_left_tready[0][x]),
          .M_AXIS_1_tvalid(n2s_chain_left_tvalid[0][x]),
     
          .S_AXIS_0_tdata(w2e_chain_tdata[x*2][0]),
          .S_AXIS_0_tready(w2e_chain_tready[x*2][0]),
          .S_AXIS_0_tvalid(w2e_chain_tvalid[x*2][0]),
          
          .S_AXIS_1_tdata(w2e_chain_tdata[x*2+1][0]),
          .S_AXIS_1_tready(w2e_chain_tready[x*2+1][0]),
          .S_AXIS_1_tvalid(w2e_chain_tvalid[x*2+1][0]),
     
          .aclk_0(aclk_0),
          .aresetn_0(aresetn_0)
        );
  end
endgenerate

generate
  for (z = 0; z < LOGM-1; z=z+1) begin : zs2
    for (y = 0; y < M/(2*`k); y = y+1) begin : ys2
      for (x = 0; x < `k; x = x+1) begin : xs2
        if (x < `k/2) begin //switch
          switch_bft
            #(
             .DATA_WIDTH(DATA_WIDTH),
             .ADDR_WIDTH(ADDR_WIDTH),
             .DEPTH(DEPTH),
             .ID(LOGM-z-2),
             .N(N),
             .M(M),
             .C_nR(C_nR),
             .C(C),
             .R(R)
           )
           SW_0_0
           (
             .M_AXIS_0_tdata(n2s_chain_right_tdata[z+1][`k*y+x]),
             .M_AXIS_0_tready(n2s_chain_right_tready[z+1][`k*y+x]),
             .M_AXIS_0_tvalid(n2s_chain_right_tvalid[z+1][`k*y+x]),
        
             .M_AXIS_1_tdata(n2s_chain_left_tdata[z+1][`k*y+x]),
             .M_AXIS_1_tready(n2s_chain_left_tready[z+1][`k*y+x]),
             .M_AXIS_1_tvalid(n2s_chain_left_tvalid[z+1][`k*y+x]),
             
             .S_AXIS_0_tdata(n2s_chain_left_tdata[z][`k*y+x+`k/2]),
             .S_AXIS_0_tready(n2s_chain_left_tready[z][`k*y+x+`k/2]),
             .S_AXIS_0_tvalid(n2s_chain_left_tvalid[z][`k*y+x+`k/2]),
        
             .S_AXIS_1_tdata(n2s_chain_left_tdata[z][`k*y+x]),
             .S_AXIS_1_tready(n2s_chain_left_tready[z][`k*y+x]),
             .S_AXIS_1_tvalid(n2s_chain_left_tvalid[z][`k*y+x]),
        
             .aclk_0(aclk_0),
             .aresetn_0(aresetn_0)
           );
        end else begin
          switch_bft
            #(
             .DATA_WIDTH(DATA_WIDTH),
             .ADDR_WIDTH(ADDR_WIDTH),
             .DEPTH(DEPTH),
             .ID(LOGM-z-2),
             .N(N),
             .M(M),
             .C_nR(C_nR),
             .C(C),
             .R(R)
           )
           SW_0_1
           (
             .M_AXIS_0_tdata(n2s_chain_right_tdata[z+1][`k*y+x]),
             .M_AXIS_0_tready(n2s_chain_right_tready[z+1][`k*y+x]),
             .M_AXIS_0_tvalid(n2s_chain_right_tvalid[z+1][`k*y+x]),
        
             .M_AXIS_1_tdata(n2s_chain_left_tdata[z+1][`k*y+x]),
             .M_AXIS_1_tready(n2s_chain_left_tready[z+1][`k*y+x]),
             .M_AXIS_1_tvalid(n2s_chain_left_tvalid[z+1][`k*y+x]),
             
             .S_AXIS_0_tdata(n2s_chain_right_tdata[z][`k*y+x]),
             .S_AXIS_0_tready(n2s_chain_right_tready[z][`k*y+x]),
             .S_AXIS_0_tvalid(n2s_chain_right_tvalid[z][`k*y+x]),
        
             .S_AXIS_1_tdata(n2s_chain_right_tdata[z][`k*y+x-`k/2]),
             .S_AXIS_1_tready(n2s_chain_right_tready[z][`k*y+x-`k/2]),
             .S_AXIS_1_tvalid(n2s_chain_right_tvalid[z][`k*y+x-`k/2]),
        
             .aclk_0(aclk_0),
             .aresetn_0(aresetn_0)
           );
        end
      end
    end
  end
endgenerate


endmodule
