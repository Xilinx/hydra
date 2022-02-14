#/*
# * Copyright 2019-2021 Xilinx, Inc.
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
#*/

delete_bd_objs [get_bd_nets ap_rst_n] [get_bd_nets ap_clk] [get_bd_intf_nets example_op_0_m_axis] [get_bd_intf_nets dma_0_m00_sts] [get_bd_intf_nets dma_0_m00_axis] [get_bd_intf_nets dma_1_m00_axis] [get_bd_intf_nets example_op_1_m_axis] [get_bd_intf_nets control_m00_cmd] [get_bd_intf_nets control_m01_cmd] [get_bd_intf_nets dma_1_m00_sts] [get_bd_intf_nets s_axi_control] [get_bd_intf_nets dma_1_m00_axi] [get_bd_intf_nets dma_0_m00_axi] [get_bd_cells example_op_0] [get_bd_cells example_op_1] [get_bd_cells control] [get_bd_cells dma_1] [get_bd_cells dma_0]

set_property  ip_repo_paths ./ip [current_project]
update_ip_catalog
create_bd_cell -type ip -vlnv xilinx.com:hls:LSA:1.0 LSA_0

add_files -norecurse -scan_for_includes {./noc/src/noc_wrapper.v ./noc/src/noc_bft_v2.v ./noc/src/switch_bft.v ./noc/src/split_bft.v ./noc/src/merge.v ./noc/src/EB.v ./noc/src/HBEB.v ./noc/src/eb_srl.v}
import_files -norecurse {./noc/src/noc_wrapper.v ./noc/src/noc_bft_v2.v ./noc/src/switch_bft.v ./noc/src/split_bft.v ./noc/src/merge.v ./noc/src/EB.v ./noc/src/HBEB.v ./noc/src/eb_srl.v}

create_bd_cell -type module -reference noc_wrapper noc_wrapper_0

create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_0

set_property -dict [list CONFIG.M_TDATA_NUM_BYTES.VALUE_SRC USER CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER] [get_bd_cells axis_broadcaster_0]
set_property -dict [list CONFIG.NUM_MI {4} CONFIG.M_TDATA_NUM_BYTES {8} CONFIG.S_TDATA_NUM_BYTES {32} CONFIG.M00_TDATA_REMAP {tdata[63:0]} CONFIG.M01_TDATA_REMAP {tdata[63:0]} CONFIG.M02_TDATA_REMAP {tdata[63:0]} CONFIG.M03_TDATA_REMAP {tdata[63:0]}] [get_bd_cells axis_broadcaster_0]

set_property -dict [list CONFIG.M01_TDATA_REMAP {tdata[127:64]} CONFIG.M02_TDATA_REMAP {tdata[191:128]} CONFIG.M03_TDATA_REMAP {tdata[255:192]}] [get_bd_cells axis_broadcaster_0]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M00_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_0]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M01_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_1]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M02_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_2]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M03_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_3]

copy_bd_objs /  [get_bd_cells {axis_broadcaster_0}]
set_property name axis_broadcaster_5 [get_bd_cells axis_broadcaster_1]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M00_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_4]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M01_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_5]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M02_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_6]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M03_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_7]


connect_bd_intf_net [get_bd_intf_pins LSA_0/stream_wide_mat0_V_V] [get_bd_intf_pins axis_broadcaster_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins LSA_0/stream_wide_mat1_V_V] [get_bd_intf_pins axis_broadcaster_5/S_AXIS]


