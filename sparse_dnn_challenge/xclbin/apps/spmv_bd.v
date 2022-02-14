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

`timescale 1 ps / 1 ps

module spmv_bd_util_reduced_logic_0_0(din, dout);
input[7:0] din;
output dout;
assign dout = &din;
endmodule

module spmv_bd_xlconcat_0_2(din0, din1, din2, din3, din4, din5, din6, din7, dout);
input[31:0] din0, din1, din2, din3, din4, din5, din6, din7;
output[255:0] dout;

assign dout = {din7, din6, din5, din4, din3, din2, din1, din0};

endmodule

module spmv_bd_xlconcat_1_0(din0, din1, din2, din3, din4, din5, din6, din7, dout);
input din0, din1, din2, din3, din4, din5, din6, din7;
output[7:0] dout;

assign dout = {din7, din6, din5, din4, din3, din2, din1, din0};

endmodule




module ACC_imp_1KNT4EL
   (M_AXIS_tdata,
    M_AXIS_tready,
    M_AXIS_tvalid,
    ap_clk,
    ap_rst_n,
    ins_V1_tdata,
    ins_V1_tready,
    ins_V1_tvalid,
    ins_V2_tdata,
    ins_V2_tready,
    ins_V2_tvalid,
    ins_V3_tdata,
    ins_V3_tready,
    ins_V3_tvalid,
    ins_V4_tdata,
    ins_V4_tready,
    ins_V4_tvalid,
    ins_V5_tdata,
    ins_V5_tready,
    ins_V5_tvalid,
    ins_V6_tdata,
    ins_V6_tready,
    ins_V6_tvalid,
    ins_V7_tdata,
    ins_V7_tready,
    ins_V7_tvalid,
    ins_V_tdata,
    ins_V_tready,
    ins_V_tvalid,
    stream_in_nnz_count_V_V_tdata,
    stream_in_nnz_count_V_V_tready,
    stream_in_nnz_count_V_V_tvalid,
    stream_out_nnz_count_V_V_tdata,
    stream_out_nnz_count_V_V_tready,
    stream_out_nnz_count_V_V_tvalid,
    token_V_V1_tdata,
    token_V_V1_tready,
    token_V_V1_tvalid,
    token_V_V2_tdata,
    token_V_V2_tready,
    token_V_V2_tvalid,
    token_V_V3_tdata,
    token_V_V3_tready,
    token_V_V3_tvalid,
    token_V_V4_tdata,
    token_V_V4_tready,
    token_V_V4_tvalid,
    token_V_V5_tdata,
    token_V_V5_tready,
    token_V_V5_tvalid,
    token_V_V6_tdata,
    token_V_V6_tready,
    token_V_V6_tvalid,
    token_V_V7_tdata,
    token_V_V7_tready,
    token_V_V7_tvalid,
    token_V_V_tdata,
    token_V_V_tready,
    token_V_V_tvalid);
  output [255:0]M_AXIS_tdata;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  input ap_clk;
  input ap_rst_n;
  input [63:0]ins_V1_tdata;
  output ins_V1_tready;
  input ins_V1_tvalid;
  input [63:0]ins_V2_tdata;
  output ins_V2_tready;
  input ins_V2_tvalid;
  input [63:0]ins_V3_tdata;
  output ins_V3_tready;
  input ins_V3_tvalid;
  input [63:0]ins_V4_tdata;
  output ins_V4_tready;
  input ins_V4_tvalid;
  input [63:0]ins_V5_tdata;
  output ins_V5_tready;
  input ins_V5_tvalid;
  input [63:0]ins_V6_tdata;
  output ins_V6_tready;
  input ins_V6_tvalid;
  input [63:0]ins_V7_tdata;
  output ins_V7_tready;
  input ins_V7_tvalid;
  input [63:0]ins_V_tdata;
  output ins_V_tready;
  input ins_V_tvalid;
  input [31:0]stream_in_nnz_count_V_V_tdata;
  output stream_in_nnz_count_V_V_tready;
  input stream_in_nnz_count_V_V_tvalid;
  output [31:0]stream_out_nnz_count_V_V_tdata;
  input stream_out_nnz_count_V_V_tready;
  output stream_out_nnz_count_V_V_tvalid;
  input [31:0]token_V_V1_tdata;
  output token_V_V1_tready;
  input token_V_V1_tvalid;
  input [31:0]token_V_V2_tdata;
  output token_V_V2_tready;
  input token_V_V2_tvalid;
  input [31:0]token_V_V3_tdata;
  output token_V_V3_tready;
  input token_V_V3_tvalid;
  input [31:0]token_V_V4_tdata;
  output token_V_V4_tready;
  input token_V_V4_tvalid;
  input [31:0]token_V_V5_tdata;
  output token_V_V5_tready;
  input token_V_V5_tvalid;
  input [31:0]token_V_V6_tdata;
  output token_V_V6_tready;
  input token_V_V6_tvalid;
  input [31:0]token_V_V7_tdata;
  output token_V_V7_tready;
  input token_V_V7_tvalid;
  input [31:0]token_V_V_tdata;
  output token_V_V_tready;
  input token_V_V_tvalid;

  wire [31:0]ACC_0_stream_vec_V_TDATA;
  wire ACC_0_stream_vec_V_TVALID;
  wire [31:0]ACC_1_stream_vec_V_TDATA;
  wire ACC_1_stream_vec_V_TVALID;
  wire [31:0]ACC_2_stream_vec_V_TDATA;
  wire ACC_2_stream_vec_V_TVALID;
  wire [31:0]ACC_3_stream_vec_V_TDATA;
  wire ACC_3_stream_vec_V_TVALID;
  wire [31:0]ACC_4_stream_vec_V_TDATA;
  wire ACC_4_stream_vec_V_TVALID;
  wire [31:0]ACC_5_stream_vec_V_TDATA;
  wire ACC_5_stream_vec_V_TVALID;
  wire [31:0]ACC_6_stream_vec_V_TDATA;
  wire ACC_6_stream_vec_V_TVALID;
  wire [31:0]ACC_7_stream_vec_V_TDATA;
  wire ACC_7_stream_vec_V_TVALID;
  wire [31:0]Conn1_TDATA;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire [31:0]Conn2_TDATA;
  wire Conn2_TREADY;
  wire Conn2_TVALID;
  wire ap_clk_1;
  wire ap_rst_n_1;
  wire [31:0]axis_broadcaster_2_M00_AXIS_TDATA;
  wire axis_broadcaster_2_M00_AXIS_TREADY;
  wire axis_broadcaster_2_M00_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M01_AXIS_TDATA;
  wire axis_broadcaster_2_M01_AXIS_TREADY;
  wire axis_broadcaster_2_M01_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M02_AXIS_TDATA;
  wire axis_broadcaster_2_M02_AXIS_TREADY;
  wire axis_broadcaster_2_M02_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M03_AXIS_TDATA;
  wire axis_broadcaster_2_M03_AXIS_TREADY;
  wire axis_broadcaster_2_M03_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M04_AXIS_TDATA;
  wire axis_broadcaster_2_M04_AXIS_TREADY;
  wire axis_broadcaster_2_M04_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M05_AXIS_TDATA;
  wire axis_broadcaster_2_M05_AXIS_TREADY;
  wire axis_broadcaster_2_M05_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M06_AXIS_TDATA;
  wire axis_broadcaster_2_M06_AXIS_TREADY;
  wire axis_broadcaster_2_M06_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M07_AXIS_TDATA;
  wire axis_broadcaster_2_M07_AXIS_TREADY;
  wire axis_broadcaster_2_M07_AXIS_TVALID;
  wire [255:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  wire axis_data_fifo_0_s_axis_tready;
  wire [47:0]input_queue1_M_AXIS1_TDATA;
  wire input_queue1_M_AXIS1_TREADY;
  wire input_queue1_M_AXIS1_TVALID;
  wire [47:0]input_queue1_M_AXIS2_TDATA;
  wire input_queue1_M_AXIS2_TREADY;
  wire input_queue1_M_AXIS2_TVALID;
  wire [47:0]input_queue1_M_AXIS3_TDATA;
  wire input_queue1_M_AXIS3_TREADY;
  wire input_queue1_M_AXIS3_TVALID;
  wire [47:0]input_queue1_M_AXIS4_TDATA;
  wire input_queue1_M_AXIS4_TREADY;
  wire input_queue1_M_AXIS4_TVALID;
  wire [47:0]input_queue1_M_AXIS5_TDATA;
  wire input_queue1_M_AXIS5_TREADY;
  wire input_queue1_M_AXIS5_TVALID;
  wire [47:0]input_queue1_M_AXIS6_TDATA;
  wire input_queue1_M_AXIS6_TREADY;
  wire input_queue1_M_AXIS6_TVALID;
  wire [47:0]input_queue1_M_AXIS7_TDATA;
  wire input_queue1_M_AXIS7_TREADY;
  wire input_queue1_M_AXIS7_TVALID;
  wire [47:0]input_queue1_M_AXIS_TDATA;
  wire input_queue1_M_AXIS_TREADY;
  wire input_queue1_M_AXIS_TVALID;
  wire [47:0]input_queue2_M_AXIS1_TDATA;
  wire input_queue2_M_AXIS1_TREADY;
  wire input_queue2_M_AXIS1_TVALID;
  wire [47:0]input_queue2_M_AXIS2_TDATA;
  wire input_queue2_M_AXIS2_TREADY;
  wire input_queue2_M_AXIS2_TVALID;
  wire [47:0]input_queue2_M_AXIS3_TDATA;
  wire input_queue2_M_AXIS3_TREADY;
  wire input_queue2_M_AXIS3_TVALID;
  wire [47:0]input_queue2_M_AXIS4_TDATA;
  wire input_queue2_M_AXIS4_TREADY;
  wire input_queue2_M_AXIS4_TVALID;
  wire [47:0]input_queue2_M_AXIS5_TDATA;
  wire input_queue2_M_AXIS5_TREADY;
  wire input_queue2_M_AXIS5_TVALID;
  wire [47:0]input_queue2_M_AXIS6_TDATA;
  wire input_queue2_M_AXIS6_TREADY;
  wire input_queue2_M_AXIS6_TVALID;
  wire [47:0]input_queue2_M_AXIS7_TDATA;
  wire input_queue2_M_AXIS7_TREADY;
  wire input_queue2_M_AXIS7_TVALID;
  wire [47:0]input_queue2_M_AXIS_TDATA;
  wire input_queue2_M_AXIS_TREADY;
  wire input_queue2_M_AXIS_TVALID;
  wire [47:0]kernel_0_outs_V_TDATA;
  wire kernel_0_outs_V_TREADY;
  wire kernel_0_outs_V_TVALID;
  wire [47:0]kernel_1_outs_V_TDATA;
  wire kernel_1_outs_V_TREADY;
  wire kernel_1_outs_V_TVALID;
  wire [47:0]kernel_2_outs_V_TDATA;
  wire kernel_2_outs_V_TREADY;
  wire kernel_2_outs_V_TVALID;
  wire [47:0]kernel_3_outs_V_TDATA;
  wire kernel_3_outs_V_TREADY;
  wire kernel_3_outs_V_TVALID;
  wire [47:0]kernel_4_outs_V_TDATA;
  wire kernel_4_outs_V_TREADY;
  wire kernel_4_outs_V_TVALID;
  wire [47:0]kernel_5_outs_V_TDATA;
  wire kernel_5_outs_V_TREADY;
  wire kernel_5_outs_V_TVALID;
  wire [47:0]kernel_6_outs_V_TDATA;
  wire kernel_6_outs_V_TREADY;
  wire kernel_6_outs_V_TVALID;
  wire [47:0]kernel_7_outs_V_TDATA;
  wire kernel_7_outs_V_TREADY;
  wire kernel_7_outs_V_TVALID;
  wire [47:0]monitor_0_stream_out_V_0_TDATA;
  wire monitor_0_stream_out_V_0_TREADY;
  wire monitor_0_stream_out_V_0_TVALID;
  wire [47:0]monitor_0_stream_out_V_1_TDATA;
  wire monitor_0_stream_out_V_1_TREADY;
  wire monitor_0_stream_out_V_1_TVALID;
  wire [47:0]monitor_0_stream_out_V_2_TDATA;
  wire monitor_0_stream_out_V_2_TREADY;
  wire monitor_0_stream_out_V_2_TVALID;
  wire [47:0]monitor_0_stream_out_V_3_TDATA;
  wire monitor_0_stream_out_V_3_TREADY;
  wire monitor_0_stream_out_V_3_TVALID;
  wire [47:0]monitor_0_stream_out_V_4_TDATA;
  wire monitor_0_stream_out_V_4_TREADY;
  wire monitor_0_stream_out_V_4_TVALID;
  wire [47:0]monitor_0_stream_out_V_5_TDATA;
  wire monitor_0_stream_out_V_5_TREADY;
  wire monitor_0_stream_out_V_5_TVALID;
  wire [47:0]monitor_0_stream_out_V_6_TDATA;
  wire monitor_0_stream_out_V_6_TREADY;
  wire monitor_0_stream_out_V_6_TVALID;
  wire [47:0]monitor_0_stream_out_V_7_TDATA;
  wire monitor_0_stream_out_V_7_TREADY;
  wire monitor_0_stream_out_V_7_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_0_TDATA;
  wire noc_wrapper_1_M_AXIS_0_TREADY;
  wire noc_wrapper_1_M_AXIS_0_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_1_TDATA;
  wire noc_wrapper_1_M_AXIS_1_TREADY;
  wire noc_wrapper_1_M_AXIS_1_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_2_TDATA;
  wire noc_wrapper_1_M_AXIS_2_TREADY;
  wire noc_wrapper_1_M_AXIS_2_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_3_TDATA;
  wire noc_wrapper_1_M_AXIS_3_TREADY;
  wire noc_wrapper_1_M_AXIS_3_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_4_TDATA;
  wire noc_wrapper_1_M_AXIS_4_TREADY;
  wire noc_wrapper_1_M_AXIS_4_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_5_TDATA;
  wire noc_wrapper_1_M_AXIS_5_TREADY;
  wire noc_wrapper_1_M_AXIS_5_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_6_TDATA;
  wire noc_wrapper_1_M_AXIS_6_TREADY;
  wire noc_wrapper_1_M_AXIS_6_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_7_TDATA;
  wire noc_wrapper_1_M_AXIS_7_TREADY;
  wire noc_wrapper_1_M_AXIS_7_TVALID;
  wire util_reduced_logic_0_Res;
  wire [255:0]xlconcat_0_dout;
  wire [7:0]xlconcat_1_dout;

  assign Conn1_TDATA = stream_in_nnz_count_V_V_tdata[31:0];
  assign Conn1_TVALID = stream_in_nnz_count_V_V_tvalid;
  assign Conn2_TREADY = stream_out_nnz_count_V_V_tready;
  assign M_AXIS_tdata[255:0] = axis_data_fifo_0_M_AXIS_TDATA;
  assign M_AXIS_tvalid = axis_data_fifo_0_M_AXIS_TVALID;
  assign ap_clk_1 = ap_clk;
  assign ap_rst_n_1 = ap_rst_n;
  assign axis_broadcaster_2_M00_AXIS_TDATA = token_V_V5_tdata[31:0];
  assign axis_broadcaster_2_M00_AXIS_TVALID = token_V_V5_tvalid;
  assign axis_broadcaster_2_M01_AXIS_TDATA = token_V_V6_tdata[31:0];
  assign axis_broadcaster_2_M01_AXIS_TVALID = token_V_V6_tvalid;
  assign axis_broadcaster_2_M02_AXIS_TDATA = token_V_V7_tdata[31:0];
  assign axis_broadcaster_2_M02_AXIS_TVALID = token_V_V7_tvalid;
  assign axis_broadcaster_2_M03_AXIS_TDATA = token_V_V_tdata[31:0];
  assign axis_broadcaster_2_M03_AXIS_TVALID = token_V_V_tvalid;
  assign axis_broadcaster_2_M04_AXIS_TDATA = token_V_V1_tdata[31:0];
  assign axis_broadcaster_2_M04_AXIS_TVALID = token_V_V1_tvalid;
  assign axis_broadcaster_2_M05_AXIS_TDATA = token_V_V2_tdata[31:0];
  assign axis_broadcaster_2_M05_AXIS_TVALID = token_V_V2_tvalid;
  assign axis_broadcaster_2_M06_AXIS_TDATA = token_V_V3_tdata[31:0];
  assign axis_broadcaster_2_M06_AXIS_TVALID = token_V_V3_tvalid;
  assign axis_broadcaster_2_M07_AXIS_TDATA = token_V_V4_tdata[31:0];
  assign axis_broadcaster_2_M07_AXIS_TVALID = token_V_V4_tvalid;
  assign axis_data_fifo_0_M_AXIS_TREADY = M_AXIS_tready;
  assign ins_V1_tready = noc_wrapper_1_M_AXIS_0_TREADY;
  assign ins_V2_tready = noc_wrapper_1_M_AXIS_1_TREADY;
  assign ins_V3_tready = noc_wrapper_1_M_AXIS_2_TREADY;
  assign ins_V4_tready = noc_wrapper_1_M_AXIS_3_TREADY;
  assign ins_V5_tready = noc_wrapper_1_M_AXIS_4_TREADY;
  assign ins_V6_tready = noc_wrapper_1_M_AXIS_5_TREADY;
  assign ins_V7_tready = noc_wrapper_1_M_AXIS_6_TREADY;
  assign ins_V_tready = noc_wrapper_1_M_AXIS_7_TREADY;
  assign noc_wrapper_1_M_AXIS_0_TDATA = ins_V1_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_0_TVALID = ins_V1_tvalid;
  assign noc_wrapper_1_M_AXIS_1_TDATA = ins_V2_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_1_TVALID = ins_V2_tvalid;
  assign noc_wrapper_1_M_AXIS_2_TDATA = ins_V3_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_2_TVALID = ins_V3_tvalid;
  assign noc_wrapper_1_M_AXIS_3_TDATA = ins_V4_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_3_TVALID = ins_V4_tvalid;
  assign noc_wrapper_1_M_AXIS_4_TDATA = ins_V5_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_4_TVALID = ins_V5_tvalid;
  assign noc_wrapper_1_M_AXIS_5_TDATA = ins_V6_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_5_TVALID = ins_V6_tvalid;
  assign noc_wrapper_1_M_AXIS_6_TDATA = ins_V7_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_6_TVALID = ins_V7_tvalid;
  assign noc_wrapper_1_M_AXIS_7_TDATA = ins_V_tdata[63:0];
  assign noc_wrapper_1_M_AXIS_7_TVALID = ins_V_tvalid;
  assign stream_in_nnz_count_V_V_tready = Conn1_TREADY;
  assign stream_out_nnz_count_V_V_tdata[31:0] = Conn2_TDATA;
  assign stream_out_nnz_count_V_V_tvalid = Conn2_TVALID;
  assign token_V_V1_tready = axis_broadcaster_2_M04_AXIS_TREADY;
  assign token_V_V2_tready = axis_broadcaster_2_M05_AXIS_TREADY;
  assign token_V_V3_tready = axis_broadcaster_2_M06_AXIS_TREADY;
  assign token_V_V4_tready = axis_broadcaster_2_M07_AXIS_TREADY;
  assign token_V_V5_tready = axis_broadcaster_2_M00_AXIS_TREADY;
  assign token_V_V6_tready = axis_broadcaster_2_M01_AXIS_TREADY;
  assign token_V_V7_tready = axis_broadcaster_2_M02_AXIS_TREADY;
  assign token_V_V_tready = axis_broadcaster_2_M03_AXIS_TREADY;
  ACC ACC_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS_TVALID),
        .stream_vec_V_TDATA(ACC_0_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_0_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M00_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M00_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M00_AXIS_TVALID));
  ACC ACC_1
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS1_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS1_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS1_TVALID),
        .stream_vec_V_TDATA(ACC_1_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_1_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M01_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M01_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M01_AXIS_TVALID));
  ACC ACC_2
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS2_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS2_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS2_TVALID),
        .stream_vec_V_TDATA(ACC_2_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_2_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M02_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M02_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M02_AXIS_TVALID));
  ACC ACC_3
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS3_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS3_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS3_TVALID),
        .stream_vec_V_TDATA(ACC_3_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_3_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M03_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M03_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M03_AXIS_TVALID));
  ACC ACC_4
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS4_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS4_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS4_TVALID),
        .stream_vec_V_TDATA(ACC_4_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_4_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M04_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M04_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M04_AXIS_TVALID));
  ACC ACC_5
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS5_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS5_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS5_TVALID),
        .stream_vec_V_TDATA(ACC_5_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_5_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M05_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M05_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M05_AXIS_TVALID));
  ACC ACC_6
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS6_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS6_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS6_TVALID),
        .stream_vec_V_TDATA(ACC_6_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_6_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M06_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M06_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M06_AXIS_TVALID));
  ACC ACC_7
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(input_queue2_M_AXIS7_TDATA),
        .stream_data_in_V_TREADY(input_queue2_M_AXIS7_TREADY),
        .stream_data_in_V_TVALID(input_queue2_M_AXIS7_TVALID),
        .stream_vec_V_TDATA(ACC_7_stream_vec_V_TDATA),
        .stream_vec_V_TREADY(axis_data_fifo_0_s_axis_tready),
        .stream_vec_V_TVALID(ACC_7_stream_vec_V_TVALID),
        .token_V_V_TDATA(axis_broadcaster_2_M07_AXIS_TDATA),
        .token_V_V_TREADY(axis_broadcaster_2_M07_AXIS_TREADY),
        .token_V_V_TVALID(axis_broadcaster_2_M07_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(256), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(xlconcat_0_dout),
        .s_axis_tready(axis_data_fifo_0_s_axis_tready),
        .s_axis_tvalid(util_reduced_logic_0_Res));
  input_queue1_imp_Y81KJL input_queue1
       (.M_AXIS1_tdata(input_queue1_M_AXIS1_TDATA),
        .M_AXIS1_tready(input_queue1_M_AXIS1_TREADY),
        .M_AXIS1_tvalid(input_queue1_M_AXIS1_TVALID),
        .M_AXIS2_tdata(input_queue1_M_AXIS2_TDATA),
        .M_AXIS2_tready(input_queue1_M_AXIS2_TREADY),
        .M_AXIS2_tvalid(input_queue1_M_AXIS2_TVALID),
        .M_AXIS3_tdata(input_queue1_M_AXIS3_TDATA),
        .M_AXIS3_tready(input_queue1_M_AXIS3_TREADY),
        .M_AXIS3_tvalid(input_queue1_M_AXIS3_TVALID),
        .M_AXIS4_tdata(input_queue1_M_AXIS4_TDATA),
        .M_AXIS4_tready(input_queue1_M_AXIS4_TREADY),
        .M_AXIS4_tvalid(input_queue1_M_AXIS4_TVALID),
        .M_AXIS5_tdata(input_queue1_M_AXIS5_TDATA),
        .M_AXIS5_tready(input_queue1_M_AXIS5_TREADY),
        .M_AXIS5_tvalid(input_queue1_M_AXIS5_TVALID),
        .M_AXIS6_tdata(input_queue1_M_AXIS6_TDATA),
        .M_AXIS6_tready(input_queue1_M_AXIS6_TREADY),
        .M_AXIS6_tvalid(input_queue1_M_AXIS6_TVALID),
        .M_AXIS7_tdata(input_queue1_M_AXIS7_TDATA),
        .M_AXIS7_tready(input_queue1_M_AXIS7_TREADY),
        .M_AXIS7_tvalid(input_queue1_M_AXIS7_TVALID),
        .M_AXIS_tdata(input_queue1_M_AXIS_TDATA),
        .M_AXIS_tready(input_queue1_M_AXIS_TREADY),
        .M_AXIS_tvalid(input_queue1_M_AXIS_TVALID),
        .S_AXIS1_tdata(kernel_1_outs_V_TDATA),
        .S_AXIS1_tready(kernel_1_outs_V_TREADY),
        .S_AXIS1_tvalid(kernel_1_outs_V_TVALID),
        .S_AXIS2_tdata(kernel_2_outs_V_TDATA),
        .S_AXIS2_tready(kernel_2_outs_V_TREADY),
        .S_AXIS2_tvalid(kernel_2_outs_V_TVALID),
        .S_AXIS3_tdata(kernel_3_outs_V_TDATA),
        .S_AXIS3_tready(kernel_3_outs_V_TREADY),
        .S_AXIS3_tvalid(kernel_3_outs_V_TVALID),
        .S_AXIS4_tdata(kernel_4_outs_V_TDATA),
        .S_AXIS4_tready(kernel_4_outs_V_TREADY),
        .S_AXIS4_tvalid(kernel_4_outs_V_TVALID),
        .S_AXIS5_tdata(kernel_5_outs_V_TDATA),
        .S_AXIS5_tready(kernel_5_outs_V_TREADY),
        .S_AXIS5_tvalid(kernel_5_outs_V_TVALID),
        .S_AXIS6_tdata(kernel_6_outs_V_TDATA),
        .S_AXIS6_tready(kernel_6_outs_V_TREADY),
        .S_AXIS6_tvalid(kernel_6_outs_V_TVALID),
        .S_AXIS7_tdata(kernel_7_outs_V_TDATA),
        .S_AXIS7_tready(kernel_7_outs_V_TREADY),
        .S_AXIS7_tvalid(kernel_7_outs_V_TVALID),
        .S_AXIS_tdata(kernel_0_outs_V_TDATA),
        .S_AXIS_tready(kernel_0_outs_V_TREADY),
        .S_AXIS_tvalid(kernel_0_outs_V_TVALID),
        .ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1));
  input_queue2_imp_1W7P7KY input_queue2
       (.M_AXIS1_tdata(input_queue2_M_AXIS1_TDATA),
        .M_AXIS1_tready(input_queue2_M_AXIS1_TREADY),
        .M_AXIS1_tvalid(input_queue2_M_AXIS1_TVALID),
        .M_AXIS2_tdata(input_queue2_M_AXIS2_TDATA),
        .M_AXIS2_tready(input_queue2_M_AXIS2_TREADY),
        .M_AXIS2_tvalid(input_queue2_M_AXIS2_TVALID),
        .M_AXIS3_tdata(input_queue2_M_AXIS3_TDATA),
        .M_AXIS3_tready(input_queue2_M_AXIS3_TREADY),
        .M_AXIS3_tvalid(input_queue2_M_AXIS3_TVALID),
        .M_AXIS4_tdata(input_queue2_M_AXIS4_TDATA),
        .M_AXIS4_tready(input_queue2_M_AXIS4_TREADY),
        .M_AXIS4_tvalid(input_queue2_M_AXIS4_TVALID),
        .M_AXIS5_tdata(input_queue2_M_AXIS5_TDATA),
        .M_AXIS5_tready(input_queue2_M_AXIS5_TREADY),
        .M_AXIS5_tvalid(input_queue2_M_AXIS5_TVALID),
        .M_AXIS6_tdata(input_queue2_M_AXIS6_TDATA),
        .M_AXIS6_tready(input_queue2_M_AXIS6_TREADY),
        .M_AXIS6_tvalid(input_queue2_M_AXIS6_TVALID),
        .M_AXIS7_tdata(input_queue2_M_AXIS7_TDATA),
        .M_AXIS7_tready(input_queue2_M_AXIS7_TREADY),
        .M_AXIS7_tvalid(input_queue2_M_AXIS7_TVALID),
        .M_AXIS_tdata(input_queue2_M_AXIS_TDATA),
        .M_AXIS_tready(input_queue2_M_AXIS_TREADY),
        .M_AXIS_tvalid(input_queue2_M_AXIS_TVALID),
        .S_AXIS1_tdata(monitor_0_stream_out_V_1_TDATA),
        .S_AXIS1_tready(monitor_0_stream_out_V_1_TREADY),
        .S_AXIS1_tvalid(monitor_0_stream_out_V_1_TVALID),
        .S_AXIS2_tdata(monitor_0_stream_out_V_2_TDATA),
        .S_AXIS2_tready(monitor_0_stream_out_V_2_TREADY),
        .S_AXIS2_tvalid(monitor_0_stream_out_V_2_TVALID),
        .S_AXIS3_tdata(monitor_0_stream_out_V_3_TDATA),
        .S_AXIS3_tready(monitor_0_stream_out_V_3_TREADY),
        .S_AXIS3_tvalid(monitor_0_stream_out_V_3_TVALID),
        .S_AXIS4_tdata(monitor_0_stream_out_V_4_TDATA),
        .S_AXIS4_tready(monitor_0_stream_out_V_4_TREADY),
        .S_AXIS4_tvalid(monitor_0_stream_out_V_4_TVALID),
        .S_AXIS5_tdata(monitor_0_stream_out_V_5_TDATA),
        .S_AXIS5_tready(monitor_0_stream_out_V_5_TREADY),
        .S_AXIS5_tvalid(monitor_0_stream_out_V_5_TVALID),
        .S_AXIS6_tdata(monitor_0_stream_out_V_6_TDATA),
        .S_AXIS6_tready(monitor_0_stream_out_V_6_TREADY),
        .S_AXIS6_tvalid(monitor_0_stream_out_V_6_TVALID),
        .S_AXIS7_tdata(monitor_0_stream_out_V_7_TDATA),
        .S_AXIS7_tready(monitor_0_stream_out_V_7_TREADY),
        .S_AXIS7_tvalid(monitor_0_stream_out_V_7_TVALID),
        .S_AXIS_tdata(monitor_0_stream_out_V_0_TDATA),
        .S_AXIS_tready(monitor_0_stream_out_V_0_TREADY),
        .S_AXIS_tvalid(monitor_0_stream_out_V_0_TVALID),
        .ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1));
  kernel kernel_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_0_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_0_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_0_TVALID),
        .outs_V_TDATA(kernel_0_outs_V_TDATA),
        .outs_V_TREADY(kernel_0_outs_V_TREADY),
        .outs_V_TVALID(kernel_0_outs_V_TVALID));
  kernel kernel_1
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_1_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_1_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_1_TVALID),
        .outs_V_TDATA(kernel_1_outs_V_TDATA),
        .outs_V_TREADY(kernel_1_outs_V_TREADY),
        .outs_V_TVALID(kernel_1_outs_V_TVALID));
  kernel kernel_2
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_2_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_2_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_2_TVALID),
        .outs_V_TDATA(kernel_2_outs_V_TDATA),
        .outs_V_TREADY(kernel_2_outs_V_TREADY),
        .outs_V_TVALID(kernel_2_outs_V_TVALID));
  kernel kernel_3
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_3_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_3_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_3_TVALID),
        .outs_V_TDATA(kernel_3_outs_V_TDATA),
        .outs_V_TREADY(kernel_3_outs_V_TREADY),
        .outs_V_TVALID(kernel_3_outs_V_TVALID));
  kernel kernel_4
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_4_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_4_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_4_TVALID),
        .outs_V_TDATA(kernel_4_outs_V_TDATA),
        .outs_V_TREADY(kernel_4_outs_V_TREADY),
        .outs_V_TVALID(kernel_4_outs_V_TVALID));
  kernel kernel_5
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_5_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_5_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_5_TVALID),
        .outs_V_TDATA(kernel_5_outs_V_TDATA),
        .outs_V_TREADY(kernel_5_outs_V_TREADY),
        .outs_V_TVALID(kernel_5_outs_V_TVALID));
  kernel kernel_6
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_6_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_6_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_6_TVALID),
        .outs_V_TDATA(kernel_6_outs_V_TDATA),
        .outs_V_TREADY(kernel_6_outs_V_TREADY),
        .outs_V_TVALID(kernel_6_outs_V_TVALID));
  kernel kernel_7
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V_TDATA(noc_wrapper_1_M_AXIS_7_TDATA),
        .ins_V_TREADY(noc_wrapper_1_M_AXIS_7_TREADY),
        .ins_V_TVALID(noc_wrapper_1_M_AXIS_7_TVALID),
        .outs_V_TDATA(kernel_7_outs_V_TDATA),
        .outs_V_TREADY(kernel_7_outs_V_TREADY),
        .outs_V_TVALID(kernel_7_outs_V_TVALID));
  monitor monitor_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_in_V_0_TDATA(input_queue1_M_AXIS_TDATA),
        .stream_in_V_0_TREADY(input_queue1_M_AXIS_TREADY),
        .stream_in_V_0_TVALID(input_queue1_M_AXIS_TVALID),
        .stream_in_V_1_TDATA(input_queue1_M_AXIS1_TDATA),
        .stream_in_V_1_TREADY(input_queue1_M_AXIS1_TREADY),
        .stream_in_V_1_TVALID(input_queue1_M_AXIS1_TVALID),
        .stream_in_V_2_TDATA(input_queue1_M_AXIS2_TDATA),
        .stream_in_V_2_TREADY(input_queue1_M_AXIS2_TREADY),
        .stream_in_V_2_TVALID(input_queue1_M_AXIS2_TVALID),
        .stream_in_V_3_TDATA(input_queue1_M_AXIS3_TDATA),
        .stream_in_V_3_TREADY(input_queue1_M_AXIS3_TREADY),
        .stream_in_V_3_TVALID(input_queue1_M_AXIS3_TVALID),
        .stream_in_V_4_TDATA(input_queue1_M_AXIS4_TDATA),
        .stream_in_V_4_TREADY(input_queue1_M_AXIS4_TREADY),
        .stream_in_V_4_TVALID(input_queue1_M_AXIS4_TVALID),
        .stream_in_V_5_TDATA(input_queue1_M_AXIS5_TDATA),
        .stream_in_V_5_TREADY(input_queue1_M_AXIS5_TREADY),
        .stream_in_V_5_TVALID(input_queue1_M_AXIS5_TVALID),
        .stream_in_V_6_TDATA(input_queue1_M_AXIS6_TDATA),
        .stream_in_V_6_TREADY(input_queue1_M_AXIS6_TREADY),
        .stream_in_V_6_TVALID(input_queue1_M_AXIS6_TVALID),
        .stream_in_V_7_TDATA(input_queue1_M_AXIS7_TDATA),
        .stream_in_V_7_TREADY(input_queue1_M_AXIS7_TREADY),
        .stream_in_V_7_TVALID(input_queue1_M_AXIS7_TVALID),
        .stream_in_nnz_count_V_V_TDATA(Conn1_TDATA),
        .stream_in_nnz_count_V_V_TREADY(Conn1_TREADY),
        .stream_in_nnz_count_V_V_TVALID(Conn1_TVALID),
        .stream_out_V_0_TDATA(monitor_0_stream_out_V_0_TDATA),
        .stream_out_V_0_TREADY(monitor_0_stream_out_V_0_TREADY),
        .stream_out_V_0_TVALID(monitor_0_stream_out_V_0_TVALID),
        .stream_out_V_1_TDATA(monitor_0_stream_out_V_1_TDATA),
        .stream_out_V_1_TREADY(monitor_0_stream_out_V_1_TREADY),
        .stream_out_V_1_TVALID(monitor_0_stream_out_V_1_TVALID),
        .stream_out_V_2_TDATA(monitor_0_stream_out_V_2_TDATA),
        .stream_out_V_2_TREADY(monitor_0_stream_out_V_2_TREADY),
        .stream_out_V_2_TVALID(monitor_0_stream_out_V_2_TVALID),
        .stream_out_V_3_TDATA(monitor_0_stream_out_V_3_TDATA),
        .stream_out_V_3_TREADY(monitor_0_stream_out_V_3_TREADY),
        .stream_out_V_3_TVALID(monitor_0_stream_out_V_3_TVALID),
        .stream_out_V_4_TDATA(monitor_0_stream_out_V_4_TDATA),
        .stream_out_V_4_TREADY(monitor_0_stream_out_V_4_TREADY),
        .stream_out_V_4_TVALID(monitor_0_stream_out_V_4_TVALID),
        .stream_out_V_5_TDATA(monitor_0_stream_out_V_5_TDATA),
        .stream_out_V_5_TREADY(monitor_0_stream_out_V_5_TREADY),
        .stream_out_V_5_TVALID(monitor_0_stream_out_V_5_TVALID),
        .stream_out_V_6_TDATA(monitor_0_stream_out_V_6_TDATA),
        .stream_out_V_6_TREADY(monitor_0_stream_out_V_6_TREADY),
        .stream_out_V_6_TVALID(monitor_0_stream_out_V_6_TVALID),
        .stream_out_V_7_TDATA(monitor_0_stream_out_V_7_TDATA),
        .stream_out_V_7_TREADY(monitor_0_stream_out_V_7_TREADY),
        .stream_out_V_7_TVALID(monitor_0_stream_out_V_7_TVALID),
        .stream_out_nnz_count_V_V_TDATA(Conn2_TDATA),
        .stream_out_nnz_count_V_V_TREADY(Conn2_TREADY),
        .stream_out_nnz_count_V_V_TVALID(Conn2_TVALID));
  spmv_bd_util_reduced_logic_0_0 util_reduced_logic_0
       (.din(xlconcat_1_dout),
        .dout(util_reduced_logic_0_Res));
  spmv_bd_xlconcat_0_2 xlconcat_0
       (.din0(ACC_0_stream_vec_V_TDATA),
        .din1(ACC_1_stream_vec_V_TDATA),
        .din2(ACC_2_stream_vec_V_TDATA),
        .din3(ACC_3_stream_vec_V_TDATA),
        .din4(ACC_4_stream_vec_V_TDATA),
        .din5(ACC_5_stream_vec_V_TDATA),
        .din6(ACC_6_stream_vec_V_TDATA),
        .din7(ACC_7_stream_vec_V_TDATA),
        .dout(xlconcat_0_dout));
  spmv_bd_xlconcat_1_0 xlconcat_1
       (.din0(ACC_0_stream_vec_V_TVALID),
        .din1(ACC_1_stream_vec_V_TVALID),
        .din2(ACC_2_stream_vec_V_TVALID),
        .din3(ACC_3_stream_vec_V_TVALID),
        .din4(ACC_4_stream_vec_V_TVALID),
        .din5(ACC_5_stream_vec_V_TVALID),
        .din6(ACC_6_stream_vec_V_TVALID),
        .din7(ACC_7_stream_vec_V_TVALID),
        .dout(xlconcat_1_dout));
endmodule

module BVB_imp_3VPNHQ
   (ap_clk,
    ap_rst_n,
    stream_data_in_V1_tdata,
    stream_data_in_V1_tready,
    stream_data_in_V1_tvalid,
    stream_data_in_V2_tdata,
    stream_data_in_V2_tready,
    stream_data_in_V2_tvalid,
    stream_data_in_V3_tdata,
    stream_data_in_V3_tready,
    stream_data_in_V3_tvalid,
    stream_data_in_V4_tdata,
    stream_data_in_V4_tready,
    stream_data_in_V4_tvalid,
    stream_data_in_V5_tdata,
    stream_data_in_V5_tready,
    stream_data_in_V5_tvalid,
    stream_data_in_V6_tdata,
    stream_data_in_V6_tready,
    stream_data_in_V6_tvalid,
    stream_data_in_V7_tdata,
    stream_data_in_V7_tready,
    stream_data_in_V7_tvalid,
    stream_data_in_V_tdata,
    stream_data_in_V_tready,
    stream_data_in_V_tvalid,
    stream_data_out_V1_tdata,
    stream_data_out_V1_tready,
    stream_data_out_V1_tvalid,
    stream_data_out_V2_tdata,
    stream_data_out_V2_tready,
    stream_data_out_V2_tvalid,
    stream_data_out_V3_tdata,
    stream_data_out_V3_tready,
    stream_data_out_V3_tvalid,
    stream_data_out_V4_tdata,
    stream_data_out_V4_tready,
    stream_data_out_V4_tvalid,
    stream_data_out_V5_tdata,
    stream_data_out_V5_tready,
    stream_data_out_V5_tvalid,
    stream_data_out_V6_tdata,
    stream_data_out_V6_tready,
    stream_data_out_V6_tvalid,
    stream_data_out_V7_tdata,
    stream_data_out_V7_tready,
    stream_data_out_V7_tvalid,
    stream_data_out_V_tdata,
    stream_data_out_V_tready,
    stream_data_out_V_tvalid,
    stream_vec_V1_tdata,
    stream_vec_V1_tready,
    stream_vec_V1_tvalid,
    stream_vec_V2_tdata,
    stream_vec_V2_tready,
    stream_vec_V2_tvalid,
    stream_vec_V3_tdata,
    stream_vec_V3_tready,
    stream_vec_V3_tvalid,
    stream_vec_V4_tdata,
    stream_vec_V4_tready,
    stream_vec_V4_tvalid,
    stream_vec_V5_tdata,
    stream_vec_V5_tready,
    stream_vec_V5_tvalid,
    stream_vec_V6_tdata,
    stream_vec_V6_tready,
    stream_vec_V6_tvalid,
    stream_vec_V7_tdata,
    stream_vec_V7_tready,
    stream_vec_V7_tvalid,
    stream_vec_V_tdata,
    stream_vec_V_tready,
    stream_vec_V_tvalid);
  input ap_clk;
  input ap_rst_n;
  input [63:0]stream_data_in_V1_tdata;
  output stream_data_in_V1_tready;
  input stream_data_in_V1_tvalid;
  input [63:0]stream_data_in_V2_tdata;
  output stream_data_in_V2_tready;
  input stream_data_in_V2_tvalid;
  input [63:0]stream_data_in_V3_tdata;
  output stream_data_in_V3_tready;
  input stream_data_in_V3_tvalid;
  input [63:0]stream_data_in_V4_tdata;
  output stream_data_in_V4_tready;
  input stream_data_in_V4_tvalid;
  input [63:0]stream_data_in_V5_tdata;
  output stream_data_in_V5_tready;
  input stream_data_in_V5_tvalid;
  input [63:0]stream_data_in_V6_tdata;
  output stream_data_in_V6_tready;
  input stream_data_in_V6_tvalid;
  input [63:0]stream_data_in_V7_tdata;
  output stream_data_in_V7_tready;
  input stream_data_in_V7_tvalid;
  input [63:0]stream_data_in_V_tdata;
  output stream_data_in_V_tready;
  input stream_data_in_V_tvalid;
  output [63:0]stream_data_out_V1_tdata;
  input stream_data_out_V1_tready;
  output stream_data_out_V1_tvalid;
  output [63:0]stream_data_out_V2_tdata;
  input stream_data_out_V2_tready;
  output stream_data_out_V2_tvalid;
  output [63:0]stream_data_out_V3_tdata;
  input stream_data_out_V3_tready;
  output stream_data_out_V3_tvalid;
  output [63:0]stream_data_out_V4_tdata;
  input stream_data_out_V4_tready;
  output stream_data_out_V4_tvalid;
  output [63:0]stream_data_out_V5_tdata;
  input stream_data_out_V5_tready;
  output stream_data_out_V5_tvalid;
  output [63:0]stream_data_out_V6_tdata;
  input stream_data_out_V6_tready;
  output stream_data_out_V6_tvalid;
  output [63:0]stream_data_out_V7_tdata;
  input stream_data_out_V7_tready;
  output stream_data_out_V7_tvalid;
  output [63:0]stream_data_out_V_tdata;
  input stream_data_out_V_tready;
  output stream_data_out_V_tvalid;
  input [31:0]stream_vec_V1_tdata;
  output stream_vec_V1_tready;
  input stream_vec_V1_tvalid;
  input [31:0]stream_vec_V2_tdata;
  output stream_vec_V2_tready;
  input stream_vec_V2_tvalid;
  input [31:0]stream_vec_V3_tdata;
  output stream_vec_V3_tready;
  input stream_vec_V3_tvalid;
  input [31:0]stream_vec_V4_tdata;
  output stream_vec_V4_tready;
  input stream_vec_V4_tvalid;
  input [31:0]stream_vec_V5_tdata;
  output stream_vec_V5_tready;
  input stream_vec_V5_tvalid;
  input [31:0]stream_vec_V6_tdata;
  output stream_vec_V6_tready;
  input stream_vec_V6_tvalid;
  input [31:0]stream_vec_V7_tdata;
  output stream_vec_V7_tready;
  input stream_vec_V7_tvalid;
  input [31:0]stream_vec_V_tdata;
  output stream_vec_V_tready;
  input stream_vec_V_tvalid;

  wire [63:0]BVB_load_0_stream_data_out_V_TDATA;
  wire BVB_load_0_stream_data_out_V_TREADY;
  wire BVB_load_0_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_1_stream_data_out_V_TDATA;
  wire BVB_load_1_stream_data_out_V_TREADY;
  wire BVB_load_1_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_2_stream_data_out_V_TDATA;
  wire BVB_load_2_stream_data_out_V_TREADY;
  wire BVB_load_2_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_3_stream_data_out_V_TDATA;
  wire BVB_load_3_stream_data_out_V_TREADY;
  wire BVB_load_3_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_4_stream_data_out_V_TDATA;
  wire BVB_load_4_stream_data_out_V_TREADY;
  wire BVB_load_4_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_5_stream_data_out_V_TDATA;
  wire BVB_load_5_stream_data_out_V_TREADY;
  wire BVB_load_5_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_6_stream_data_out_V_TDATA;
  wire BVB_load_6_stream_data_out_V_TREADY;
  wire BVB_load_6_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_7_stream_data_out_V_TDATA;
  wire BVB_load_7_stream_data_out_V_TREADY;
  wire BVB_load_7_stream_data_out_V_TVALID;
  wire ap_clk_1;
  wire ap_rst_n_1;
  wire [31:0]axis_broadcaster_1_M00_AXIS_TDATA;
  wire axis_broadcaster_1_M00_AXIS_TREADY;
  wire axis_broadcaster_1_M00_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M01_AXIS_TDATA;
  wire axis_broadcaster_1_M01_AXIS_TREADY;
  wire axis_broadcaster_1_M01_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M02_AXIS_TDATA;
  wire axis_broadcaster_1_M02_AXIS_TREADY;
  wire axis_broadcaster_1_M02_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M03_AXIS_TDATA;
  wire axis_broadcaster_1_M03_AXIS_TREADY;
  wire axis_broadcaster_1_M03_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M04_AXIS_TDATA;
  wire axis_broadcaster_1_M04_AXIS_TREADY;
  wire axis_broadcaster_1_M04_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M05_AXIS_TDATA;
  wire axis_broadcaster_1_M05_AXIS_TREADY;
  wire axis_broadcaster_1_M05_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M06_AXIS_TDATA;
  wire axis_broadcaster_1_M06_AXIS_TREADY;
  wire axis_broadcaster_1_M06_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M07_AXIS_TDATA;
  wire axis_broadcaster_1_M07_AXIS_TREADY;
  wire axis_broadcaster_1_M07_AXIS_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_0_TDATA;
  wire noc_wrapper_0_M_AXIS_0_TREADY;
  wire noc_wrapper_0_M_AXIS_0_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_1_TDATA;
  wire noc_wrapper_0_M_AXIS_1_TREADY;
  wire noc_wrapper_0_M_AXIS_1_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_2_TDATA;
  wire noc_wrapper_0_M_AXIS_2_TREADY;
  wire noc_wrapper_0_M_AXIS_2_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_3_TDATA;
  wire noc_wrapper_0_M_AXIS_3_TREADY;
  wire noc_wrapper_0_M_AXIS_3_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_4_TDATA;
  wire noc_wrapper_0_M_AXIS_4_TREADY;
  wire noc_wrapper_0_M_AXIS_4_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_5_TDATA;
  wire noc_wrapper_0_M_AXIS_5_TREADY;
  wire noc_wrapper_0_M_AXIS_5_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_6_TDATA;
  wire noc_wrapper_0_M_AXIS_6_TREADY;
  wire noc_wrapper_0_M_AXIS_6_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_7_TDATA;
  wire noc_wrapper_0_M_AXIS_7_TREADY;
  wire noc_wrapper_0_M_AXIS_7_TVALID;

  assign BVB_load_0_stream_data_out_V_TREADY = stream_data_out_V5_tready;
  assign BVB_load_1_stream_data_out_V_TREADY = stream_data_out_V6_tready;
  assign BVB_load_2_stream_data_out_V_TREADY = stream_data_out_V_tready;
  assign BVB_load_3_stream_data_out_V_TREADY = stream_data_out_V1_tready;
  assign BVB_load_4_stream_data_out_V_TREADY = stream_data_out_V2_tready;
  assign BVB_load_5_stream_data_out_V_TREADY = stream_data_out_V3_tready;
  assign BVB_load_6_stream_data_out_V_TREADY = stream_data_out_V7_tready;
  assign BVB_load_7_stream_data_out_V_TREADY = stream_data_out_V4_tready;
  assign ap_clk_1 = ap_clk;
  assign ap_rst_n_1 = ap_rst_n;
  assign axis_broadcaster_1_M00_AXIS_TDATA = stream_vec_V5_tdata[31:0];
  assign axis_broadcaster_1_M00_AXIS_TVALID = stream_vec_V5_tvalid;
  assign axis_broadcaster_1_M01_AXIS_TDATA = stream_vec_V6_tdata[31:0];
  assign axis_broadcaster_1_M01_AXIS_TVALID = stream_vec_V6_tvalid;
  assign axis_broadcaster_1_M02_AXIS_TDATA = stream_vec_V_tdata[31:0];
  assign axis_broadcaster_1_M02_AXIS_TVALID = stream_vec_V_tvalid;
  assign axis_broadcaster_1_M03_AXIS_TDATA = stream_vec_V1_tdata[31:0];
  assign axis_broadcaster_1_M03_AXIS_TVALID = stream_vec_V1_tvalid;
  assign axis_broadcaster_1_M04_AXIS_TDATA = stream_vec_V2_tdata[31:0];
  assign axis_broadcaster_1_M04_AXIS_TVALID = stream_vec_V2_tvalid;
  assign axis_broadcaster_1_M05_AXIS_TDATA = stream_vec_V3_tdata[31:0];
  assign axis_broadcaster_1_M05_AXIS_TVALID = stream_vec_V3_tvalid;
  assign axis_broadcaster_1_M06_AXIS_TDATA = stream_vec_V7_tdata[31:0];
  assign axis_broadcaster_1_M06_AXIS_TVALID = stream_vec_V7_tvalid;
  assign axis_broadcaster_1_M07_AXIS_TDATA = stream_vec_V4_tdata[31:0];
  assign axis_broadcaster_1_M07_AXIS_TVALID = stream_vec_V4_tvalid;
  assign noc_wrapper_0_M_AXIS_0_TDATA = stream_data_in_V5_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_0_TVALID = stream_data_in_V5_tvalid;
  assign noc_wrapper_0_M_AXIS_1_TDATA = stream_data_in_V6_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_1_TVALID = stream_data_in_V6_tvalid;
  assign noc_wrapper_0_M_AXIS_2_TDATA = stream_data_in_V_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_2_TVALID = stream_data_in_V_tvalid;
  assign noc_wrapper_0_M_AXIS_3_TDATA = stream_data_in_V1_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_3_TVALID = stream_data_in_V1_tvalid;
  assign noc_wrapper_0_M_AXIS_4_TDATA = stream_data_in_V2_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_4_TVALID = stream_data_in_V2_tvalid;
  assign noc_wrapper_0_M_AXIS_5_TDATA = stream_data_in_V3_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_5_TVALID = stream_data_in_V3_tvalid;
  assign noc_wrapper_0_M_AXIS_6_TDATA = stream_data_in_V7_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_6_TVALID = stream_data_in_V7_tvalid;
  assign noc_wrapper_0_M_AXIS_7_TDATA = stream_data_in_V4_tdata[63:0];
  assign noc_wrapper_0_M_AXIS_7_TVALID = stream_data_in_V4_tvalid;
  assign stream_data_in_V1_tready = noc_wrapper_0_M_AXIS_3_TREADY;
  assign stream_data_in_V2_tready = noc_wrapper_0_M_AXIS_4_TREADY;
  assign stream_data_in_V3_tready = noc_wrapper_0_M_AXIS_5_TREADY;
  assign stream_data_in_V4_tready = noc_wrapper_0_M_AXIS_7_TREADY;
  assign stream_data_in_V5_tready = noc_wrapper_0_M_AXIS_0_TREADY;
  assign stream_data_in_V6_tready = noc_wrapper_0_M_AXIS_1_TREADY;
  assign stream_data_in_V7_tready = noc_wrapper_0_M_AXIS_6_TREADY;
  assign stream_data_in_V_tready = noc_wrapper_0_M_AXIS_2_TREADY;
  assign stream_data_out_V1_tdata[63:0] = BVB_load_3_stream_data_out_V_TDATA;
  assign stream_data_out_V1_tvalid = BVB_load_3_stream_data_out_V_TVALID;
  assign stream_data_out_V2_tdata[63:0] = BVB_load_4_stream_data_out_V_TDATA;
  assign stream_data_out_V2_tvalid = BVB_load_4_stream_data_out_V_TVALID;
  assign stream_data_out_V3_tdata[63:0] = BVB_load_5_stream_data_out_V_TDATA;
  assign stream_data_out_V3_tvalid = BVB_load_5_stream_data_out_V_TVALID;
  assign stream_data_out_V4_tdata[63:0] = BVB_load_7_stream_data_out_V_TDATA;
  assign stream_data_out_V4_tvalid = BVB_load_7_stream_data_out_V_TVALID;
  assign stream_data_out_V5_tdata[63:0] = BVB_load_0_stream_data_out_V_TDATA;
  assign stream_data_out_V5_tvalid = BVB_load_0_stream_data_out_V_TVALID;
  assign stream_data_out_V6_tdata[63:0] = BVB_load_1_stream_data_out_V_TDATA;
  assign stream_data_out_V6_tvalid = BVB_load_1_stream_data_out_V_TVALID;
  assign stream_data_out_V7_tdata[63:0] = BVB_load_6_stream_data_out_V_TDATA;
  assign stream_data_out_V7_tvalid = BVB_load_6_stream_data_out_V_TVALID;
  assign stream_data_out_V_tdata[63:0] = BVB_load_2_stream_data_out_V_TDATA;
  assign stream_data_out_V_tvalid = BVB_load_2_stream_data_out_V_TVALID;
  assign stream_vec_V1_tready = axis_broadcaster_1_M03_AXIS_TREADY;
  assign stream_vec_V2_tready = axis_broadcaster_1_M04_AXIS_TREADY;
  assign stream_vec_V3_tready = axis_broadcaster_1_M05_AXIS_TREADY;
  assign stream_vec_V4_tready = axis_broadcaster_1_M07_AXIS_TREADY;
  assign stream_vec_V5_tready = axis_broadcaster_1_M00_AXIS_TREADY;
  assign stream_vec_V6_tready = axis_broadcaster_1_M01_AXIS_TREADY;
  assign stream_vec_V7_tready = axis_broadcaster_1_M06_AXIS_TREADY;
  assign stream_vec_V_tready = axis_broadcaster_1_M02_AXIS_TREADY;
  BVB_load BVB_load_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_0_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_0_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_0_TVALID),
        .stream_data_out_V_TDATA(BVB_load_0_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_0_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_0_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M00_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M00_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M00_AXIS_TVALID));
  BVB_load BVB_load_1
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_1_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_1_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_1_TVALID),
        .stream_data_out_V_TDATA(BVB_load_1_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_1_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_1_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M01_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M01_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M01_AXIS_TVALID));
  BVB_load BVB_load_2
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_2_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_2_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_2_TVALID),
        .stream_data_out_V_TDATA(BVB_load_2_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_2_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_2_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M02_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M02_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M02_AXIS_TVALID));
  BVB_load BVB_load_3
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_3_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_3_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_3_TVALID),
        .stream_data_out_V_TDATA(BVB_load_3_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_3_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_3_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M03_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M03_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M03_AXIS_TVALID));
  BVB_load BVB_load_4
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_4_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_4_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_4_TVALID),
        .stream_data_out_V_TDATA(BVB_load_4_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_4_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_4_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M04_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M04_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M04_AXIS_TVALID));
  BVB_load BVB_load_5
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_5_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_5_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_5_TVALID),
        .stream_data_out_V_TDATA(BVB_load_5_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_5_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_5_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M05_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M05_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M05_AXIS_TVALID));
  BVB_load BVB_load_6
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_6_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_6_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_6_TVALID),
        .stream_data_out_V_TDATA(BVB_load_6_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_6_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_6_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M06_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M06_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M06_AXIS_TVALID));
  BVB_load BVB_load_7
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V_TDATA(noc_wrapper_0_M_AXIS_7_TDATA),
        .stream_data_in_V_TREADY(noc_wrapper_0_M_AXIS_7_TREADY),
        .stream_data_in_V_TVALID(noc_wrapper_0_M_AXIS_7_TVALID),
        .stream_data_out_V_TDATA(BVB_load_7_stream_data_out_V_TDATA),
        .stream_data_out_V_TREADY(BVB_load_7_stream_data_out_V_TREADY),
        .stream_data_out_V_TVALID(BVB_load_7_stream_data_out_V_TVALID),
        .stream_vec_V_TDATA(axis_broadcaster_1_M07_AXIS_TDATA),
        .stream_vec_V_TREADY(axis_broadcaster_1_M07_AXIS_TREADY),
        .stream_vec_V_TVALID(axis_broadcaster_1_M07_AXIS_TVALID));
endmodule

module input_queue1_imp_Y81KJL
   (M_AXIS1_tdata,
    M_AXIS1_tready,
    M_AXIS1_tvalid,
    M_AXIS2_tdata,
    M_AXIS2_tready,
    M_AXIS2_tvalid,
    M_AXIS3_tdata,
    M_AXIS3_tready,
    M_AXIS3_tvalid,
    M_AXIS4_tdata,
    M_AXIS4_tready,
    M_AXIS4_tvalid,
    M_AXIS5_tdata,
    M_AXIS5_tready,
    M_AXIS5_tvalid,
    M_AXIS6_tdata,
    M_AXIS6_tready,
    M_AXIS6_tvalid,
    M_AXIS7_tdata,
    M_AXIS7_tready,
    M_AXIS7_tvalid,
    M_AXIS_tdata,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS1_tdata,
    S_AXIS1_tready,
    S_AXIS1_tvalid,
    S_AXIS2_tdata,
    S_AXIS2_tready,
    S_AXIS2_tvalid,
    S_AXIS3_tdata,
    S_AXIS3_tready,
    S_AXIS3_tvalid,
    S_AXIS4_tdata,
    S_AXIS4_tready,
    S_AXIS4_tvalid,
    S_AXIS5_tdata,
    S_AXIS5_tready,
    S_AXIS5_tvalid,
    S_AXIS6_tdata,
    S_AXIS6_tready,
    S_AXIS6_tvalid,
    S_AXIS7_tdata,
    S_AXIS7_tready,
    S_AXIS7_tvalid,
    S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid,
    ap_clk,
    ap_rst_n);
  output [47:0]M_AXIS1_tdata;
  input M_AXIS1_tready;
  output M_AXIS1_tvalid;
  output [47:0]M_AXIS2_tdata;
  input M_AXIS2_tready;
  output M_AXIS2_tvalid;
  output [47:0]M_AXIS3_tdata;
  input M_AXIS3_tready;
  output M_AXIS3_tvalid;
  output [47:0]M_AXIS4_tdata;
  input M_AXIS4_tready;
  output M_AXIS4_tvalid;
  output [47:0]M_AXIS5_tdata;
  input M_AXIS5_tready;
  output M_AXIS5_tvalid;
  output [47:0]M_AXIS6_tdata;
  input M_AXIS6_tready;
  output M_AXIS6_tvalid;
  output [47:0]M_AXIS7_tdata;
  input M_AXIS7_tready;
  output M_AXIS7_tvalid;
  output [47:0]M_AXIS_tdata;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  input [47:0]S_AXIS1_tdata;
  output S_AXIS1_tready;
  input S_AXIS1_tvalid;
  input [47:0]S_AXIS2_tdata;
  output S_AXIS2_tready;
  input S_AXIS2_tvalid;
  input [47:0]S_AXIS3_tdata;
  output S_AXIS3_tready;
  input S_AXIS3_tvalid;
  input [47:0]S_AXIS4_tdata;
  output S_AXIS4_tready;
  input S_AXIS4_tvalid;
  input [47:0]S_AXIS5_tdata;
  output S_AXIS5_tready;
  input S_AXIS5_tvalid;
  input [47:0]S_AXIS6_tdata;
  output S_AXIS6_tready;
  input S_AXIS6_tvalid;
  input [47:0]S_AXIS7_tdata;
  output S_AXIS7_tready;
  input S_AXIS7_tvalid;
  input [47:0]S_AXIS_tdata;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input ap_clk;
  input ap_rst_n;

  wire ap_clk_1;
  wire ap_rst_n_1;
  wire [47:0]axis_broadcaster_0_M00_AXIS_TDATA;
  wire axis_broadcaster_0_M00_AXIS_TREADY;
  wire axis_broadcaster_0_M00_AXIS_TVALID;
  wire [47:0]axis_broadcaster_0_M01_AXIS_TDATA;
  wire axis_broadcaster_0_M01_AXIS_TREADY;
  wire axis_broadcaster_0_M01_AXIS_TVALID;
  wire [47:0]axis_broadcaster_0_M02_AXIS_TDATA;
  wire axis_broadcaster_0_M02_AXIS_TREADY;
  wire axis_broadcaster_0_M02_AXIS_TVALID;
  wire [47:0]axis_broadcaster_0_M03_AXIS_TDATA;
  wire axis_broadcaster_0_M03_AXIS_TREADY;
  wire axis_broadcaster_0_M03_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M00_AXIS_TDATA;
  wire axis_broadcaster_5_M00_AXIS_TREADY;
  wire axis_broadcaster_5_M00_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M01_AXIS_TDATA;
  wire axis_broadcaster_5_M01_AXIS_TREADY;
  wire axis_broadcaster_5_M01_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M02_AXIS_TDATA;
  wire axis_broadcaster_5_M02_AXIS_TREADY;
  wire axis_broadcaster_5_M02_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M03_AXIS_TDATA;
  wire axis_broadcaster_5_M03_AXIS_TREADY;
  wire axis_broadcaster_5_M03_AXIS_TVALID;
  wire [47:0]axis_data_fifo_0_M_AXIS1_TDATA;
  wire axis_data_fifo_0_M_AXIS1_TREADY;
  wire axis_data_fifo_0_M_AXIS1_TVALID;
  wire [47:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_2_M_AXIS_TDATA;
  wire axis_data_fifo_2_M_AXIS_TREADY;
  wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_3_M_AXIS_TDATA;
  wire axis_data_fifo_3_M_AXIS_TREADY;
  wire axis_data_fifo_3_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_4_M_AXIS_TDATA;
  wire axis_data_fifo_4_M_AXIS_TREADY;
  wire axis_data_fifo_4_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_5_M_AXIS_TDATA;
  wire axis_data_fifo_5_M_AXIS_TREADY;
  wire axis_data_fifo_5_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_6_M_AXIS_TDATA;
  wire axis_data_fifo_6_M_AXIS_TREADY;
  wire axis_data_fifo_6_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_7_M_AXIS_TDATA;
  wire axis_data_fifo_7_M_AXIS_TREADY;
  wire axis_data_fifo_7_M_AXIS_TVALID;

  assign M_AXIS1_tdata[47:0] = axis_data_fifo_1_M_AXIS_TDATA;
  assign M_AXIS1_tvalid = axis_data_fifo_1_M_AXIS_TVALID;
  assign M_AXIS2_tdata[47:0] = axis_data_fifo_2_M_AXIS_TDATA;
  assign M_AXIS2_tvalid = axis_data_fifo_2_M_AXIS_TVALID;
  assign M_AXIS3_tdata[47:0] = axis_data_fifo_3_M_AXIS_TDATA;
  assign M_AXIS3_tvalid = axis_data_fifo_3_M_AXIS_TVALID;
  assign M_AXIS4_tdata[47:0] = axis_data_fifo_4_M_AXIS_TDATA;
  assign M_AXIS4_tvalid = axis_data_fifo_4_M_AXIS_TVALID;
  assign M_AXIS5_tdata[47:0] = axis_data_fifo_5_M_AXIS_TDATA;
  assign M_AXIS5_tvalid = axis_data_fifo_5_M_AXIS_TVALID;
  assign M_AXIS6_tdata[47:0] = axis_data_fifo_6_M_AXIS_TDATA;
  assign M_AXIS6_tvalid = axis_data_fifo_6_M_AXIS_TVALID;
  assign M_AXIS7_tdata[47:0] = axis_data_fifo_7_M_AXIS_TDATA;
  assign M_AXIS7_tvalid = axis_data_fifo_7_M_AXIS_TVALID;
  assign M_AXIS_tdata[47:0] = axis_data_fifo_0_M_AXIS1_TDATA;
  assign M_AXIS_tvalid = axis_data_fifo_0_M_AXIS1_TVALID;
  assign S_AXIS1_tready = axis_broadcaster_0_M01_AXIS_TREADY;
  assign S_AXIS2_tready = axis_broadcaster_0_M02_AXIS_TREADY;
  assign S_AXIS3_tready = axis_broadcaster_0_M03_AXIS_TREADY;
  assign S_AXIS4_tready = axis_broadcaster_5_M00_AXIS_TREADY;
  assign S_AXIS5_tready = axis_broadcaster_5_M01_AXIS_TREADY;
  assign S_AXIS6_tready = axis_broadcaster_5_M02_AXIS_TREADY;
  assign S_AXIS7_tready = axis_broadcaster_5_M03_AXIS_TREADY;
  assign S_AXIS_tready = axis_broadcaster_0_M00_AXIS_TREADY;
  assign ap_clk_1 = ap_clk;
  assign ap_rst_n_1 = ap_rst_n;
  assign axis_broadcaster_0_M00_AXIS_TDATA = S_AXIS_tdata[47:0];
  assign axis_broadcaster_0_M00_AXIS_TVALID = S_AXIS_tvalid;
  assign axis_broadcaster_0_M01_AXIS_TDATA = S_AXIS1_tdata[47:0];
  assign axis_broadcaster_0_M01_AXIS_TVALID = S_AXIS1_tvalid;
  assign axis_broadcaster_0_M02_AXIS_TDATA = S_AXIS2_tdata[47:0];
  assign axis_broadcaster_0_M02_AXIS_TVALID = S_AXIS2_tvalid;
  assign axis_broadcaster_0_M03_AXIS_TDATA = S_AXIS3_tdata[47:0];
  assign axis_broadcaster_0_M03_AXIS_TVALID = S_AXIS3_tvalid;
  assign axis_broadcaster_5_M00_AXIS_TDATA = S_AXIS4_tdata[47:0];
  assign axis_broadcaster_5_M00_AXIS_TVALID = S_AXIS4_tvalid;
  assign axis_broadcaster_5_M01_AXIS_TDATA = S_AXIS5_tdata[47:0];
  assign axis_broadcaster_5_M01_AXIS_TVALID = S_AXIS5_tvalid;
  assign axis_broadcaster_5_M02_AXIS_TDATA = S_AXIS6_tdata[47:0];
  assign axis_broadcaster_5_M02_AXIS_TVALID = S_AXIS6_tvalid;
  assign axis_broadcaster_5_M03_AXIS_TDATA = S_AXIS7_tdata[47:0];
  assign axis_broadcaster_5_M03_AXIS_TVALID = S_AXIS7_tvalid;
  assign axis_data_fifo_0_M_AXIS1_TREADY = M_AXIS_tready;
  assign axis_data_fifo_1_M_AXIS_TREADY = M_AXIS1_tready;
  assign axis_data_fifo_2_M_AXIS_TREADY = M_AXIS2_tready;
  assign axis_data_fifo_3_M_AXIS_TREADY = M_AXIS3_tready;
  assign axis_data_fifo_4_M_AXIS_TREADY = M_AXIS4_tready;
  assign axis_data_fifo_5_M_AXIS_TREADY = M_AXIS5_tready;
  assign axis_data_fifo_6_M_AXIS_TREADY = M_AXIS6_tready;
  assign axis_data_fifo_7_M_AXIS_TREADY = M_AXIS7_tready;
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS1_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS1_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS1_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M00_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M00_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M00_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_1
       (.m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M01_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M01_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M01_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_2
       (.m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M02_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M02_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M02_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_3
       (.m_axis_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M03_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M03_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M03_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_4
       (.m_axis_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_4_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M00_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M00_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M00_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_5
       (.m_axis_tdata(axis_data_fifo_5_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_5_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_5_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M01_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M01_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M01_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_6
       (.m_axis_tdata(axis_data_fifo_6_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_6_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_6_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M02_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M02_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M02_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_7
       (.m_axis_tdata(axis_data_fifo_7_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_7_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_7_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M03_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M03_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M03_AXIS_TVALID));
endmodule

module input_queue2_imp_1W7P7KY
   (M_AXIS1_tdata,
    M_AXIS1_tready,
    M_AXIS1_tvalid,
    M_AXIS2_tdata,
    M_AXIS2_tready,
    M_AXIS2_tvalid,
    M_AXIS3_tdata,
    M_AXIS3_tready,
    M_AXIS3_tvalid,
    M_AXIS4_tdata,
    M_AXIS4_tready,
    M_AXIS4_tvalid,
    M_AXIS5_tdata,
    M_AXIS5_tready,
    M_AXIS5_tvalid,
    M_AXIS6_tdata,
    M_AXIS6_tready,
    M_AXIS6_tvalid,
    M_AXIS7_tdata,
    M_AXIS7_tready,
    M_AXIS7_tvalid,
    M_AXIS_tdata,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS1_tdata,
    S_AXIS1_tready,
    S_AXIS1_tvalid,
    S_AXIS2_tdata,
    S_AXIS2_tready,
    S_AXIS2_tvalid,
    S_AXIS3_tdata,
    S_AXIS3_tready,
    S_AXIS3_tvalid,
    S_AXIS4_tdata,
    S_AXIS4_tready,
    S_AXIS4_tvalid,
    S_AXIS5_tdata,
    S_AXIS5_tready,
    S_AXIS5_tvalid,
    S_AXIS6_tdata,
    S_AXIS6_tready,
    S_AXIS6_tvalid,
    S_AXIS7_tdata,
    S_AXIS7_tready,
    S_AXIS7_tvalid,
    S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid,
    ap_clk,
    ap_rst_n);
  output [47:0]M_AXIS1_tdata;
  input M_AXIS1_tready;
  output M_AXIS1_tvalid;
  output [47:0]M_AXIS2_tdata;
  input M_AXIS2_tready;
  output M_AXIS2_tvalid;
  output [47:0]M_AXIS3_tdata;
  input M_AXIS3_tready;
  output M_AXIS3_tvalid;
  output [47:0]M_AXIS4_tdata;
  input M_AXIS4_tready;
  output M_AXIS4_tvalid;
  output [47:0]M_AXIS5_tdata;
  input M_AXIS5_tready;
  output M_AXIS5_tvalid;
  output [47:0]M_AXIS6_tdata;
  input M_AXIS6_tready;
  output M_AXIS6_tvalid;
  output [47:0]M_AXIS7_tdata;
  input M_AXIS7_tready;
  output M_AXIS7_tvalid;
  output [47:0]M_AXIS_tdata;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  input [47:0]S_AXIS1_tdata;
  output S_AXIS1_tready;
  input S_AXIS1_tvalid;
  input [47:0]S_AXIS2_tdata;
  output S_AXIS2_tready;
  input S_AXIS2_tvalid;
  input [47:0]S_AXIS3_tdata;
  output S_AXIS3_tready;
  input S_AXIS3_tvalid;
  input [47:0]S_AXIS4_tdata;
  output S_AXIS4_tready;
  input S_AXIS4_tvalid;
  input [47:0]S_AXIS5_tdata;
  output S_AXIS5_tready;
  input S_AXIS5_tvalid;
  input [47:0]S_AXIS6_tdata;
  output S_AXIS6_tready;
  input S_AXIS6_tvalid;
  input [47:0]S_AXIS7_tdata;
  output S_AXIS7_tready;
  input S_AXIS7_tvalid;
  input [47:0]S_AXIS_tdata;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input ap_clk;
  input ap_rst_n;

  wire ap_clk_1;
  wire ap_rst_n_1;
  wire [47:0]axis_broadcaster_0_M00_AXIS_TDATA;
  wire axis_broadcaster_0_M00_AXIS_TREADY;
  wire axis_broadcaster_0_M00_AXIS_TVALID;
  wire [47:0]axis_broadcaster_0_M01_AXIS_TDATA;
  wire axis_broadcaster_0_M01_AXIS_TREADY;
  wire axis_broadcaster_0_M01_AXIS_TVALID;
  wire [47:0]axis_broadcaster_0_M02_AXIS_TDATA;
  wire axis_broadcaster_0_M02_AXIS_TREADY;
  wire axis_broadcaster_0_M02_AXIS_TVALID;
  wire [47:0]axis_broadcaster_0_M03_AXIS_TDATA;
  wire axis_broadcaster_0_M03_AXIS_TREADY;
  wire axis_broadcaster_0_M03_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M00_AXIS_TDATA;
  wire axis_broadcaster_5_M00_AXIS_TREADY;
  wire axis_broadcaster_5_M00_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M01_AXIS_TDATA;
  wire axis_broadcaster_5_M01_AXIS_TREADY;
  wire axis_broadcaster_5_M01_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M02_AXIS_TDATA;
  wire axis_broadcaster_5_M02_AXIS_TREADY;
  wire axis_broadcaster_5_M02_AXIS_TVALID;
  wire [47:0]axis_broadcaster_5_M03_AXIS_TDATA;
  wire axis_broadcaster_5_M03_AXIS_TREADY;
  wire axis_broadcaster_5_M03_AXIS_TVALID;
  wire [47:0]axis_data_fifo_0_M_AXIS1_TDATA;
  wire axis_data_fifo_0_M_AXIS1_TREADY;
  wire axis_data_fifo_0_M_AXIS1_TVALID;
  wire [47:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_2_M_AXIS_TDATA;
  wire axis_data_fifo_2_M_AXIS_TREADY;
  wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_3_M_AXIS_TDATA;
  wire axis_data_fifo_3_M_AXIS_TREADY;
  wire axis_data_fifo_3_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_4_M_AXIS_TDATA;
  wire axis_data_fifo_4_M_AXIS_TREADY;
  wire axis_data_fifo_4_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_5_M_AXIS_TDATA;
  wire axis_data_fifo_5_M_AXIS_TREADY;
  wire axis_data_fifo_5_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_6_M_AXIS_TDATA;
  wire axis_data_fifo_6_M_AXIS_TREADY;
  wire axis_data_fifo_6_M_AXIS_TVALID;
  wire [47:0]axis_data_fifo_7_M_AXIS_TDATA;
  wire axis_data_fifo_7_M_AXIS_TREADY;
  wire axis_data_fifo_7_M_AXIS_TVALID;

  assign M_AXIS1_tdata[47:0] = axis_data_fifo_1_M_AXIS_TDATA;
  assign M_AXIS1_tvalid = axis_data_fifo_1_M_AXIS_TVALID;
  assign M_AXIS2_tdata[47:0] = axis_data_fifo_2_M_AXIS_TDATA;
  assign M_AXIS2_tvalid = axis_data_fifo_2_M_AXIS_TVALID;
  assign M_AXIS3_tdata[47:0] = axis_data_fifo_3_M_AXIS_TDATA;
  assign M_AXIS3_tvalid = axis_data_fifo_3_M_AXIS_TVALID;
  assign M_AXIS4_tdata[47:0] = axis_data_fifo_4_M_AXIS_TDATA;
  assign M_AXIS4_tvalid = axis_data_fifo_4_M_AXIS_TVALID;
  assign M_AXIS5_tdata[47:0] = axis_data_fifo_5_M_AXIS_TDATA;
  assign M_AXIS5_tvalid = axis_data_fifo_5_M_AXIS_TVALID;
  assign M_AXIS6_tdata[47:0] = axis_data_fifo_6_M_AXIS_TDATA;
  assign M_AXIS6_tvalid = axis_data_fifo_6_M_AXIS_TVALID;
  assign M_AXIS7_tdata[47:0] = axis_data_fifo_7_M_AXIS_TDATA;
  assign M_AXIS7_tvalid = axis_data_fifo_7_M_AXIS_TVALID;
  assign M_AXIS_tdata[47:0] = axis_data_fifo_0_M_AXIS1_TDATA;
  assign M_AXIS_tvalid = axis_data_fifo_0_M_AXIS1_TVALID;
  assign S_AXIS1_tready = axis_broadcaster_0_M01_AXIS_TREADY;
  assign S_AXIS2_tready = axis_broadcaster_0_M02_AXIS_TREADY;
  assign S_AXIS3_tready = axis_broadcaster_0_M03_AXIS_TREADY;
  assign S_AXIS4_tready = axis_broadcaster_5_M00_AXIS_TREADY;
  assign S_AXIS5_tready = axis_broadcaster_5_M01_AXIS_TREADY;
  assign S_AXIS6_tready = axis_broadcaster_5_M02_AXIS_TREADY;
  assign S_AXIS7_tready = axis_broadcaster_5_M03_AXIS_TREADY;
  assign S_AXIS_tready = axis_broadcaster_0_M00_AXIS_TREADY;
  assign ap_clk_1 = ap_clk;
  assign ap_rst_n_1 = ap_rst_n;
  assign axis_broadcaster_0_M00_AXIS_TDATA = S_AXIS_tdata[47:0];
  assign axis_broadcaster_0_M00_AXIS_TVALID = S_AXIS_tvalid;
  assign axis_broadcaster_0_M01_AXIS_TDATA = S_AXIS1_tdata[47:0];
  assign axis_broadcaster_0_M01_AXIS_TVALID = S_AXIS1_tvalid;
  assign axis_broadcaster_0_M02_AXIS_TDATA = S_AXIS2_tdata[47:0];
  assign axis_broadcaster_0_M02_AXIS_TVALID = S_AXIS2_tvalid;
  assign axis_broadcaster_0_M03_AXIS_TDATA = S_AXIS3_tdata[47:0];
  assign axis_broadcaster_0_M03_AXIS_TVALID = S_AXIS3_tvalid;
  assign axis_broadcaster_5_M00_AXIS_TDATA = S_AXIS4_tdata[47:0];
  assign axis_broadcaster_5_M00_AXIS_TVALID = S_AXIS4_tvalid;
  assign axis_broadcaster_5_M01_AXIS_TDATA = S_AXIS5_tdata[47:0];
  assign axis_broadcaster_5_M01_AXIS_TVALID = S_AXIS5_tvalid;
  assign axis_broadcaster_5_M02_AXIS_TDATA = S_AXIS6_tdata[47:0];
  assign axis_broadcaster_5_M02_AXIS_TVALID = S_AXIS6_tvalid;
  assign axis_broadcaster_5_M03_AXIS_TDATA = S_AXIS7_tdata[47:0];
  assign axis_broadcaster_5_M03_AXIS_TVALID = S_AXIS7_tvalid;
  assign axis_data_fifo_0_M_AXIS1_TREADY = M_AXIS_tready;
  assign axis_data_fifo_1_M_AXIS_TREADY = M_AXIS1_tready;
  assign axis_data_fifo_2_M_AXIS_TREADY = M_AXIS2_tready;
  assign axis_data_fifo_3_M_AXIS_TREADY = M_AXIS3_tready;
  assign axis_data_fifo_4_M_AXIS_TREADY = M_AXIS4_tready;
  assign axis_data_fifo_5_M_AXIS_TREADY = M_AXIS5_tready;
  assign axis_data_fifo_6_M_AXIS_TREADY = M_AXIS6_tready;
  assign axis_data_fifo_7_M_AXIS_TREADY = M_AXIS7_tready;
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS1_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS1_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS1_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M00_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M00_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M00_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_1
       (.m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M01_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M01_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M01_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_2
       (.m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M02_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M02_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M02_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_3
       (.m_axis_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M03_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M03_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M03_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_4
       (.m_axis_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_4_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M00_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M00_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M00_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_5
       (.m_axis_tdata(axis_data_fifo_5_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_5_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_5_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M01_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M01_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M01_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_6
       (.m_axis_tdata(axis_data_fifo_6_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_6_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_6_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M02_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M02_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M02_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(48), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_7
       (.m_axis_tdata(axis_data_fifo_7_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_7_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_7_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M03_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M03_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M03_AXIS_TVALID));
endmodule

module input_queue_imp_XB9HP
   (M_AXIS1_tdata,
    M_AXIS1_tready,
    M_AXIS1_tvalid,
    M_AXIS2_tdata,
    M_AXIS2_tready,
    M_AXIS2_tvalid,
    M_AXIS3_tdata,
    M_AXIS3_tready,
    M_AXIS3_tvalid,
    M_AXIS4_tdata,
    M_AXIS4_tready,
    M_AXIS4_tvalid,
    M_AXIS5_tdata,
    M_AXIS5_tready,
    M_AXIS5_tvalid,
    M_AXIS6_tdata,
    M_AXIS6_tready,
    M_AXIS6_tvalid,
    M_AXIS7_tdata,
    M_AXIS7_tready,
    M_AXIS7_tvalid,
    M_AXIS_tdata,
    M_AXIS_tready,
    M_AXIS_tvalid,
    S_AXIS1_tdata,
    S_AXIS1_tready,
    S_AXIS1_tvalid,
    S_AXIS2_tdata,
    S_AXIS2_tready,
    S_AXIS2_tvalid,
    S_AXIS3_tdata,
    S_AXIS3_tready,
    S_AXIS3_tvalid,
    S_AXIS4_tdata,
    S_AXIS4_tready,
    S_AXIS4_tvalid,
    S_AXIS5_tdata,
    S_AXIS5_tready,
    S_AXIS5_tvalid,
    S_AXIS6_tdata,
    S_AXIS6_tready,
    S_AXIS6_tvalid,
    S_AXIS7_tdata,
    S_AXIS7_tready,
    S_AXIS7_tvalid,
    S_AXIS_tdata,
    S_AXIS_tready,
    S_AXIS_tvalid,
    ap_clk,
    ap_rst_n);
  output [63:0]M_AXIS1_tdata;
  input M_AXIS1_tready;
  output M_AXIS1_tvalid;
  output [63:0]M_AXIS2_tdata;
  input M_AXIS2_tready;
  output M_AXIS2_tvalid;
  output [63:0]M_AXIS3_tdata;
  input M_AXIS3_tready;
  output M_AXIS3_tvalid;
  output [63:0]M_AXIS4_tdata;
  input M_AXIS4_tready;
  output M_AXIS4_tvalid;
  output [63:0]M_AXIS5_tdata;
  input M_AXIS5_tready;
  output M_AXIS5_tvalid;
  output [63:0]M_AXIS6_tdata;
  input M_AXIS6_tready;
  output M_AXIS6_tvalid;
  output [63:0]M_AXIS7_tdata;
  input M_AXIS7_tready;
  output M_AXIS7_tvalid;
  output [63:0]M_AXIS_tdata;
  input M_AXIS_tready;
  output M_AXIS_tvalid;
  input [63:0]S_AXIS1_tdata;
  output S_AXIS1_tready;
  input S_AXIS1_tvalid;
  input [63:0]S_AXIS2_tdata;
  output S_AXIS2_tready;
  input S_AXIS2_tvalid;
  input [63:0]S_AXIS3_tdata;
  output S_AXIS3_tready;
  input S_AXIS3_tvalid;
  input [63:0]S_AXIS4_tdata;
  output S_AXIS4_tready;
  input S_AXIS4_tvalid;
  input [63:0]S_AXIS5_tdata;
  output S_AXIS5_tready;
  input S_AXIS5_tvalid;
  input [63:0]S_AXIS6_tdata;
  output S_AXIS6_tready;
  input S_AXIS6_tvalid;
  input [63:0]S_AXIS7_tdata;
  output S_AXIS7_tready;
  input S_AXIS7_tvalid;
  input [63:0]S_AXIS_tdata;
  output S_AXIS_tready;
  input S_AXIS_tvalid;
  input ap_clk;
  input ap_rst_n;

  wire ap_clk_1;
  wire ap_rst_n_1;
  wire [63:0]axis_broadcaster_0_M00_AXIS_TDATA;
  wire axis_broadcaster_0_M00_AXIS_TREADY;
  wire axis_broadcaster_0_M00_AXIS_TVALID;
  wire [63:0]axis_broadcaster_0_M01_AXIS_TDATA;
  wire axis_broadcaster_0_M01_AXIS_TREADY;
  wire axis_broadcaster_0_M01_AXIS_TVALID;
  wire [63:0]axis_broadcaster_0_M02_AXIS_TDATA;
  wire axis_broadcaster_0_M02_AXIS_TREADY;
  wire axis_broadcaster_0_M02_AXIS_TVALID;
  wire [63:0]axis_broadcaster_0_M03_AXIS_TDATA;
  wire axis_broadcaster_0_M03_AXIS_TREADY;
  wire axis_broadcaster_0_M03_AXIS_TVALID;
  wire [63:0]axis_broadcaster_5_M00_AXIS_TDATA;
  wire axis_broadcaster_5_M00_AXIS_TREADY;
  wire axis_broadcaster_5_M00_AXIS_TVALID;
  wire [63:0]axis_broadcaster_5_M01_AXIS_TDATA;
  wire axis_broadcaster_5_M01_AXIS_TREADY;
  wire axis_broadcaster_5_M01_AXIS_TVALID;
  wire [63:0]axis_broadcaster_5_M02_AXIS_TDATA;
  wire axis_broadcaster_5_M02_AXIS_TREADY;
  wire axis_broadcaster_5_M02_AXIS_TVALID;
  wire [63:0]axis_broadcaster_5_M03_AXIS_TDATA;
  wire axis_broadcaster_5_M03_AXIS_TREADY;
  wire axis_broadcaster_5_M03_AXIS_TVALID;
  wire [63:0]axis_data_fifo_0_M_AXIS1_TDATA;
  wire axis_data_fifo_0_M_AXIS1_TREADY;
  wire axis_data_fifo_0_M_AXIS1_TVALID;
  wire [63:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_2_M_AXIS_TDATA;
  wire axis_data_fifo_2_M_AXIS_TREADY;
  wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_3_M_AXIS_TDATA;
  wire axis_data_fifo_3_M_AXIS_TREADY;
  wire axis_data_fifo_3_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_4_M_AXIS_TDATA;
  wire axis_data_fifo_4_M_AXIS_TREADY;
  wire axis_data_fifo_4_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_5_M_AXIS_TDATA;
  wire axis_data_fifo_5_M_AXIS_TREADY;
  wire axis_data_fifo_5_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_6_M_AXIS_TDATA;
  wire axis_data_fifo_6_M_AXIS_TREADY;
  wire axis_data_fifo_6_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_7_M_AXIS_TDATA;
  wire axis_data_fifo_7_M_AXIS_TREADY;
  wire axis_data_fifo_7_M_AXIS_TVALID;

  assign M_AXIS1_tdata[63:0] = axis_data_fifo_1_M_AXIS_TDATA;
  assign M_AXIS1_tvalid = axis_data_fifo_1_M_AXIS_TVALID;
  assign M_AXIS2_tdata[63:0] = axis_data_fifo_2_M_AXIS_TDATA;
  assign M_AXIS2_tvalid = axis_data_fifo_2_M_AXIS_TVALID;
  assign M_AXIS3_tdata[63:0] = axis_data_fifo_3_M_AXIS_TDATA;
  assign M_AXIS3_tvalid = axis_data_fifo_3_M_AXIS_TVALID;
  assign M_AXIS4_tdata[63:0] = axis_data_fifo_4_M_AXIS_TDATA;
  assign M_AXIS4_tvalid = axis_data_fifo_4_M_AXIS_TVALID;
  assign M_AXIS5_tdata[63:0] = axis_data_fifo_5_M_AXIS_TDATA;
  assign M_AXIS5_tvalid = axis_data_fifo_5_M_AXIS_TVALID;
  assign M_AXIS6_tdata[63:0] = axis_data_fifo_6_M_AXIS_TDATA;
  assign M_AXIS6_tvalid = axis_data_fifo_6_M_AXIS_TVALID;
  assign M_AXIS7_tdata[63:0] = axis_data_fifo_7_M_AXIS_TDATA;
  assign M_AXIS7_tvalid = axis_data_fifo_7_M_AXIS_TVALID;
  assign M_AXIS_tdata[63:0] = axis_data_fifo_0_M_AXIS1_TDATA;
  assign M_AXIS_tvalid = axis_data_fifo_0_M_AXIS1_TVALID;
  assign S_AXIS1_tready = axis_broadcaster_0_M01_AXIS_TREADY;
  assign S_AXIS2_tready = axis_broadcaster_0_M02_AXIS_TREADY;
  assign S_AXIS3_tready = axis_broadcaster_0_M03_AXIS_TREADY;
  assign S_AXIS4_tready = axis_broadcaster_5_M00_AXIS_TREADY;
  assign S_AXIS5_tready = axis_broadcaster_5_M01_AXIS_TREADY;
  assign S_AXIS6_tready = axis_broadcaster_5_M02_AXIS_TREADY;
  assign S_AXIS7_tready = axis_broadcaster_5_M03_AXIS_TREADY;
  assign S_AXIS_tready = axis_broadcaster_0_M00_AXIS_TREADY;
  assign ap_clk_1 = ap_clk;
  assign ap_rst_n_1 = ap_rst_n;
  assign axis_broadcaster_0_M00_AXIS_TDATA = S_AXIS_tdata[63:0];
  assign axis_broadcaster_0_M00_AXIS_TVALID = S_AXIS_tvalid;
  assign axis_broadcaster_0_M01_AXIS_TDATA = S_AXIS1_tdata[63:0];
  assign axis_broadcaster_0_M01_AXIS_TVALID = S_AXIS1_tvalid;
  assign axis_broadcaster_0_M02_AXIS_TDATA = S_AXIS2_tdata[63:0];
  assign axis_broadcaster_0_M02_AXIS_TVALID = S_AXIS2_tvalid;
  assign axis_broadcaster_0_M03_AXIS_TDATA = S_AXIS3_tdata[63:0];
  assign axis_broadcaster_0_M03_AXIS_TVALID = S_AXIS3_tvalid;
  assign axis_broadcaster_5_M00_AXIS_TDATA = S_AXIS4_tdata[63:0];
  assign axis_broadcaster_5_M00_AXIS_TVALID = S_AXIS4_tvalid;
  assign axis_broadcaster_5_M01_AXIS_TDATA = S_AXIS5_tdata[63:0];
  assign axis_broadcaster_5_M01_AXIS_TVALID = S_AXIS5_tvalid;
  assign axis_broadcaster_5_M02_AXIS_TDATA = S_AXIS6_tdata[63:0];
  assign axis_broadcaster_5_M02_AXIS_TVALID = S_AXIS6_tvalid;
  assign axis_broadcaster_5_M03_AXIS_TDATA = S_AXIS7_tdata[63:0];
  assign axis_broadcaster_5_M03_AXIS_TVALID = S_AXIS7_tvalid;
  assign axis_data_fifo_0_M_AXIS1_TREADY = M_AXIS_tready;
  assign axis_data_fifo_1_M_AXIS_TREADY = M_AXIS1_tready;
  assign axis_data_fifo_2_M_AXIS_TREADY = M_AXIS2_tready;
  assign axis_data_fifo_3_M_AXIS_TREADY = M_AXIS3_tready;
  assign axis_data_fifo_4_M_AXIS_TREADY = M_AXIS4_tready;
  assign axis_data_fifo_5_M_AXIS_TREADY = M_AXIS5_tready;
  assign axis_data_fifo_6_M_AXIS_TREADY = M_AXIS6_tready;
  assign axis_data_fifo_7_M_AXIS_TREADY = M_AXIS7_tready;
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_data_fifo_0
       (.m_axis_tdata(axis_data_fifo_0_M_AXIS1_TDATA),
        .m_axis_tready(axis_data_fifo_0_M_AXIS1_TREADY),
        .m_axis_tvalid(axis_data_fifo_0_M_AXIS1_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M00_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M00_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M00_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_1
       (.m_axis_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M01_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M01_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M01_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_2
       (.m_axis_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M02_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M02_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M02_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_3
       (.m_axis_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_0_M03_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_0_M03_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_0_M03_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_4
       (.m_axis_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_4_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M00_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M00_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M00_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_5
       (.m_axis_tdata(axis_data_fifo_5_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_5_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_5_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M01_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M01_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M01_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_6
       (.m_axis_tdata(axis_data_fifo_6_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_6_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_6_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M02_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M02_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M02_AXIS_TVALID));
  eb_srl #(.DATA_WIDTH(64), .ADDR_WIDTH(4), .DEPTH(16)
  )  axis_data_fifo_7
       (.m_axis_tdata(axis_data_fifo_7_M_AXIS_TDATA),
        .m_axis_tready(axis_data_fifo_7_M_AXIS_TREADY),
        .m_axis_tvalid(axis_data_fifo_7_M_AXIS_TVALID),
        .s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .s_axis_tdata(axis_broadcaster_5_M03_AXIS_TDATA),
        .s_axis_tready(axis_broadcaster_5_M03_AXIS_TREADY),
        .s_axis_tvalid(axis_broadcaster_5_M03_AXIS_TVALID));
endmodule

(* CORE_GENERATION_INFO = "spmv_bd,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=spmv_bd,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=67,numReposBlks=62,numNonXlnxBlks=0,numHierBlks=5,maxHierDepth=2,numSysgenBlks=0,numHlsBlks=26,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,da_bram_cntlr_cnt=3,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "spmv_bd.hwdef" *) 
module spmv_bd
   (ap_clk,
    ap_rst_n,
    m00_axi_araddr,
    m00_axi_arburst,
    m00_axi_arcache,
    m00_axi_arlen,
    m00_axi_arlock,
    m00_axi_arprot,
    m00_axi_arqos,
    m00_axi_arready,
    m00_axi_arregion,
    m00_axi_arsize,
    m00_axi_arvalid,
    m00_axi_awaddr,
    m00_axi_awburst,
    m00_axi_awcache,
    m00_axi_awlen,
    m00_axi_awlock,
    m00_axi_awprot,
    m00_axi_awqos,
    m00_axi_awready,
    m00_axi_awregion,
    m00_axi_awsize,
    m00_axi_awvalid,
    m00_axi_bready,
    m00_axi_bresp,
    m00_axi_bvalid,
    m00_axi_rdata,
    m00_axi_rlast,
    m00_axi_rready,
    m00_axi_rresp,
    m00_axi_rvalid,
    m00_axi_wdata,
    m00_axi_wlast,
    m00_axi_wready,
    m00_axi_wstrb,
    m00_axi_wvalid,
    m01_axi_araddr,
    m01_axi_arburst,
    m01_axi_arcache,
    m01_axi_arlen,
    m01_axi_arlock,
    m01_axi_arprot,
    m01_axi_arqos,
    m01_axi_arready,
    m01_axi_arregion,
    m01_axi_arsize,
    m01_axi_arvalid,
    m01_axi_awaddr,
    m01_axi_awburst,
    m01_axi_awcache,
    m01_axi_awlen,
    m01_axi_awlock,
    m01_axi_awprot,
    m01_axi_awqos,
    m01_axi_awready,
    m01_axi_awregion,
    m01_axi_awsize,
    m01_axi_awvalid,
    m01_axi_bready,
    m01_axi_bresp,
    m01_axi_bvalid,
    m01_axi_rdata,
    m01_axi_rlast,
    m01_axi_rready,
    m01_axi_rresp,
    m01_axi_rvalid,
    m01_axi_wdata,
    m01_axi_wlast,
    m01_axi_wready,
    m01_axi_wstrb,
    m01_axi_wvalid,
    s_axi_control_araddr,
    s_axi_control_arready,
    s_axi_control_arvalid,
    s_axi_control_awaddr,
    s_axi_control_awready,
    s_axi_control_awvalid,
    s_axi_control_bready,
    s_axi_control_bresp,
    s_axi_control_bvalid,
    s_axi_control_rdata,
    s_axi_control_rready,
    s_axi_control_rresp,
    s_axi_control_rvalid,
    s_axi_control_wdata,
    s_axi_control_wready,
    s_axi_control_wstrb,
    s_axi_control_wvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF m00_axi:m01_axi:s_axi_control, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN spmv_bd_ap_clk, FREQ_HZ 250000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ap_rst_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m00_axi, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN spmv_bd_ap_clk, DATA_WIDTH 256, FREQ_HZ 250000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [63:0]m00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARBURST" *) output [1:0]m00_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARCACHE" *) output [3:0]m00_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARLEN" *) output [7:0]m00_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARLOCK" *) output [1:0]m00_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARPROT" *) output [2:0]m00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARQOS" *) output [3:0]m00_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARREADY" *) input m00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARREGION" *) output [3:0]m00_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARSIZE" *) output [2:0]m00_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi ARVALID" *) output m00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWADDR" *) output [63:0]m00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWBURST" *) output [1:0]m00_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWCACHE" *) output [3:0]m00_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWLEN" *) output [7:0]m00_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWLOCK" *) output [1:0]m00_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWPROT" *) output [2:0]m00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWQOS" *) output [3:0]m00_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWREADY" *) input m00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWREGION" *) output [3:0]m00_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWSIZE" *) output [2:0]m00_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi AWVALID" *) output m00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BREADY" *) output m00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BRESP" *) input [1:0]m00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi BVALID" *) input m00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RDATA" *) input [255:0]m00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RLAST" *) input m00_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RREADY" *) output m00_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RRESP" *) input [1:0]m00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi RVALID" *) input m00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WDATA" *) output [255:0]m00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WLAST" *) output m00_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WREADY" *) input m00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WSTRB" *) output [31:0]m00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m00_axi WVALID" *) output m00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m01_axi, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN spmv_bd_ap_clk, DATA_WIDTH 256, FREQ_HZ 250000000, HAS_BRESP 0, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) output [63:0]m01_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARBURST" *) output [1:0]m01_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARCACHE" *) output [3:0]m01_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARLEN" *) output [7:0]m01_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARLOCK" *) output [1:0]m01_axi_arlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARPROT" *) output [2:0]m01_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARQOS" *) output [3:0]m01_axi_arqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARREADY" *) input m01_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARREGION" *) output [3:0]m01_axi_arregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARSIZE" *) output [2:0]m01_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi ARVALID" *) output m01_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWADDR" *) output [63:0]m01_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWBURST" *) output [1:0]m01_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWCACHE" *) output [3:0]m01_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWLEN" *) output [7:0]m01_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWLOCK" *) output [1:0]m01_axi_awlock;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWPROT" *) output [2:0]m01_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWQOS" *) output [3:0]m01_axi_awqos;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWREADY" *) input m01_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWREGION" *) output [3:0]m01_axi_awregion;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWSIZE" *) output [2:0]m01_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi AWVALID" *) output m01_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BREADY" *) output m01_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BRESP" *) input [1:0]m01_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi BVALID" *) input m01_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RDATA" *) input [255:0]m01_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RLAST" *) input m01_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RREADY" *) output m01_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RRESP" *) input [1:0]m01_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi RVALID" *) input m01_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WDATA" *) output [255:0]m01_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WLAST" *) output m01_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WREADY" *) input m01_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WSTRB" *) output [31:0]m01_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m01_axi WVALID" *) output m01_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 12, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN spmv_bd_ap_clk, DATA_WIDTH 32, FREQ_HZ 250000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [6:0]s_axi_control_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARREADY" *) output s_axi_control_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control ARVALID" *) input s_axi_control_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWADDR" *) input [6:0]s_axi_control_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWREADY" *) output s_axi_control_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control AWVALID" *) input s_axi_control_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BREADY" *) input s_axi_control_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BRESP" *) output [1:0]s_axi_control_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control BVALID" *) output s_axi_control_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RDATA" *) output [31:0]s_axi_control_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RREADY" *) input s_axi_control_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RRESP" *) output [1:0]s_axi_control_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control RVALID" *) output s_axi_control_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WDATA" *) input [31:0]s_axi_control_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WREADY" *) output s_axi_control_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WSTRB" *) input [3:0]s_axi_control_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_control WVALID" *) input s_axi_control_wvalid;

  wire [31:0]ACC_stream_out_nnz_count_V_V_TDATA;
  wire ACC_stream_out_nnz_count_V_V_TREADY;
  wire ACC_stream_out_nnz_count_V_V_TVALID;
  wire [63:0]BVB_load_0_stream_data_out_V_TDATA;
  wire BVB_load_0_stream_data_out_V_TREADY;
  wire BVB_load_0_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_1_stream_data_out_V_TDATA;
  wire BVB_load_1_stream_data_out_V_TREADY;
  wire BVB_load_1_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_2_stream_data_out_V_TDATA;
  wire BVB_load_2_stream_data_out_V_TREADY;
  wire BVB_load_2_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_3_stream_data_out_V_TDATA;
  wire BVB_load_3_stream_data_out_V_TREADY;
  wire BVB_load_3_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_4_stream_data_out_V_TDATA;
  wire BVB_load_4_stream_data_out_V_TREADY;
  wire BVB_load_4_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_5_stream_data_out_V_TDATA;
  wire BVB_load_5_stream_data_out_V_TREADY;
  wire BVB_load_5_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_6_stream_data_out_V_TDATA;
  wire BVB_load_6_stream_data_out_V_TREADY;
  wire BVB_load_6_stream_data_out_V_TVALID;
  wire [63:0]BVB_load_7_stream_data_out_V_TDATA;
  wire BVB_load_7_stream_data_out_V_TREADY;
  wire BVB_load_7_stream_data_out_V_TVALID;
  wire ap_clk_1;
  wire ap_rst_n_1;
  wire [63:0]axis_broadcaster_0_M00_AXIS_TDATA;
  wire axis_broadcaster_0_M00_AXIS_TREADY;
  wire [0:0]axis_broadcaster_0_M00_AXIS_TVALID;
  wire [127:64]axis_broadcaster_0_M01_AXIS_TDATA;
  wire axis_broadcaster_0_M01_AXIS_TREADY;
  wire [1:1]axis_broadcaster_0_M01_AXIS_TVALID;
  wire [191:128]axis_broadcaster_0_M02_AXIS_TDATA;
  wire axis_broadcaster_0_M02_AXIS_TREADY;
  wire [2:2]axis_broadcaster_0_M02_AXIS_TVALID;
  wire [255:192]axis_broadcaster_0_M03_AXIS_TDATA;
  wire axis_broadcaster_0_M03_AXIS_TREADY;
  wire [3:3]axis_broadcaster_0_M03_AXIS_TVALID;
  wire [31:0]axis_broadcaster_1_M00_AXIS_TDATA;
  wire axis_broadcaster_1_M00_AXIS_TREADY;
  wire [0:0]axis_broadcaster_1_M00_AXIS_TVALID;
  wire [63:32]axis_broadcaster_1_M01_AXIS_TDATA;
  wire axis_broadcaster_1_M01_AXIS_TREADY;
  wire [1:1]axis_broadcaster_1_M01_AXIS_TVALID;
  wire [95:64]axis_broadcaster_1_M02_AXIS_TDATA;
  wire axis_broadcaster_1_M02_AXIS_TREADY;
  wire [2:2]axis_broadcaster_1_M02_AXIS_TVALID;
  wire [127:96]axis_broadcaster_1_M03_AXIS_TDATA;
  wire axis_broadcaster_1_M03_AXIS_TREADY;
  wire [3:3]axis_broadcaster_1_M03_AXIS_TVALID;
  wire [159:128]axis_broadcaster_1_M04_AXIS_TDATA;
  wire axis_broadcaster_1_M04_AXIS_TREADY;
  wire [4:4]axis_broadcaster_1_M04_AXIS_TVALID;
  wire [191:160]axis_broadcaster_1_M05_AXIS_TDATA;
  wire axis_broadcaster_1_M05_AXIS_TREADY;
  wire [5:5]axis_broadcaster_1_M05_AXIS_TVALID;
  wire [223:192]axis_broadcaster_1_M06_AXIS_TDATA;
  wire axis_broadcaster_1_M06_AXIS_TREADY;
  wire [6:6]axis_broadcaster_1_M06_AXIS_TVALID;
  wire [255:224]axis_broadcaster_1_M07_AXIS_TDATA;
  wire axis_broadcaster_1_M07_AXIS_TREADY;
  wire [7:7]axis_broadcaster_1_M07_AXIS_TVALID;
  wire [31:0]axis_broadcaster_2_M00_AXIS_TDATA;
  wire axis_broadcaster_2_M00_AXIS_TREADY;
  wire [0:0]axis_broadcaster_2_M00_AXIS_TVALID;
  wire [63:32]axis_broadcaster_2_M01_AXIS_TDATA;
  wire axis_broadcaster_2_M01_AXIS_TREADY;
  wire [1:1]axis_broadcaster_2_M01_AXIS_TVALID;
  wire [95:64]axis_broadcaster_2_M02_AXIS_TDATA;
  wire axis_broadcaster_2_M02_AXIS_TREADY;
  wire [2:2]axis_broadcaster_2_M02_AXIS_TVALID;
  wire [127:96]axis_broadcaster_2_M03_AXIS_TDATA;
  wire axis_broadcaster_2_M03_AXIS_TREADY;
  wire [3:3]axis_broadcaster_2_M03_AXIS_TVALID;
  wire [159:128]axis_broadcaster_2_M04_AXIS_TDATA;
  wire axis_broadcaster_2_M04_AXIS_TREADY;
  wire [4:4]axis_broadcaster_2_M04_AXIS_TVALID;
  wire [191:160]axis_broadcaster_2_M05_AXIS_TDATA;
  wire axis_broadcaster_2_M05_AXIS_TREADY;
  wire [5:5]axis_broadcaster_2_M05_AXIS_TVALID;
  wire [223:192]axis_broadcaster_2_M06_AXIS_TDATA;
  wire axis_broadcaster_2_M06_AXIS_TREADY;
  wire [6:6]axis_broadcaster_2_M06_AXIS_TVALID;
  wire [255:224]axis_broadcaster_2_M07_AXIS_TDATA;
  wire axis_broadcaster_2_M07_AXIS_TREADY;
  wire [7:7]axis_broadcaster_2_M07_AXIS_TVALID;
  wire [63:0]axis_broadcaster_5_M00_AXIS_TDATA;
  wire axis_broadcaster_5_M00_AXIS_TREADY;
  wire [0:0]axis_broadcaster_5_M00_AXIS_TVALID;
  wire [127:64]axis_broadcaster_5_M01_AXIS_TDATA;
  wire axis_broadcaster_5_M01_AXIS_TREADY;
  wire [1:1]axis_broadcaster_5_M01_AXIS_TVALID;
  wire [191:128]axis_broadcaster_5_M02_AXIS_TDATA;
  wire axis_broadcaster_5_M02_AXIS_TREADY;
  wire [2:2]axis_broadcaster_5_M02_AXIS_TVALID;
  wire [255:192]axis_broadcaster_5_M03_AXIS_TDATA;
  wire axis_broadcaster_5_M03_AXIS_TREADY;
  wire [3:3]axis_broadcaster_5_M03_AXIS_TVALID;
  wire [63:0]axis_data_fifo_0_M_AXIS1_TDATA;
  wire axis_data_fifo_0_M_AXIS1_TREADY;
  wire axis_data_fifo_0_M_AXIS1_TVALID;
  wire [255:0]axis_data_fifo_0_M_AXIS_TDATA;
  wire axis_data_fifo_0_M_AXIS_TREADY;
  wire axis_data_fifo_0_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_1_M_AXIS_TDATA;
  wire axis_data_fifo_1_M_AXIS_TREADY;
  wire axis_data_fifo_1_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_2_M_AXIS_TDATA;
  wire axis_data_fifo_2_M_AXIS_TREADY;
  wire axis_data_fifo_2_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_3_M_AXIS_TDATA;
  wire axis_data_fifo_3_M_AXIS_TREADY;
  wire axis_data_fifo_3_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_4_M_AXIS_TDATA;
  wire axis_data_fifo_4_M_AXIS_TREADY;
  wire axis_data_fifo_4_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_5_M_AXIS_TDATA;
  wire axis_data_fifo_5_M_AXIS_TREADY;
  wire axis_data_fifo_5_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_6_M_AXIS_TDATA;
  wire axis_data_fifo_6_M_AXIS_TREADY;
  wire axis_data_fifo_6_M_AXIS_TVALID;
  wire [63:0]axis_data_fifo_7_M_AXIS_TDATA;
  wire axis_data_fifo_7_M_AXIS_TREADY;
  wire axis_data_fifo_7_M_AXIS_TVALID;
  wire [255:0]axis_register_slice_0_M_AXIS_TDATA;
  wire axis_register_slice_0_M_AXIS_TREADY;
  wire axis_register_slice_0_M_AXIS_TVALID;
  wire [31:0]axis_register_slice_1_M_AXIS_TDATA;
  wire axis_register_slice_1_M_AXIS_TREADY;
  wire axis_register_slice_1_M_AXIS_TVALID;
  wire [63:0]example_0_m_axi_gmem0_ARADDR;
  wire [1:0]example_0_m_axi_gmem0_ARBURST;
  wire [3:0]example_0_m_axi_gmem0_ARCACHE;
  wire [7:0]example_0_m_axi_gmem0_ARLEN;
  wire [1:0]example_0_m_axi_gmem0_ARLOCK;
  wire [2:0]example_0_m_axi_gmem0_ARPROT;
  wire [3:0]example_0_m_axi_gmem0_ARQOS;
  wire example_0_m_axi_gmem0_ARREADY;
  wire [3:0]example_0_m_axi_gmem0_ARREGION;
  wire [2:0]example_0_m_axi_gmem0_ARSIZE;
  wire example_0_m_axi_gmem0_ARVALID;
  wire [63:0]example_0_m_axi_gmem0_AWADDR;
  wire [1:0]example_0_m_axi_gmem0_AWBURST;
  wire [3:0]example_0_m_axi_gmem0_AWCACHE;
  wire [7:0]example_0_m_axi_gmem0_AWLEN;
  wire [1:0]example_0_m_axi_gmem0_AWLOCK;
  wire [2:0]example_0_m_axi_gmem0_AWPROT;
  wire [3:0]example_0_m_axi_gmem0_AWQOS;
  wire example_0_m_axi_gmem0_AWREADY;
  wire [3:0]example_0_m_axi_gmem0_AWREGION;
  wire [2:0]example_0_m_axi_gmem0_AWSIZE;
  wire example_0_m_axi_gmem0_AWVALID;
  wire example_0_m_axi_gmem0_BREADY;
  wire [1:0]example_0_m_axi_gmem0_BRESP;
  wire example_0_m_axi_gmem0_BVALID;
  wire [255:0]example_0_m_axi_gmem0_RDATA;
  wire example_0_m_axi_gmem0_RLAST;
  wire example_0_m_axi_gmem0_RREADY;
  wire [1:0]example_0_m_axi_gmem0_RRESP;
  wire example_0_m_axi_gmem0_RVALID;
  wire [255:0]example_0_m_axi_gmem0_WDATA;
  wire example_0_m_axi_gmem0_WLAST;
  wire example_0_m_axi_gmem0_WREADY;
  wire [31:0]example_0_m_axi_gmem0_WSTRB;
  wire example_0_m_axi_gmem0_WVALID;
  wire [63:0]example_0_m_axi_gmem1_ARADDR;
  wire [1:0]example_0_m_axi_gmem1_ARBURST;
  wire [3:0]example_0_m_axi_gmem1_ARCACHE;
  wire [7:0]example_0_m_axi_gmem1_ARLEN;
  wire [1:0]example_0_m_axi_gmem1_ARLOCK;
  wire [2:0]example_0_m_axi_gmem1_ARPROT;
  wire [3:0]example_0_m_axi_gmem1_ARQOS;
  wire example_0_m_axi_gmem1_ARREADY;
  wire [3:0]example_0_m_axi_gmem1_ARREGION;
  wire [2:0]example_0_m_axi_gmem1_ARSIZE;
  wire example_0_m_axi_gmem1_ARVALID;
  wire [63:0]example_0_m_axi_gmem1_AWADDR;
  wire [1:0]example_0_m_axi_gmem1_AWBURST;
  wire [3:0]example_0_m_axi_gmem1_AWCACHE;
  wire [7:0]example_0_m_axi_gmem1_AWLEN;
  wire [1:0]example_0_m_axi_gmem1_AWLOCK;
  wire [2:0]example_0_m_axi_gmem1_AWPROT;
  wire [3:0]example_0_m_axi_gmem1_AWQOS;
  wire example_0_m_axi_gmem1_AWREADY;
  wire [3:0]example_0_m_axi_gmem1_AWREGION;
  wire [2:0]example_0_m_axi_gmem1_AWSIZE;
  wire example_0_m_axi_gmem1_AWVALID;
  wire example_0_m_axi_gmem1_BREADY;
  wire [1:0]example_0_m_axi_gmem1_BRESP;
  wire example_0_m_axi_gmem1_BVALID;
  wire [255:0]example_0_m_axi_gmem1_RDATA;
  wire example_0_m_axi_gmem1_RLAST;
  wire example_0_m_axi_gmem1_RREADY;
  wire [1:0]example_0_m_axi_gmem1_RRESP;
  wire example_0_m_axi_gmem1_RVALID;
  wire [255:0]example_0_m_axi_gmem1_WDATA;
  wire example_0_m_axi_gmem1_WLAST;
  wire example_0_m_axi_gmem1_WREADY;
  wire [31:0]example_0_m_axi_gmem1_WSTRB;
  wire example_0_m_axi_gmem1_WVALID;
  wire [31:0]example_0_stream_mon_send_V_V_TDATA;
  wire example_0_stream_mon_send_V_V_TREADY;
  wire example_0_stream_mon_send_V_V_TVALID;
  wire [31:0]example_0_stream_token_V_V_TDATA;
  wire example_0_stream_token_V_V_TREADY;
  wire example_0_stream_token_V_V_TVALID;
  wire [255:0]example_0_stream_wide_mat0_V_V_TDATA;
  wire example_0_stream_wide_mat0_V_V_TREADY;
  wire example_0_stream_wide_mat0_V_V_TVALID;
  wire [255:0]example_0_stream_wide_mat1_V_V_TDATA;
  wire example_0_stream_wide_mat1_V_V_TREADY;
  wire example_0_stream_wide_mat1_V_V_TVALID;
  wire [255:0]example_0_stream_wide_x_V_V_TDATA;
  wire example_0_stream_wide_x_V_V_TREADY;
  wire example_0_stream_wide_x_V_V_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_0_TDATA;
  wire noc_wrapper_0_M_AXIS_0_TREADY;
  wire noc_wrapper_0_M_AXIS_0_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_1_TDATA;
  wire noc_wrapper_0_M_AXIS_1_TREADY;
  wire noc_wrapper_0_M_AXIS_1_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_2_TDATA;
  wire noc_wrapper_0_M_AXIS_2_TREADY;
  wire noc_wrapper_0_M_AXIS_2_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_3_TDATA;
  wire noc_wrapper_0_M_AXIS_3_TREADY;
  wire noc_wrapper_0_M_AXIS_3_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_4_TDATA;
  wire noc_wrapper_0_M_AXIS_4_TREADY;
  wire noc_wrapper_0_M_AXIS_4_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_5_TDATA;
  wire noc_wrapper_0_M_AXIS_5_TREADY;
  wire noc_wrapper_0_M_AXIS_5_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_6_TDATA;
  wire noc_wrapper_0_M_AXIS_6_TREADY;
  wire noc_wrapper_0_M_AXIS_6_TVALID;
  wire [63:0]noc_wrapper_0_M_AXIS_7_TDATA;
  wire noc_wrapper_0_M_AXIS_7_TREADY;
  wire noc_wrapper_0_M_AXIS_7_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_0_TDATA;
  wire noc_wrapper_1_M_AXIS_0_TREADY;
  wire noc_wrapper_1_M_AXIS_0_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_1_TDATA;
  wire noc_wrapper_1_M_AXIS_1_TREADY;
  wire noc_wrapper_1_M_AXIS_1_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_2_TDATA;
  wire noc_wrapper_1_M_AXIS_2_TREADY;
  wire noc_wrapper_1_M_AXIS_2_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_3_TDATA;
  wire noc_wrapper_1_M_AXIS_3_TREADY;
  wire noc_wrapper_1_M_AXIS_3_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_4_TDATA;
  wire noc_wrapper_1_M_AXIS_4_TREADY;
  wire noc_wrapper_1_M_AXIS_4_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_5_TDATA;
  wire noc_wrapper_1_M_AXIS_5_TREADY;
  wire noc_wrapper_1_M_AXIS_5_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_6_TDATA;
  wire noc_wrapper_1_M_AXIS_6_TREADY;
  wire noc_wrapper_1_M_AXIS_6_TVALID;
  wire [63:0]noc_wrapper_1_M_AXIS_7_TDATA;
  wire noc_wrapper_1_M_AXIS_7_TREADY;
  wire noc_wrapper_1_M_AXIS_7_TVALID;
  wire [6:0]s_axi_control_1_ARADDR;
  wire s_axi_control_1_ARREADY;
  wire s_axi_control_1_ARVALID;
  wire [6:0]s_axi_control_1_AWADDR;
  wire s_axi_control_1_AWREADY;
  wire s_axi_control_1_AWVALID;
  wire s_axi_control_1_BREADY;
  wire [1:0]s_axi_control_1_BRESP;
  wire s_axi_control_1_BVALID;
  wire [31:0]s_axi_control_1_RDATA;
  wire s_axi_control_1_RREADY;
  wire [1:0]s_axi_control_1_RRESP;
  wire s_axi_control_1_RVALID;
  wire [31:0]s_axi_control_1_WDATA;
  wire s_axi_control_1_WREADY;
  wire [3:0]s_axi_control_1_WSTRB;
  wire s_axi_control_1_WVALID;

  assign ap_clk_1 = ap_clk;
  assign ap_rst_n_1 = ap_rst_n;
  assign example_0_m_axi_gmem0_ARREADY = m00_axi_arready;
  assign example_0_m_axi_gmem0_AWREADY = m00_axi_awready;
  assign example_0_m_axi_gmem0_BRESP = m00_axi_bresp[1:0];
  assign example_0_m_axi_gmem0_BVALID = m00_axi_bvalid;
  assign example_0_m_axi_gmem0_RDATA = m00_axi_rdata[255:0];
  assign example_0_m_axi_gmem0_RLAST = m00_axi_rlast;
  assign example_0_m_axi_gmem0_RRESP = m00_axi_rresp[1:0];
  assign example_0_m_axi_gmem0_RVALID = m00_axi_rvalid;
  assign example_0_m_axi_gmem0_WREADY = m00_axi_wready;
  assign example_0_m_axi_gmem1_ARREADY = m01_axi_arready;
  assign example_0_m_axi_gmem1_AWREADY = m01_axi_awready;
  assign example_0_m_axi_gmem1_BRESP = m01_axi_bresp[1:0];
  assign example_0_m_axi_gmem1_BVALID = m01_axi_bvalid;
  assign example_0_m_axi_gmem1_RDATA = m01_axi_rdata[255:0];
  assign example_0_m_axi_gmem1_RLAST = m01_axi_rlast;
  assign example_0_m_axi_gmem1_RRESP = m01_axi_rresp[1:0];
  assign example_0_m_axi_gmem1_RVALID = m01_axi_rvalid;
  assign example_0_m_axi_gmem1_WREADY = m01_axi_wready;
  assign m00_axi_araddr[63:0] = example_0_m_axi_gmem0_ARADDR;
  assign m00_axi_arburst[1:0] = example_0_m_axi_gmem0_ARBURST;
  assign m00_axi_arcache[3:0] = example_0_m_axi_gmem0_ARCACHE;
  assign m00_axi_arlen[7:0] = example_0_m_axi_gmem0_ARLEN;
  assign m00_axi_arlock[1:0] = example_0_m_axi_gmem0_ARLOCK;
  assign m00_axi_arprot[2:0] = example_0_m_axi_gmem0_ARPROT;
  assign m00_axi_arqos[3:0] = example_0_m_axi_gmem0_ARQOS;
  assign m00_axi_arregion[3:0] = example_0_m_axi_gmem0_ARREGION;
  assign m00_axi_arsize[2:0] = example_0_m_axi_gmem0_ARSIZE;
  assign m00_axi_arvalid = example_0_m_axi_gmem0_ARVALID;
  assign m00_axi_awaddr[63:0] = example_0_m_axi_gmem0_AWADDR;
  assign m00_axi_awburst[1:0] = example_0_m_axi_gmem0_AWBURST;
  assign m00_axi_awcache[3:0] = example_0_m_axi_gmem0_AWCACHE;
  assign m00_axi_awlen[7:0] = example_0_m_axi_gmem0_AWLEN;
  assign m00_axi_awlock[1:0] = example_0_m_axi_gmem0_AWLOCK;
  assign m00_axi_awprot[2:0] = example_0_m_axi_gmem0_AWPROT;
  assign m00_axi_awqos[3:0] = example_0_m_axi_gmem0_AWQOS;
  assign m00_axi_awregion[3:0] = example_0_m_axi_gmem0_AWREGION;
  assign m00_axi_awsize[2:0] = example_0_m_axi_gmem0_AWSIZE;
  assign m00_axi_awvalid = example_0_m_axi_gmem0_AWVALID;
  assign m00_axi_bready = example_0_m_axi_gmem0_BREADY;
  assign m00_axi_rready = example_0_m_axi_gmem0_RREADY;
  assign m00_axi_wdata[255:0] = example_0_m_axi_gmem0_WDATA;
  assign m00_axi_wlast = example_0_m_axi_gmem0_WLAST;
  assign m00_axi_wstrb[31:0] = example_0_m_axi_gmem0_WSTRB;
  assign m00_axi_wvalid = example_0_m_axi_gmem0_WVALID;
  assign m01_axi_araddr[63:0] = example_0_m_axi_gmem1_ARADDR;
  assign m01_axi_arburst[1:0] = example_0_m_axi_gmem1_ARBURST;
  assign m01_axi_arcache[3:0] = example_0_m_axi_gmem1_ARCACHE;
  assign m01_axi_arlen[7:0] = example_0_m_axi_gmem1_ARLEN;
  assign m01_axi_arlock[1:0] = example_0_m_axi_gmem1_ARLOCK;
  assign m01_axi_arprot[2:0] = example_0_m_axi_gmem1_ARPROT;
  assign m01_axi_arqos[3:0] = example_0_m_axi_gmem1_ARQOS;
  assign m01_axi_arregion[3:0] = example_0_m_axi_gmem1_ARREGION;
  assign m01_axi_arsize[2:0] = example_0_m_axi_gmem1_ARSIZE;
  assign m01_axi_arvalid = example_0_m_axi_gmem1_ARVALID;
  assign m01_axi_awaddr[63:0] = example_0_m_axi_gmem1_AWADDR;
  assign m01_axi_awburst[1:0] = example_0_m_axi_gmem1_AWBURST;
  assign m01_axi_awcache[3:0] = example_0_m_axi_gmem1_AWCACHE;
  assign m01_axi_awlen[7:0] = example_0_m_axi_gmem1_AWLEN;
  assign m01_axi_awlock[1:0] = example_0_m_axi_gmem1_AWLOCK;
  assign m01_axi_awprot[2:0] = example_0_m_axi_gmem1_AWPROT;
  assign m01_axi_awqos[3:0] = example_0_m_axi_gmem1_AWQOS;
  assign m01_axi_awregion[3:0] = example_0_m_axi_gmem1_AWREGION;
  assign m01_axi_awsize[2:0] = example_0_m_axi_gmem1_AWSIZE;
  assign m01_axi_awvalid = example_0_m_axi_gmem1_AWVALID;
  assign m01_axi_bready = example_0_m_axi_gmem1_BREADY;
  assign m01_axi_rready = example_0_m_axi_gmem1_RREADY;
  assign m01_axi_wdata[255:0] = example_0_m_axi_gmem1_WDATA;
  assign m01_axi_wlast = example_0_m_axi_gmem1_WLAST;
  assign m01_axi_wstrb[31:0] = example_0_m_axi_gmem1_WSTRB;
  assign m01_axi_wvalid = example_0_m_axi_gmem1_WVALID;
  assign s_axi_control_1_ARADDR = s_axi_control_araddr[6:0];
  assign s_axi_control_1_ARVALID = s_axi_control_arvalid;
  assign s_axi_control_1_AWADDR = s_axi_control_awaddr[6:0];
  assign s_axi_control_1_AWVALID = s_axi_control_awvalid;
  assign s_axi_control_1_BREADY = s_axi_control_bready;
  assign s_axi_control_1_RREADY = s_axi_control_rready;
  assign s_axi_control_1_WDATA = s_axi_control_wdata[31:0];
  assign s_axi_control_1_WSTRB = s_axi_control_wstrb[3:0];
  assign s_axi_control_1_WVALID = s_axi_control_wvalid;
  assign s_axi_control_arready = s_axi_control_1_ARREADY;
  assign s_axi_control_awready = s_axi_control_1_AWREADY;
  assign s_axi_control_bresp[1:0] = s_axi_control_1_BRESP;
  assign s_axi_control_bvalid = s_axi_control_1_BVALID;
  assign s_axi_control_rdata[31:0] = s_axi_control_1_RDATA;
  assign s_axi_control_rresp[1:0] = s_axi_control_1_RRESP;
  assign s_axi_control_rvalid = s_axi_control_1_RVALID;
  assign s_axi_control_wready = s_axi_control_1_WREADY;
  ACC_imp_1KNT4EL ACC
       (.M_AXIS_tdata(axis_data_fifo_0_M_AXIS_TDATA),
        .M_AXIS_tready(axis_data_fifo_0_M_AXIS_TREADY),
        .M_AXIS_tvalid(axis_data_fifo_0_M_AXIS_TVALID),
        .ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .ins_V1_tdata(noc_wrapper_1_M_AXIS_0_TDATA),
        .ins_V1_tready(noc_wrapper_1_M_AXIS_0_TREADY),
        .ins_V1_tvalid(noc_wrapper_1_M_AXIS_0_TVALID),
        .ins_V2_tdata(noc_wrapper_1_M_AXIS_1_TDATA),
        .ins_V2_tready(noc_wrapper_1_M_AXIS_1_TREADY),
        .ins_V2_tvalid(noc_wrapper_1_M_AXIS_1_TVALID),
        .ins_V3_tdata(noc_wrapper_1_M_AXIS_2_TDATA),
        .ins_V3_tready(noc_wrapper_1_M_AXIS_2_TREADY),
        .ins_V3_tvalid(noc_wrapper_1_M_AXIS_2_TVALID),
        .ins_V4_tdata(noc_wrapper_1_M_AXIS_3_TDATA),
        .ins_V4_tready(noc_wrapper_1_M_AXIS_3_TREADY),
        .ins_V4_tvalid(noc_wrapper_1_M_AXIS_3_TVALID),
        .ins_V5_tdata(noc_wrapper_1_M_AXIS_4_TDATA),
        .ins_V5_tready(noc_wrapper_1_M_AXIS_4_TREADY),
        .ins_V5_tvalid(noc_wrapper_1_M_AXIS_4_TVALID),
        .ins_V6_tdata(noc_wrapper_1_M_AXIS_5_TDATA),
        .ins_V6_tready(noc_wrapper_1_M_AXIS_5_TREADY),
        .ins_V6_tvalid(noc_wrapper_1_M_AXIS_5_TVALID),
        .ins_V7_tdata(noc_wrapper_1_M_AXIS_6_TDATA),
        .ins_V7_tready(noc_wrapper_1_M_AXIS_6_TREADY),
        .ins_V7_tvalid(noc_wrapper_1_M_AXIS_6_TVALID),
        .ins_V_tdata(noc_wrapper_1_M_AXIS_7_TDATA),
        .ins_V_tready(noc_wrapper_1_M_AXIS_7_TREADY),
        .ins_V_tvalid(noc_wrapper_1_M_AXIS_7_TVALID),
        .stream_in_nnz_count_V_V_tdata(example_0_stream_mon_send_V_V_TDATA),
        .stream_in_nnz_count_V_V_tready(example_0_stream_mon_send_V_V_TREADY),
        .stream_in_nnz_count_V_V_tvalid(example_0_stream_mon_send_V_V_TVALID),
        .stream_out_nnz_count_V_V_tdata(ACC_stream_out_nnz_count_V_V_TDATA),
        .stream_out_nnz_count_V_V_tready(ACC_stream_out_nnz_count_V_V_TREADY),
        .stream_out_nnz_count_V_V_tvalid(ACC_stream_out_nnz_count_V_V_TVALID),
        .token_V_V1_tdata(axis_broadcaster_2_M04_AXIS_TDATA),
        .token_V_V1_tready(axis_broadcaster_2_M04_AXIS_TREADY),
        .token_V_V1_tvalid(axis_broadcaster_2_M04_AXIS_TVALID),
        .token_V_V2_tdata(axis_broadcaster_2_M05_AXIS_TDATA),
        .token_V_V2_tready(axis_broadcaster_2_M05_AXIS_TREADY),
        .token_V_V2_tvalid(axis_broadcaster_2_M05_AXIS_TVALID),
        .token_V_V3_tdata(axis_broadcaster_2_M06_AXIS_TDATA),
        .token_V_V3_tready(axis_broadcaster_2_M06_AXIS_TREADY),
        .token_V_V3_tvalid(axis_broadcaster_2_M06_AXIS_TVALID),
        .token_V_V4_tdata(axis_broadcaster_2_M07_AXIS_TDATA),
        .token_V_V4_tready(axis_broadcaster_2_M07_AXIS_TREADY),
        .token_V_V4_tvalid(axis_broadcaster_2_M07_AXIS_TVALID),
        .token_V_V5_tdata(axis_broadcaster_2_M00_AXIS_TDATA),
        .token_V_V5_tready(axis_broadcaster_2_M00_AXIS_TREADY),
        .token_V_V5_tvalid(axis_broadcaster_2_M00_AXIS_TVALID),
        .token_V_V6_tdata(axis_broadcaster_2_M01_AXIS_TDATA),
        .token_V_V6_tready(axis_broadcaster_2_M01_AXIS_TREADY),
        .token_V_V6_tvalid(axis_broadcaster_2_M01_AXIS_TVALID),
        .token_V_V7_tdata(axis_broadcaster_2_M02_AXIS_TDATA),
        .token_V_V7_tready(axis_broadcaster_2_M02_AXIS_TREADY),
        .token_V_V7_tvalid(axis_broadcaster_2_M02_AXIS_TVALID),
        .token_V_V_tdata(axis_broadcaster_2_M03_AXIS_TDATA),
        .token_V_V_tready(axis_broadcaster_2_M03_AXIS_TREADY),
        .token_V_V_tvalid(axis_broadcaster_2_M03_AXIS_TVALID));
  BVB_imp_3VPNHQ BVB
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .stream_data_in_V1_tdata(noc_wrapper_0_M_AXIS_3_TDATA),
        .stream_data_in_V1_tready(noc_wrapper_0_M_AXIS_3_TREADY),
        .stream_data_in_V1_tvalid(noc_wrapper_0_M_AXIS_3_TVALID),
        .stream_data_in_V2_tdata(noc_wrapper_0_M_AXIS_4_TDATA),
        .stream_data_in_V2_tready(noc_wrapper_0_M_AXIS_4_TREADY),
        .stream_data_in_V2_tvalid(noc_wrapper_0_M_AXIS_4_TVALID),
        .stream_data_in_V3_tdata(noc_wrapper_0_M_AXIS_5_TDATA),
        .stream_data_in_V3_tready(noc_wrapper_0_M_AXIS_5_TREADY),
        .stream_data_in_V3_tvalid(noc_wrapper_0_M_AXIS_5_TVALID),
        .stream_data_in_V4_tdata(noc_wrapper_0_M_AXIS_7_TDATA),
        .stream_data_in_V4_tready(noc_wrapper_0_M_AXIS_7_TREADY),
        .stream_data_in_V4_tvalid(noc_wrapper_0_M_AXIS_7_TVALID),
        .stream_data_in_V5_tdata(noc_wrapper_0_M_AXIS_0_TDATA),
        .stream_data_in_V5_tready(noc_wrapper_0_M_AXIS_0_TREADY),
        .stream_data_in_V5_tvalid(noc_wrapper_0_M_AXIS_0_TVALID),
        .stream_data_in_V6_tdata(noc_wrapper_0_M_AXIS_1_TDATA),
        .stream_data_in_V6_tready(noc_wrapper_0_M_AXIS_1_TREADY),
        .stream_data_in_V6_tvalid(noc_wrapper_0_M_AXIS_1_TVALID),
        .stream_data_in_V7_tdata(noc_wrapper_0_M_AXIS_6_TDATA),
        .stream_data_in_V7_tready(noc_wrapper_0_M_AXIS_6_TREADY),
        .stream_data_in_V7_tvalid(noc_wrapper_0_M_AXIS_6_TVALID),
        .stream_data_in_V_tdata(noc_wrapper_0_M_AXIS_2_TDATA),
        .stream_data_in_V_tready(noc_wrapper_0_M_AXIS_2_TREADY),
        .stream_data_in_V_tvalid(noc_wrapper_0_M_AXIS_2_TVALID),
        .stream_data_out_V1_tdata(BVB_load_3_stream_data_out_V_TDATA),
        .stream_data_out_V1_tready(BVB_load_3_stream_data_out_V_TREADY),
        .stream_data_out_V1_tvalid(BVB_load_3_stream_data_out_V_TVALID),
        .stream_data_out_V2_tdata(BVB_load_4_stream_data_out_V_TDATA),
        .stream_data_out_V2_tready(BVB_load_4_stream_data_out_V_TREADY),
        .stream_data_out_V2_tvalid(BVB_load_4_stream_data_out_V_TVALID),
        .stream_data_out_V3_tdata(BVB_load_5_stream_data_out_V_TDATA),
        .stream_data_out_V3_tready(BVB_load_5_stream_data_out_V_TREADY),
        .stream_data_out_V3_tvalid(BVB_load_5_stream_data_out_V_TVALID),
        .stream_data_out_V4_tdata(BVB_load_7_stream_data_out_V_TDATA),
        .stream_data_out_V4_tready(BVB_load_7_stream_data_out_V_TREADY),
        .stream_data_out_V4_tvalid(BVB_load_7_stream_data_out_V_TVALID),
        .stream_data_out_V5_tdata(BVB_load_0_stream_data_out_V_TDATA),
        .stream_data_out_V5_tready(BVB_load_0_stream_data_out_V_TREADY),
        .stream_data_out_V5_tvalid(BVB_load_0_stream_data_out_V_TVALID),
        .stream_data_out_V6_tdata(BVB_load_1_stream_data_out_V_TDATA),
        .stream_data_out_V6_tready(BVB_load_1_stream_data_out_V_TREADY),
        .stream_data_out_V6_tvalid(BVB_load_1_stream_data_out_V_TVALID),
        .stream_data_out_V7_tdata(BVB_load_6_stream_data_out_V_TDATA),
        .stream_data_out_V7_tready(BVB_load_6_stream_data_out_V_TREADY),
        .stream_data_out_V7_tvalid(BVB_load_6_stream_data_out_V_TVALID),
        .stream_data_out_V_tdata(BVB_load_2_stream_data_out_V_TDATA),
        .stream_data_out_V_tready(BVB_load_2_stream_data_out_V_TREADY),
        .stream_data_out_V_tvalid(BVB_load_2_stream_data_out_V_TVALID),
        .stream_vec_V1_tdata(axis_broadcaster_1_M03_AXIS_TDATA),
        .stream_vec_V1_tready(axis_broadcaster_1_M03_AXIS_TREADY),
        .stream_vec_V1_tvalid(axis_broadcaster_1_M03_AXIS_TVALID),
        .stream_vec_V2_tdata(axis_broadcaster_1_M04_AXIS_TDATA),
        .stream_vec_V2_tready(axis_broadcaster_1_M04_AXIS_TREADY),
        .stream_vec_V2_tvalid(axis_broadcaster_1_M04_AXIS_TVALID),
        .stream_vec_V3_tdata(axis_broadcaster_1_M05_AXIS_TDATA),
        .stream_vec_V3_tready(axis_broadcaster_1_M05_AXIS_TREADY),
        .stream_vec_V3_tvalid(axis_broadcaster_1_M05_AXIS_TVALID),
        .stream_vec_V4_tdata(axis_broadcaster_1_M07_AXIS_TDATA),
        .stream_vec_V4_tready(axis_broadcaster_1_M07_AXIS_TREADY),
        .stream_vec_V4_tvalid(axis_broadcaster_1_M07_AXIS_TVALID),
        .stream_vec_V5_tdata(axis_broadcaster_1_M00_AXIS_TDATA),
        .stream_vec_V5_tready(axis_broadcaster_1_M00_AXIS_TREADY),
        .stream_vec_V5_tvalid(axis_broadcaster_1_M00_AXIS_TVALID),
        .stream_vec_V6_tdata(axis_broadcaster_1_M01_AXIS_TDATA),
        .stream_vec_V6_tready(axis_broadcaster_1_M01_AXIS_TREADY),
        .stream_vec_V6_tvalid(axis_broadcaster_1_M01_AXIS_TVALID),
        .stream_vec_V7_tdata(axis_broadcaster_1_M06_AXIS_TDATA),
        .stream_vec_V7_tready(axis_broadcaster_1_M06_AXIS_TREADY),
        .stream_vec_V7_tvalid(axis_broadcaster_1_M06_AXIS_TVALID),
        .stream_vec_V_tdata(axis_broadcaster_1_M02_AXIS_TDATA),
        .stream_vec_V_tready(axis_broadcaster_1_M02_AXIS_TREADY),
        .stream_vec_V_tvalid(axis_broadcaster_1_M02_AXIS_TVALID));
  axis_broadcaster_0_mat axis_broadcaster_0
       (.aclk(ap_clk_1),
        .aresetn(ap_rst_n_1),
        .m_axis_tdata({axis_broadcaster_0_M03_AXIS_TDATA,axis_broadcaster_0_M02_AXIS_TDATA,axis_broadcaster_0_M01_AXIS_TDATA,axis_broadcaster_0_M00_AXIS_TDATA}),
        .m_axis_tready({axis_broadcaster_0_M03_AXIS_TREADY,axis_broadcaster_0_M02_AXIS_TREADY,axis_broadcaster_0_M01_AXIS_TREADY,axis_broadcaster_0_M00_AXIS_TREADY}),
        .m_axis_tvalid({axis_broadcaster_0_M03_AXIS_TVALID,axis_broadcaster_0_M02_AXIS_TVALID,axis_broadcaster_0_M01_AXIS_TVALID,axis_broadcaster_0_M00_AXIS_TVALID}),
        .s_axis_tdata(example_0_stream_wide_mat0_V_V_TDATA),
        .s_axis_tready(example_0_stream_wide_mat0_V_V_TREADY),
        .s_axis_tvalid(example_0_stream_wide_mat0_V_V_TVALID));
  axis_broadcaster_1_vec axis_broadcaster_1
       (.aclk(ap_clk_1),
        .aresetn(ap_rst_n_1),
        .m_axis_tdata({axis_broadcaster_1_M07_AXIS_TDATA,axis_broadcaster_1_M06_AXIS_TDATA,axis_broadcaster_1_M05_AXIS_TDATA,axis_broadcaster_1_M04_AXIS_TDATA,axis_broadcaster_1_M03_AXIS_TDATA,axis_broadcaster_1_M02_AXIS_TDATA,axis_broadcaster_1_M01_AXIS_TDATA,axis_broadcaster_1_M00_AXIS_TDATA}),
        .m_axis_tready({axis_broadcaster_1_M07_AXIS_TREADY,axis_broadcaster_1_M06_AXIS_TREADY,axis_broadcaster_1_M05_AXIS_TREADY,axis_broadcaster_1_M04_AXIS_TREADY,axis_broadcaster_1_M03_AXIS_TREADY,axis_broadcaster_1_M02_AXIS_TREADY,axis_broadcaster_1_M01_AXIS_TREADY,axis_broadcaster_1_M00_AXIS_TREADY}),
        .m_axis_tvalid({axis_broadcaster_1_M07_AXIS_TVALID,axis_broadcaster_1_M06_AXIS_TVALID,axis_broadcaster_1_M05_AXIS_TVALID,axis_broadcaster_1_M04_AXIS_TVALID,axis_broadcaster_1_M03_AXIS_TVALID,axis_broadcaster_1_M02_AXIS_TVALID,axis_broadcaster_1_M01_AXIS_TVALID,axis_broadcaster_1_M00_AXIS_TVALID}),
        .s_axis_tdata(axis_register_slice_0_M_AXIS_TDATA),
        .s_axis_tready(axis_register_slice_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_register_slice_0_M_AXIS_TVALID));
  axis_broadcaster_2_token axis_broadcaster_2
       (.aclk(ap_clk_1),
        .aresetn(ap_rst_n_1),
        .m_axis_tdata({axis_broadcaster_2_M07_AXIS_TDATA,axis_broadcaster_2_M06_AXIS_TDATA,axis_broadcaster_2_M05_AXIS_TDATA,axis_broadcaster_2_M04_AXIS_TDATA,axis_broadcaster_2_M03_AXIS_TDATA,axis_broadcaster_2_M02_AXIS_TDATA,axis_broadcaster_2_M01_AXIS_TDATA,axis_broadcaster_2_M00_AXIS_TDATA}),
        .m_axis_tready({axis_broadcaster_2_M07_AXIS_TREADY,axis_broadcaster_2_M06_AXIS_TREADY,axis_broadcaster_2_M05_AXIS_TREADY,axis_broadcaster_2_M04_AXIS_TREADY,axis_broadcaster_2_M03_AXIS_TREADY,axis_broadcaster_2_M02_AXIS_TREADY,axis_broadcaster_2_M01_AXIS_TREADY,axis_broadcaster_2_M00_AXIS_TREADY}),
        .m_axis_tvalid({axis_broadcaster_2_M07_AXIS_TVALID,axis_broadcaster_2_M06_AXIS_TVALID,axis_broadcaster_2_M05_AXIS_TVALID,axis_broadcaster_2_M04_AXIS_TVALID,axis_broadcaster_2_M03_AXIS_TVALID,axis_broadcaster_2_M02_AXIS_TVALID,axis_broadcaster_2_M01_AXIS_TVALID,axis_broadcaster_2_M00_AXIS_TVALID}),
        .s_axis_tdata(axis_register_slice_1_M_AXIS_TDATA),
        .s_axis_tready(axis_register_slice_1_M_AXIS_TREADY),
        .s_axis_tvalid(axis_register_slice_1_M_AXIS_TVALID));
  axis_broadcaster_0_mat axis_broadcaster_5
       (.aclk(ap_clk_1),
        .aresetn(ap_rst_n_1),
        .m_axis_tdata({axis_broadcaster_5_M03_AXIS_TDATA,axis_broadcaster_5_M02_AXIS_TDATA,axis_broadcaster_5_M01_AXIS_TDATA,axis_broadcaster_5_M00_AXIS_TDATA}),
        .m_axis_tready({axis_broadcaster_5_M03_AXIS_TREADY,axis_broadcaster_5_M02_AXIS_TREADY,axis_broadcaster_5_M01_AXIS_TREADY,axis_broadcaster_5_M00_AXIS_TREADY}),
        .m_axis_tvalid({axis_broadcaster_5_M03_AXIS_TVALID,axis_broadcaster_5_M02_AXIS_TVALID,axis_broadcaster_5_M01_AXIS_TVALID,axis_broadcaster_5_M00_AXIS_TVALID}),
        .s_axis_tdata(example_0_stream_wide_mat1_V_V_TDATA),
        .s_axis_tready(example_0_stream_wide_mat1_V_V_TREADY),
        .s_axis_tvalid(example_0_stream_wide_mat1_V_V_TVALID));
  eb_srl #(.DATA_WIDTH(256), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_register_slice_0
       (.s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .m_axis_tdata(axis_register_slice_0_M_AXIS_TDATA),
        .m_axis_tready(axis_register_slice_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_register_slice_0_M_AXIS_TVALID),
        .s_axis_tdata(example_0_stream_wide_x_V_V_TDATA),
        .s_axis_tready(example_0_stream_wide_x_V_V_TREADY),
        .s_axis_tvalid(example_0_stream_wide_x_V_V_TVALID));
  eb_srl #(.DATA_WIDTH(32), .ADDR_WIDTH(4), .DEPTH(16)
  ) axis_register_slice_1
       (.s_axis_aclk(ap_clk_1),
        .s_axis_aresetn(ap_rst_n_1),
        .m_axis_tdata(axis_register_slice_1_M_AXIS_TDATA),
        .m_axis_tready(axis_register_slice_1_M_AXIS_TREADY),
        .m_axis_tvalid(axis_register_slice_1_M_AXIS_TVALID),
        .s_axis_tdata(example_0_stream_token_V_V_TDATA),
        .s_axis_tready(example_0_stream_token_V_V_TREADY),
        .s_axis_tvalid(example_0_stream_token_V_V_TVALID));
  example example_0
       (.ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1),
        .m_axi_gmem0_ARADDR(example_0_m_axi_gmem0_ARADDR),
        .m_axi_gmem0_ARBURST(example_0_m_axi_gmem0_ARBURST),
        .m_axi_gmem0_ARCACHE(example_0_m_axi_gmem0_ARCACHE),
        .m_axi_gmem0_ARLEN(example_0_m_axi_gmem0_ARLEN),
        .m_axi_gmem0_ARLOCK(example_0_m_axi_gmem0_ARLOCK),
        .m_axi_gmem0_ARPROT(example_0_m_axi_gmem0_ARPROT),
        .m_axi_gmem0_ARQOS(example_0_m_axi_gmem0_ARQOS),
        .m_axi_gmem0_ARREADY(example_0_m_axi_gmem0_ARREADY),
        .m_axi_gmem0_ARREGION(example_0_m_axi_gmem0_ARREGION),
        .m_axi_gmem0_ARSIZE(example_0_m_axi_gmem0_ARSIZE),
        .m_axi_gmem0_ARVALID(example_0_m_axi_gmem0_ARVALID),
        .m_axi_gmem0_AWADDR(example_0_m_axi_gmem0_AWADDR),
        .m_axi_gmem0_AWBURST(example_0_m_axi_gmem0_AWBURST),
        .m_axi_gmem0_AWCACHE(example_0_m_axi_gmem0_AWCACHE),
        .m_axi_gmem0_AWLEN(example_0_m_axi_gmem0_AWLEN),
        .m_axi_gmem0_AWLOCK(example_0_m_axi_gmem0_AWLOCK),
        .m_axi_gmem0_AWPROT(example_0_m_axi_gmem0_AWPROT),
        .m_axi_gmem0_AWQOS(example_0_m_axi_gmem0_AWQOS),
        .m_axi_gmem0_AWREADY(example_0_m_axi_gmem0_AWREADY),
        .m_axi_gmem0_AWREGION(example_0_m_axi_gmem0_AWREGION),
        .m_axi_gmem0_AWSIZE(example_0_m_axi_gmem0_AWSIZE),
        .m_axi_gmem0_AWVALID(example_0_m_axi_gmem0_AWVALID),
        .m_axi_gmem0_BREADY(example_0_m_axi_gmem0_BREADY),
        .m_axi_gmem0_BRESP(example_0_m_axi_gmem0_BRESP),
        .m_axi_gmem0_BVALID(example_0_m_axi_gmem0_BVALID),
        .m_axi_gmem0_RDATA(example_0_m_axi_gmem0_RDATA),
        .m_axi_gmem0_RLAST(example_0_m_axi_gmem0_RLAST),
        .m_axi_gmem0_RREADY(example_0_m_axi_gmem0_RREADY),
        .m_axi_gmem0_RRESP(example_0_m_axi_gmem0_RRESP),
        .m_axi_gmem0_RVALID(example_0_m_axi_gmem0_RVALID),
        .m_axi_gmem0_WDATA(example_0_m_axi_gmem0_WDATA),
        .m_axi_gmem0_WLAST(example_0_m_axi_gmem0_WLAST),
        .m_axi_gmem0_WREADY(example_0_m_axi_gmem0_WREADY),
        .m_axi_gmem0_WSTRB(example_0_m_axi_gmem0_WSTRB),
        .m_axi_gmem0_WVALID(example_0_m_axi_gmem0_WVALID),
        .m_axi_gmem1_ARADDR(example_0_m_axi_gmem1_ARADDR),
        .m_axi_gmem1_ARBURST(example_0_m_axi_gmem1_ARBURST),
        .m_axi_gmem1_ARCACHE(example_0_m_axi_gmem1_ARCACHE),
        .m_axi_gmem1_ARLEN(example_0_m_axi_gmem1_ARLEN),
        .m_axi_gmem1_ARLOCK(example_0_m_axi_gmem1_ARLOCK),
        .m_axi_gmem1_ARPROT(example_0_m_axi_gmem1_ARPROT),
        .m_axi_gmem1_ARQOS(example_0_m_axi_gmem1_ARQOS),
        .m_axi_gmem1_ARREADY(example_0_m_axi_gmem1_ARREADY),
        .m_axi_gmem1_ARREGION(example_0_m_axi_gmem1_ARREGION),
        .m_axi_gmem1_ARSIZE(example_0_m_axi_gmem1_ARSIZE),
        .m_axi_gmem1_ARVALID(example_0_m_axi_gmem1_ARVALID),
        .m_axi_gmem1_AWADDR(example_0_m_axi_gmem1_AWADDR),
        .m_axi_gmem1_AWBURST(example_0_m_axi_gmem1_AWBURST),
        .m_axi_gmem1_AWCACHE(example_0_m_axi_gmem1_AWCACHE),
        .m_axi_gmem1_AWLEN(example_0_m_axi_gmem1_AWLEN),
        .m_axi_gmem1_AWLOCK(example_0_m_axi_gmem1_AWLOCK),
        .m_axi_gmem1_AWPROT(example_0_m_axi_gmem1_AWPROT),
        .m_axi_gmem1_AWQOS(example_0_m_axi_gmem1_AWQOS),
        .m_axi_gmem1_AWREADY(example_0_m_axi_gmem1_AWREADY),
        .m_axi_gmem1_AWREGION(example_0_m_axi_gmem1_AWREGION),
        .m_axi_gmem1_AWSIZE(example_0_m_axi_gmem1_AWSIZE),
        .m_axi_gmem1_AWVALID(example_0_m_axi_gmem1_AWVALID),
        .m_axi_gmem1_BREADY(example_0_m_axi_gmem1_BREADY),
        .m_axi_gmem1_BRESP(example_0_m_axi_gmem1_BRESP),
        .m_axi_gmem1_BVALID(example_0_m_axi_gmem1_BVALID),
        .m_axi_gmem1_RDATA(example_0_m_axi_gmem1_RDATA),
        .m_axi_gmem1_RLAST(example_0_m_axi_gmem1_RLAST),
        .m_axi_gmem1_RREADY(example_0_m_axi_gmem1_RREADY),
        .m_axi_gmem1_RRESP(example_0_m_axi_gmem1_RRESP),
        .m_axi_gmem1_RVALID(example_0_m_axi_gmem1_RVALID),
        .m_axi_gmem1_WDATA(example_0_m_axi_gmem1_WDATA),
        .m_axi_gmem1_WLAST(example_0_m_axi_gmem1_WLAST),
        .m_axi_gmem1_WREADY(example_0_m_axi_gmem1_WREADY),
        .m_axi_gmem1_WSTRB(example_0_m_axi_gmem1_WSTRB),
        .m_axi_gmem1_WVALID(example_0_m_axi_gmem1_WVALID),
        .s_axi_control_ARADDR(s_axi_control_1_ARADDR),
        .s_axi_control_ARREADY(s_axi_control_1_ARREADY),
        .s_axi_control_ARVALID(s_axi_control_1_ARVALID),
        .s_axi_control_AWADDR(s_axi_control_1_AWADDR),
        .s_axi_control_AWREADY(s_axi_control_1_AWREADY),
        .s_axi_control_AWVALID(s_axi_control_1_AWVALID),
        .s_axi_control_BREADY(s_axi_control_1_BREADY),
        .s_axi_control_BRESP(s_axi_control_1_BRESP),
        .s_axi_control_BVALID(s_axi_control_1_BVALID),
        .s_axi_control_RDATA(s_axi_control_1_RDATA),
        .s_axi_control_RREADY(s_axi_control_1_RREADY),
        .s_axi_control_RRESP(s_axi_control_1_RRESP),
        .s_axi_control_RVALID(s_axi_control_1_RVALID),
        .s_axi_control_WDATA(s_axi_control_1_WDATA),
        .s_axi_control_WREADY(s_axi_control_1_WREADY),
        .s_axi_control_WSTRB(s_axi_control_1_WSTRB),
        .s_axi_control_WVALID(s_axi_control_1_WVALID),
        .stream_mon_recv_V_V_TDATA(ACC_stream_out_nnz_count_V_V_TDATA),
        .stream_mon_recv_V_V_TREADY(ACC_stream_out_nnz_count_V_V_TREADY),
        .stream_mon_recv_V_V_TVALID(ACC_stream_out_nnz_count_V_V_TVALID),
        .stream_mon_send_V_V_TDATA(example_0_stream_mon_send_V_V_TDATA),
        .stream_mon_send_V_V_TREADY(example_0_stream_mon_send_V_V_TREADY),
        .stream_mon_send_V_V_TVALID(example_0_stream_mon_send_V_V_TVALID),
        .stream_token_V_V_TDATA(example_0_stream_token_V_V_TDATA),
        .stream_token_V_V_TREADY(example_0_stream_token_V_V_TREADY),
        .stream_token_V_V_TVALID(example_0_stream_token_V_V_TVALID),
        .stream_wide_mat0_V_V_TDATA(example_0_stream_wide_mat0_V_V_TDATA),
        .stream_wide_mat0_V_V_TREADY(example_0_stream_wide_mat0_V_V_TREADY),
        .stream_wide_mat0_V_V_TVALID(example_0_stream_wide_mat0_V_V_TVALID),
        .stream_wide_mat1_V_V_TDATA(example_0_stream_wide_mat1_V_V_TDATA),
        .stream_wide_mat1_V_V_TREADY(example_0_stream_wide_mat1_V_V_TREADY),
        .stream_wide_mat1_V_V_TVALID(example_0_stream_wide_mat1_V_V_TVALID),
        .stream_wide_x_V_V_TDATA(example_0_stream_wide_x_V_V_TDATA),
        .stream_wide_x_V_V_TREADY(example_0_stream_wide_x_V_V_TREADY),
        .stream_wide_x_V_V_TVALID(example_0_stream_wide_x_V_V_TVALID),
        .stream_wide_y_V_V_TDATA(axis_data_fifo_0_M_AXIS_TDATA),
        .stream_wide_y_V_V_TREADY(axis_data_fifo_0_M_AXIS_TREADY),
        .stream_wide_y_V_V_TVALID(axis_data_fifo_0_M_AXIS_TVALID));
  input_queue_imp_XB9HP input_queue
       (.M_AXIS1_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .M_AXIS1_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .M_AXIS1_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .M_AXIS2_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .M_AXIS2_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .M_AXIS2_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .M_AXIS3_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .M_AXIS3_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .M_AXIS3_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .M_AXIS4_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .M_AXIS4_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .M_AXIS4_tvalid(axis_data_fifo_4_M_AXIS_TVALID),
        .M_AXIS5_tdata(axis_data_fifo_5_M_AXIS_TDATA),
        .M_AXIS5_tready(axis_data_fifo_5_M_AXIS_TREADY),
        .M_AXIS5_tvalid(axis_data_fifo_5_M_AXIS_TVALID),
        .M_AXIS6_tdata(axis_data_fifo_6_M_AXIS_TDATA),
        .M_AXIS6_tready(axis_data_fifo_6_M_AXIS_TREADY),
        .M_AXIS6_tvalid(axis_data_fifo_6_M_AXIS_TVALID),
        .M_AXIS7_tdata(axis_data_fifo_7_M_AXIS_TDATA),
        .M_AXIS7_tready(axis_data_fifo_7_M_AXIS_TREADY),
        .M_AXIS7_tvalid(axis_data_fifo_7_M_AXIS_TVALID),
        .M_AXIS_tdata(axis_data_fifo_0_M_AXIS1_TDATA),
        .M_AXIS_tready(axis_data_fifo_0_M_AXIS1_TREADY),
        .M_AXIS_tvalid(axis_data_fifo_0_M_AXIS1_TVALID),
        .S_AXIS1_tdata(axis_broadcaster_0_M01_AXIS_TDATA),
        .S_AXIS1_tready(axis_broadcaster_0_M01_AXIS_TREADY),
        .S_AXIS1_tvalid(axis_broadcaster_0_M01_AXIS_TVALID),
        .S_AXIS2_tdata(axis_broadcaster_0_M02_AXIS_TDATA),
        .S_AXIS2_tready(axis_broadcaster_0_M02_AXIS_TREADY),
        .S_AXIS2_tvalid(axis_broadcaster_0_M02_AXIS_TVALID),
        .S_AXIS3_tdata(axis_broadcaster_0_M03_AXIS_TDATA),
        .S_AXIS3_tready(axis_broadcaster_0_M03_AXIS_TREADY),
        .S_AXIS3_tvalid(axis_broadcaster_0_M03_AXIS_TVALID),
        .S_AXIS4_tdata(axis_broadcaster_5_M00_AXIS_TDATA),
        .S_AXIS4_tready(axis_broadcaster_5_M00_AXIS_TREADY),
        .S_AXIS4_tvalid(axis_broadcaster_5_M00_AXIS_TVALID),
        .S_AXIS5_tdata(axis_broadcaster_5_M01_AXIS_TDATA),
        .S_AXIS5_tready(axis_broadcaster_5_M01_AXIS_TREADY),
        .S_AXIS5_tvalid(axis_broadcaster_5_M01_AXIS_TVALID),
        .S_AXIS6_tdata(axis_broadcaster_5_M02_AXIS_TDATA),
        .S_AXIS6_tready(axis_broadcaster_5_M02_AXIS_TREADY),
        .S_AXIS6_tvalid(axis_broadcaster_5_M02_AXIS_TVALID),
        .S_AXIS7_tdata(axis_broadcaster_5_M03_AXIS_TDATA),
        .S_AXIS7_tready(axis_broadcaster_5_M03_AXIS_TREADY),
        .S_AXIS7_tvalid(axis_broadcaster_5_M03_AXIS_TVALID),
        .S_AXIS_tdata(axis_broadcaster_0_M00_AXIS_TDATA),
        .S_AXIS_tready(axis_broadcaster_0_M00_AXIS_TREADY),
        .S_AXIS_tvalid(axis_broadcaster_0_M00_AXIS_TVALID),
        .ap_clk(ap_clk_1),
        .ap_rst_n(ap_rst_n_1));
  noc_wrapper #(.DATA_WIDTH(64),
      .ADDR_WIDTH(1),
      .DEPTH(2),
      .N(8),
      .M(8),
      .C_nR(1),
      .C(0),
      .R(16)
  ) noc_wrapper_0
       (.M_AXIS_0_tdata(noc_wrapper_0_M_AXIS_0_TDATA),
        .M_AXIS_0_tready(noc_wrapper_0_M_AXIS_0_TREADY),
        .M_AXIS_0_tvalid(noc_wrapper_0_M_AXIS_0_TVALID),
        .M_AXIS_1_tdata(noc_wrapper_0_M_AXIS_1_TDATA),
        .M_AXIS_1_tready(noc_wrapper_0_M_AXIS_1_TREADY),
        .M_AXIS_1_tvalid(noc_wrapper_0_M_AXIS_1_TVALID),
        .M_AXIS_2_tdata(noc_wrapper_0_M_AXIS_2_TDATA),
        .M_AXIS_2_tready(noc_wrapper_0_M_AXIS_2_TREADY),
        .M_AXIS_2_tvalid(noc_wrapper_0_M_AXIS_2_TVALID),
        .M_AXIS_3_tdata(noc_wrapper_0_M_AXIS_3_TDATA),
        .M_AXIS_3_tready(noc_wrapper_0_M_AXIS_3_TREADY),
        .M_AXIS_3_tvalid(noc_wrapper_0_M_AXIS_3_TVALID),
        .M_AXIS_4_tdata(noc_wrapper_0_M_AXIS_4_TDATA),
        .M_AXIS_4_tready(noc_wrapper_0_M_AXIS_4_TREADY),
        .M_AXIS_4_tvalid(noc_wrapper_0_M_AXIS_4_TVALID),
        .M_AXIS_5_tdata(noc_wrapper_0_M_AXIS_5_TDATA),
        .M_AXIS_5_tready(noc_wrapper_0_M_AXIS_5_TREADY),
        .M_AXIS_5_tvalid(noc_wrapper_0_M_AXIS_5_TVALID),
        .M_AXIS_6_tdata(noc_wrapper_0_M_AXIS_6_TDATA),
        .M_AXIS_6_tready(noc_wrapper_0_M_AXIS_6_TREADY),
        .M_AXIS_6_tvalid(noc_wrapper_0_M_AXIS_6_TVALID),
        .M_AXIS_7_tdata(noc_wrapper_0_M_AXIS_7_TDATA),
        .M_AXIS_7_tready(noc_wrapper_0_M_AXIS_7_TREADY),
        .M_AXIS_7_tvalid(noc_wrapper_0_M_AXIS_7_TVALID),
        .S_AXIS_0_tdata(axis_data_fifo_0_M_AXIS1_TDATA),
        .S_AXIS_0_tready(axis_data_fifo_0_M_AXIS1_TREADY),
        .S_AXIS_0_tvalid(axis_data_fifo_0_M_AXIS1_TVALID),
        .S_AXIS_1_tdata(axis_data_fifo_1_M_AXIS_TDATA),
        .S_AXIS_1_tready(axis_data_fifo_1_M_AXIS_TREADY),
        .S_AXIS_1_tvalid(axis_data_fifo_1_M_AXIS_TVALID),
        .S_AXIS_2_tdata(axis_data_fifo_2_M_AXIS_TDATA),
        .S_AXIS_2_tready(axis_data_fifo_2_M_AXIS_TREADY),
        .S_AXIS_2_tvalid(axis_data_fifo_2_M_AXIS_TVALID),
        .S_AXIS_3_tdata(axis_data_fifo_3_M_AXIS_TDATA),
        .S_AXIS_3_tready(axis_data_fifo_3_M_AXIS_TREADY),
        .S_AXIS_3_tvalid(axis_data_fifo_3_M_AXIS_TVALID),
        .S_AXIS_4_tdata(axis_data_fifo_4_M_AXIS_TDATA),
        .S_AXIS_4_tready(axis_data_fifo_4_M_AXIS_TREADY),
        .S_AXIS_4_tvalid(axis_data_fifo_4_M_AXIS_TVALID),
        .S_AXIS_5_tdata(axis_data_fifo_5_M_AXIS_TDATA),
        .S_AXIS_5_tready(axis_data_fifo_5_M_AXIS_TREADY),
        .S_AXIS_5_tvalid(axis_data_fifo_5_M_AXIS_TVALID),
        .S_AXIS_6_tdata(axis_data_fifo_6_M_AXIS_TDATA),
        .S_AXIS_6_tready(axis_data_fifo_6_M_AXIS_TREADY),
        .S_AXIS_6_tvalid(axis_data_fifo_6_M_AXIS_TVALID),
        .S_AXIS_7_tdata(axis_data_fifo_7_M_AXIS_TDATA),
        .S_AXIS_7_tready(axis_data_fifo_7_M_AXIS_TREADY),
        .S_AXIS_7_tvalid(axis_data_fifo_7_M_AXIS_TVALID),
        .aclk_0(ap_clk_1),
        .aresetn_0(ap_rst_n_1));
  noc_wrapper #(.DATA_WIDTH(64),
      .ADDR_WIDTH(1),
      .DEPTH(2),
      .N(8),
      .M(8),
      .C_nR(0),
      .C(0),
      .R(16)
  ) noc_wrapper_1
       (.M_AXIS_0_tdata(noc_wrapper_1_M_AXIS_0_TDATA),
        .M_AXIS_0_tready(noc_wrapper_1_M_AXIS_0_TREADY),
        .M_AXIS_0_tvalid(noc_wrapper_1_M_AXIS_0_TVALID),
        .M_AXIS_1_tdata(noc_wrapper_1_M_AXIS_1_TDATA),
        .M_AXIS_1_tready(noc_wrapper_1_M_AXIS_1_TREADY),
        .M_AXIS_1_tvalid(noc_wrapper_1_M_AXIS_1_TVALID),
        .M_AXIS_2_tdata(noc_wrapper_1_M_AXIS_2_TDATA),
        .M_AXIS_2_tready(noc_wrapper_1_M_AXIS_2_TREADY),
        .M_AXIS_2_tvalid(noc_wrapper_1_M_AXIS_2_TVALID),
        .M_AXIS_3_tdata(noc_wrapper_1_M_AXIS_3_TDATA),
        .M_AXIS_3_tready(noc_wrapper_1_M_AXIS_3_TREADY),
        .M_AXIS_3_tvalid(noc_wrapper_1_M_AXIS_3_TVALID),
        .M_AXIS_4_tdata(noc_wrapper_1_M_AXIS_4_TDATA),
        .M_AXIS_4_tready(noc_wrapper_1_M_AXIS_4_TREADY),
        .M_AXIS_4_tvalid(noc_wrapper_1_M_AXIS_4_TVALID),
        .M_AXIS_5_tdata(noc_wrapper_1_M_AXIS_5_TDATA),
        .M_AXIS_5_tready(noc_wrapper_1_M_AXIS_5_TREADY),
        .M_AXIS_5_tvalid(noc_wrapper_1_M_AXIS_5_TVALID),
        .M_AXIS_6_tdata(noc_wrapper_1_M_AXIS_6_TDATA),
        .M_AXIS_6_tready(noc_wrapper_1_M_AXIS_6_TREADY),
        .M_AXIS_6_tvalid(noc_wrapper_1_M_AXIS_6_TVALID),
        .M_AXIS_7_tdata(noc_wrapper_1_M_AXIS_7_TDATA),
        .M_AXIS_7_tready(noc_wrapper_1_M_AXIS_7_TREADY),
        .M_AXIS_7_tvalid(noc_wrapper_1_M_AXIS_7_TVALID),
        .S_AXIS_0_tdata(BVB_load_0_stream_data_out_V_TDATA),
        .S_AXIS_0_tready(BVB_load_0_stream_data_out_V_TREADY),
        .S_AXIS_0_tvalid(BVB_load_0_stream_data_out_V_TVALID),
        .S_AXIS_1_tdata(BVB_load_1_stream_data_out_V_TDATA),
        .S_AXIS_1_tready(BVB_load_1_stream_data_out_V_TREADY),
        .S_AXIS_1_tvalid(BVB_load_1_stream_data_out_V_TVALID),
        .S_AXIS_2_tdata(BVB_load_2_stream_data_out_V_TDATA),
        .S_AXIS_2_tready(BVB_load_2_stream_data_out_V_TREADY),
        .S_AXIS_2_tvalid(BVB_load_2_stream_data_out_V_TVALID),
        .S_AXIS_3_tdata(BVB_load_3_stream_data_out_V_TDATA),
        .S_AXIS_3_tready(BVB_load_3_stream_data_out_V_TREADY),
        .S_AXIS_3_tvalid(BVB_load_3_stream_data_out_V_TVALID),
        .S_AXIS_4_tdata(BVB_load_4_stream_data_out_V_TDATA),
        .S_AXIS_4_tready(BVB_load_4_stream_data_out_V_TREADY),
        .S_AXIS_4_tvalid(BVB_load_4_stream_data_out_V_TVALID),
        .S_AXIS_5_tdata(BVB_load_5_stream_data_out_V_TDATA),
        .S_AXIS_5_tready(BVB_load_5_stream_data_out_V_TREADY),
        .S_AXIS_5_tvalid(BVB_load_5_stream_data_out_V_TVALID),
        .S_AXIS_6_tdata(BVB_load_6_stream_data_out_V_TDATA),
        .S_AXIS_6_tready(BVB_load_6_stream_data_out_V_TREADY),
        .S_AXIS_6_tvalid(BVB_load_6_stream_data_out_V_TVALID),
        .S_AXIS_7_tdata(BVB_load_7_stream_data_out_V_TDATA),
        .S_AXIS_7_tready(BVB_load_7_stream_data_out_V_TREADY),
        .S_AXIS_7_tvalid(BVB_load_7_stream_data_out_V_TVALID),
        .aclk_0(ap_clk_1),
        .aresetn_0(ap_rst_n_1));
endmodule


