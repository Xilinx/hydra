SDNN Challenge on Alveo U280
======================

This is an example of OpenCL host application to describe how to use SpMV appliance on Alveo U280 for SDNN challenge.

***KEY CONCEPTS:*** High Bandwidth Memory, Multiple HBM Banks. SDNN Challenge, Inference Engine

***KEYWORDS:*** HBM, XCL_MEM_TOPOLOGY, cl_mem_ext_ptr_t


## PREREQUISITES

* Platform: Xilinx Alveo U280 (xilinx_u280_xdma_201920_3)
* Toolchain: Xilinx Vitis 2020.1


##  DESIGN FILES
Application code is located in the src directory. 
Source to generate accelerator binary files are available in xclbin directory. 
A listing of source files is shown below

```
src/host.cpp
src/kernel.h
src/utility.h
src/SparseMatrix.h

```

## DOWNLOAD DATASET

```
cd data
source dataset_download.sh

```

##  XCLBIN GENERATION

```
cd xclbin
make all

```

##  BENCHMARKING
Once the environment has been configured, the application can be compiled and executed:

```
xbutil reset
make
make run

```

## License

Licensed using the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0).

    Copyright 2019-2021 Xilinx, Inc.
    
    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
    Copyright 2019-2021 Xilinx, Inc.
