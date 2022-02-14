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

#include "hrb.h"

using namespace std;
using namespace hls;


void hrb_pe(stream<ID> &ins, stream<ID> &outs) {
#pragma HLS DATA_PACK variable=ins
#pragma HLS DATA_PACK variable=outs

#pragma HLS PIPELINE II=1 enable_flush

//#pragma HLS LATENCY min=0 max=0

	static bool go = true;
	static ID temp;
	static bool outstanding = false;
	static IDXTYPE rid_shift_reg[N]={0xffff};
#pragma HLS array_partition variable=rid_shift_reg complete

	for(unsigned int j=N;j>1;j--){
	#pragma HLS UNROLL
		rid_shift_reg[j-1] = rid_shift_reg[j-2];
	}

	//rid_shift_reg[3] = rid_shift_reg[2];
	//rid_shift_reg[2] = rid_shift_reg[1];
	//rid_shift_reg[1] = rid_shift_reg[0];
	//for(unsigned int j=0;j<4;j++){
	//	cout << "rid_shift_reg[" << j << "] = " << rid_shift_reg[j] << " ";
	//}
	//cout << endl;

	if (!ins.empty() && !outs.full()) {
		if(go){
			temp = ins.read();
			//go = (temp.idx != rid_shift_reg[0]) && (temp.idx != rid_shift_reg[1]) && (temp.idx != rid_shift_reg[2]) && (temp.idx != rid_shift_reg[3]);
			go = (temp.idx != rid_shift_reg[0]);
			for(unsigned int j=1;j<N;j++){
			#pragma HLS UNROLL
				go = go && (temp.idx != rid_shift_reg[j]);
			}
			//rid_shift_reg[0] = temp.idx;
			if (go){
				rid_shift_reg[0] = temp.idx;
				outs.write(temp);
				outstanding = false;
				//cout << "No Match, continue!!" << endl;
			}else{
				rid_shift_reg[0] = 0xffff;
				outstanding = true;
			}
		}else{
			//cout << "Match, wait for N cycles!!!" << endl;
			//go = (temp.idx != rid_shift_reg[0]) && (temp.idx != rid_shift_reg[1]) && (temp.idx != rid_shift_reg[2]) && (temp.idx != rid_shift_reg[3]);
			go = (temp.idx != rid_shift_reg[0]);
			for(unsigned int j=1;j<N;j++){
			#pragma HLS UNROLL
				go = go && (temp.idx != rid_shift_reg[j]);
			}
			if (go) {
				rid_shift_reg[0] = temp.idx;
				outs.write(temp);
				outstanding = false;
			}else{
				rid_shift_reg[0] = 0xffff;
				outstanding = true;
			}
		}
	}
	else{
		if(outstanding == true){
			//cout << "Match, wait for N cycles!!!" << endl;
			//go = (temp.idx != rid_shift_reg[0]) && (temp.idx != rid_shift_reg[1]) && (temp.idx != rid_shift_reg[2]) && (temp.idx != rid_shift_reg[3]);
			go = (temp.idx != rid_shift_reg[0]);
			for(unsigned int j=1;j<N;j++){
			#pragma HLS UNROLL
				go = go && (temp.idx != rid_shift_reg[j]);
			}
			if (go) {
				rid_shift_reg[0] = temp.idx;
				outs.write(temp);
				outstanding = false;
			}else{
				rid_shift_reg[0] = 0xffff;
				outstanding = true;
			}
		}else{

			rid_shift_reg[0] = 0xffff;
		}		
		//go = (temp.idx == 1);
	}
}

/*
void om(stream<ID> &ins, stream<ID> &outs) {
#pragma HLS DATA_PACK variable=ins
#pragma HLS DATA_PACK variable=outs

#pragma HLS PIPELINE II=1 enable_flush

	static ID ids[N];
#pragma HLS ARRAY_PARTITION variable=ids complete dim=1
	static bool valids[N];
#pragma HLS ARRAY_PARTITION variable=valids complete dim=1

	DATATYPE ds[N];
	ID out;
	bool output = valids[N-1];

	unsigned i;
	for (i = 0; i < N-1; ++i) {
#pragma HLS UNROLL
		if (valids[i] && (ids[i].idx == ids[N-1].idx)) {
			ds[i] = ids[i].data;
		} else {
			ds[i] = DATATYPE(0);
		}
	}
	ds[N-1] = ids[N-1].data;
	out.data = 0;
	for (i = 0; i < N; ++i) {
#pragma HLS UNROLL
		// HLS will make this into a nice tree
		out.data += ds[i];
	}
	out.idx = ids[N-1].idx;
	if (output) outs.write(out);

	for (i = N-1; i > 0; --i) {
#pragma HLS UNROLL
		valids[i] = valids[i-1] && ((!output) || (ids[i-1].idx != out.idx));
		ids[i] = ids[i-1];
	}
	valids[0] = ins.read_nb(ids[0]);
}
*/

void copy1(stream<FID> &ins, stream<ID> &outs) {
#pragma HLS LATENCY min=0 max=0
    FID t1;
    ID t2;
	if (!ins.empty() && !outs.full()) {
		t1 = ins.read();
		t2.data = t1.data;
		t2.idx = t1.ridx;
		outs.write(t2);
	}
}

void copy2(stream<ID> &ins, stream<ID> &outs) {
#pragma HLS LATENCY min=0 max=0
	if (!ins.empty() && !outs.full()) {
		outs.write(ins.read());
	}
}

void HRB(stream<FID> &ins, stream<ID> &outs) {
#pragma HLS INTERFACE ap_ctrl_none port=return
#pragma HLS INTERFACE axis register both port=ins
#pragma HLS INTERFACE axis register both port=outs
#pragma HLS DATA_PACK variable=ins
#pragma HLS DATA_PACK variable=outs

#pragma HLS DATAFLOW
	static stream<ID> in;
#pragma HLS STREAM variable=in depth=32

	copy1(ins, in);
	//copy2(out, outs);
	//om(in, out);
	hrb_pe (in,outs);
	//copy1(ins, in);
}
