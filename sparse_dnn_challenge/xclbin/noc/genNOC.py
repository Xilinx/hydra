#/*
# * Copyright 2019-2021 Xilinx, Inc.
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *     http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
#*/

import itertools
import random
import numpy as np
import math
import json
import os
import sys
from pprint import pprint
import re
import argparse

global DATA_WIDTH
global ADDR_WIDTH
global N
global M

def get_wire_name(from_i, from_j, to_i, to_j):
  s = 'W_' + str(from_i) + '_' + str(from_j) + '_to_' + str(to_i) + '_' + str(to_j)
  return s

def get_wire_def(from_i,from_j,to_i,to_j):
  wire_name = get_wire_name(from_i,from_j,to_i,to_j)
  wire_d_name = wire_name + '_d'

  s = ' wire [DATA_WIDTH-1:0] ' + wire_name + '_tdata;\n'
  s += ' wire ' + wire_name + '_tready;\n'
  s += ' wire ' + wire_name + '_tvalid;\n'


  return s

def get_switch(i,j, m0,m1,s0,s1,type,C_nR):
  s = ' switch'
  if type == 'r':
    s += '\n'
  elif type == 's':
    s += '_s\n'
  elif type == 'm':
    s += '_m\n'
  else:
    print 'ERROR'
  ID = str(j) if C_nR == 1 else str(i)
  s += '  #(\n' \
      '   .DATA_WIDTH(DATA_WIDTH),\n' \
      '   .ADDR_WIDTH(ADDR_WIDTH),\n' \
      '   .DEPTH(DEPTH),\n' \
      '   .ID(' + str(ID) + '),\n' \
      '   .N(N),\n' \
      '   .M(M),\n' \
      '   .C_nR(C_nR),\n' \
      '   .C(C),\n' \
      '   .R(R)\n' \
      ' )\n' \
      ' S_' + str(i) + '_'  + str(j) + '\n' \
      ' (\n'
  if m0 != None:
    s +='   .M_AXIS_0_tdata(' + m0 + '_tdata' + '),\n' \
        '   .M_AXIS_0_tready(' + m0 + '_tready' + '),\n' \
        '   .M_AXIS_0_tvalid(' + m0 + '_tvalid' + '),\n\n'

  s += '   .M_AXIS_1_tdata(' + m1 + '_tdata' + '),\n' \
      '   .M_AXIS_1_tready(' + m1 + '_tready' + '),\n' \
      '   .M_AXIS_1_tvalid(' + m1 + '_tvalid' + '),\n\n'

  s+= '   .S_AXIS_0_tdata(' + s0 + '_tdata' + '),\n' \
      '   .S_AXIS_0_tready(' + s0 + '_tready' + '),\n' \
      '   .S_AXIS_0_tvalid(' + s0 + '_tvalid' + '),\n\n'

  if s1 != None:
    s += '   .S_AXIS_1_tdata(' + s1 + '_tdata' + '),\n' \
      '   .S_AXIS_1_tready(' + s1 + '_tready' + '),\n' \
      '   .S_AXIS_1_tvalid(' + s1 + '_tvalid' + '),\n\n'
  s += '   .aclk_0(aclk_0),\n' \
      '   .aresetn_0(aresetn_0)\n' \
      ' ); \n'
  return s

