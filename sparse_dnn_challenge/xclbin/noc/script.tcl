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

create_project project_1 project_1 -part xcu200-fsgd2104-2-e
set_property board_part xilinx.com:au200:part0:1.2 [current_project]
add_files -norecurse -scan_for_includes {./src/noc_wrapper.v ./src/split.v ./src/switch.v ./src/switch_m.v ./src/EB_Element.v ./src/noc.v ./src/EB.v ./src/switch_s.v ./src/HBEB.v ./src/merge.v}
import_files -norecurse {./src/noc_wrapper.v ./src/split.v ./src/switch.v ./src/switch_m.v ./src/EB_Element.v ./src/noc.v ./src/EB.v ./src/switch_s.v ./src/HBEB.v ./src/merge.v}
add_files -fileset constrs_1 -norecurse ./src/constrs.xdc
import_files -fileset constrs_1 ./src/constrs.xdc
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-mode out_of_context} -objects [get_runs synth_1]
launch_runs impl_1 -jobs 16
wait_on_run impl_1 


