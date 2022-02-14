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

create_project project_2 ./project_2 -part xcu280-fsvh2892-2L-e

#Adding top level testbench
set_property SOURCE_SET sources_1 [get_filesets sim_1]
add_files -fileset sim_1 -norecurse -scan_for_includes ./apps/spmv_tb.sv
import_files -fileset sim_1 -norecurse ./apps/spmv_tb.sv

#Adding top level spmv ip wrapper
add_files -norecurse -scan_for_includes ./apps/spmv.v
import_files -norecurse ./apps/spmv.v


add_files -norecurse -scan_for_includes ./apps/spmv_bd.v
import_files -norecurse ./apps/spmv_bd.v

set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-mode out_of_context} -objects [get_runs synth_1]


#Adding NoC
add_files -norecurse -scan_for_includes {./noc/src/noc_wrapper.v ./noc/src/noc_bft_v2.v ./noc/src/switch_bft.v ./noc/src/split_bft.v ./noc/src/merge.v ./noc/src/EB.v ./noc/src/HBEB.v ./noc/src/eb_srl.v}
import_files -norecurse {./noc/src/noc_wrapper.v ./noc/src/noc_bft_v2.v ./noc/src/switch_bft.v ./noc/src/split_bft.v ./noc/src/merge.v ./noc/src/EB.v ./noc/src/HBEB.v ./noc/src/eb_srl.v}

#Adding MON
add_files -norecurse -scan_for_includes {./ip/xilinx_com_hls_monitor_1_0/hdl/verilog/monitor.v ./ip/xilinx_com_hls_monitor_1_0/hdl/verilog/regslice_core.v}
import_files -norecurse {./ip/xilinx_com_hls_monitor_1_0/hdl/verilog/monitor.v ./ip/xilinx_com_hls_monitor_1_0/hdl/verilog/regslice_core.v}

#Adding BVB
add_files -norecurse -scan_for_includes {./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load_fmul_32ns_32ns_32_6_max_dsp_1.v ./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load.v ./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load_bvb.v}
import_files -norecurse {./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load_fmul_32ns_32ns_32_6_max_dsp_1.v ./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load.v ./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load_bvb.v}
add_files -norecurse -scan_for_includes ./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load_bvb_ram.dat
import_files -force -norecurse ./ip/xilinx_com_hls_BVB_load_1_0/hdl/verilog/BVB_load_bvb_ram.dat

#Adding FP32 MUL IP core
create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name BVB_load_ap_fmul_4_max_dsp_32
set_property -dict [list CONFIG.Has_ACLKEN {true} CONFIG.Operation_Type {Multiply} CONFIG.C_Mult_Usage {Max_Usage} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {4} CONFIG.A_Precision_Type {Single} CONFIG.C_A_Exponent_Width {8} CONFIG.C_A_Fraction_Width {24} CONFIG.Result_Precision_Type {Single} CONFIG.C_Result_Exponent_Width {8} CONFIG.C_Result_Fraction_Width {24} CONFIG.Has_RESULT_TREADY {false} CONFIG.C_Rate {1}] [get_ips BVB_load_ap_fmul_4_max_dsp_32]
set_property generate_synth_checkpoint false [get_files BVB_load_ap_fmul_4_max_dsp_32.xci]
generate_target {synthesis simulation} [get_files BVB_load_ap_fmul_4_max_dsp_32.xci]

#Adding ACC
add_files -norecurse -scan_for_includes {./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/ACC.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/copy.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/regslice_core.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/process_r_bvb.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/fifo_w32_d512_A.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/process_r.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/ACC_fadd_32ns_32ns_32_10_full_dsp_1.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/start_for_copy_U0.v}
import_files -force -norecurse {./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/ACC.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/copy.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/regslice_core.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/process_r_bvb.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/fifo_w32_d512_A.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/process_r.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/ACC_fadd_32ns_32ns_32_10_full_dsp_1.v ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/start_for_copy_U0.v}
add_files -norecurse -scan_for_includes ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/process_r_bvb_ram.dat
import_files -force -norecurse ./ip/xilinx_com_hls_ACC_1_0/hdl/verilog/process_r_bvb_ram.dat

