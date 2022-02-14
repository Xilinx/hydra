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

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include "engine.h"

using namespace hls;
using namespace std;

int main(int argc, char** argv){
	stream<nz> stream_data_in;
	stream<DT> stream_vec;
	stream<nz> stream_data_out;
	nz result;

	ap_uint<16> j;
	
	for(j=0;j<8;j++){
		stream_vec.write((float)j);
		BVB_load(stream_vec, stream_data_in, stream_data_out);
	}


	for(j=0;j<8;j++){
		nz nz1;
		nz1.v = (float)j; nz1.c = 8*j; nz1.r = 0;
		stream_data_in.write(nz1);
		BVB_load(stream_vec, stream_data_in, stream_data_out);
		result = stream_data_out.read();
		cout << "output = " << result.v << " " <<  result.r << " " << result.c << endl;
	}
	
	cout<<"----program complete----"<<endl;
	return 0;
}