update_compile_order -fileset sources_1
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_broadcaster_0/aclk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_broadcaster_0/aresetn]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins noc_wrapper_0/aclk_0]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins noc_wrapper_0/aresetn_0]
copy_bd_objs /  [get_bd_cells {noc_wrapper_0}]
set_property -dict [list CONFIG.C_nR {0}] [get_bd_cells noc_wrapper_1]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins noc_wrapper_1/aclk_0]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins noc_wrapper_1/aresetn_0]
create_bd_cell -type ip -vlnv xilinx.com:hls:BVB_load:1.0 BVB_load_0
copy_bd_objs /  [get_bd_cells {BVB_load_0}]
copy_bd_objs /  [get_bd_cells {BVB_load_0}]
copy_bd_objs /  [get_bd_cells {BVB_load_0}]
copy_bd_objs /  [get_bd_cells {BVB_load_0}]
copy_bd_objs /  [get_bd_cells {BVB_load_0}]
copy_bd_objs /  [get_bd_cells {BVB_load_0}]
copy_bd_objs /  [get_bd_cells {BVB_load_0}]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_0/M_AXIS_0] [get_bd_intf_pins BVB_load_0/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins BVB_load_0/stream_data_out_V] [get_bd_intf_pins noc_wrapper_1/S_AXIS_0]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_0/M_AXIS_1] [get_bd_intf_pins BVB_load_1/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins BVB_load_1/stream_data_out_V] [get_bd_intf_pins noc_wrapper_1/S_AXIS_1]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_0/M_AXIS_2] [get_bd_intf_pins BVB_load_2/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins BVB_load_2/stream_data_out_V] [get_bd_intf_pins noc_wrapper_1/S_AXIS_2]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_0/M_AXIS_3] [get_bd_intf_pins BVB_load_3/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/S_AXIS_3] [get_bd_intf_pins BVB_load_3/stream_data_out_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_0/M_AXIS_4] [get_bd_intf_pins BVB_load_4/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_0/M_AXIS_5] [get_bd_intf_pins BVB_load_5/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/S_AXIS_4] [get_bd_intf_pins BVB_load_4/stream_data_out_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/S_AXIS_5] [get_bd_intf_pins BVB_load_5/stream_data_out_V]
connect_bd_intf_net [get_bd_intf_pins BVB_load_6/stream_data_in_V] [get_bd_intf_pins noc_wrapper_0/M_AXIS_6]
connect_bd_intf_net [get_bd_intf_pins BVB_load_7/stream_data_in_V] [get_bd_intf_pins noc_wrapper_0/M_AXIS_7]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/S_AXIS_6] [get_bd_intf_pins BVB_load_6/stream_data_out_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/S_AXIS_7] [get_bd_intf_pins BVB_load_7/stream_data_out_V]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_1/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_0/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_2/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_3/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_4/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_5/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_6/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins BVB_load_7/ap_clk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_3/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_4/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_5/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_6/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins BVB_load_7/ap_rst_n]

