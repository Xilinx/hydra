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

module split
#(
  DATA_WIDTH = 32,
  ADDR_WIDTH = 2,
  DEPTH = 2**ADDR_WIDTH,
  ID=0,
  N=2,
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
  
  wire condition;
  
  generate
    if ( C_nR == 1 )
        assign condition = S_AXIS_0_tdata[($clog2(N)-1)+C:C]==ID ? 1'b1 : 1'b0;
    else
        assign condition = S_AXIS_0_tdata[($clog2(M)-1)+R:R]==ID ? 1'b1 : 1'b0;
  endgenerate

  assign M_AXIS_0_tdata = S_AXIS_0_tdata;
  assign M_AXIS_1_tdata = S_AXIS_0_tdata;

  assign M_AXIS_0_tvalid = condition ? 1'b0 : S_AXIS_0_tvalid;
  assign M_AXIS_1_tvalid = condition ? S_AXIS_0_tvalid : 1'b0;

  //assign S_AXIS_0_tready = M_AXIS_0_tready & M_AXIS_1_tready;

  // Non-Blocking
  assign S_AXIS_0_tready = (~condition & M_AXIS_0_tready)|(condition & M_AXIS_1_tready);

endmodule