def get_NOC_io_def(N,M, xilinx):

  s = '(\n'

  for i in range(0, M):
    s += '  M_AXIS_' + str(i) + '_tdata,\n'
    s += '  M_AXIS_' + str(i) + '_tready,\n'
    s += '  M_AXIS_' + str(i) + '_tvalid,\n\n'

  for i in range(0, N):
    s += '  S_AXIS_' + str(i) + '_tdata,\n'
    s += '  S_AXIS_' + str(i) + '_tready,\n'
    s += '  S_AXIS_' + str(i) + '_tvalid,\n\n'

  s += '  aclk_0,\n' \
       '  aresetn_0\n' \
       ');\n'

  for i in range(0, M):
    if xilinx:
      s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 M_AXIS_' + str(i) + ' TDATA\" *) ' \
           '(* X_INTERFACE_PARAMETER = \"XIL_INTERFACENAME M_AXIS_' + str(i) + \
           ',  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, ' \
           'PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0\" *)\t'
    s += '  output [DATA_WIDTH-1:0] M_AXIS_' + str(i) + '_tdata;\n'
    if xilinx:
      s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 M_AXIS_' + str(i) + ' TREADY\" *)\t'
    s += '  input M_AXIS_' + str(i) + '_tready;\n'
    if xilinx:
      s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 M_AXIS_' + str(i) + ' TVALID\" *)\t'
    s += '  output M_AXIS_' + str(i) + '_tvalid;\n\n'

  for i in range(0, N):
    if xilinx:
      s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 S_AXIS_' + str(i) + ' TDATA\" *) ' \
           '(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_' + str(i) + \
           ',  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, ' \
           'PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)\t'
    s += '  input [DATA_WIDTH-1:0] S_AXIS_' + str(i) + '_tdata;\n'
    if xilinx:
      s += '(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_' + str(i) + ' TREADY" *)\t'
    s += '  output S_AXIS_' + str(i) + '_tready;\n'
    if xilinx:
      s += '(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_' + str(i) + ' TVALID" *)\t'
    s += '  input S_AXIS_' + str(i) + '_tvalid;\n\n'

  if xilinx:
    s += '(* X_INTERFACE_INFO = \"xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK\" *)' \
         '(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, ASSOCIATED_BUSIF '
    for i in range(0, N):
      s += 'S_AXIS_' + str(i) + ':'
    for i in range(0, M):
      s += 'M_AXIS_' + str(i) + ':'

    s += ', ASSOCIATED_RESET aresetn_0,  INSERT_VIP 0, PHASE 0.000" *)'

  s += '  input aclk_0;\n'
  if xilinx:
    s += '(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) '
  s += '  input aresetn_0;\n\n'

  return s

def gen_NOC_wrapper_with_EBs(N,M,R_or_C_based, outDir, xilinx, DATA_WIDTH, ADDR_WIDTH):
  s = '`timescale 1ns / 1ps\n\n'

  if R_or_C_based == 'c':
    C_nR = 1
  elif R_or_C_based == 'r':
    C_nR = 0
  else:
    print 'ERROR'
    return
  s += 'module noc_wrapper\n' \
       '#(\n' \
       '  DATA_WIDTH = ' + str(DATA_WIDTH) + ',\n' \
       '  ADDR_WIDTH = ' + str(ADDR_WIDTH) + ',\n' \
       '  DEPTH = 2**ADDR_WIDTH,\n' \
       '  N = ' + str(N) + ',\n' \
       '  M = ' + str(M) + ',\n' \
       '  C_nR = ' + str(C_nR) + ',\n' \
       '  C = 0,\n' \
       '  R = 16\n'\
       ')\n'
  s += get_NOC_io_def(N,M,xilinx)

  wire_def_s = ''
  wire_name = 'EB_to_NOC_in_'
  for i in range(0,N):
    wire_def_s += ' wire [DATA_WIDTH-1:0] ' + wire_name + str(i) +  '_tdata;\n'
    wire_def_s += ' wire ' + wire_name + str(i) + '_tready;\n'
    wire_def_s += ' wire ' + wire_name + str(i) + '_tvalid;\n'

  wire_name = 'NOC_out_to_EB_'
  for i in range(0,M):
    wire_def_s += ' wire [DATA_WIDTH-1:0] ' + wire_name + str(i) +  '_tdata;\n'
    wire_def_s += ' wire ' + wire_name + str(i) + '_tready;\n'
    wire_def_s += ' wire ' + wire_name + str(i) + '_tvalid;\n'

  s += wire_def_s + '\n'

  for i in range(0,N):
    s +=  '  EB\n' \
          '  #(\n' \
          '    .DATA_WIDTH(DATA_WIDTH),\n' \
          '    .ADDR_WIDTH(ADDR_WIDTH),\n' \
          '    .DEPTH(DEPTH)\n' \
          '  )\n' \
          '  EB_input_' + str(i) + '\n' \
          '  (\n' \
          '    .M_AXIS_0_tdata(EB_to_NOC_in_' + str(i) + '_tdata),\n' \
          '    .M_AXIS_0_tready(EB_to_NOC_in_' + str(i) + '_tready),\n' \
          '    .M_AXIS_0_tvalid(EB_to_NOC_in_' + str(i) + '_tvalid),\n' \
          '    .S_AXIS_0_tdata(S_AXIS_' + str(i) + '_tdata),\n' \
          '    .S_AXIS_0_tready(S_AXIS_' + str(i) + '_tready),\n' \
          '    .S_AXIS_0_tvalid(S_AXIS_' + str(i) + '_tvalid),\n' \
          '    .aclk_0(aclk_0),\n' \
          '    .aresetn_0(aresetn_0)\n' \
          '  );\n\n'

  for i in range(0,M):
    s +=  '  EB\n' \
          '  #(\n' \
          '    .DATA_WIDTH(DATA_WIDTH),\n' \
          '    .ADDR_WIDTH(ADDR_WIDTH),\n' \
          '    .DEPTH(DEPTH)\n' \
          '  )\n' \
          '  EB_output_' + str(i) + '\n' \
          '  (\n' \
          '    .M_AXIS_0_tdata(M_AXIS_' + str(i) + '_tdata),\n' \
          '    .M_AXIS_0_tready(M_AXIS_' + str(i) + '_tready),\n' \
          '    .M_AXIS_0_tvalid(M_AXIS_' + str(i) + '_tvalid),\n' \
          '    .S_AXIS_0_tdata(NOC_out_to_EB_' + str(i) + '_tdata),\n' \
          '    .S_AXIS_0_tready(NOC_out_to_EB_' + str(i) + '_tready),\n' \
          '    .S_AXIS_0_tvalid(NOC_out_to_EB_' + str(i) + '_tvalid),\n' \
          '    .aclk_0(aclk_0),\n' \
          '    .aresetn_0(aresetn_0)\n' \
          '  );\n\n'


  s += '  noc\n' \
       '  #(' \
       '      .DATA_WIDTH(DATA_WIDTH),\n' \
       '      .ADDR_WIDTH(ADDR_WIDTH),\n' \
       '      .DEPTH(DEPTH),\n' \
       '      .N(N),\n' \
       '      .M(M),\n' \
       '      .C_nR(C_nR),\n' \
       '      .C(C),\n' \
       '      .R(R)\n' \
       '  ) NOC \n' \
       '  (\n'
  for i in range(0,M):
    s += '    .M_AXIS_' + str(i) + '_tdata(NOC_out_to_EB_' + str(i) + '_tdata),\n'
    s += '    .M_AXIS_' + str(i) + '_tready(NOC_out_to_EB_' + str(i) + '_tready),\n'
    s += '    .M_AXIS_' + str(i) + '_tvalid(NOC_out_to_EB_' + str(i) + '_tvalid),\n'

  for i in range(0,N):
    s += '    .S_AXIS_' + str(i) + '_tdata(EB_to_NOC_in_' + str(i) + '_tdata),\n'
    s += '    .S_AXIS_' + str(i) + '_tready(EB_to_NOC_in_' + str(i) + '_tready),\n'
    s += '    .S_AXIS_' + str(i) + '_tvalid(EB_to_NOC_in_' + str(i) + '_tvalid),\n'

  s += '    .aclk_0(aclk_0),\n' \
       '    .aresetn_0(aresetn_0)\n' \
       '  ); \n'

  s += 'endmodule'


  if not os.path.exists(outDir):
    os.makedirs(outDir)
  dump_noc_RTL(s, outDir, 'noc_wrapper.v')

