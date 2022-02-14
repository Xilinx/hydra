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

module EBHB_Element
#(
DATA_WIDTH = 32
)
(
  clk,
  //reset,
  data_in,
  ready_out,
  valid_in,
  data_out,
  ready_in,
  valid_out
);
  input clk;
  //input reset;

  input [DATA_WIDTH-1:0] data_in;
  output ready_out;
  input valid_in;
  
  output reg [DATA_WIDTH-1:0] data_out;
  input ready_in;
  output valid_out;
  
  reg full = 0;
  
  assign valid_out = full;
  assign ready_out = ~(full);
  
  always @(posedge clk)
  begin
//    if (reset)
//    begin
//        full = 0;
//    end
//    else
//    begin
        if ( valid_in == 1 && full == 0 )
        begin
                full = 1;
                data_out = data_in;
        end
        else if ( ready_in == 1 && full == 1 )
             begin
                 full = 0;
             end
        end
//    end

endmodule
