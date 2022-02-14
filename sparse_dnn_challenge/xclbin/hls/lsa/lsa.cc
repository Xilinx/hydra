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

#include "lsa.h"
#include <iostream>
using namespace hls;
using namespace std;

#include <math.h>


void LSA(int nnz_expct,int mat_size, int vec_size, wide_mat_dt *matrix0, wide_mat_dt *matrix1, wide_vec_dt *x, wide_vec_dt *y, stream_wide_mat_dt &stream_wide_mat0, stream_wide_mat_dt &stream_wide_mat1, stream_wide_vec_dt &stream_wide_x, stream_token_dt &stream_token, stream_wide_vec_dt &stream_wide_y, stream_token_dt &stream_mon_send, stream_token_dt &stream_mon_recv)
{
#pragma HLS INTERFACE m_axi port=matrix0 offset=slave bundle=gmem0 num_read_outstanding=8 max_read_burst_length=16 depth=256
#pragma HLS INTERFACE m_axi port=matrix1 offset=slave bundle=gmem1 num_read_outstanding=8 max_read_burst_length=16 depth=256
#pragma HLS INTERFACE m_axi port=x offset=slave bundle=gmem1 num_read_outstanding=8 max_read_burst_length=16 depth=256
#pragma HLS INTERFACE m_axi port=y offset=slave bundle=gmem1 num_read_outstanding=8 max_read_burst_length=16 depth=256

#pragma HLS INTERFACE axis register both port=stream_wide_mat0
#pragma HLS INTERFACE axis register both port=stream_wide_mat1
#pragma HLS INTERFACE axis register both port=stream_wide_x
#pragma HLS INTERFACE axis register both port=stream_token
#pragma HLS INTERFACE axis register both port=stream_wide_y
#pragma HLS INTERFACE axis register both port=stream_mon_send
#pragma HLS INTERFACE axis register both port=stream_mon_recv
#pragma HLS STREAM variable=stream_wide_y depth=1024

#pragma HLS INTERFACE s_axilite port=matrix0 bundle=control
#pragma HLS INTERFACE s_axilite port=matrix1 bundle=control
#pragma HLS INTERFACE s_axilite port=x bundle=control
#pragma HLS INTERFACE s_axilite port=y bundle=control
#pragma HLS INTERFACE s_axilite port=nnz_expct bundle=control
#pragma HLS INTERFACE s_axilite port=mat_size bundle=control
#pragma HLS INTERFACE s_axilite port=vec_size bundle=control
#pragma HLS interface s_axilite port=return bundle=control

    int iter = nnz_expct;
    int nnz_sets = mat_size/8;
    int vec_sets = vec_size/8;
    token_dt nnz = mat_size; //(token_dt)nnz_expct;

    int vec_base = 0;
    int vec_high = vec_sets;


    for(int j=0;j<iter;j++){
	wide_vec_dt temp_x;
//	int nnz_sets = mat_size/8;
//	int vec_sets = vec_size/8;
//	token_dt nnz = mat_size; //(token_dt)nnz_expct;

        //int vec_base = j*vec_sets;
	//int vec_high = (j+1)*vec_sets;
	for(int i = 0; i < vec_sets; i++) {
	//for(int i = vec_base; i < vec_high; i++) {
	#pragma HLS PIPELINE II=1
		temp_x = x[i+vec_base];
		//temp_x = x[i];
	        stream_wide_x.write(temp_x);
	}

	stream_mon_send.write(nnz);


	wide_mat_dt temp0, temp1;
	for(int i = 0; i < nnz_sets; i++) {
	#pragma HLS PIPELINE II=1
		temp0 = matrix0[i];
		temp1 = matrix1[i];
		stream_wide_mat0.write(temp0);
		stream_wide_mat1.write(temp1);
	}


	token_dt recv_nnz;
	while(stream_mon_recv.empty());
	recv_nnz = stream_mon_recv.read();

	token_dt token = (vec_size/4) + 1;   //(vec_size/width)*2 + 1;  LSB is go bit and rest are for bank length
	stream_token.write(token);

	wide_vec_dt temp_y;
	for(int i = 0; i < vec_sets; i++) {
	//for(int i = vec_base; i < vec_high; i++) {
	#pragma HLS PIPELINE II=1
	   	temp_y = stream_wide_y.read();
	   	y[i+vec_base] = temp_y;
	   	//y[i] = temp_y;
	}

	vec_base = vec_base + vec_sets;
	vec_high = vec_high + vec_sets;
   }	
}


