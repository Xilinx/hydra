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

module switch_s
#(
  DATA_WIDTH = 32,
  ADDR_WIDTH = 2,
  DEPTH = 2**ADDR_WIDTH,
  ID = 0,
  N = 2,
  M=2,
  C_nR=1,
  C=0,
  R=$clog2(N)
)
(
    M_AXIS_0_tdata,
    M_AXIS_0_tready,
    M_AXIS_0_tvalid,

    M_AXIS_1_tdata,
    M_AXIS_1_tready,
    M_AXIS_1_tvalid,

    S_AXIS_0_tdata,
    S_AXIS_0_tready,
    S_AXIS_0_tvalid,

    aclk_0,
    aresetn_0
);

  output [DATA_WIDTH-1:0] M_AXIS_0_tdata;
  input M_AXIS_0_tready;
  output M_AXIS_0_tvalid;

  output [DATA_WIDTH-1:0] M_AXIS_1_tdata;
  input M_AXIS_1_tready;
  output M_AXIS_1_tvalid;

  input [DATA_WIDTH-1:0] S_AXIS_0_tdata;
  output S_AXIS_0_tready;
  input S_AXIS_0_tvalid;

  input aclk_0;
  input aresetn_0;

  wire [DATA_WIDTH-1:0] from_S0_to_EB_tdata;
  wire from_S0_to_EB_tready;
  wire from_S0_to_EB_tvalid;

  wire [DATA_WIDTH-1:0] from_S1_to_EB_tdata;
  wire from_S1_to_EB_tready;
  wire from_S1_to_EB_tvalid;

   EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_from_Split_to_EAST
  (
    .M_AXIS_0_tdata(M_AXIS_0_tdata),
    .M_AXIS_0_tready(M_AXIS_0_tready),
    .M_AXIS_0_tvalid(M_AXIS_0_tvalid),
    .S_AXIS_0_tdata(from_S0_to_EB_tdata),
    .S_AXIS_0_tready(from_S0_to_EB_tready),
    .S_AXIS_0_tvalid(from_S0_to_EB_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  split
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH),
    .ID(ID),
    .N(N),
    .M(M),
    .C_nR(C_nR),
    .C(C),
    .R(R)
  ) split_0
  (
    .M_AXIS_0_tdata(from_S0_to_EB_tdata),
    .M_AXIS_0_tready(from_S0_to_EB_tready),
    .M_AXIS_0_tvalid(from_S0_to_EB_tvalid),

    .M_AXIS_1_tdata(M_AXIS_1_tdata),
    .M_AXIS_1_tready(M_AXIS_1_tready),
    .M_AXIS_1_tvalid(M_AXIS_1_tvalid),

    .S_AXIS_0_tdata(S_AXIS_0_tdata),
    .S_AXIS_0_tready(S_AXIS_0_tready),
    .S_AXIS_0_tvalid(S_AXIS_0_tvalid),

    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );



endmodule
