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

module switch_bft
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

    S_AXIS_1_tdata,
    S_AXIS_1_tready,
    S_AXIS_1_tvalid,

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

  input [DATA_WIDTH-1:0] S_AXIS_1_tdata;
  output S_AXIS_1_tready;
  input S_AXIS_1_tvalid;

  input aclk_0;
  input aresetn_0;

  wire [DATA_WIDTH-1:0] from_S0_to_R_tdata;
  wire from_S0_to_R_tready;
  wire from_S0_to_R_tvalid;

  wire [DATA_WIDTH-1:0] from_S0_to_L_tdata;
  wire from_S0_to_L_tready;
  wire from_S0_to_L_tvalid;

  wire [DATA_WIDTH-1:0] from_S1_to_R_tdata;
  wire from_S1_to_R_tready;
  wire from_S1_to_R_tvalid;

  wire [DATA_WIDTH-1:0] from_S1_to_L_tdata;
  wire from_S1_to_L_tready;
  wire from_S1_to_L_tvalid;

  wire [DATA_WIDTH-1:0] from_EB_S0_to_R_tdata;
  wire from_EB_S0_to_R_tready;
  wire from_EB_S0_to_R_tvalid;

  wire [DATA_WIDTH-1:0] from_EB_S0_to_L_tdata;
  wire from_EB_S0_to_L_tready;
  wire from_EB_S0_to_L_tvalid;

  wire [DATA_WIDTH-1:0] from_EB_S1_to_R_tdata;
  wire from_EB_S1_to_R_tready;
  wire from_EB_S1_to_R_tvalid;

  wire [DATA_WIDTH-1:0] from_EB_S1_to_L_tdata;
  wire from_EB_S1_to_L_tready;
  wire from_EB_S1_to_L_tvalid;


generate
 if (DEPTH > 4) begin: srlfifo_0
   eb_srl 
     #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
    )
    EB_S0_TO_R (
     .s_axis_aresetn       (aresetn_0),
     .s_axis_aclk          (aclk_0),
     .s_axis_tvalid        (from_S0_to_R_tvalid),
     .s_axis_tready        (from_S0_to_R_tready),
     .s_axis_tdata         (from_S0_to_R_tdata),
     .m_axis_tvalid        (from_EB_S0_to_R_tvalid),
     .m_axis_tready        (from_EB_S0_to_R_tready),
     .m_axis_tdata         (from_EB_S0_to_R_tdata)
   );

   eb_srl
     #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
     ) 
    EB_S0_TO_L (
     .s_axis_aresetn       (aresetn_0),
     .s_axis_aclk          (aclk_0),
     .s_axis_tvalid        (from_S0_to_L_tvalid),
     .s_axis_tready        (from_S0_to_L_tready),
     .s_axis_tdata         (from_S0_to_L_tdata),
     .m_axis_tvalid        (from_EB_S0_to_L_tvalid),
     .m_axis_tready        (from_EB_S0_to_L_tready),
     .m_axis_tdata         (from_EB_S0_to_L_tdata)
   );

   eb_srl
     #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
     ) 
    EB_S1_TO_R (
     .s_axis_aresetn       (aresetn_0),
     .s_axis_aclk          (aclk_0),
     .s_axis_tvalid        (from_S1_to_R_tvalid),
     .s_axis_tready        (from_S1_to_R_tready),
     .s_axis_tdata         (from_S1_to_R_tdata),
     .m_axis_tvalid        (from_EB_S1_to_R_tvalid),
     .m_axis_tready        (from_EB_S1_to_R_tready),
     .m_axis_tdata         (from_EB_S1_to_R_tdata)
   );

   eb_srl
     #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
     ) 
    EB_S1_TO_L (
     .s_axis_aresetn       (aresetn_0),
     .s_axis_aclk          (aclk_0),
     .s_axis_tvalid        (from_S1_to_L_tvalid),
     .s_axis_tready        (from_S1_to_L_tready),
     .s_axis_tdata         (from_S1_to_L_tdata),
     .m_axis_tvalid        (from_EB_S1_to_L_tvalid),
     .m_axis_tready        (from_EB_S1_to_L_tready),
     .m_axis_tdata         (from_EB_S1_to_L_tdata)
   );
 end
endgenerate



