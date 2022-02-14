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

module merge
#(
  DATA_WIDTH=32,
  ADDR_WIDTH=2,
  DEPTH=2**ADDR_WIDTH
)
(
    M_AXIS_0_tdata,
    M_AXIS_0_tready,
    M_AXIS_0_tvalid,
    
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

  input [DATA_WIDTH-1:0] S_AXIS_0_tdata;
  output S_AXIS_0_tready;
  input S_AXIS_0_tvalid;

  input [DATA_WIDTH-1:0] S_AXIS_1_tdata;
  output S_AXIS_1_tready;
  input S_AXIS_1_tvalid;

  input aclk_0;
  input aresetn_0;

  wire data_sel;
  wire ready_sel;
  wire valid_sel;

  Datapath #(.DATA_WIDTH(DATA_WIDTH), .ADDR_WIDTH(ADDR_WIDTH), .DEPTH(DEPTH)) dp
  (
    .EB_S0_tdata_out(S_AXIS_0_tdata),
    .EB_S0_tready_in(S_AXIS_0_tready),
    .EB_S0_tvalid_out(S_AXIS_0_tvalid),
    .EB_S1_tdata_out(S_AXIS_1_tdata),
    .EB_S1_tready_in(S_AXIS_1_tready),
    .EB_S1_tvalid_out(S_AXIS_1_tvalid),
    .EB_M0_tdata_in(M_AXIS_0_tdata),
    .EB_M0_tready_out(M_AXIS_0_tready),
    .EB_M0_tvalid_in(M_AXIS_0_tvalid),
    .data_sel(data_sel),
    .valid_sel(valid_sel),
    .ready_sel(ready_sel)
  );

  Arbiter_opt arb
  (
    S_AXIS_0_tvalid,
    S_AXIS_1_tvalid,
    M_AXIS_0_tready,
    data_sel,
    valid_sel,
    ready_sel,
    aclk_0
  );


endmodule

module Arbiter_opt
(
  EB_S0_tvalid_out,
  EB_S1_tvalid_out,
  EB_M0_tready_out,
  data_sel,
  valid_sel,
  ready_sel,
  aclk_0
);
  input EB_S0_tvalid_out;
  input EB_S1_tvalid_out;
  input EB_M0_tready_out;
  
  output data_sel;
  output valid_sel;
  output ready_sel;
  
  reg sel = 0;
  
  input aclk_0;
  parameter R0=0, R1=1;
  
  reg state = R0;
  reg nextState = R0;
  
  assign data_sel = sel;
  assign valid_sel = sel;
  assign ready_sel = sel;
  
  always @(posedge aclk_0)
    state = nextState;
        
  always @(state)
  begin
    case(state)
        R0:
        begin
            sel <= 0;      
        end
        R1:
        begin
            sel <= 1;
        end
    endcase
  
  end
    
  always @(*)
  begin
    case (state)
     R0:
        if ( EB_M0_tready_out == 1 )
        begin
            if ( EB_S1_tvalid_out == 1 )
                nextState = R1;
            else if ( EB_S0_tvalid_out == 1 )
                nextState = R0;
        end 
      R1:
        if ( EB_M0_tready_out == 1 )
        begin
            if ( EB_S0_tvalid_out == 1 )
                nextState = R0;
            else if ( EB_S1_tvalid_out == 1 )
                nextState = R1;
        end    
    endcase
  end

endmodule

module arbiter
(
  EB_S0_tvalid_out,
  EB_S1_tvalid_out,
  EB_M0_tready_out,
  data_sel,
  valid_sel,
  ready_sel,
  aclk_0
);

  input EB_S0_tvalid_out;
  input EB_S1_tvalid_out;
  input EB_M0_tready_out;
  
  output reg data_sel;
  output reg valid_sel;
  output reg ready_sel;
  
  input aclk_0;
  
  parameter NON=0, R0=1, R1=2;
  
  reg [1:0] state = NON;
  reg [1:0] nextState = NON;
  
  always @(posedge aclk_0)
    state = nextState;
    
  always @(state)
  begin
    case(state)
        NON:
        begin
            data_sel <= 0;
            valid_sel <= 0;
            ready_sel <= 0;
        end
        R0:
        begin
            data_sel <= 0;
            valid_sel <= 0;
            ready_sel <= 0;       
        end
        R1:
        begin
            data_sel <= 1;
            valid_sel <= 1;
            ready_sel <= 1;       
        end
    endcase
  
  end
    
  always @(*)
  begin
    case (state)
    NON:
        if ( EB_M0_tready_out == 1 )        
            if ( EB_S0_tvalid_out == 1 )
                nextState = R0;
            else if ( EB_S1_tvalid_out == 1)
                nextState = R1;
            else
                nextState = NON;
        else
            nextState = NON;
     R0:
        if ( EB_M0_tready_out == 1 )
            if ( EB_S1_tvalid_out == 1 )
                nextState = R1;
            else if ( EB_S0_tvalid_out == 1 )
                nextState = R0;
            else
                nextState = NON;
        else
            nextState = NON;
            
      R1:
        if ( EB_M0_tready_out == 1 )
            if ( EB_S0_tvalid_out == 1 )
                nextState = R0;
            else if ( EB_S1_tvalid_out == 1 )
                nextState = R1;
            else
                nextState = NON;
        else
            nextState = NON;
            
    endcase
  end

endmodule

module Datapath
#(
  DATA_WIDTH=32,
  ADDR_WIDTH=2,
  DEPTH=2**ADDR_WIDTH
)
(
  EB_S0_tdata_out,
  EB_S0_tready_in,
  EB_S0_tvalid_out,
  EB_S1_tdata_out,
  EB_S1_tready_in,
  EB_S1_tvalid_out,
  EB_M0_tdata_in,
  EB_M0_tready_out,
  EB_M0_tvalid_in,
  data_sel,
  valid_sel,
  ready_sel
);

  //Named based on EB perspective
  input [DATA_WIDTH-1:0] EB_S0_tdata_out;
  output EB_S0_tready_in;
  input EB_S0_tvalid_out;

  input [DATA_WIDTH-1:0] EB_S1_tdata_out;
  output EB_S1_tready_in;
  input EB_S1_tvalid_out;

  output [DATA_WIDTH-1:0] EB_M0_tdata_in;
  input EB_M0_tready_out;
  output EB_M0_tvalid_in;

  input data_sel;
  input valid_sel;
  input ready_sel;

  assign EB_M0_tdata_in = data_sel ? EB_S1_tdata_out : EB_S0_tdata_out;
  assign EB_M0_tvalid_in = valid_sel ? EB_S1_tvalid_out : EB_S0_tvalid_out;
  
  assign EB_S0_tready_in = ready_sel ? 1'b0 : EB_M0_tready_out;
  assign EB_S1_tready_in = ready_sel ? EB_M0_tready_out : 1'b0;

endmodule
