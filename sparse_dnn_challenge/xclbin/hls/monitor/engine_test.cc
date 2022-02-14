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

static const ap_uint<32> matrix[126]={
#include "traffic.dat"
};

int main()
{
  int i,j;
  ap_uint<32> A[N][126];
  static stream<nz> stream_in[N];
#pragma HLS STREAM variable=stream_in depth=128

  static stream<nz> stream_out[N];
#pragma HLS STREAM variable=stream_out depth=128

  for(i=0; i < 126; i++){
	  cout<< (matrix[i] & 0xFFFF0000)/65536 << " " << (matrix[i] & 0x0000FFFF)<< endl;
  }

  nz mynz;

  //Put data into A
  for(i=0; i < 125; i=i+N){
    for(j=0;j<N;j++){
    	if(!stream_in[j].full() & (i+j)<126){
    		mynz.v = 1.0;
    		//mynz.c = (ap_uint<16>)(matrix[i+j] & 0x0000FFFF);
    		mynz.r = (ap_uint<16>)((matrix[i+j] & 0xFFFF0000)/65536);
    		stream_in[j].write(mynz);
    	}
    }
  }
  printf("HLS AXI-Stream no side-channel data example\n");

  static stream<CNTTYPE> stream_in_nnz_count;
#pragma HLS STREAM variable=stream_in_nnz_count depth=4

  static stream<CNTTYPE> stream_out_nnz_count;
#pragma HLS STREAM variable=stream_out_nnz_count depth=4

  stream_in_nnz_count.write(126);
  for(i=0; i < 512; i++){
	  monitor(stream_in_nnz_count, stream_in, stream_out, stream_out_nnz_count);
  }

  while(!stream_out_nnz_count.empty()){
  cout<<"nnz_count " << stream_out_nnz_count.read() << endl;
  }

  int count_arr[N]={0};
  ap_uint<16> id;

  nz myvec;

  for(int j=0;j<N;j++){
	  i=0;
	  while(!stream_out[j].empty()){
		  myvec = stream_out[j].read();
		  id.range(15,0) = myvec.r;
		  //id.range(31,16) = mynz.r;
		  A[j][i++]= id;
	  }
	  count_arr[j] = i;
  }

  int packet_count = 0;
  for(int j=0;j<N;j++){
	    //cout<<"channel " << j << endl;
	    //for(i=0; i < count_arr[j]; i++){
	  	//cout<< (A[j][i] & 0xFF00)/256 << " " << (A[j][i] & 0x00FF)<< endl;
	    //}
	    cout<<"Channel " << j << " received " << count_arr[j] << " packets! " << endl;
	    packet_count += count_arr[j];
  }
  cout<< packet_count << " Total Packets Received!" << endl;
  cout<< "N = " << N <<endl;


  for(i=0; i < 125; i=i+N){
    for(j=0;j<N;j++){
    	if(!stream_in[j].full() & (i+j)<126){
    		mynz.v = 1.0;
    		//mynz.c = (ap_uint<16>)(matrix[i+j] & 0x0000FFFF);
    		mynz.r = (ap_uint<16>)((matrix[i+j] & 0xFFFF0000)/65536);
    		stream_in[j].write(mynz);
    	}
    }
  }

  stream_in_nnz_count.write(126);
  for(i=0; i < 512; i++){
	  monitor(stream_in_nnz_count, stream_in, stream_out, stream_out_nnz_count);
  }

  while(!stream_out_nnz_count.empty()){
  cout<<"nnz_count " << stream_out_nnz_count.read() << endl;
  }

  for(int j=0;j<N;j++){
  	  i=0;
  	  while(!stream_out[j].empty()){
  		  myvec = stream_out[j].read();
  		  id.range(15,0) = myvec.r;
  		  //id.range(31,16) = mynz.r;
  		  A[j][i++]= id;
  	  }
  	  count_arr[j] = i;
    }
  for(int j=0;j<N;j++){
  	    //cout<<"channel " << j << endl;
  	    //for(i=0; i < count_arr[j]; i++){
  	  	//cout<< (A[j][i] & 0xFF00)/256 << " " << (A[j][i] & 0x00FF)<< endl;
  	    //}
  	    cout<<"Channel " << j << " received " << count_arr[j] << " packets! " << endl;
  	    packet_count += count_arr[j];
    }
    cout<< packet_count << " Total Packets Received!" << endl;
    cout<< "N = " << N <<endl;

  return 0;
}

  


