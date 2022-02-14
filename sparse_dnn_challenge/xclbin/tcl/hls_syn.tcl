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

# start reading args from index 2 since vivado HLS also passes -f tclname here
set config_proj_name      [lindex $::argv 2]
set config_hwsrc          [lindex $::argv 3]
set config_proj_part      [lindex $::argv 4]
set config_clkperiod      [lindex $::argv 5]
set config_toplevelfxn    [lindex $::argv 6]

puts "HLS project: $config_proj_name"
puts "HW source file: $config_hwsrc"
puts "Part: $config_proj_part"
puts "Clock period: $config_clkperiod ns"
puts "Top level function name: $config_toplevelfxn"

# set up project
open_project $config_proj_name
add_files $config_hwsrc -cflags "-std=c++0x"
set_top $config_toplevelfxn
open_solution sol1
set_part $config_proj_part
config_compile -name_max_length 300

# use 64-bit AXI MM addresses
config_interface -m_axi_addr64

# optionally prefix the RTL generated function names
if {$argc > 8} {
    set config_prefix [lindex $::argv 8]
    puts "Prefixing RTL function names with: $config_prefix"
    config_rtl -prefix "$config_prefix"
}

# synthesize
create_clock -period $config_clkperiod -name default
csynth_design

# optionally export the IP in the desired format
if {$argc > 7} {
    set config_ip_format [lindex $::argv 7]
    puts "Exporting IP in format: $config_ip_format"
    export_design -format $config_ip_format
}

exit 0
