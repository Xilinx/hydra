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

#include "engine.h"
#include <iostream>
using namespace hls;
using namespace std;


void BVB_load(stream<DT> &stream_vec, stream<nz> &stream_data_in, stream<nz> &stream_data_out)
{
#pragma HLS INTERFACE axis register both port=stream_vec
#pragma HLS INTERFACE axis register both port=stream_data_in
#pragma HLS DATA_PACK variable=stream_data_in
#pragma HLS INTERFACE axis register both port=stream_data_out
#pragma HLS DATA_PACK variable=stream_data_out
#pragma HLS INTERFACE ap_ctrl_none port=return

    static float bvb[vec_size] = {0};
#pragma HLS ARRAY_RESHAPE variable=bvb cyclic factor=2 dim=1
#pragma HLS RESOURCE variable=bvb core=RAM_2P_URAM
    static int k = 0;
    float prod;
    nz t1, t3;
    ap_uint<bvb_addr> col;

    #pragma HLS PIPELINE II=1 enable_flush
    if(!stream_vec.empty()){
    	bvb[k] = stream_vec.read();
    	k = k+1;
    }else if(!stream_data_in.empty()){
        k = 0;
    	t1 = stream_data_in.read();
    	col = t1.c.range(index_size-1,3);
    	prod = bvb[col] * t1.v;
    	t3.c = t1.c;	t3.r = t1.r; t3.v = prod;
    	stream_data_out.write(t3);
    }
}


		






	
	