create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1
set_property -dict [list CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER] [get_bd_cells axis_broadcaster_1]
set_property -dict [list CONFIG.NUM_MI {8} CONFIG.M_TDATA_NUM_BYTES {4} CONFIG.S_TDATA_NUM_BYTES {32} CONFIG.M00_TDATA_REMAP {tdata[31:0]} CONFIG.M01_TDATA_REMAP {tdata[31:0]} CONFIG.M02_TDATA_REMAP {tdata[31:0]} CONFIG.M03_TDATA_REMAP {tdata[31:0]} CONFIG.M04_TDATA_REMAP {tdata[31:0]} CONFIG.M05_TDATA_REMAP {tdata[31:0]} CONFIG.M06_TDATA_REMAP {tdata[31:0]} CONFIG.M07_TDATA_REMAP {tdata[31:0]}] [get_bd_cells axis_broadcaster_1]
set_property -dict [list CONFIG.M_TDATA_NUM_BYTES {4} CONFIG.M00_TDATA_REMAP {tdata[31:0]} CONFIG.M01_TDATA_REMAP {tdata[63:32]} CONFIG.M02_TDATA_REMAP {tdata[95:64]} CONFIG.M03_TDATA_REMAP {tdata[127:96]} CONFIG.M04_TDATA_REMAP {tdata[159:128]} CONFIG.M05_TDATA_REMAP {tdata[191:160]} CONFIG.M06_TDATA_REMAP {tdata[223:192]} CONFIG.M07_TDATA_REMAP {tdata[255:224]}] [get_bd_cells axis_broadcaster_1]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M00_AXIS] [get_bd_intf_pins BVB_load_0/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M01_AXIS] [get_bd_intf_pins BVB_load_1/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M02_AXIS] [get_bd_intf_pins BVB_load_2/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M03_AXIS] [get_bd_intf_pins BVB_load_3/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M04_AXIS] [get_bd_intf_pins BVB_load_4/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M05_AXIS] [get_bd_intf_pins BVB_load_5/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M06_AXIS] [get_bd_intf_pins BVB_load_6/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/M07_AXIS] [get_bd_intf_pins BVB_load_7/stream_vec_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/S_AXIS] [get_bd_intf_pins LSA_0/stream_wide_x_V_V]
create_bd_cell -type ip -vlnv xilinx.com:hls:HRB:1.0 HRB_0
copy_bd_objs /  [get_bd_cells {HRB_0}]
copy_bd_objs /  [get_bd_cells {HRB_0}]
copy_bd_objs /  [get_bd_cells {HRB_0}]
copy_bd_objs /  [get_bd_cells {HRB_0}]
copy_bd_objs /  [get_bd_cells {HRB_0}]
copy_bd_objs /  [get_bd_cells {HRB_0}]
copy_bd_objs /  [get_bd_cells {HRB_0}]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_0] [get_bd_intf_pins HRB_0/ins_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_1] [get_bd_intf_pins HRB_1/ins_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_2] [get_bd_intf_pins HRB_2/ins_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_3] [get_bd_intf_pins HRB_3/ins_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_4] [get_bd_intf_pins HRB_4/ins_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_5] [get_bd_intf_pins HRB_5/ins_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_6] [get_bd_intf_pins HRB_6/ins_V]
connect_bd_intf_net [get_bd_intf_pins noc_wrapper_1/M_AXIS_7] [get_bd_intf_pins HRB_7/ins_V]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_0/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_1/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_2/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_3/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_4/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_5/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_6/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins HRB_7/ap_clk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_3/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_4/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_5/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_6/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins HRB_7/ap_rst_n]
create_bd_cell -type ip -vlnv xilinx.com:hls:ACC:1.0 ACC_0
copy_bd_objs /  [get_bd_cells {ACC_0}]
copy_bd_objs /  [get_bd_cells {ACC_0}]
copy_bd_objs /  [get_bd_cells {ACC_0}]
copy_bd_objs /  [get_bd_cells {ACC_0}]
copy_bd_objs /  [get_bd_cells {ACC_0}]
copy_bd_objs /  [get_bd_cells {ACC_0}]
copy_bd_objs /  [get_bd_cells {ACC_0}]
connect_bd_intf_net [get_bd_intf_pins HRB_0/outs_V] [get_bd_intf_pins ACC_0/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins HRB_1/outs_V] [get_bd_intf_pins ACC_1/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins HRB_2/outs_V] [get_bd_intf_pins ACC_2/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins HRB_3/outs_V] [get_bd_intf_pins ACC_3/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins HRB_4/outs_V] [get_bd_intf_pins ACC_4/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins HRB_5/outs_V] [get_bd_intf_pins ACC_5/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins HRB_6/outs_V] [get_bd_intf_pins ACC_6/stream_data_in_V]
connect_bd_intf_net [get_bd_intf_pins HRB_7/outs_V] [get_bd_intf_pins ACC_7/stream_data_in_V]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_0/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_1/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_2/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_3/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_4/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_5/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_6/ap_clk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ACC_7/ap_clk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_3/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_4/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_5/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_6/ap_rst_n]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ACC_7/ap_rst_n]
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_2
set_property -dict [list CONFIG.NUM_MI {8} CONFIG.M02_TDATA_REMAP {tdata[7:0]} CONFIG.M03_TDATA_REMAP {tdata[7:0]} CONFIG.M04_TDATA_REMAP {tdata[7:0]} CONFIG.M05_TDATA_REMAP {tdata[7:0]} CONFIG.M06_TDATA_REMAP {tdata[7:0]} CONFIG.M07_TDATA_REMAP {tdata[7:0]}] [get_bd_cells axis_broadcaster_2]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M00_AXIS] [get_bd_intf_pins ACC_0/token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M01_AXIS] [get_bd_intf_pins ACC_1/token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M02_AXIS] [get_bd_intf_pins ACC_2/token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M03_AXIS] [get_bd_intf_pins ACC_3/token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M04_AXIS] [get_bd_intf_pins ACC_4/token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M05_AXIS] [get_bd_intf_pins ACC_5/token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M06_AXIS] [get_bd_intf_pins ACC_6/token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/M07_AXIS] [get_bd_intf_pins ACC_7/token_V_V]
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0
set_property -dict [list CONFIG.NUM_PORTS {8}] [get_bd_cells xlconcat_0]
connect_bd_net [get_bd_pins ACC_0/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In0]
connect_bd_net [get_bd_pins ACC_1/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In1]
connect_bd_net [get_bd_pins ACC_2/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In2]
connect_bd_net [get_bd_pins ACC_3/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In3]
connect_bd_net [get_bd_pins ACC_4/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In4]
connect_bd_net [get_bd_pins ACC_5/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In5]
connect_bd_net [get_bd_pins ACC_6/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In6]
connect_bd_net [get_bd_pins ACC_7/stream_vec_V_TDATA] [get_bd_pins xlconcat_0/In7]
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins axis_data_fifo_0/s_axis_tdata]
regenerate_bd_layout
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_0/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_1/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_2/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_3/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_4/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_5/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_6/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_7/stream_vec_V_TREADY]
create_bd_cell -type ip -vlnv xilinx.com:ip:util_reduced_logic:2.0 util_reduced_logic_0
create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1
set_property -dict [list CONFIG.NUM_PORTS {8}] [get_bd_cells xlconcat_1]
connect_bd_net [get_bd_pins ACC_0/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In0]
connect_bd_net [get_bd_pins ACC_1/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In1]
connect_bd_net [get_bd_pins ACC_2/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In2]
connect_bd_net [get_bd_pins ACC_3/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In3]
connect_bd_net [get_bd_pins ACC_4/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In4]
connect_bd_net [get_bd_pins ACC_5/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In5]
connect_bd_net [get_bd_pins ACC_6/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In6]
connect_bd_net [get_bd_pins ACC_7/stream_vec_V_TVALID] [get_bd_pins xlconcat_1/In7]
connect_bd_net [get_bd_pins xlconcat_1/dout] [get_bd_pins util_reduced_logic_0/Op1]
connect_bd_net [get_bd_pins util_reduced_logic_0/Res] [get_bd_pins axis_data_fifo_0/s_axis_tvalid]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_0/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk]
delete_bd_objs [get_bd_nets xlconcat_0_dout] [get_bd_nets util_reduced_logic_0_Res] [get_bd_cells axis_data_fifo_0]
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0
connect_bd_net [get_bd_pins xlconcat_0/dout] [get_bd_pins axis_data_fifo_0/s_axis_tdata]
connect_bd_net [get_bd_pins axis_data_fifo_0/s_axis_tready] [get_bd_pins ACC_0/stream_vec_V_TREADY]
connect_bd_net [get_bd_pins util_reduced_logic_0/Res] [get_bd_pins axis_data_fifo_0/s_axis_tvalid]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_broadcaster_2/aclk]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/S_AXIS] [get_bd_intf_pins LSA_0/stream_token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins LSA_0/stream_wide_y_V_V]
set_property -dict [list CONFIG.TDATA_NUM_BYTES.VALUE_SRC USER] [get_bd_cells axis_data_fifo_0]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {32} CONFIG.FIFO_DEPTH {8192} CONFIG.FIFO_MEMORY_TYPE {ultra}] [get_bd_cells axis_data_fifo_0]
apply_bd_automation -rule xilinx.com:bd_rule:clkrst -config {Clk "/ap_clk (250 MHz)" }  [get_bd_pins axis_broadcaster_1/aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_0/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_broadcaster_2/aresetn]
set_property -dict [list CONFIG.S_TDATA_NUM_BYTES {32} CONFIG.M01_TDATA_REMAP {tdata[31:0]} CONFIG.M02_TDATA_REMAP {tdata[31:0]} CONFIG.M03_TDATA_REMAP {tdata[31:0]} CONFIG.M04_TDATA_REMAP {tdata[31:0]} CONFIG.M05_TDATA_REMAP {tdata[31:0]} CONFIG.M06_TDATA_REMAP {tdata[31:0]} CONFIG.M07_TDATA_REMAP {tdata[31:0]}] [get_bd_cells axis_broadcaster_1]

