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

#define vec_len 64

typedef float DT;
typedef ap_uint<32> TT;

struct nz{
	ap_uint<16> r;
	float v;
};

void ACC(stream<TT> &token, stream<nz> &stream_data_in, stream<DT> &stream_vec);
