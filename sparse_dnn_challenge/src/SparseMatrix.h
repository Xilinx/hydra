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

template <typename T> struct aligned_allocator {
  using value_type = T;
  T *allocate(std::size_t num) {
    void *ptr = nullptr;
    if (posix_memalign(&ptr, 4096, num * sizeof(T)))
      throw std::bad_alloc();
    return reinterpret_cast<T *>(ptr);
  }
  void deallocate(T *p, std::size_t num) { free(p); }
};

class SparseMatrix {
    FILE *f;
    public:
    	unsigned int nz;
    	int *I, *J;
        std::vector<float, aligned_allocator<float>> val;
        std::vector<std::tuple<unsigned int, unsigned int, unsigned int>> dat;
        void Read (std::string&);
        void ReadBuf (std::string& , unsigned int , unsigned int , unsigned int, unsigned int, std::vector<std::vector<float, aligned_allocator<float>>>& );
        
};

void SparseMatrix::Read(std::string &tsv_file) {
    std::ifstream inFile(tsv_file); 
    nz = std::count(std::istreambuf_iterator<char>(inFile), std::istreambuf_iterator<char>(), '\n');
    inFile.clear();                 // clear fail and eof bits
    inFile.seekg(0, std::ios::beg);
    
    double v;
    unsigned int rid, cid;
    
    I = (int *) malloc(nz * sizeof(int));
    J = (int *) malloc(nz * sizeof(int));
    val.resize(nz);
    
    for (unsigned int i=0; i<nz; i++)
    {
        inFile >> rid >> cid >> v;

        val[i] =  (float) v; 
        rid--;
        cid--;
        I[i] = rid;
        J[i] = cid;
    }
    
    inFile.close();
}


void SparseMatrix::ReadBuf(std::string &tsv_file, unsigned int N_ROWS, unsigned int ITER_INPUTS, unsigned int N_KERNELS, unsigned int vlen, std::vector<std::vector<float, aligned_allocator<float>>> &matrix ) {
   
    std::ifstream inFile(tsv_file); 
    nz = std::count(std::istreambuf_iterator<char>(inFile), std::istreambuf_iterator<char>(), '\n');
    inFile.clear();                 // clear fail and eof bits
    inFile.seekg(0, std::ios::beg);
    
    I = (int *) malloc(nz * sizeof(int));
    J = (int *) malloc(nz * sizeof(int));
    val.resize(nz);
    double v;
    unsigned int rid, cid;
    
    for (unsigned int i=0; i<nz; i++)
    {
        inFile >> rid >> cid >> v;

        val[i] =  (float) v; 
        rid--;
        cid--;
        I[i] = rid;
        J[i] = cid;
        if(rid < N_ROWS) matrix[rid%(ITER_INPUTS*N_KERNELS)][((rid/(ITER_INPUTS*N_KERNELS))*vlen)+cid] = (float) v;    //fill all buffers simultaneously
    }
        
    inFile.close();

}

