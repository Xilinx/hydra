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
#include "lsa.h"

using namespace hls;
using namespace std;

int main()
{
  int i,j;
  int mat_size = mat_size_val;
  int vec_size = vec_size_val;

  int nnz_expct = 1;

  static wide_mat_dt matrix0[mat_size_val];
  static wide_mat_dt matrix1[mat_size_val];
  static wide_vec_dt x[vec_size_val];
  static wide_vec_dt y[vec_size_val];

  for(int j=0;j<mat_size;j++){	  matrix0[j] = (wide_mat_dt)j;  }
  for(int j=0;j<mat_size;j++){	  matrix1[j] = (wide_mat_dt)j;  }
  for(int j=0;j<vec_size;j++){	  x[j] = (wide_vec_dt)j;  }
  for(int j=0;j<vec_size;j++){	  y[j] = (wide_vec_dt)0;  }


  static stream_wide_mat_dt stream_wide_mat0;
#pragma HLS STREAM variable=stream_wide_mat0 depth=128

  static stream_wide_mat_dt stream_wide_mat1;
#pragma HLS STREAM variable=stream_wide_mat1 depth=128

  static stream_wide_vec_dt stream_wide_x;
#pragma HLS STREAM variable=stream_wide_x depth=128

  static stream_wide_vec_dt stream_wide_y;
#pragma HLS STREAM variable=stream_wide_y depth=128

  static stream_token_dt stream_token;
#pragma HLS STREAM variable=stream_token depth=128

  static stream_token_dt stream_mon_send;
#pragma HLS STREAM variable=stream_mon_send depth=128

  static stream_token_dt stream_mon_recv;
#pragma HLS STREAM variable=stream_mon_recv depth=128

  for(int j=0;j<vec_size;j++){	  stream_wide_y.write((wide_vec_dt)j);  }
  for(int j=0;j<1;j++){	  	  stream_mon_recv.write((token_dt)j);  }


  lsa(nnz_expct, mat_size, vec_size, 
  		matrix0, matrix1, x, y, 
		stream_wide_mat0, stream_wide_mat1, 
		stream_wide_x, stream_token, stream_wide_y,
		stream_mon_send, stream_mon_recv);

  wide_mat_dt temp_mat;
  wide_vec_dt temp_vec;
  token_dt temp_token;
  token_dt temp_mon;

  int count_arr[5]={0};


  i=0;
  while(!stream_wide_x.empty()){
	  temp_vec = stream_wide_x.read();
	  i++;
  }
  count_arr[0] = i;

  i=0;
  while(!stream_mon_send.empty()){
          temp_mon = stream_mon_send.read();
	  i++;
  }
  count_arr[1] = i;


  i=0;
  while(!stream_wide_mat0.empty()){
	  temp_mat = stream_wide_mat0.read();
	  i++;
  }
  count_arr[2] = i;

  i=0;
  while(!stream_wide_mat1.empty()){
	  temp_mat = stream_wide_mat1.read();
	  i++;
  }
  count_arr[3] = i;


  i=0;
  while(!stream_token.empty()){
	  temp_token = stream_token.read();
	  i++;
  }
  count_arr[4] = i;

  for(int j=0;j<vec_size;j++){	  cout << y[j] <<endl;  }

  int packet_count = 0;
  for(int j=0;j<5;j++){
	    cout<<"Channel " << j << " received " << count_arr[j] << " packets! " << endl;
	    packet_count += count_arr[j];
  }
  cout<< packet_count << " Total Packets Received!" << endl;

  return 0;
}

  


