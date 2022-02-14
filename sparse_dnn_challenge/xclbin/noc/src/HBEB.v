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
module HBEB
#(
DATA_WIDTH = 32
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
  
  reg [DATA_WIDTH-1:0] data_out;
  wire ready_in;
  wire valid_out;
  
  assign M_AXIS_0_tdata[DATA_WIDTH-1:0] = data_out;
  assign M_AXIS_0_tvalid = valid_out;
  assign data_in = S_AXIS_0_tdata[DATA_WIDTH-1:0];
  assign valid_in = S_AXIS_0_tvalid;
  assign S_AXIS_0_tready = ready_out;
  assign ready_in = M_AXIS_0_tready;
  
  reg full = 0;
  
  assign valid_out = full;
  assign ready_out = ~(full);
  
  always @(posedge aclk_0)
  begin
//    if (reset)
//    begin
//        full = 1;
//    end
//    else
//    begin
        if ( valid_in == 1 && full == 0 )
        begin
                full <= 1;
                data_out <= data_in;
        end
        else if ( ready_in == 1 && full == 1 )
             begin
                 full <= 0;
             end
        end
//    end
  
endmodule