connect_bd_intf_net [get_bd_intf_ports m01_axi] [get_bd_intf_pins LSA_0/m_axi_gmem1]
connect_bd_intf_net [get_bd_intf_ports m00_axi] [get_bd_intf_pins LSA_0/m_axi_gmem0]
connect_bd_intf_net [get_bd_intf_ports s_axi_control] [get_bd_intf_pins LSA_0/s_axi_control]


assign_bd_address
set_property range 1M [get_bd_addr_segs {LSA_0/Data_m_axi_gmem0/SEG_m00_axi_Reg}]
save_bd_design

group_bd_cells ACC [get_bd_cells HRB_7] [get_bd_cells ACC_3] [get_bd_cells axis_data_fifo_0] [get_bd_cells ACC_4] [get_bd_cells ACC_5] [get_bd_cells ACC_6] [get_bd_cells xlconcat_0] [get_bd_cells xlconcat_1] [get_bd_cells ACC_7] [get_bd_cells HRB_0] [get_bd_cells HRB_1] [get_bd_cells HRB_2] [get_bd_cells HRB_3] [get_bd_cells ACC_0] [get_bd_cells HRB_4] [get_bd_cells ACC_1] [get_bd_cells HRB_5] [get_bd_cells HRB_6] [get_bd_cells ACC_2] [get_bd_cells util_reduced_logic_0]
group_bd_cells BVB [get_bd_cells BVB_load_2] [get_bd_cells BVB_load_3] [get_bd_cells BVB_load_4] [get_bd_cells BVB_load_5] [get_bd_cells BVB_load_7] [get_bd_cells BVB_load_0] [get_bd_cells BVB_load_1] [get_bd_cells BVB_load_6]

