hydra
======================
hydra is an experimental framework from Xilinx Architecture Group to explore domain-specific architectures (targetting FPGA) for sparse linear algebra applications.
Currently, this repository contains tools to design and customize accelerator for sparse matrix vector multiplication (SpMV) targetting HBM-enabled FPGA platform (Alveo U280).
 
## What's New in hydra?

* **2022-02-13:** v0.1 is released, introducing Alveo U280 support and acceleration of sparse deep neural networks (SDNN) from Graph Challenge benchmarks. Read more here [HPEC 2021 paper](https://ieeexplore.ieee.org/document/9622804).


## Getting Started

For downloading SDNN datasets, generation of U280 xclbin and benchmarking, please clone the repo and see the instructions in the README file as follows:

```
git clone https://github.com/xilinx/hydra
cd hydra/sparse_dnn_challenge
cat README

```

## Citation

The current implementation of the framework is based on the following publications. Please consider citing them if you find hydra useful.

    @inproceedings{jain2021sparse,
    title={Sparse Deep Neural Network Acceleration on HBM-Enabled FPGA Platform},
    author={Jain, Abhishek Kumar and Kumar, Sharan and Tripathi, Aashish and Gaitonde, Dinesh},
    booktitle={IEEE High Performance Extreme Computing Conference (HPEC)},
    pages={1--7},
    year={2021},
    organization={IEEE}
    }
    @inproceedings{jain2020domain,
    title={A domain-specific architecture for accelerating sparse matrix vector multiplication on fpgas},
    author={Jain, Abhishek Kumar and Omidian, Hossein and Fraisse, Henri and Benipal, Mansimran and Liu, Lisa and Gaitonde, Dinesh},
    booktitle={30th International conference on field-programmable logic and applications (FPL)},
    pages={127--132},
    year={2020},
    organization={IEEE}
    }

    


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
