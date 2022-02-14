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

#include <stdint.h>
#include <cstdlib>
#include <ap_int.h>
#include <hls_stream.h>
using namespace hls;

#define mat_size_val 512 
#define vec_size_val 64 

#define wide_mat_bits 256 
#define wide_vec_bits 256
#define token_bits 32

typedef ap_uint<wide_mat_bits> wide_mat_dt;
typedef ap_uint<wide_vec_bits> wide_vec_dt;
typedef stream<wide_mat_dt> stream_wide_mat_dt;
typedef stream<wide_vec_dt> stream_wide_vec_dt;

typedef ap_uint<token_bits> token_dt;
typedef stream<token_dt> stream_token_dt;

void LSA(int nnz_expct, int mat_size, int vec_size, wide_mat_dt *matrix0, wide_mat_dt *matrix1, wide_vec_dt *x,  wide_vec_dt *y, stream_wide_mat_dt &stream_wide_mat0, stream_wide_mat_dt &stream_wide_mat1, stream_wide_vec_dt &stream_wide_x, stream_token_dt &stream_token, stream_wide_vec_dt &stream_wide_y, stream_token_dt &stream_mon_send, stream_token_dt &stream_mon_recv);

