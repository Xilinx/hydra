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
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2020 05:35:05 PM
// Design Name: 
// Module Name: eb_srl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module eb_srl
#(
  DATA_WIDTH = 32,
  ADDR_WIDTH = 2,
  DEPTH = 2**ADDR_WIDTH
)

   (m_axis_tdata,
    m_axis_tready,
    m_axis_tvalid,
    s_axis_tdata,
    s_axis_tready,
    s_axis_tvalid,
    s_axis_aclk,
    s_axis_aresetn);
    
  output [DATA_WIDTH-1:0]m_axis_tdata;
  input m_axis_tready;
  output m_axis_tvalid;
  input [DATA_WIDTH-1:0]s_axis_tdata;
  output s_axis_tready;
  input s_axis_tvalid;
  input s_axis_aclk;
  input s_axis_aresetn;
 
// xpm_fifo_axis: AXI Stream FIFO

   // Xilinx Parameterized Macro, version 2020.1

 

   xpm_fifo_axis #(

      .CDC_SYNC_STAGES(2),            // DECIMAL

      .CLOCKING_MODE("common_clock"), // String

      .ECC_MODE("no_ecc"),            // String

      .FIFO_DEPTH(DEPTH),              // DECIMAL

      .FIFO_MEMORY_TYPE("distributed"),      // String

      .PACKET_FIFO("false"),          // String

      .PROG_EMPTY_THRESH(10),         // DECIMAL

      .PROG_FULL_THRESH(10),          // DECIMAL

      .RD_DATA_COUNT_WIDTH(1),        // DECIMAL

      .RELATED_CLOCKS(0),             // DECIMAL

      .SIM_ASSERT_CHK(0),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages

      .TDATA_WIDTH(DATA_WIDTH),               // DECIMAL

      .TDEST_WIDTH(1),                // DECIMAL

      .TID_WIDTH(1),                  // DECIMAL

      .TUSER_WIDTH(1),                // DECIMAL

      .USE_ADV_FEATURES("1000"),      // String

      .WR_DATA_COUNT_WIDTH(1)         // DECIMAL

   )

   xpm_fifo_axis_inst (

      .almost_empty_axis(),   // 1-bit output: Almost Empty : When asserted, this signal

                                               // indicates that only one more read can be performed before the

                                               // FIFO goes to empty.

 

      .almost_full_axis(),     // 1-bit output: Almost Full: When asserted, this signal

                                               // indicates that only one more write can be performed before

                                               // the FIFO is full.

 

      .dbiterr_axis(),             // 1-bit output: Double Bit Error- Indicates that the ECC

                                               // decoder detected a double-bit error and data in the FIFO core

                                               // is corrupted.

 

      .m_axis_tdata(m_axis_tdata),             // TDATA_WIDTH-bit output: TDATA: The primary payload that is

                                               // used to provide the data that is passing across the

                                               // interface. The width of the data payload is an integer number

                                               // of bytes.

 

      .m_axis_tdest(),             // TDEST_WIDTH-bit output: TDEST: Provides routing information

                                               // for the data stream.

 

      .m_axis_tid(),                 // TID_WIDTH-bit output: TID: The data stream identifier that

                                               // indicates different streams of data.

 

      .m_axis_tkeep(),             // TDATA_WIDTH/8-bit output: TKEEP: The byte qualifier that

                                               // indicates whether the content of the associated byte of TDATA

                                               // is processed as part of the data stream. Associated bytes

                                               // that have the TKEEP byte qualifier deasserted are null bytes

                                               // and can be removed from the data stream. For a 64-bit DATA,

                                               // bit 0 corresponds to the least significant byte on DATA, and

                                               // bit 7 corresponds to the most significant byte. For example:

                                               // KEEP[0] = 1b, DATA[7:0] is not a NULL byte KEEP[7] = 0b,

                                               // DATA[63:56] is a NULL byte

 

      .m_axis_tlast(),             // 1-bit output: TLAST: Indicates the boundary of a packet.

      .m_axis_tstrb(),             // TDATA_WIDTH/8-bit output: TSTRB: The byte qualifier that

                                               // indicates whether the content of the associated byte of TDATA

                                               // is processed as a data byte or a position byte. For a 64-bit

                                               // DATA, bit 0 corresponds to the least significant byte on

                                               // DATA, and bit 0 corresponds to the least significant byte on

                                               // DATA, and bit 7 corresponds to the most significant byte. For

                                               // example: STROBE[0] = 1b, DATA[7:0] is valid STROBE[7] = 0b,

                                               // DATA[63:56] is not valid

 

      .m_axis_tuser(),             // TUSER_WIDTH-bit output: TUSER: The user-defined sideband

                                               // information that can be transmitted alongside the data

                                               // stream.

 

      .m_axis_tvalid(m_axis_tvalid),           // 1-bit output: TVALID: Indicates that the master is driving a

                                               // valid transfer. A transfer takes place when both TVALID and

                                               // TREADY are asserted

 

      .prog_empty_axis(),       // 1-bit output: Programmable Empty- This signal is asserted

                                               // when the number of words in the FIFO is less than or equal to

                                               // the programmable empty threshold value. It is de-asserted

                                               // when the number of words in the FIFO exceeds the programmable

                                               // empty threshold value.

 

      .prog_full_axis(),         // 1-bit output: Programmable Full: This signal is asserted when

                                               // the number of words in the FIFO is greater than or equal to

                                               // the programmable full threshold value. It is de-asserted when

                                               // the number of words in the FIFO is less than the programmable

                                               // full threshold value.

 

      .rd_data_count_axis(), // RD_DATA_COUNT_WIDTH-bit output: Read Data Count- This bus

                                               // indicates the number of words available for reading in the

                                               // FIFO.

 

      .s_axis_tready(s_axis_tready),           // 1-bit output: TREADY: Indicates that the slave can accept a

                                               // transfer in the current cycle.

 

      .sbiterr_axis(),             // 1-bit output: Single Bit Error- Indicates that the ECC

                                               // decoder detected and fixed a single-bit error.

 

      .wr_data_count_axis(), // WR_DATA_COUNT_WIDTH-bit output: Write Data Count: This bus

                                               // indicates the number of words written into the FIFO.

 

      .injectdbiterr_axis(), // 1-bit input: Double Bit Error Injection- Injects a double bit

                                               // error if the ECC feature is used.

 

      .injectsbiterr_axis(), // 1-bit input: Single Bit Error Injection- Injects a single bit

                                               // error if the ECC feature is used.

 

      .m_aclk(s_axis_aclk),                         // 1-bit input: Master Interface Clock: All signals on master

                                               // interface are sampled on the rising edge of this clock.

 

      .m_axis_tready(m_axis_tready),           // 1-bit input: TREADY: Indicates that the slave can accept a

                                               // transfer in the current cycle.

 

      .s_aclk(s_axis_aclk),                         // 1-bit input: Slave Interface Clock: All signals on slave

                                               // interface are sampled on the rising edge of this clock.

 

      .s_aresetn(s_axis_aresetn),                   // 1-bit input: Active low asynchronous reset.

      .s_axis_tdata(s_axis_tdata),             // TDATA_WIDTH-bit input: TDATA: The primary payload that is

                                               // used to provide the data that is passing across the

                                               // interface. The width of the data payload is an integer number

                                               // of bytes.

 

      .s_axis_tdest(),             // TDEST_WIDTH-bit input: TDEST: Provides routing information

                                               // for the data stream.

 

      .s_axis_tid(),                 // TID_WIDTH-bit input: TID: The data stream identifier that

                                               // indicates different streams of data.

 

      .s_axis_tkeep(),             // TDATA_WIDTH/8-bit input: TKEEP: The byte qualifier that

                                               // indicates whether the content of the associated byte of TDATA

                                               // is processed as part of the data stream. Associated bytes

                                               // that have the TKEEP byte qualifier deasserted are null bytes

                                               // and can be removed from the data stream. For a 64-bit DATA,

                                               // bit 0 corresponds to the least significant byte on DATA, and

                                               // bit 7 corresponds to the most significant byte. For example:

                                               // KEEP[0] = 1b, DATA[7:0] is not a NULL byte KEEP[7] = 0b,

                                               // DATA[63:56] is a NULL byte

 

      .s_axis_tlast(),             // 1-bit input: TLAST: Indicates the boundary of a packet.

      .s_axis_tstrb(),             // TDATA_WIDTH/8-bit input: TSTRB: The byte qualifier that

                                               // indicates whether the content of the associated byte of TDATA

                                               // is processed as a data byte or a position byte. For a 64-bit

                                               // DATA, bit 0 corresponds to the least significant byte on

                                               // DATA, and bit 0 corresponds to the least significant byte on

                                               // DATA, and bit 7 corresponds to the most significant byte. For

                                               // example: STROBE[0] = 1b, DATA[7:0] is valid STROBE[7] = 0b,

                                               // DATA[63:56] is not valid

 

      .s_axis_tuser(),             // TUSER_WIDTH-bit input: TUSER: The user-defined sideband

                                               // information that can be transmitted alongside the data

                                               // stream.

 

      .s_axis_tvalid(s_axis_tvalid)            // 1-bit input: TVALID: Indicates that the master is driving a

                                               // valid transfer. A transfer takes place when both TVALID and

                                               // TREADY are asserted

 

   );

 

   // End of xpm_fifo_axis_inst instantiation    
endmodule
