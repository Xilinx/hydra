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

//Number of HBM Banks required
#define MAX_HBM_BANKCOUNT 24
#define BANK_NAME(n) n | XCL_MEM_TOPOLOGY
const int bank_assign[MAX_HBM_BANKCOUNT] = {
    BANK_NAME(0),  BANK_NAME(1),  BANK_NAME(2),  BANK_NAME(3),  BANK_NAME(4),
    BANK_NAME(5),  BANK_NAME(6),  BANK_NAME(7),  BANK_NAME(8),  BANK_NAME(9),
    BANK_NAME(10), BANK_NAME(11), BANK_NAME(16), BANK_NAME(17), BANK_NAME(18), 
    BANK_NAME(19), BANK_NAME(20), BANK_NAME(21), BANK_NAME(22), BANK_NAME(23), 
    BANK_NAME(24), BANK_NAME(25), BANK_NAME(26), BANK_NAME(27)};


              

//___________________________________________________________________ TRANSFERING INPUTS ___________________________________________________________________
void transfer_inputs(unsigned int it, cl::CommandQueue& q, unsigned int N_KERNELS, unsigned int vlen, unsigned int N_INPUTS,
                     cl_int &err,
                     cl::Context &context,
                     std::vector<std::vector<float, aligned_allocator<float>>> &x,
                     std::vector<cl::Buffer> &vec,
                     std::vector<cl_mem_ext_ptr_t> &vec_pointer){
    std::vector<cl::Memory> vec_mem;   
    for(unsigned int i = 0; i<N_KERNELS; i++){
      vec_pointer[i].obj = x[it*N_KERNELS+i].data(); vec_pointer[i].param = 0; vec_pointer[i].flags = bank_assign[2*i+1];
      vec[i] = cl::Buffer(context, CL_MEM_READ_WRITE |CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR, sizeof(uint32_t) *vlen*(N_INPUTS/N_KERNELS), &vec_pointer[i], &err);
      vec_mem.push_back(vec[i]);
      //vec_mem[i] = vec[i];
      //std::this_thread::sleep_for(std::chrono::nanoseconds(1000));
    }
    q.enqueueMigrateMemObjects(vec_mem, 0 /* 0 means from host*/);
    q.finish();
    
}
        
//____________________________________________________________________ TRANSFERRING OUTPUTS ____________________________________________________________________
void transfer_outputs(unsigned int it, cl::CommandQueue& q, unsigned int N_KERNELS, std::vector<cl::Buffer> &vec){    
    
    std::vector<cl::Memory> vec_mem;
    for(unsigned int i=0; i<N_KERNELS; i++){
            vec_mem.push_back(vec[i]);
    }
    q.enqueueMigrateMemObjects(vec_mem, CL_MIGRATE_MEM_OBJECT_HOST );
    
    q.finish();
    //q.enqueueReleaseGLObjects(&vec_mem, NULL, NULL);
    //q.finish();
}

//____________________________________________________________________ TRANSFERRING MATRICES ____________________________________________________________________
void transfer_matrices(unsigned int it, cl::CommandQueue& q,  unsigned int N_KERNELS,  unsigned int NUM_LAYERS, unsigned int nnz,
                       cl_int &err,
                       cl::Context &context,
                       std::vector<std::vector<cl::Buffer>> &mat0,
                       std::vector<std::vector<cl::Buffer>> &mat1, 
                       std::vector<std::vector<cl_mem_ext_ptr_t>> &mat0_pointer,
                       std::vector<std::vector<cl_mem_ext_ptr_t>> &mat1_pointer,
                       std::vector<std::vector<unsigned int, aligned_allocator<unsigned int>>> &matrix0,
                       std::vector<std::vector<unsigned int, aligned_allocator<unsigned int>>> &matrix1){
    std::vector<cl::Memory> mat_mem;
    for(unsigned int i=0; i<NUM_LAYERS; i++){
        for(unsigned int j=0; j<N_KERNELS; j++){
            mat0_pointer[j][i].obj = matrix0[it*NUM_LAYERS+i].data(); mat0_pointer[j][i].param = 0; mat0_pointer[j][i].flags = bank_assign[2*j];
            mat1_pointer[j][i].obj = matrix1[it*NUM_LAYERS+i].data(); mat1_pointer[j][i].param = 0; mat1_pointer[j][i].flags = bank_assign[2*j+1];
            
            mat0[j][i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR, sizeof(uint32_t) * nnz, &mat0_pointer[j][i], &err);
            mat1[j][i] = cl::Buffer(context, CL_MEM_READ_ONLY | CL_MEM_EXT_PTR_XILINX | CL_MEM_USE_HOST_PTR, sizeof(uint32_t) * nnz, &mat1_pointer[j][i], &err);
            mat_mem.push_back(mat0[j][i]);
            mat_mem.push_back(mat1[j][i]);
            //mat_mem[i*N_KERNELS+j] = mat0[j][i];
            //mat_mem[NUM_LAYERS*N_KERNELS+i*N_KERNELS+j] = mat1[j][i];        
        }
    }
    q.enqueueMigrateMemObjects(mat_mem,0 /* 0 means from host*/);
    q.finish();
}

//_________________________________________________________________________ KERNEL FUNCTION _______________________________________________________________________
void launch_kernel(unsigned int kernel_number, cl::CommandQueue& q, unsigned int NUM_LAYERS,
                   std::vector<std::vector<cl::Buffer>> &mat0,
                   std::vector<std::vector<cl::Buffer>> &mat1,
                   std::vector<cl::Buffer>              &vec,
                   std::vector<cl::Kernel>              &kernel){
    //std::cout << "starting launch_kernel Function" << std::endl;
    for(unsigned int j=0; j<NUM_LAYERS; j++){                              //NUM_LAYERS  = 40 for 16k neuron (120/ITER_LAYERS)      
        //std::cout << "        setting layer arg " << j << std::endl;
        (kernel[kernel_number]).setArg(3, mat0[kernel_number][j]);
        (kernel[kernel_number]).setArg(4, mat1[kernel_number][j]);
        (kernel[kernel_number]).setArg(5, vec[kernel_number]);
        (kernel[kernel_number]).setArg(6, vec[kernel_number]);
        q.enqueueTask(kernel[kernel_number]);
        q.finish();
    }
}
