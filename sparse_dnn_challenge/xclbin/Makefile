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

# platform options: 
# xilinx_u280_xdma_201920_3_
#
# kernel frequency options: 
# 500
#
# hls clock options:
# 2
#
# part options (choose based on platform option):
# xcu280-fsvh2892-2L-e
# 
platform ?= xilinx_u280_xdma_201920_3  
part ?= xcu280-fsvh2892-2L-e
kernel_frequency ?= 500
hls_clock ?= 2.00 
tool_version ?= 2020.1_released

.PHONY: help all hls ip xo xclbin clean 

ROOT_DIR := $(shell readlink -f .)

help:
	@echo
	@echo "usage: make all"
	@echo

all:
	make hls
	make ip
	make xo
	make xclbin

xo:
	vivado -mode batch -source tcl/gen_base.tcl -tclargs $(platform) $(ROOT_DIR)
	cp spmv_ex/exports/spmv.xo ./

xclbin:	
	v++ -l -t hw -R2 --kernel_frequency 500 --config ./u280.cfg ./spmv.xo -o spmv.xclbin

hls:
	mkdir hls_build
	mkdir hls_build/bvb; cd hls_build/bvb; vivado_hls -f ../../tcl/hls_syn.tcl bvb ../../hls/bvb/bvb.cc $(part) $(hls_clock) BVB_load ip_catalog
	mkdir hls_build/acc; cd hls_build/acc; vivado_hls -f ../../tcl/hls_syn.tcl acc ../../hls/acc/acc.cc $(part) $(hls_clock) ACC ip_catalog
	mkdir hls_build/hrb; cd hls_build/hrb; vivado_hls -f ../../tcl/hls_syn.tcl hrb ../../hls/hrb/hrb.cc $(part) $(hls_clock) HRB ip_catalog
	mkdir hls_build/lsa; cd hls_build/lsa; vivado_hls -f ../../tcl/hls_syn.tcl lsa ../../hls/lsa/lsa.cc $(part) $(hls_clock) LSA ip_catalog
	mkdir hls_build/monitor; cd hls_build/monitor; vivado_hls -f ../../tcl/hls_syn.tcl monitor ../../hls/monitor/monitor.cc $(part) $(hls_clock) monitor ip_catalog

ip:
	mkdir ip
	unzip hls_build/bvb/bvb/sol1/impl/ip/xilinx_com_hls_BVB_load_1_0.zip -d ip/xilinx_com_hls_BVB_load_1_0
	unzip hls_build/acc/acc/sol1/impl/ip/xilinx_com_hls_ACC_1_0.zip -d ip/xilinx_com_hls_ACC_1_0
	unzip hls_build/hrb/hrb/sol1/impl/ip/xilinx_com_hls_HRB_1_0.zip -d ip/xilinx_com_hls_HRB_1_0
	unzip hls_build/lsa/lsa/sol1/impl/ip/xilinx_com_hls_LSA_1_0.zip -d ip/xilinx_com_hls_LSA_1_0
	unzip hls_build/monitor/monitor/sol1/impl/ip/xilinx_com_hls_monitor_1_0.zip -d ip/xilinx_com_hls_monitor_1_0

clean:
	rm -rf p* s* v* 
	#rm -rf p* s* v* hls_build ip