def gen_NOC(N,M,R_or_C_based, outDir, xilinx, DATA_WIDTH, ADDR_WIDTH):
  s = '`timescale 1ns / 1ps\n\n'

  if R_or_C_based == 'c':
    C_nR = 1
  elif R_or_C_based == 'r':
    C_nR = 0
  else:
    print 'ERROR'
    return
  s += 'module noc\n' \
       '#(\n' \
       '  DATA_WIDTH = ' + str(DATA_WIDTH) + ',\n' \
       '  ADDR_WIDTH = ' + str(ADDR_WIDTH) + ',\n' \
       '  DEPTH = 2**ADDR_WIDTH,\n' \
       '  N = ' + str(N) + ',\n' \
       '  M = ' + str(M) + ',\n' \
       '  C_nR = ' + str(C_nR) + ',\n' \
       '  C = 0,\n' \
       '  R = $clog2(N)\n'\
       ')\n'
  s += get_NOC_io_def(N,M,xilinx)

  # S += '(\n'
  # for i in range(0,M):
  #   s += '  M_AXIS_' + str(i) + '_tdata,\n'
  #   s += '  M_AXIS_' + str(i) + '_tready,\n'
  #   s += '  M_AXIS_' + str(i) + '_tvalid,\n\n'
  #
  # for i in range(0,N):
  #   s += '  S_AXIS_' + str(i) + '_tdata,\n'
  #   s += '  S_AXIS_' + str(i) + '_tready,\n'
  #   s += '  S_AXIS_' + str(i) + '_tvalid,\n\n'
  #
  # s += '  aclk_0,\n' \
  #      '  aresetn_0\n' \
  #      ');\n'
  #
  # for i in range(0,M):
  #   if xilinx:
  #     s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 M_AXIS_' + str(i) + ' TDATA\" *) ' \
  #          '(* X_INTERFACE_PARAMETER = \"XIL_INTERFACENAME M_AXIS_' + str(i) + \
  #          ',  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, ' \
  #          'PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0\" *)\t'
  #   s += '  output [DATA_WIDTH-1:0] M_AXIS_' + str(i) + '_tdata;\n'
  #   if xilinx:
  #     s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 M_AXIS_' + str(i) + ' TREADY\" *)\t'
  #   s += '  input M_AXIS_' + str(i) + '_tready;\n'
  #   if xilinx:
  #     s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 M_AXIS_' + str(i) + ' TVALID\" *)\t'
  #   s += '  output M_AXIS_' + str(i) + '_tvalid;\n\n'
  #
  # for i in range(0,N):
  #   if xilinx:
  #     s += '(* X_INTERFACE_INFO = \"xilinx.com:interface:axis:1.0 S_AXIS_' + str(i) + ' TDATA\" *) ' \
  #          '(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_' + str(i) + \
  #          ',  HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, ' \
  #          'PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *)\t'
  #   s += '  input [DATA_WIDTH-1:0] S_AXIS_' + str(i) + '_tdata;\n'
  #   if xilinx:
  #     s += '(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_' + str(i) + ' TREADY" *)\t'
  #   s += '  output S_AXIS_' + str(i) + '_tready;\n'
  #   if xilinx:
  #     s += '(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_' + str(i) + ' TVALID" *)\t'
  #   s += '  input S_AXIS_' + str(i) + '_tvalid;\n\n'
  #
  # if xilinx:
  #   s += '(* X_INTERFACE_INFO = \"xilinx.com:signal:clock:1.0 CLK.ACLK_0 CLK\" *)' \
  #        '(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK_0, ASSOCIATED_BUSIF '
  #   for i in range(0,N):
  #     s += 'S_AXIS_' + str(i) + ':'
  #   for i in range(0,M):
  #     s += 'M_AXIS_' + str(i) + ':'
  #   #s += 'S_AXIS_0:S_AXIS_1:S_AXIS_2:S_AXIS_3:S_AXIS_4:S_AXIS_5:S_AXIS_6:S_AXIS_7:M_AXIS_0:M_AXIS_1:M_AXIS_2:M_AXIS_3:M_AXIS_4:M_AXIS_5:M_AXIS_6:M_AXIS_7:'
  #   s += ', ASSOCIATED_RESET aresetn_0,  INSERT_VIP 0, PHASE 0.000" *)'
  #
  # s += '  input aclk_0;\n'
  # if xilinx:
  #   s += '(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) '
  # s += '  input aresetn_0;\n\n' \

  wire_def_s = ''
  switch_inst_s = ''

  for i in range(0,N):
    wire_def_s += '//Row ' + str (i) + '\n'
    if i == 0:
      for j in range(0,M-1):
        if j != M-2:
          wire_def_s += get_wire_def(i,j,i,j+1)
        else:
          wire_def_s += get_wire_def(i,j,i+1,j+1)
        wire_def_s += get_wire_def(i,j,i+1,j)
    else:
      for j in range(0,M):
        if i == N -1:
          if j != M-1:
            wire_def_s += get_wire_def(i,j,i,j+1)
        else:
          if j != M-1:
            wire_def_s += get_wire_def(i, j, i, j+1)
          wire_def_s += get_wire_def(i, j, i + 1, j)
    wire_def_s += '\n'

  for i in range(0,N):
    switch_inst_s += '//Row ' + str(i) + '\n'
    if i == 0:
      for j in range(0,M-1):
        if j == 0 and j == M-2:
          m0 = get_wire_name(i, j, i + 1, j + 1)
          m1 = get_wire_name(i, j, i + 1, j)
          s0 = 'S_AXIS_' + str(i)
        elif j == 0:
          m0 = get_wire_name(i,j,i,j+1)
          m1 = get_wire_name(i,j,i+1,j)
          s0 = 'S_AXIS_' + str(i)
        elif j != M-2:
          m0 = get_wire_name(i,j,i,j+1)
          m1 = get_wire_name(i,j,i+1,j)
          s0 = get_wire_name(i,j-1,i,j)
        else:
          m0 = get_wire_name(i,j,i+1,j+1)
          m1 = get_wire_name(i,j,i+1,j)
          s0 = get_wire_name(i,j-1,i,j)

        switch_inst_s += get_switch(i,j,m0,m1,s0,None,'s',C_nR)
        switch_inst_s += '\n'
    else:
      for j in range(0,M):
        if j == M-1:
          if i != N-1:
            m1= get_wire_name(i, j, i + 1, j)
            s0= get_wire_name(i, j -1 , i, j)
            if i == 1:
              s1= get_wire_name(i - 1, j - 1, i, j)
            else:
              s1= get_wire_name(i - 1, j, i, j)
          else:
            m1 = 'M_AXIS_' + str(j)
            s0 = get_wire_name(i, j - 1, i, j)
            if i == 1:
              s1 = get_wire_name(i - 1, j - 1, i, j)
            else:
              s1= get_wire_name(i - 1, j, i, j)
          switch_inst_s += get_switch(i,j,None,m1,s0,s1,'m',C_nR)
        else:
          if i == N-1 and j == 0:
            m0= get_wire_name(i, j, i, j + 1)
            m1= 'M_AXIS_' + str(j)
            s0= 'S_AXIS_' + str(i)
            s1= get_wire_name(i - 1, j, i, j)
          elif j == 0:
            m0= get_wire_name(i, j, i, j + 1)
            m1= get_wire_name(i, j, i + 1, j)
            s0= 'S_AXIS_' + str(i)
            s1= get_wire_name(i - 1, j, i, j)
          elif i == N-1:
            m0= get_wire_name(i, j, i, j + 1)
            m1= 'M_AXIS_' + str(j)
            s0= get_wire_name(i, j - 1, i, j)
            s1= get_wire_name(i - 1, j, i, j)
          else:
            m0= get_wire_name(i, j, i, j + 1)
            m1= get_wire_name(i, j, i + 1, j)
            s0= get_wire_name(i, j - 1, i, j)
            s1= get_wire_name(i - 1, j, i, j)
          switch_inst_s += get_switch(i,j,m0,m1,s0,s1,'r',C_nR)

        switch_inst_s += '\n'

    switch_inst_s += '\n'

  s += wire_def_s
  s += switch_inst_s

  s += 'endmodule'

  if not os.path.exists(outDir):
    os.makedirs(outDir)
  dump_noc_RTL(s, outDir, 'noc.v')

