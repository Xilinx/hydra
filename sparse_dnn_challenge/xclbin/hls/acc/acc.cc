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


	
void process(stream<TT> &token, stream<nz> &stream_data_in, stream<DT> &stream_vec)
{
/*
#pragma HLS INTERFACE axis register both port=stream_vec
#pragma HLS INTERFACE axis register both port=stream_data_in
#pragma HLS DATA_PACK variable=stream_data_in
#pragma HLS INTERFACE axis register both port=token
#pragma HLS INTERFACE ap_ctrl_none port=return
*/

	//static float bvb[8192] = {0};
	//#pragma HLS DEPENDENCE variable=bvb array inter false
	//#pragma HLS ARRAY_RESHAPE variable=bvb cyclic factor=2 dim=1
	//#pragma HLS RESOURCE variable=bvb core=RAM_2P_BRAM
	    //static int k = 0;
	    //float prod;
	    nz t1, t3;

	    ap_uint<13> row;
	    static float relu_in, relu_out;
	    static float b1 = -0.3;
	    static float b2 = -0.35;
	    static float b3 = -0.4;
	    static float b4 = -0.45;
	    //static TT store = 0;

	    //#pragma HLS PIPELINE II=1 enable_flush

     	static float bvb[8192] = {0};
#pragma HLS RESOURCE variable=bvb core=RAM_2P_URAM
#pragma HLS DEPENDENCE variable=bvb array inter false


		static TT store = 0;
		static bool go = false;
		static TT len = 0;
		static int k = 0;
		float bias = 0.0;
		if(!token.empty()){
			store = token.read();
			go = store.range(0,0);
			len = store.range(31,1);
			//bias = -0.3;
			//if (len==512) bias = -0.35;
			//if (len==2048) bias = -0.4;
			//if (len==8192) bias = -0.45;
		}

//#pragma HLS dataflow
#pragma HLS PIPELINE II=1 enable_flush
		if(go == 1){
			//if(!stream_vec.full()){
			if(k<=len){
				//relu_in = bvb[k] - 0.3;
				//if(relu_in <= 0){ 		relu_out = 0; }
				//if(relu_in >= 32){ 		relu_out = 32;}	
				//if(relu_in > 0 & relu_in < 32){	relu_out = relu_in;}
				//stream_vec.write(relu_in);

				stream_vec.write(bvb[k]);
				bvb[k] = 0;
				k = k+1;
				/*if(stream_vec.write_nb(bvb[k])){ //p2(stream_vec);
					k = k+1;
					cout << k << endl;
				}*/
			}else{
				go = 0;
				k=0;
			}
			//}
		}else{
			t1 = stream_data_in.read();
			//col = t1.c;
			row = t1.r.range(15,3);
			bvb[row] = bvb[row] + t1.v;
			//p1(stream_data_in);
		}




	 
 
}

void relu(stream<DT> &ins, stream<DT> &outs) {
#pragma HLS PIPELINE II=1 enable_flush
	DT relu_in, relu_out;
	if (!ins.empty()) {
		relu_in = ins.read() - 0.3;
		if(relu_in <= 0){             		relu_out = 0; }
		else if(relu_in >= 32){       		relu_out = 32;} 
                else {				       	relu_out = relu_in;}
                //else if(relu_in > 0 & relu_in < 32){       	relu_out = relu_in;}
		outs.write(relu_out);
	}
}

void copy(stream<DT> &ins, stream<DT> &outs) {
#pragma HLS PIPELINE II=1 enable_flush
	if (!ins.empty()) {
		outs.write(ins.read());
	}
}


void ACC(stream<TT> &token, stream<nz> &stream_data_in, stream<DT> &stream_vec)
{
#pragma HLS INTERFACE axis register both port=stream_data_in
#pragma HLS DATA_PACK variable=stream_data_in
#pragma HLS INTERFACE axis register both port=stream_vec
#pragma HLS INTERFACE axis register both port=token
#pragma HLS INTERFACE ap_ctrl_none port=return

#pragma HLS DATAFLOW
	static stream<DT> stream_vec_p;

#pragma HLS STREAM variable=stream_vec_p depth=512



	process(token, stream_data_in, stream_vec_p);
	relu(stream_vec_p, stream_vec);

}






	
	



