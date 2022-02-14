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
#include <math.h>

void monitor(stream<CNTTYPE> &stream_in_nnz_count, stream<nz> stream_in[N] , stream<nz> stream_out[N], stream<CNTTYPE> &stream_out_nnz_count)
{
#pragma HLS INTERFACE axis register both port=stream_in_nnz_count
#pragma HLS INTERFACE axis register both port=stream_out_nnz_count
#pragma HLS INTERFACE axis register both port=stream_in
#pragma HLS DATA_PACK variable=stream_in
#pragma HLS INTERFACE axis register both port=stream_out
#pragma HLS DATA_PACK variable=stream_out
#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS pipeline II = 1

	static CNTTYPE nnz_count = 12071;
	bool current_count[N];
#pragma HLS array_partition variable=current_count complete
	static CNTTYPE current_count_total = 0;

	if(!stream_in_nnz_count.empty()){	nnz_count = stream_in_nnz_count.read();	}

	for(int i=0;i<N;i++){
	#pragma HLS LOOP_TRIPCOUNT min=8 max=8 avg=8
	#pragma HLS UNROLL
		if (!stream_in[i].empty() && !stream_out[i].full()) {
				stream_out[i].write(stream_in[i].read());
				current_count[i] = true;
		}else{
				current_count[i] = false;
		}
	}

	for(int i=0;i<N;i++){
	#pragma HLS LOOP_TRIPCOUNT min=8 max=8 avg=8
	#pragma HLS UNROLL
		current_count_total += (CNTTYPE) current_count[i];
	}

	if(current_count_total >= nnz_count){
		stream_out_nnz_count.write(current_count_total);
		current_count_total = 0;
	}

}