create_ip -name floating_point -vendor xilinx.com -library ip -version 7.1 -module_name ACC_ap_fadd_8_full_dsp_32
set_property -dict [list CONFIG.Component_Name {ACC_ap_fadd_8_full_dsp_32} CONFIG.Add_Sub_Value {Add} CONFIG.Flow_Control {NonBlocking} CONFIG.Maximum_Latency {false} CONFIG.C_Latency {8} CONFIG.Has_ACLKEN {true} CONFIG.Has_RESULT_TREADY {false}] [get_ips ACC_ap_fadd_8_full_dsp_32]
set_property generate_synth_checkpoint false [get_files ACC_ap_fadd_8_full_dsp_32.xci]
generate_target {synthesis simulation} [get_files ACC_ap_fadd_8_full_dsp_32.xci]


#Adding HRB
add_files -norecurse -scan_for_includes {./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/hrb.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/start_for_hrb_U0.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/copy1.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/kernel.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/fifo_w48_d32_A.v}
import_files -norecurse {./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/hrb.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/start_for_hrb_U0.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/copy1.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/kernel.v ./ip/xilinx_com_hls_kernel_1_0/hdl/verilog/fifo_w48_d32_A.v}

#Adding LSA
add_files -norecurse -scan_for_includes {./ip/xilinx_com_hls_example_1_0/hdl/verilog/example_gmem1_m_axi.v ./ip/xilinx_com_hls_example_1_0/hdl/verilog/example_gmem0_m_axi.v ./ip/xilinx_com_hls_example_1_0/hdl/verilog/example.v ./ip/xilinx_com_hls_example_1_0/hdl/verilog/example_control_s_axi.v}


#Adding splitters for matrix streams and naming them 0 and 5
create_ip -name axis_broadcaster -vendor xilinx.com -library ip -version 1.1 -module_name axis_broadcaster_0_mat
set_property -dict [list CONFIG.NUM_MI {4} CONFIG.M_TDATA_NUM_BYTES {8} CONFIG.S_TDATA_NUM_BYTES {32} CONFIG.M00_TDATA_REMAP {tdata[63:0]} CONFIG.M01_TDATA_REMAP {tdata[127:64]} CONFIG.M02_TDATA_REMAP {tdata[191:128]} CONFIG.M03_TDATA_REMAP {tdata[255:192]} CONFIG.Component_Name {axis_broadcaster_0_mat}] [get_ips axis_broadcaster_0_mat]
set_property generate_synth_checkpoint false [get_files axis_broadcaster_0_mat.xci]
generate_target {synthesis simulation} [get_files axis_broadcaster_0_mat.xci]

#Adding splitter for vector streams and naming it 1
create_ip -name axis_broadcaster -vendor xilinx.com -library ip -version 1.1 -module_name axis_broadcaster_1_vec
set_property -dict [list CONFIG.NUM_MI {8} CONFIG.M_TDATA_NUM_BYTES {4} CONFIG.S_TDATA_NUM_BYTES {32} CONFIG.M00_TDATA_REMAP {tdata[31:0]} CONFIG.M01_TDATA_REMAP {tdata[63:32]} CONFIG.M02_TDATA_REMAP {tdata[95:64]} CONFIG.M03_TDATA_REMAP {tdata[127:96]} CONFIG.M04_TDATA_REMAP {tdata[159:128]} CONFIG.M05_TDATA_REMAP {tdata[191:160]} CONFIG.M06_TDATA_REMAP {tdata[223:192]} CONFIG.M07_TDATA_REMAP {tdata[255:224]}] [get_ips axis_broadcaster_1_vec]
set_property generate_synth_checkpoint false [get_files axis_broadcaster_1_vec.xci]
generate_target {synthesis simulation} [get_files axis_broadcaster_1_vec.xci]