set_property offset 0x0000000144A00000 [get_bd_addr_segs {LSA_0/Data_m_axi_gmem1/SEG_m01_axi_Reg}]
save_bd_design

create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 axis_data_fifo_0
copy_bd_objs /  [get_bd_cells {axis_data_fifo_0}]
copy_bd_objs /  [get_bd_cells {axis_data_fifo_0}]
copy_bd_objs /  [get_bd_cells {axis_data_fifo_0}]
copy_bd_objs /  [get_bd_cells {axis_data_fifo_0}]
copy_bd_objs /  [get_bd_cells {axis_data_fifo_0}]
copy_bd_objs /  [get_bd_cells {axis_data_fifo_0}]
copy_bd_objs /  [get_bd_cells {axis_data_fifo_0}]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_0_M00_AXIS]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_0_M01_AXIS]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_0_M02_AXIS]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_0_M03_AXIS]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_5_M00_AXIS]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_5_M01_AXIS]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_5_M02_AXIS]
delete_bd_objs [get_bd_intf_nets axis_broadcaster_5_M03_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M00_AXIS] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M01_AXIS] [get_bd_intf_pins axis_data_fifo_1/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M02_AXIS] [get_bd_intf_pins axis_data_fifo_2/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_0/M03_AXIS] [get_bd_intf_pins axis_data_fifo_3/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M00_AXIS] [get_bd_intf_pins axis_data_fifo_4/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M01_AXIS] [get_bd_intf_pins axis_data_fifo_5/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M02_AXIS] [get_bd_intf_pins axis_data_fifo_6/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_5/M03_AXIS] [get_bd_intf_pins axis_data_fifo_7/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_0]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_1/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_1]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_2/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_2]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_3/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_3]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_4/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_4]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_5/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_5]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_6/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_6]
connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_7/M_AXIS] [get_bd_intf_pins noc_wrapper_0/S_AXIS_7]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_1/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_2/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_3/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_4/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_5/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_6/s_axis_aclk]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_data_fifo_7/s_axis_aclk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_0/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_1/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_2/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_3/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_4/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_5/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_6/s_axis_aresetn]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_data_fifo_7/s_axis_aresetn]
group_bd_cells input_queue [get_bd_cells axis_data_fifo_0] [get_bd_cells axis_data_fifo_1] [get_bd_cells axis_data_fifo_2] [get_bd_cells axis_data_fifo_3] [get_bd_cells axis_data_fifo_4] [get_bd_cells axis_data_fifo_5] [get_bd_cells axis_data_fifo_6] [get_bd_cells axis_data_fifo_7]