def dump_noc_RTL(s, outDir, filename):
  print " Dumping " + outDir + '/' + filename
  noc_file = open(outDir + '/' + filename, 'w')

  noc_file.write(s)
  noc_file.close

  print " .......Done"

def main():

  argparser = argparse.ArgumentParser(description="Generating NxM NOC")
  argparser.add_argument('N', metavar='<Rows>', type=int, help="Number of Rows")
  argparser.add_argument('M', metavar='<Columns>', type=int, help="Number of Colmns")
  argparser.add_argument('outDir', metavar='<OutDir>', type=str, help="Out Dir")
  argparser.add_argument('-split', metavar='<Split>', type=str, help="Split type, column-wise of row-wise")
  argparser.add_argument('-data_width', metavar='<DATA_WIDTH>', type=int, help='Data Width')
  argparser.add_argument('-addr_width', metavar='<ADDR_WIDTH>', type=int, help='Address Width')
  argparser.add_argument('-xilinx', action='store_true', help='Enabling Xilinx Design Block Annotations')
  argparser.add_argument('-buf', metavar='<buf>', type=str, help="Buffering JSON file")

  args = argparser.parse_args()

  if args.xilinx:
    xilinx = 1
  else:
    xilinx = 0

  if args.split:
    split = args.split
    if split != 'c' and split != 'r':
      print 'ERROR: split is not defined correctly'
      return
  else:
    split = 'c'

  if args.data_width:
    DATA_WIDTH = args.data_width
  else:
    DATA_WIDTH = 32

  if args.addr_width:
    ADDR_WIDTH = args.addr_width
  else:
    ADDR_WIDTH = 2
  N = args.N
  M = args.M
  outDir = args.outDir


  gen_NOC(N,M,split,outDir,xilinx, DATA_WIDTH, ADDR_WIDTH)

  gen_NOC_wrapper_with_EBs(N,M,split,outDir,xilinx, DATA_WIDTH, ADDR_WIDTH)

if __name__ == '__main__':
  try:
    main()
  except KeyboardInterrupt:
    sys.exit("Exiting..")