#Adding broad and naming them 0 and 5
create_ip -name axis_broadcaster -vendor xilinx.com -library ip -version 1.1 -module_name axis_broadcaster_2_token
set_property -dict [list CONFIG.NUM_MI {8} CONFIG.M_TDATA_NUM_BYTES {4} CONFIG.S_TDATA_NUM_BYTES {4} CONFIG.M00_TDATA_REMAP {tdata[31:0]} CONFIG.M01_TDATA_REMAP {tdata[31:0]} CONFIG.M02_TDATA_REMAP {tdata[31:0]} CONFIG.M03_TDATA_REMAP {tdata[31:0]} CONFIG.M04_TDATA_REMAP {tdata[31:0]} CONFIG.M05_TDATA_REMAP {tdata[31:0]} CONFIG.M06_TDATA_REMAP {tdata[31:0]} CONFIG.M07_TDATA_REMAP {tdata[31:0]}] [get_ips axis_broadcaster_2_token]
set_property generate_synth_checkpoint false [get_files axis_broadcaster_2_token.xci]
generate_target {synthesis simulation} [get_files axis_broadcaster_2_token.xci]

set_property top spmv [current_fileset]
update_compile_order -fileset sources_1

create_ip -name axi_vip -vendor xilinx.com -library ip -version 1.1 -module_name control_spmv_vip
set_property -dict [list CONFIG.Component_Name {control_spmv_vip} CONFIG.PROTOCOL {AXI4LITE} CONFIG.INTERFACE_MODE {MASTER} CONFIG.ADDR_WIDTH {12} CONFIG.SUPPORTS_NARROW {0} CONFIG.HAS_BURST {0} CONFIG.HAS_LOCK {0} CONFIG.HAS_CACHE {0} CONFIG.HAS_REGION {0} CONFIG.HAS_QOS {0} CONFIG.HAS_PROT {0}] [get_ips control_spmv_vip]
set_property generate_synth_checkpoint false [get_files control_spmv_vip.xci]
generate_target {simulation} [get_files control_spmv_vip.xci]


create_ip -name axi_vip -vendor xilinx.com -library ip -version 1.1 -module_name slv_m00_axi_vip
set_property -dict [list CONFIG.Component_Name {slv_m00_axi_vip} CONFIG.INTERFACE_MODE {SLAVE} CONFIG.ADDR_WIDTH {64} CONFIG.DATA_WIDTH {256} CONFIG.SUPPORTS_NARROW {0} CONFIG.HAS_BURST {0} CONFIG.HAS_LOCK {0} CONFIG.HAS_CACHE {0} CONFIG.HAS_REGION {0} CONFIG.HAS_QOS {0} CONFIG.HAS_PROT {0} CONFIG.HAS_WSTRB {1} CONFIG.HAS_BRESP {0} CONFIG.HAS_RRESP {0}] [get_ips slv_m00_axi_vip]
set_property generate_synth_checkpoint false [get_files slv_m00_axi_vip.xci]
generate_target {simulation} [get_files slv_m00_axi_vip.xci]


create_ip -name axi_vip -vendor xilinx.com -library ip -version 1.1 -module_name slv_m01_axi_vip
set_property -dict [list CONFIG.Component_Name {slv_m01_axi_vip} CONFIG.INTERFACE_MODE {SLAVE} CONFIG.ADDR_WIDTH {64} CONFIG.DATA_WIDTH {256} CONFIG.SUPPORTS_NARROW {0} CONFIG.HAS_BURST {0} CONFIG.HAS_LOCK {0} CONFIG.HAS_CACHE {0} CONFIG.HAS_REGION {0} CONFIG.HAS_QOS {0} CONFIG.HAS_PROT {0} CONFIG.HAS_WSTRB {1} CONFIG.HAS_BRESP {0} CONFIG.HAS_RRESP {0}] [get_ips slv_m01_axi_vip]
set_property generate_synth_checkpoint false [get_files slv_m01_axi_vip.xci]
generate_target {simulation} [get_files slv_m01_axi_vip.xci]

add_files -fileset sim_1 -norecurse -scan_for_includes ./apps/d64.dat
import_files -fileset sim_1 -norecurse ./apps/d64.dat

set_property top spmv_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

launch_simulation
source ./project_2/project_2.sim/sim_1/behav/xsim/spmv_tb.tcl
run all


#launch_runs synth_1 -jobs 8
#wait_on_run synth_1