generate
  if (DEPTH <= 4) begin: ebfifo
   EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_S0_TO_R
  (
    .M_AXIS_0_tdata(from_EB_S0_to_R_tdata),
    .M_AXIS_0_tready(from_EB_S0_to_R_tready),
    .M_AXIS_0_tvalid(from_EB_S0_to_R_tvalid),
    .S_AXIS_0_tdata(from_S0_to_R_tdata),
    .S_AXIS_0_tready(from_S0_to_R_tready),
    .S_AXIS_0_tvalid(from_S0_to_R_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_S0_TO_L
  (
    .M_AXIS_0_tdata(from_EB_S0_to_L_tdata),
    .M_AXIS_0_tready(from_EB_S0_to_L_tready),
    .M_AXIS_0_tvalid(from_EB_S0_to_L_tvalid),
    .S_AXIS_0_tdata(from_S0_to_L_tdata),
    .S_AXIS_0_tready(from_S0_to_L_tready),
    .S_AXIS_0_tvalid(from_S0_to_L_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

   EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_S1_TO_R
  (
    .M_AXIS_0_tdata(from_EB_S1_to_R_tdata),
    .M_AXIS_0_tready(from_EB_S1_to_R_tready),
    .M_AXIS_0_tvalid(from_EB_S1_to_R_tvalid),
    .S_AXIS_0_tdata(from_S1_to_R_tdata),
    .S_AXIS_0_tready(from_S1_to_R_tready),
    .S_AXIS_0_tvalid(from_S1_to_R_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  EB
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  )
  EB_S1_TO_L
  (
    .M_AXIS_0_tdata(from_EB_S1_to_L_tdata),
    .M_AXIS_0_tready(from_EB_S1_to_L_tready),
    .M_AXIS_0_tvalid(from_EB_S1_to_L_tvalid),
    .S_AXIS_0_tdata(from_S1_to_L_tdata),
    .S_AXIS_0_tready(from_S1_to_L_tready),
    .S_AXIS_0_tvalid(from_S1_to_L_tvalid),
    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );
end
endgenerate



  split_bft
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
    .M_AXIS_0_tdata(from_S0_to_R_tdata),
    .M_AXIS_0_tready(from_S0_to_R_tready),
    .M_AXIS_0_tvalid(from_S0_to_R_tvalid),

    .M_AXIS_1_tdata(from_S0_to_L_tdata),
    .M_AXIS_1_tready(from_S0_to_L_tready),
    .M_AXIS_1_tvalid(from_S0_to_L_tvalid),

    .S_AXIS_0_tdata(S_AXIS_0_tdata),
    .S_AXIS_0_tready(S_AXIS_0_tready),
    .S_AXIS_0_tvalid(S_AXIS_0_tvalid),

    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  split_bft
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
  ) split_1
  (
    .M_AXIS_0_tdata(from_S1_to_R_tdata),
    .M_AXIS_0_tready(from_S1_to_R_tready),
    .M_AXIS_0_tvalid(from_S1_to_R_tvalid),

    .M_AXIS_1_tdata(from_S1_to_L_tdata),
    .M_AXIS_1_tready(from_S1_to_L_tready),
    .M_AXIS_1_tvalid(from_S1_to_L_tvalid),

    .S_AXIS_0_tdata(S_AXIS_1_tdata),
    .S_AXIS_0_tready(S_AXIS_1_tready),
    .S_AXIS_0_tvalid(S_AXIS_1_tvalid),

    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  merge
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  ) merge_R
  (
    .M_AXIS_0_tdata(M_AXIS_0_tdata),
    .M_AXIS_0_tready(M_AXIS_0_tready),
    .M_AXIS_0_tvalid(M_AXIS_0_tvalid),

    .S_AXIS_0_tdata(from_EB_S0_to_R_tdata),
    .S_AXIS_0_tready(from_EB_S0_to_R_tready),
    .S_AXIS_0_tvalid(from_EB_S0_to_R_tvalid),

    .S_AXIS_1_tdata(from_EB_S1_to_R_tdata),
    .S_AXIS_1_tready(from_EB_S1_to_R_tready),
    .S_AXIS_1_tvalid(from_EB_S1_to_R_tvalid),

    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );

  merge
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .DEPTH(DEPTH)
  ) merge_L
  (
    .M_AXIS_0_tdata(M_AXIS_1_tdata),
    .M_AXIS_0_tready(M_AXIS_1_tready),
    .M_AXIS_0_tvalid(M_AXIS_1_tvalid),

    .S_AXIS_0_tdata(from_EB_S0_to_L_tdata),
    .S_AXIS_0_tready(from_EB_S0_to_L_tready),
    .S_AXIS_0_tvalid(from_EB_S0_to_L_tvalid),

    .S_AXIS_1_tdata(from_EB_S1_to_L_tdata),
    .S_AXIS_1_tready(from_EB_S1_to_L_tready),
    .S_AXIS_1_tvalid(from_EB_S1_to_L_tvalid),

    .aclk_0(aclk_0),
    .aresetn_0(aresetn_0)
  );



endmodule

