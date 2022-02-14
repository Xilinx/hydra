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
#include "hrb.h"

using namespace hls;
using namespace std;

#define RANGE 16

int main(int argc, char** argv) {
	srand(3);

	const int inputSize = 32;
	DATATYPE mem1[RANGE];
	DATATYPE mem2[RANGE];
	stream<FID> ins;
	stream<ID> outs;

	unsigned i;

	for (i = 0; i < RANGE; ++i) {
		mem1[i] = 0;
		mem2[i] = 0;
	}
	FID id1; ID id2;
	for (i = 0; i < inputSize; ++i) {
		id1.data = i+1;
		id1.ridx = rand() % RANGE;
		id1.cidx = rand() % RANGE;
		ins.write(id1);
		mem1[id1.ridx] += id1.data;
		cout << id1.ridx << "," << id1.data << endl;
	}

	for (i = 0; i < inputSize+200; ++i) {
		HRB(ins, outs);
	}

	cout << inputSize << " values reduced to " << outs.size() << " values" << endl;
	while (!outs.empty()) {
		id2 = outs.read();
		mem2[id2.idx] += id2.data;
		cout << id2.idx << "," << id2.data << endl;
	}
	unsigned errors = 0;
	for (i = 0; i < RANGE; ++i) {
		if (mem1[i] != mem2[i]) {
			++errors;
			cout << "Error on index " << i << ": " << mem1[i] << " != " << mem2[i] << endl;
		}
	}
	printf("%u total errors\n", errors);

	return errors > 0 ? 1 : 0;
}
