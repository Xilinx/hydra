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
	stream<TT> token;
	DT result;

	ap_uint<16> j;
	
	
	for(j=0;j<8192;j++){
		nz nz1;
		nz1.v = (float)j;
		//nz1.c = j;
		nz1.r = 8*j;
		stream_data_in.write(nz1);
		ACC(token, stream_data_in, stream_vec);
		//result = stream_data_out.read();
		//cout << "output = " << result.v << " " <<  result.r << " " << result.c << endl;
	}
	
	TT command;
	command = vec_len*2;
	command = command + 1;
	token.write(command);

	//for(j=0;j<8;j++){

	for(j=0;j<vec_len;j++){
		ACC(token, stream_data_in, stream_vec);
	}

	if(!stream_vec.empty()){
		while(!stream_vec.empty()){
			result = stream_vec.read();
			cout << "output = " << result << endl;
		}
	}

	cout<<"----program complete----"<<endl;
	return 0;
}