copy_bd_objs /  [get_bd_cells {input_queue}]
move_bd_cells [get_bd_cells ACC] [get_bd_cells input_queue1]
delete_bd_objs [get_bd_intf_nets ACC/HRB_0_outs_V]
delete_bd_objs [get_bd_intf_nets ACC/HRB_1_outs_V]
delete_bd_objs [get_bd_intf_nets ACC/HRB_2_outs_V]
delete_bd_objs [get_bd_intf_nets ACC/HRB_3_outs_V]
delete_bd_objs [get_bd_intf_nets ACC/HRB_4_outs_V]
delete_bd_objs [get_bd_intf_nets ACC/HRB_5_outs_V]
delete_bd_objs [get_bd_intf_nets ACC/HRB_6_outs_V]
delete_bd_objs [get_bd_intf_nets ACC/HRB_7_outs_V]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_0/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_1/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS1]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_2/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS2]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_3/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS3]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_4/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS4]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_5/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS5]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_6/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS6]
connect_bd_intf_net [get_bd_intf_pins ACC/HRB_7/outs_V] -boundary_type upper [get_bd_intf_pins ACC/input_queue1/S_AXIS7]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS] [get_bd_intf_pins ACC/ACC_0/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS1] [get_bd_intf_pins ACC/ACC_1/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS2] [get_bd_intf_pins ACC/ACC_2/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS3] [get_bd_intf_pins ACC/ACC_3/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS4] [get_bd_intf_pins ACC/ACC_4/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS5] [get_bd_intf_pins ACC/ACC_5/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS6] [get_bd_intf_pins ACC/ACC_6/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS7] [get_bd_intf_pins ACC/ACC_7/stream_data_in_V]
connect_bd_net [get_bd_pins ACC/ap_rst_n] [get_bd_pins ACC/input_queue1/ap_rst_n]
connect_bd_net [get_bd_pins ACC/ap_clk] [get_bd_pins ACC/input_queue1/ap_clk]

set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_0]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_1]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_2]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_3]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_4]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_5]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_6]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells ACC/input_queue1/axis_data_fifo_7]

set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_0]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_1]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_2]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_3]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_4]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_5]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_6]
set_property -dict [list CONFIG.FIFO_DEPTH {16}] [get_bd_cells input_queue/axis_data_fifo_7]

set_property -dict [list CONFIG.ADDR_WIDTH {4} CONFIG.DEPTH {16}] [get_bd_cells noc_wrapper_0]
set_property -dict [list CONFIG.ADDR_WIDTH {4} CONFIG.DEPTH {16}] [get_bd_cells noc_wrapper_1]


