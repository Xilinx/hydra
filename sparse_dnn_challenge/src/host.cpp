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

#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fstream>
#include <sstream>
#include <omp.h>
#include <vector>
#include <thread>
#include <algorithm>

#include <CL/cl2.hpp>
#include "SparseMatrix.h"
#include "utility.h"
#include "kernel.h"


int main(int argc, char* argv[]){
    //__________________________________________________________________ AVAILABLE SDNNs __________________________________________________________________________
    //__________ Layers          = ______________120_____________     _____________480_____________     _____________1920_____________
    //__________ select_dnn      =     0,      1,     2,       3,        4,      5,     6,       7,        8,      9,    10,      11
    unsigned int NEURON[]        = {1024, 4*1024, 16384, 64*1024,     1024, 4*1024, 16384, 64*1024,     1024, 4*1024, 16384, 64*1024};
    unsigned int ITER_INPUT[]    = {   1,      1,     4,      20,        1,      1,     4,      20,        1,      4,     8,      20};
    unsigned int ITER_LAYER[]    = {   1,      1,     3,      24,        1,      2,     8,      48,        2,      8,    24,      96};
    unsigned int LAYERS[]        = {120, 480, 1920};                                    
    unsigned int T_INPUTS        = 60000;                                 //MUST be multiple of N_KERNELS * ITER_INPUTS[select_dnn] 
    
    //_____________________________________________________________________ PARAMETERS _________________________________________________________________________
    unsigned int select_dnn    = atoi(argv[2]);
    unsigned int T_LAYERS      = LAYERS[select_dnn/4];
    unsigned int ITER_INPUTS   = ITER_INPUT[select_dnn];
    unsigned int ITER_LAYERS   = ITER_LAYER[select_dnn];
    unsigned int N_INPUTS      = T_INPUTS/ITER_INPUTS;                     //no. of inputs to all kernels in one iteration;
    unsigned int NUM_LAYERS    = T_LAYERS/ITER_LAYERS;                     //no. of layers sent to HBM attached to each kernel in one iteration
    unsigned int vlen          = NEURON[select_dnn];                       //each row has 32 nnz
    unsigned int nnz           = 32*vlen;                                  //each layer matrix nnz
    unsigned int N_KERNELS     = 12;                                       //hardware kernels are 12
    unsigned int N_THREADS     = 12;
    unsigned int N_QUEUES      = 12;
    std::string binaryFile     = argv[1]; 				   //"xclbin/spmv_relu_new.xclbin";
    std::string datasetsPath   = argv[3]; 				   

    
    cl_int err;
    cl::Context context;
    cl::CommandQueue q_io;        
    std::vector<cl::CommandQueue> q(N_QUEUES);
    std::vector<cl::Kernel> kernel(N_KERNELS);
    std::vector<std::thread> th(N_THREADS);

    //____________________________________________________________________ SETTING UP THE DEVICE _________________________________________________________________ 
    std::cout << "___________________________ Starting SpMV API ___________________________" << std::endl;
    std::vector<std::vector<float, aligned_allocator<float>>> x(N_KERNELS*ITER_INPUTS, std::vector<float, aligned_allocator<float>>(vlen*(N_INPUTS/N_KERNELS),0.0));
    std::vector<cl::Buffer> vec(N_KERNELS);
    std::vector<cl_mem_ext_ptr_t> vec_pointer(N_KERNELS);
    
    std::vector<std::vector<cl::Buffer>> mat0(N_KERNELS,std::vector<cl::Buffer>(NUM_LAYERS)), mat1(N_KERNELS,std::vector<cl::Buffer>(NUM_LAYERS));
    std::vector<std::vector<cl_mem_ext_ptr_t>> mat0_pointer(N_KERNELS,std::vector<cl_mem_ext_ptr_t>(NUM_LAYERS)), mat1_pointer(N_KERNELS,std::vector<cl_mem_ext_ptr_t>(NUM_LAYERS));
    std::vector<std::vector<unsigned int, aligned_allocator<unsigned int>>> matrix0(T_LAYERS, std::vector<unsigned int, aligned_allocator<unsigned int>>(nnz,0));
    std::vector<std::vector<unsigned int, aligned_allocator<unsigned int>>> matrix1(T_LAYERS, std::vector<unsigned int, aligned_allocator<unsigned int>>(nnz,0));

   
    //____________________________________________________________________ SETTING UP THE DEVICE _________________________________________________________________ 
    std::cout << "Creating Context..." << std::endl;
    auto devices = get_xilinx_devices();
    unsigned fileBufSize;
    auto fileBuf = read_binary_file(binaryFile, fileBufSize);

    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    int valid_device = 0;
    for (unsigned int i = 0; i < devices.size(); i++) {
        auto device = devices[i];
        // Creating Context and Command Queue for selected Device
        context = cl::Context(device, NULL, NULL, NULL, &err);
        for(unsigned int j=0; j< N_QUEUES; j++){
            q[j] = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE , &err);
        }
        q_io   = cl::CommandQueue(context, device, CL_QUEUE_PROFILING_ENABLE , &err);

        std::cout << "Trying to program device[" << i
                  << "]: " << device.getInfo<CL_DEVICE_NAME>() << std::endl;
        cl::Program program(context, {device}, bins, NULL, &err);
        if (err != CL_SUCCESS) {
            std::cout << "Failed to program device[" << i
                      << "] with xclbin file!\n";
        } else {
            std::cout << "Device[" << i << "]: program successful!\n";
            for(unsigned int j=0; j<N_KERNELS; j++){                                 //........................N_KERNELS
                std::string cu_id = std::to_string((j + 1));
	        std::string krnl_name_full = "spmv:{spmv_" + cu_id + "}";
	        printf("Creating a kernel [%s] for CU(%d)\n", krnl_name_full.c_str(), j + 1);
                kernel[j] = cl::Kernel(program, krnl_name_full.c_str(), &err);
            }
            valid_device++;
            break; // we break because we found a valid device
        }
    }
    if (valid_device == 0) {
        std::cout << "Failed to program any device found, exit!\n";
        exit(EXIT_FAILURE);
    }    
    
    
    //__________________________________________________________________ READING INPUTS _____________________________________________________________
    std::cout << "Reading Inputs Vectors... ";
    {
    SparseMatrix vecs;
    std::string image_path = datasetsPath + "/sparse-images-" + std::to_string(NEURON[select_dnn]) + ".tsv";
    vecs.ReadBuf(image_path, T_INPUTS, ITER_INPUTS, N_KERNELS, vlen, x);
    std::cout << "DONE"  << std::endl;
    }
    //_________________________________________________________________  LAYERS AND MATRICES _____________________________________________________________
    std::cout << "Reading Layer Matrices ..." ;
    
    SparseMatrix A;
    for(unsigned int i=0; i<T_LAYERS; i++){
        
        std::string matrix_path_str = datasetsPath + "/neuron" + std::to_string(NEURON[select_dnn]) + "/n"+ std::to_string(NEURON[select_dnn]) + "-l"; 	
        matrix_path_str += std::to_string(i+1);
        matrix_path_str += ".tsv";	
        A.Read(matrix_path_str);
        
        for (size_t j = 0; j < A.nz; j=j+2) {                                    // cid is [0-15] & rid is [31-16] but store as cid<<16+rid for SDNN (big-endian)
            matrix0[i][j] = (A.J[j/2]<<16) + (A.I[j/2]);                         //J is coloumns I is rows, Coloumn                      
            matrix0[i][j+1] = 0x3d800000; // 0x3f800000 = 1.0, 0x3d800000 = 0.0625
            matrix1[i][j] = (A.J[nnz/2+j/2]<<16) + (A.I[nnz/2+j/2]); 
            matrix1[i][j+1] = 0x3d800000; // 0x3f800000 = 1.0, 0x3d800000 = 0.0625
        }
    }
    std::cout << "DONE"  << std::endl;  
    
    
    //_______________________________________________________________________ KERNEL RUNS _________________________________________________________________________
    std::cout << "Launching "<< N_KERNELS << " Kernels and " << N_THREADS << " threads"<< std::endl;
    
    for(unsigned int k=0; k<N_KERNELS; k++){            
        (kernel[k]).setArg(0, N_INPUTS/N_KERNELS);     //inputs vectors to be processed by one kernel  N_INPUTS/N_KERNELS
        (kernel[k]).setArg(1, nnz);                    //non-zeros per layer
        (kernel[k]).setArg(2, vlen);                   //each vector length
    }
    
    auto kernel_start = std::chrono::high_resolution_clock::now();//ITER_INPUTS
    for(unsigned int input_iter=0; input_iter<ITER_INPUTS; input_iter++){                                  // runs for ITER no .of partitions of input vectors
        std::cout << "running input iteration: " << input_iter+1 << " of "<< ITER_INPUTS << std::endl;
        
        transfer_inputs(input_iter, std::ref(q_io), N_KERNELS, vlen, N_INPUTS, err, context, std::ref(x), std::ref(vec), std::ref(vec_pointer));
        //std::cout << "transferred inputs" << std::endl;

        for(unsigned int layer_iter=0; layer_iter<ITER_LAYERS; layer_iter++){       //ITER_LAYERS                     //runs for ITER no. of parts of layers in that DNN
            std::cout << "    running layer iteration: " << layer_iter+1 << " of "<< ITER_LAYERS << std::endl;
            
            transfer_matrices(layer_iter, std::ref(q_io), N_KERNELS, NUM_LAYERS, nnz, err, context, std::ref(mat0), std::ref(mat1), std::ref(mat0_pointer), std::ref(mat1_pointer), std::ref(matrix0), std::ref(matrix1));
            std::cout << "      transferred matrices" << std::endl;
              
            for(unsigned int t=0; t<N_THREADS; t++){ //N_THREADS
                //std::cout << t << " ";               
                th[t] = std::thread(launch_kernel, t, std::ref(q[t]), NUM_LAYERS, std::ref(mat0), std::ref(mat1), std::ref(vec), std::ref(kernel));   // #threads and #kernels are same, not kernel objects
            }
            std::cout << "        waiting for kernels to finish up...";
            for(unsigned int t=0; t<N_THREADS; t++){                
                th[t].join(); 
            }
            std::cout << "done" << std::endl;
            
            
        }
        
        std::cout << "    transferring outputs...";
        std::this_thread::sleep_for(std::chrono::nanoseconds(1000));
        transfer_outputs(input_iter, std::ref(q_io), N_KERNELS, std::ref(vec));      
        std::cout << "done" << std::endl;  
     } 
     
        
    auto kernel_end = std::chrono::high_resolution_clock::now();
    std::cout << "____ SpMV API DONE_____"  << std::endl;
    std::chrono::duration<double> kernel_time = std::chrono::duration<double>(kernel_end - kernel_start);
    std::cout << "Network used: " << NEURON[select_dnn] << " neurons & "<< T_LAYERS << " layers" << std::endl;
    std::cout << "Input iterations: " << ITER_INPUTS <<  ",  layer iterations: " << ITER_LAYERS << ",  N_THREADS: " << N_THREADS << std::endl;
    std::cout << "Time for " << T_INPUTS << " vectors: " << 1000*kernel_time.count() << "ms" << std::endl;
    
    //_________________________________________________________________WRITE THE OUTPUTS TO A FILE _________________________________________________________
    
    std::ofstream myfile;
    std::ofstream catfile;
    myfile.open("outputs.txt", std::ios::out | std::ios::trunc );    
    catfile.open("categories.txt", std::ios::out | std::ios::trunc );    
    for (unsigned int i=0; i<T_INPUTS; i++){          //T_INPUTS
        for(unsigned int j=0; j<vlen; j++){     //vlen    
            if(x[i%(ITER_INPUTS*N_KERNELS)][(i/(ITER_INPUTS*N_KERNELS))*vlen+j]>=0.00001)    myfile << i+1 << " " << j+1 << " " <<  x[i%(ITER_INPUTS*N_KERNELS)][(i/(ITER_INPUTS*N_KERNELS))*vlen+j] << std::endl;
        }
        if(x[i%(ITER_INPUTS*N_KERNELS)][(i/(ITER_INPUTS*N_KERNELS))*vlen]>=0.00001)        catfile << i+1 << " " << std::endl;
    }
    myfile.close();
    catfile.close();
    std::cout << "Output files written" << std::endl;   

    delete[] fileBuf;    
    return 0;

}



