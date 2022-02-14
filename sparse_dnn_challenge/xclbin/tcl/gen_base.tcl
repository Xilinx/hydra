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

set platform [lindex $::argv 0] 
set ROOT_DIR [lindex $::argv 1]


if {[file exists "spmv_ex"]} {
    file delete -force "spmv_ex"
}
if {[file exists "project_1"]} {
    file delete -force "project_1"
}

create_project project_1 project_1 -part xcu280-fsvh2892-2L-e 
create_ip -name rtl_kernel_wizard -vendor xilinx.com -library ip -version 1.0 -module_name spmv

set_param project.enableRTLKernelBD true
set_param project.enableRTLKernelReference true

set_property -dict [list CONFIG.KERNEL_TYPE {Block_Design} CONFIG.NUM_RESETS {1} CONFIG.NUM_INPUT_ARGS {3} CONFIG.ARG00_NAME {nnz_expct} CONFIG.ARG00_TYPE {int} CONFIG.ARG01_NAME {mat_size} CONFIG.ARG01_TYPE {int} CONFIG.ARG02_NAME {vec_size} CONFIG.ARG02_TYPE {int} CONFIG.NUM_M_AXI {2} CONFIG.M00_AXI_ARG00_NAME {matrix0} CONFIG.M00_AXI_DATA_NUM_BYTES {32} CONFIG.M01_AXI_DATA_NUM_BYTES {32} CONFIG.M01_AXI_NUM_ARGS {3} CONFIG.M01_AXI_ARG00_NAME {matrix1} CONFIG.M01_AXI_ARG01_NAME {x} CONFIG.M01_AXI_ARG02_NAME {y}] [get_ips spmv]

generate_target {instantiation_template} [get_files spmv.xci]
set_property generate_synth_checkpoint false [get_files spmv.xci]

open_example_project -force -in_process -dir [pwd] [get_ips spmv]

source ./tcl/spmv_hbm.tcl