add_files -norecurse -scan_for_includes ./apps/d64.dat
import_files -norecurse ./apps/d64.dat

# spmv.v arport and awprot

delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS]
delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS1]
delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS2]
delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS3]
delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS4]
delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS5]
delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS6]
delete_bd_objs [get_bd_intf_nets ACC/input_queue1_M_AXIS7]

create_bd_cell -type ip -vlnv xilinx.com:hls:monitor:1.0 monitor_0
move_bd_cells [get_bd_cells ACC] [get_bd_cells monitor_0]

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS] [get_bd_intf_pins ACC/monitor_0/stream_in_V_0]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS1] [get_bd_intf_pins ACC/monitor_0/stream_in_V_1]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS2] [get_bd_intf_pins ACC/monitor_0/stream_in_V_2]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS3] [get_bd_intf_pins ACC/monitor_0/stream_in_V_3]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS4] [get_bd_intf_pins ACC/monitor_0/stream_in_V_4]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS5] [get_bd_intf_pins ACC/monitor_0/stream_in_V_5]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS6] [get_bd_intf_pins ACC/monitor_0/stream_in_V_6]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue1/M_AXIS7] [get_bd_intf_pins ACC/monitor_0/stream_in_V_7]

copy_bd_objs ACC  [get_bd_cells {ACC/input_queue1}]

connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_0] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_1] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS1]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_2] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS2]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_3] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS3]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_4] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS4]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_5] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS5]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_6] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS6]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_V_7] -boundary_type upper [get_bd_intf_pins ACC/input_queue2/S_AXIS7]

connect_bd_net [get_bd_pins ACC/ap_clk] [get_bd_pins ACC/monitor_0/ap_clk]
connect_bd_net [get_bd_pins ACC/ap_rst_n] [get_bd_pins ACC/monitor_0/ap_rst_n]
connect_bd_net [get_bd_pins ACC/ap_clk] [get_bd_pins ACC/input_queue2/ap_clk]
connect_bd_net [get_bd_pins ACC/ap_rst_n] [get_bd_pins ACC/input_queue2/ap_rst_n]

connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS] [get_bd_intf_pins ACC/ACC_0/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS1] [get_bd_intf_pins ACC/ACC_1/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS2] [get_bd_intf_pins ACC/ACC_2/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS3] [get_bd_intf_pins ACC/ACC_3/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS4] [get_bd_intf_pins ACC/ACC_4/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS5] [get_bd_intf_pins ACC/ACC_5/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS6] [get_bd_intf_pins ACC/ACC_6/stream_data_in_V]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins ACC/input_queue2/M_AXIS7] [get_bd_intf_pins ACC/ACC_7/stream_data_in_V]


connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_in_nnz_count_V_V] [get_bd_intf_pins LSA_0/stream_mon_send_V_V]
connect_bd_intf_net [get_bd_intf_pins ACC/monitor_0/stream_out_nnz_count_V_V] [get_bd_intf_pins LSA_0/stream_mon_recv_V_V]

connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_broadcaster_5/aclk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_broadcaster_5/aresetn]

set_property -dict [list CONFIG.ADDR_WIDTH {1} CONFIG.DEPTH {2}] [get_bd_cells noc_wrapper_0]
set_property -dict [list CONFIG.ADDR_WIDTH {1} CONFIG.DEPTH {2}] [get_bd_cells noc_wrapper_1]

