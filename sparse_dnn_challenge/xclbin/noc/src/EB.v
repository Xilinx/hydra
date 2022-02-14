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
module EB
#(
  DATA_WIDTH = 32,
  ADDR_WIDTH = 2,
  DEPTH = 2**ADDR_WIDTH
)

   (M_AXIS_0_tdata,
    M_AXIS_0_tready,
    M_AXIS_0_tvalid,
    S_AXIS_0_tdata,
    S_AXIS_0_tready,
    S_AXIS_0_tvalid,
    aclk_0,
    aresetn_0);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [DATA_WIDTH-1:0]M_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TREADY" *) input M_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_0 TVALID" *) output M_AXIS_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_0, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [DATA_WIDTH-1:0]S_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TREADY" *) output S_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_0 TVALID" *) input S_AXIS_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, ASSOCIATED_BUSIF M_AXIS_0:S_AXIS_0, ASSOCIATED_RESET aresetn_0, INSERT_VIP 0, PHASE 0.000" *) input aclk_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input aresetn_0;
 
  wire [DATA_WIDTH-1:0] data_in;
  wire ready_out;
  wire valid_in;
  
  wire [DATA_WIDTH-1:0] data_out;
  wire ready_in;
  wire valid_out;
  
  assign M_AXIS_0_tdata[DATA_WIDTH-1:0] = data_out;
  assign M_AXIS_0_tvalid = valid_out;
  assign data_in = S_AXIS_0_tdata[DATA_WIDTH-1:0];
  assign valid_in = S_AXIS_0_tvalid;
  assign S_AXIS_0_tready = ready_out;
  assign ready_in = M_AXIS_0_tready;
   
  reg [ADDR_WIDTH-1:0] head = 0;
  reg [ADDR_WIDTH-1:0] tail = 0;
  
  wire [DATA_WIDTH-1:0] data_out_w [0:DEPTH-1];
  wire [0:DEPTH-1]ready_out_w ;
  wire [0:DEPTH-1]valid_in_w  ;
  wire [0:DEPTH-1] ready_in_w  ;
  wire [0:DEPTH-1] valid_out_w;
  
  assign valid_out = |(valid_out_w);
  assign ready_out = |(ready_out_w);
  
  genvar i;
  
  generate
    for (i = 0 ; i < DEPTH; i=i+1 ) begin: generate_ebhb
        HBEB 
        #(
            .DATA_WIDTH(DATA_WIDTH)
        ) hbeb
        (
            .aclk_0(aclk_0),
            .aresetn_0(aresetn_0),            
            .S_AXIS_0_tdata(data_in),
            .S_AXIS_0_tready(ready_out_w[i]),
            .S_AXIS_0_tvalid(valid_in_w[i]),
            .M_AXIS_0_tdata(data_out_w[i]),
            .M_AXIS_0_tready(ready_in_w[i]),
            .M_AXIS_0_tvalid(valid_out_w[i])
        );
    end
  endgenerate

  assign  data_out = data_out_w[head];
  
  generate
    for ( i = 0 ; i < DEPTH ; i = i + 1)
    begin
        assign ready_in_w[i] = head==i ? ready_in : 1'b0;
        assign valid_in_w[i] = tail==i ? valid_in : 1'b0;
    end
  endgenerate
  
  
  
  always @(posedge aclk_0)
  begin
    if (ready_in & valid_out)
        head <= head + 1;
    if (valid_in & ready_out)
        tail <= tail + 1;
  
  end
  
endmodule