file copy -force ./apps/spmv_tb.sv ./spmv_ex/imports/spmv_tb.sv
file copy -force ./apps/spmv.v ./spmv_ex/imports/spmv.v
set_property -dict [list CONFIG.M01_TDATA_REMAP {tdata[63:32]} CONFIG.M02_TDATA_REMAP {tdata[95:64]} CONFIG.M03_TDATA_REMAP {tdata[127:96]} CONFIG.M04_TDATA_REMAP {tdata[159:128]} CONFIG.M05_TDATA_REMAP {tdata[191:160]} CONFIG.M06_TDATA_REMAP {tdata[223:192]} CONFIG.M07_TDATA_REMAP {tdata[255:224]}] [get_bd_cells axis_broadcaster_1]
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_register_slice:1.1 axis_register_slice_0
delete_bd_objs [get_bd_intf_nets LSA_0_stream_wide_x_V_V]
connect_bd_intf_net [get_bd_intf_pins LSA_0/stream_wide_x_V_V] [get_bd_intf_pins axis_register_slice_0/S_AXIS]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_register_slice_0/aclk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_register_slice_0/aresetn]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_1/S_AXIS] [get_bd_intf_pins axis_register_slice_0/M_AXIS]
set_property -dict [list CONFIG.REG_CONFIG {8}] [get_bd_cells axis_register_slice_0]
copy_bd_objs /  [get_bd_cells {axis_register_slice_0}]
delete_bd_objs [get_bd_intf_nets LSA_0_stream_token_V_V]
connect_bd_intf_net [get_bd_intf_pins axis_register_slice_1/S_AXIS] [get_bd_intf_pins LSA_0/stream_token_V_V]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins axis_register_slice_1/aclk]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins axis_register_slice_1/aresetn]
connect_bd_intf_net [get_bd_intf_pins axis_broadcaster_2/S_AXIS] [get_bd_intf_pins axis_register_slice_1/M_AXIS]
regenerate_bd_layout
save_bd_design


generate_target Simulation [get_files ./spmv_ex/spmv_ex.srcs/sources_1/bd/spmv_bd/spmv_bd.bd]
export_ip_user_files -of_objects [get_files ./spmv_ex/spmv_ex.srcs/sources_1/bd/spmv_bd/spmv_bd.bd] -no_script -sync -force -quiet
export_simulation -of_objects [get_files ./spmv_ex/spmv_ex.srcs/sources_1/bd/spmv_bd/spmv_bd.bd] -directory ./spmv_ex/spmv_ex.ip_user_files/sim_scripts -ip_user_files_dir ./spmv_ex/spmv_ex.ip_user_files -ipstatic_source_dir ./spmv_ex/spmv_ex.ip_user_files/ipstatic -lib_map_path [list {modelsim=./spmv_ex/spmv_ex.cache/compile_simlib/modelsim} {questa=./spmv_ex/spmv_ex.cache/compile_simlib/questa} {ies=./spmv_ex/spmv_ex.cache/compile_simlib/ies} {xcelium=./spmv_ex/spmv_ex.cache/compile_simlib/xcelium} {vcs=./spmv_ex/spmv_ex.cache/compile_simlib/vcs} {riviera=./spmv_ex/spmv_ex.cache/compile_simlib/riviera}] -use_ip_compiled_libs -force -quiet
launch_simulation
source ./spmv_ex/spmv_ex.sim/sim_1/behav/xsim/spmv_tb.tcl
run all

# --------------------------------------------
# # Start: RTL kernel Packaging of Netlist
# #
source -notrace ./spmv_ex/imports/package_kernel.tcl
reset_run synth_1
launch_runs synth_1 -jobs 4
wait_on_run [get_runs synth_1]
#
#
#
open_run synth_1 -name synth_1
rename_ref -prefix_all spmv_

write_checkpoint spmv_ex/spmv_ex.runs/synth_1/packaged.dcp
write_xdc spmv_ex/spmv_ex.runs/synth_1/packaged.xdc
close_design
package_project_dcp_and_xdc spmv_ex/spmv_ex.runs/synth_1/packaged.dcp spmv_ex/spmv_ex.runs/synth_1/packaged.xdc spmv_ex/spmv xilinx.com kernel spmv


# Packaging project
package_xo  -xo_path spmv_ex/exports/spmv.xo -kernel_name spmv -ip_directory spmv_ex/spmv -kernel_xml spmv_ex/imports/kernel.xml 
#

















