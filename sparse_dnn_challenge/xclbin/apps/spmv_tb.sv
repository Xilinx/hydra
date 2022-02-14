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

// This is a generated file. Use and modify at your own risk.
////////////////////////////////////////////////////////////////////////////////
// default_nettype of none prevents implicit wire declaration.
`default_nettype none
`timescale 1 ps / 1 ps
import axi_vip_pkg::*;
import slv_m00_axi_vip_pkg::*;
import slv_m01_axi_vip_pkg::*;
import control_spmv_vip_pkg::*;

module spmv_tb ();
parameter integer LP_MAX_LENGTH = 8192;
parameter integer LP_MAX_TRANSFER_LENGTH = 16384 / 4;
parameter integer C_S_AXI_CONTROL_ADDR_WIDTH = 12;
parameter integer C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter integer C_M00_AXI_ADDR_WIDTH = 64;
parameter integer C_M00_AXI_DATA_WIDTH = 256;
parameter integer C_M01_AXI_ADDR_WIDTH = 64;
parameter integer C_M01_AXI_DATA_WIDTH = 256;

// Control Register
parameter KRNL_CTRL_REG_ADDR     = 32'h00000000;
parameter CTRL_START_MASK        = 32'h00000001;
parameter CTRL_DONE_MASK         = 32'h00000002;
parameter CTRL_IDLE_MASK         = 32'h00000004;
parameter CTRL_READY_MASK        = 32'h00000008;
parameter CTRL_CONTINUE_MASK     = 32'h00000010; // Only ap_ctrl_chain
parameter CTRL_AUTO_RESTART_MASK = 32'h00000080; // Not used

parameter integer LP_CLK_PERIOD_PS = 4000; // 250 MHz

//System Signals
logic ap_clk = 0;

initial begin: AP_CLK
  forever begin
    ap_clk = #(LP_CLK_PERIOD_PS/2) ~ap_clk;
  end
end
 
//System Signals
logic ap_rst_n = 0;
logic initial_reset  =0;

task automatic ap_rst_n_sequence(input integer unsigned width = 20);
  @(posedge ap_clk);
  #1ps;
  ap_rst_n = 0;
  repeat (width) @(posedge ap_clk);
  #1ps;
  ap_rst_n = 1;
endtask

initial begin: AP_RST
  ap_rst_n_sequence(50);
  initial_reset =1;
end
//AXI4 master interface m00_axi
wire [1-1:0] m00_axi_awvalid;
wire [1-1:0] m00_axi_awready;
wire [C_M00_AXI_ADDR_WIDTH-1:0] m00_axi_awaddr;
wire [8-1:0] m00_axi_awlen;
wire [1-1:0] m00_axi_wvalid;
wire [1-1:0] m00_axi_wready;
wire [C_M00_AXI_DATA_WIDTH-1:0] m00_axi_wdata;
wire [C_M00_AXI_DATA_WIDTH/8-1:0] m00_axi_wstrb;
wire [1-1:0] m00_axi_wlast;
wire [1-1:0] m00_axi_bvalid;
wire [1-1:0] m00_axi_bready;
wire [1-1:0] m00_axi_arvalid;
wire [1-1:0] m00_axi_arready;
wire [C_M00_AXI_ADDR_WIDTH-1:0] m00_axi_araddr;
wire [8-1:0] m00_axi_arlen;
wire [1-1:0] m00_axi_rvalid;
wire [1-1:0] m00_axi_rready;
wire [C_M00_AXI_DATA_WIDTH-1:0] m00_axi_rdata;
wire [1-1:0] m00_axi_rlast;
//AXI4 master interface m01_axi
wire [1-1:0] m01_axi_awvalid;
wire [1-1:0] m01_axi_awready;
wire [C_M01_AXI_ADDR_WIDTH-1:0] m01_axi_awaddr;
wire [8-1:0] m01_axi_awlen;
wire [1-1:0] m01_axi_wvalid;
wire [1-1:0] m01_axi_wready;
wire [C_M01_AXI_DATA_WIDTH-1:0] m01_axi_wdata;
wire [C_M01_AXI_DATA_WIDTH/8-1:0] m01_axi_wstrb;
wire [1-1:0] m01_axi_wlast;
wire [1-1:0] m01_axi_bvalid;
wire [1-1:0] m01_axi_bready;
wire [1-1:0] m01_axi_arvalid;
wire [1-1:0] m01_axi_arready;
wire [C_M01_AXI_ADDR_WIDTH-1:0] m01_axi_araddr;
wire [8-1:0] m01_axi_arlen;
wire [1-1:0] m01_axi_rvalid;
wire [1-1:0] m01_axi_rready;
wire [C_M01_AXI_DATA_WIDTH-1:0] m01_axi_rdata;
wire [1-1:0] m01_axi_rlast;
//AXI4LITE control signals
wire [1-1:0] s_axi_control_awvalid;
wire [1-1:0] s_axi_control_awready;
wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_awaddr;
wire [1-1:0] s_axi_control_wvalid;
wire [1-1:0] s_axi_control_wready;
wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_wdata;
wire [C_S_AXI_CONTROL_DATA_WIDTH/8-1:0] s_axi_control_wstrb;
wire [1-1:0] s_axi_control_arvalid;
wire [1-1:0] s_axi_control_arready;
wire [C_S_AXI_CONTROL_ADDR_WIDTH-1:0] s_axi_control_araddr;
wire [1-1:0] s_axi_control_rvalid;
wire [1-1:0] s_axi_control_rready;
wire [C_S_AXI_CONTROL_DATA_WIDTH-1:0] s_axi_control_rdata;
wire [2-1:0] s_axi_control_rresp;
wire [1-1:0] s_axi_control_bvalid;
wire [1-1:0] s_axi_control_bready;
wire [2-1:0] s_axi_control_bresp;

// DUT instantiation
spmv #(
  .C_S_AXI_CONTROL_ADDR_WIDTH ( C_S_AXI_CONTROL_ADDR_WIDTH ),
  .C_S_AXI_CONTROL_DATA_WIDTH ( C_S_AXI_CONTROL_DATA_WIDTH ),
  .C_M00_AXI_ADDR_WIDTH       ( C_M00_AXI_ADDR_WIDTH       ),
  .C_M00_AXI_DATA_WIDTH       ( C_M00_AXI_DATA_WIDTH       ),
  .C_M01_AXI_ADDR_WIDTH       ( C_M01_AXI_ADDR_WIDTH       ),
  .C_M01_AXI_DATA_WIDTH       ( C_M01_AXI_DATA_WIDTH       )
)
inst_dut (
  .ap_clk                ( ap_clk                ),
  .ap_rst_n              ( ap_rst_n              ),
  .m00_axi_awvalid       ( m00_axi_awvalid       ),
  .m00_axi_awready       ( m00_axi_awready       ),
  .m00_axi_awaddr        ( m00_axi_awaddr        ),
  .m00_axi_awlen         ( m00_axi_awlen         ),
  .m00_axi_wvalid        ( m00_axi_wvalid        ),
  .m00_axi_wready        ( m00_axi_wready        ),
  .m00_axi_wdata         ( m00_axi_wdata         ),
  .m00_axi_wstrb         ( m00_axi_wstrb         ),
  .m00_axi_wlast         ( m00_axi_wlast         ),
  .m00_axi_bvalid        ( m00_axi_bvalid        ),
  .m00_axi_bready        ( m00_axi_bready        ),
  .m00_axi_arvalid       ( m00_axi_arvalid       ),
  .m00_axi_arready       ( m00_axi_arready       ),
  .m00_axi_araddr        ( m00_axi_araddr        ),
  .m00_axi_arlen         ( m00_axi_arlen         ),
  .m00_axi_rvalid        ( m00_axi_rvalid        ),
  .m00_axi_rready        ( m00_axi_rready        ),
  .m00_axi_rdata         ( m00_axi_rdata         ),
  .m00_axi_rlast         ( m00_axi_rlast         ),
  .m01_axi_awvalid       ( m01_axi_awvalid       ),
  .m01_axi_awready       ( m01_axi_awready       ),
  .m01_axi_awaddr        ( m01_axi_awaddr        ),
  .m01_axi_awlen         ( m01_axi_awlen         ),
  .m01_axi_wvalid        ( m01_axi_wvalid        ),
  .m01_axi_wready        ( m01_axi_wready        ),
  .m01_axi_wdata         ( m01_axi_wdata         ),
  .m01_axi_wstrb         ( m01_axi_wstrb         ),
  .m01_axi_wlast         ( m01_axi_wlast         ),
  .m01_axi_bvalid        ( m01_axi_bvalid        ),
  .m01_axi_bready        ( m01_axi_bready        ),
  .m01_axi_arvalid       ( m01_axi_arvalid       ),
  .m01_axi_arready       ( m01_axi_arready       ),
  .m01_axi_araddr        ( m01_axi_araddr        ),
  .m01_axi_arlen         ( m01_axi_arlen         ),
  .m01_axi_rvalid        ( m01_axi_rvalid        ),
  .m01_axi_rready        ( m01_axi_rready        ),
  .m01_axi_rdata         ( m01_axi_rdata         ),
  .m01_axi_rlast         ( m01_axi_rlast         ),
  .s_axi_control_awvalid ( s_axi_control_awvalid ),
  .s_axi_control_awready ( s_axi_control_awready ),
  .s_axi_control_awaddr  ( s_axi_control_awaddr  ),
  .s_axi_control_wvalid  ( s_axi_control_wvalid  ),
  .s_axi_control_wready  ( s_axi_control_wready  ),
  .s_axi_control_wdata   ( s_axi_control_wdata   ),
  .s_axi_control_wstrb   ( s_axi_control_wstrb   ),
  .s_axi_control_arvalid ( s_axi_control_arvalid ),
  .s_axi_control_arready ( s_axi_control_arready ),
  .s_axi_control_araddr  ( s_axi_control_araddr  ),
  .s_axi_control_rvalid  ( s_axi_control_rvalid  ),
  .s_axi_control_rready  ( s_axi_control_rready  ),
  .s_axi_control_rdata   ( s_axi_control_rdata   ),
  .s_axi_control_rresp   ( s_axi_control_rresp   ),
  .s_axi_control_bvalid  ( s_axi_control_bvalid  ),
  .s_axi_control_bready  ( s_axi_control_bready  ),
  .s_axi_control_bresp   ( s_axi_control_bresp   )
);

// Master Control instantiation
control_spmv_vip inst_control_spmv_vip (
  .aclk          ( ap_clk                ),
  .aresetn       ( ap_rst_n              ),
  .m_axi_awvalid ( s_axi_control_awvalid ),
  .m_axi_awready ( s_axi_control_awready ),
  .m_axi_awaddr  ( s_axi_control_awaddr  ),
  .m_axi_wvalid  ( s_axi_control_wvalid  ),
  .m_axi_wready  ( s_axi_control_wready  ),
  .m_axi_wdata   ( s_axi_control_wdata   ),
  .m_axi_wstrb   ( s_axi_control_wstrb   ),
  .m_axi_arvalid ( s_axi_control_arvalid ),
  .m_axi_arready ( s_axi_control_arready ),
  .m_axi_araddr  ( s_axi_control_araddr  ),
  .m_axi_rvalid  ( s_axi_control_rvalid  ),
  .m_axi_rready  ( s_axi_control_rready  ),
  .m_axi_rdata   ( s_axi_control_rdata   ),
  .m_axi_rresp   ( s_axi_control_rresp   ),
  .m_axi_bvalid  ( s_axi_control_bvalid  ),
  .m_axi_bready  ( s_axi_control_bready  ),
  .m_axi_bresp   ( s_axi_control_bresp   )
);

control_spmv_vip_mst_t  ctrl;

// Slave MM VIP instantiation
slv_m00_axi_vip inst_slv_m00_axi_vip (
  .aclk          ( ap_clk          ),
  .aresetn       ( ap_rst_n        ),
  .s_axi_awvalid ( m00_axi_awvalid ),
  .s_axi_awready ( m00_axi_awready ),
  .s_axi_awaddr  ( m00_axi_awaddr  ),
  .s_axi_awlen   ( m00_axi_awlen   ),
  .s_axi_wvalid  ( m00_axi_wvalid  ),
  .s_axi_wready  ( m00_axi_wready  ),
  .s_axi_wdata   ( m00_axi_wdata   ),
  .s_axi_wstrb   ( m00_axi_wstrb   ),
  .s_axi_wlast   ( m00_axi_wlast   ),
  .s_axi_bvalid  ( m00_axi_bvalid  ),
  .s_axi_bready  ( m00_axi_bready  ),
  .s_axi_arvalid ( m00_axi_arvalid ),
  .s_axi_arready ( m00_axi_arready ),
  .s_axi_araddr  ( m00_axi_araddr  ),
  .s_axi_arlen   ( m00_axi_arlen   ),
  .s_axi_rvalid  ( m00_axi_rvalid  ),
  .s_axi_rready  ( m00_axi_rready  ),
  .s_axi_rdata   ( m00_axi_rdata   ),
  .s_axi_rlast   ( m00_axi_rlast   )
);


slv_m00_axi_vip_slv_mem_t   m00_axi;
slv_m00_axi_vip_slv_t   m00_axi_slv;

// Slave MM VIP instantiation
slv_m01_axi_vip inst_slv_m01_axi_vip (
  .aclk          ( ap_clk          ),
  .aresetn       ( ap_rst_n        ),
  .s_axi_awvalid ( m01_axi_awvalid ),
  .s_axi_awready ( m01_axi_awready ),
  .s_axi_awaddr  ( m01_axi_awaddr  ),
  .s_axi_awlen   ( m01_axi_awlen   ),
  .s_axi_wvalid  ( m01_axi_wvalid  ),
  .s_axi_wready  ( m01_axi_wready  ),
  .s_axi_wdata   ( m01_axi_wdata   ),
  .s_axi_wstrb   ( m01_axi_wstrb   ),
  .s_axi_wlast   ( m01_axi_wlast   ),
  .s_axi_bvalid  ( m01_axi_bvalid  ),
  .s_axi_bready  ( m01_axi_bready  ),
  .s_axi_arvalid ( m01_axi_arvalid ),
  .s_axi_arready ( m01_axi_arready ),
  .s_axi_araddr  ( m01_axi_araddr  ),
  .s_axi_arlen   ( m01_axi_arlen   ),
  .s_axi_rvalid  ( m01_axi_rvalid  ),
  .s_axi_rready  ( m01_axi_rready  ),
  .s_axi_rdata   ( m01_axi_rdata   ),
  .s_axi_rlast   ( m01_axi_rlast   )
);


slv_m01_axi_vip_slv_mem_t   m01_axi;
slv_m01_axi_vip_slv_t   m01_axi_slv;

parameter NUM_AXIS_MST = 0;
parameter NUM_AXIS_SLV = 0;

bit               error_found = 0;

///////////////////////////////////////////////////////////////////////////
// Pointer for interface : m00_axi
bit [63:0] matrix0_ptr = 64'h0;

///////////////////////////////////////////////////////////////////////////
// Pointer for interface : m01_axi
bit [63:0] x_ptr = 64'h0;

///////////////////////////////////////////////////////////////////////////
// Pointer for interface : m01_axi
bit [63:0] y_ptr = 64'h0;

///////////////////////////////////////////////////////////////////////////
// Pointer for interface : m01_axi
bit [63:0] matrix1_ptr = 64'h0;


bit [31:0] traffic[$];

/////////////////////////////////////////////////////////////////////////////////////////////////
// Backdoor fill the m00_axi memory.
function void m00_axi_fill_memory(
  input bit [63:0] ptr,
  input integer    length
);
bit [31:0] dummy;
int status;
int traffic_counter;
int input_file;
longint unsigned t_id;

input_file  = $fopen("d64.dat","r");
traffic_counter = 0;

      while(!$feof(input_file)) begin
        status = $fscanf(input_file,"%h\n",dummy);
        traffic[traffic_counter] = dummy;
        traffic_counter++;
     end

length = traffic_counter;
$display("length (nnz): %d", length);

  for (longint unsigned slot = 0; slot < length/2; slot++) begin
    m00_axi.mem_model.backdoor_memory_write_4byte(ptr + (slot *  8), traffic[slot]);
    m00_axi.mem_model.backdoor_memory_write_4byte(ptr + 4 + ( slot * 8), 32'h3f800000); 
  end 
  
//  for (longint unsigned slot = length; slot < length+1024; slot++) begin
//    t_id = slot % length;
//    m00_axi.mem_model.backdoor_memory_write_4byte(ptr + (slot *  8), traffic[t_id]);
//    m00_axi.mem_model.backdoor_memory_write_4byte(ptr + 4 + ( slot * 8), 32'h3727C5AC); 
//  end 

endfunction
/////////////////////////////////////////////////////////////////////////////////////////////////
// Backdoor fill the m01_axi memory.
function void m01_axi_fill_memory(
  input bit [63:0] x_ptr,
  input bit [63:0] ptr,
  input integer    length
);

bit [31:0] dummy;
int status;
int traffic_counter;
int input_file;
longint unsigned t_id;
shortreal vec_val = 1.0;

for (longint unsigned slot = 0; slot < 128; slot=slot+8) begin
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + (slot *  4), 32'h3f800000);
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + 4 + (slot *  4), 32'h40000000);
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + 8 + (slot *  4), 32'h40400000);
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + 12 + (slot *  4), 32'h40800000);
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + 16 + (slot *  4), 32'h40a00000);
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + 20 + (slot *  4), 32'h40c00000);
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + 24 + (slot *  4), 32'h40e00000);
    m01_axi.mem_model.backdoor_memory_write_4byte(x_ptr + 28 + (slot *  4), 32'h41000000);
end 

input_file  = $fopen("d64.dat","r");
traffic_counter = 0;

      while(!$feof(input_file)) begin
        status = $fscanf(input_file,"%h\n",dummy);
        traffic[traffic_counter] = dummy;
        traffic_counter++;
     end

  length = traffic_counter;
  $display("length (nnz): %d", length);
  
  for (longint unsigned slot = 0; slot < length/2; slot++) begin
    m01_axi.mem_model.backdoor_memory_write_4byte(ptr + (slot *  8), traffic[slot + (length/2)]);
    m01_axi.mem_model.backdoor_memory_write_4byte(ptr + 4 + ( slot * 8), 32'h3f800000); 
  end 
  
  //for (longint unsigned slot = length; slot < length+1024; slot++) begin
  //  t_id = slot % length;
  //  m01_axi.mem_model.backdoor_memory_write_4byte(ptr + (slot *  8), traffic[t_id]);
  //  m01_axi.mem_model.backdoor_memory_write_4byte(ptr + 4 + ( slot * 8), 32'h3727C5AC); 
  //end 
endfunction
/////////////////////////////////////////////////////////////////////////////////////////////////


task automatic system_reset_sequence(input integer unsigned width = 20);
  $display("%t : Starting System Reset Sequence", $time);
  fork
    ap_rst_n_sequence(25);
    
  join

endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// Generate a random 32bit number
function bit [31:0] get_random_4bytes();
  bit [31:0] rptr;
  ptr_random_failed: assert(std::randomize(rptr));
  return(rptr);
endfunction

/////////////////////////////////////////////////////////////////////////////////////////////////
// Generate a random 64bit 4k aligned address pointer.
function bit [63:0] get_random_ptr();
  bit [63:0] rptr;
  ptr_random_failed: assert(std::randomize(rptr));
  rptr[31:0] &= ~(32'h00000fff);
  return(rptr);
endfunction

/////////////////////////////////////////////////////////////////////////////////////////////////
// Control interface non-blocking write
// The task will return when the transaction has been accepted by the driver. It will be some
// amount of time before it will appear on the interface.
task automatic write_register (input bit [31:0] addr_in, input bit [31:0] data);
  axi_transaction   wr_xfer;
  wr_xfer = ctrl.wr_driver.create_transaction("wr_xfer");
  assert(wr_xfer.randomize() with {addr == addr_in;});
  wr_xfer.set_data_beat(0, data);
  ctrl.wr_driver.send(wr_xfer);
endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// Control interface blocking write
// The task will return when the BRESP has been returned from the kernel.
task automatic blocking_write_register (input bit [31:0] addr_in, input bit [31:0] data);
  axi_transaction   wr_xfer;
  axi_transaction   wr_rsp;
  wr_xfer = ctrl.wr_driver.create_transaction("wr_xfer");
  wr_xfer.set_driver_return_item_policy(XIL_AXI_PAYLOAD_RETURN);
  assert(wr_xfer.randomize() with {addr == addr_in;});
  wr_xfer.set_data_beat(0, data);
  ctrl.wr_driver.send(wr_xfer);
  ctrl.wr_driver.wait_rsp(wr_rsp);
endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// Control interface blocking read
// The task will return when the BRESP has been returned from the kernel.
task automatic read_register (input bit [31:0] addr, output bit [31:0] rddata);
  axi_transaction   rd_xfer;
  axi_transaction   rd_rsp;
  bit [31:0] rd_value;
  rd_xfer = ctrl.rd_driver.create_transaction("rd_xfer");
  rd_xfer.set_addr(addr);
  rd_xfer.set_driver_return_item_policy(XIL_AXI_PAYLOAD_RETURN);
  ctrl.rd_driver.send(rd_xfer);
  ctrl.rd_driver.wait_rsp(rd_rsp);
  rd_value = rd_rsp.get_data_beat(0);
  rddata = rd_value;
endtask



/////////////////////////////////////////////////////////////////////////////////////////////////
// Poll the Control interface status register.
// This will poll until the DONE flag in the status register is asserted.
task automatic poll_done_register ();
  bit [31:0] rd_value;
  do begin
    read_register(KRNL_CTRL_REG_ADDR, rd_value);
  end while ((rd_value & CTRL_DONE_MASK) == 0);
endtask

// This will poll until the IDLE flag in the status register is asserted.
task automatic poll_idle_register ();
  bit [31:0] rd_value;
  do begin
    read_register(KRNL_CTRL_REG_ADDR, rd_value);
  end while ((rd_value & CTRL_IDLE_MASK) == 0);
endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// Start the control VIP, SLAVE memory models and AXI4-Stream.
task automatic start_vips();
  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Control Master: ctrl");
  ctrl = new("ctrl", spmv_tb.inst_control_spmv_vip.inst.IF);
  ctrl.start_master();

  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Starting Memory slave: m00_axi");
  m00_axi = new("m00_axi", spmv_tb.inst_slv_m00_axi_vip.inst.IF);
  m00_axi.start_slave();

  $display("///////////////////////////////////////////////////////////////////////////");
  $display("Starting Memory slave: m01_axi");
  m01_axi = new("m01_axi", spmv_tb.inst_slv_m01_axi_vip.inst.IF);
  m01_axi.start_slave();

endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, set the Slave to not de-assert WREADY at any time.
// This will show the fastest outbound bandwidth from the WRITE channel.
task automatic slv_no_backpressure_wready();
  axi_ready_gen     rgen;
  $display("%t - Applying slv_no_backpressure_wready", $time);

  rgen = new("m00_axi_no_backpressure_wready");
  rgen.set_ready_policy(XIL_AXI_READY_GEN_NO_BACKPRESSURE);
  m00_axi.wr_driver.set_wready_gen(rgen);

  rgen = new("m01_axi_no_backpressure_wready");
  rgen.set_ready_policy(XIL_AXI_READY_GEN_NO_BACKPRESSURE);
  m01_axi.wr_driver.set_wready_gen(rgen);

endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, apply a WREADY policy to introduce backpressure.
// Based on the simulation seed the order/shape of the WREADY per-channel will be different.
task automatic slv_random_backpressure_wready();
  axi_ready_gen     rgen;
  $display("%t - Applying slv_random_backpressure_wready", $time);

  rgen = new("m00_axi_random_backpressure_wready");
  rgen.set_ready_policy(XIL_AXI_READY_GEN_RANDOM);
  rgen.set_low_time_range(0,12);
  rgen.set_high_time_range(1,12);
  rgen.set_event_count_range(3,5);
  m00_axi.wr_driver.set_wready_gen(rgen);

  rgen = new("m01_axi_random_backpressure_wready");
  rgen.set_ready_policy(XIL_AXI_READY_GEN_RANDOM);
  rgen.set_low_time_range(0,12);
  rgen.set_high_time_range(1,12);
  rgen.set_event_count_range(3,5);
  m01_axi.wr_driver.set_wready_gen(rgen);

endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, force the memory model to not insert any inter-beat
// gaps on the READ channel.
task automatic slv_no_delay_rvalid();
  $display("%t - Applying slv_no_delay_rvalid", $time);

  m00_axi.mem_model.set_inter_beat_gap_delay_policy(XIL_AXI_MEMORY_DELAY_FIXED);
  m00_axi.mem_model.set_inter_beat_gap(0);

  m01_axi.mem_model.set_inter_beat_gap_delay_policy(XIL_AXI_MEMORY_DELAY_FIXED);
  m01_axi.mem_model.set_inter_beat_gap(0);

endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the connected slave interfaces, Allow the memory model to insert any inter-beat
// gaps on the READ channel.
task automatic slv_random_delay_rvalid();
  $display("%t - Applying slv_random_delay_rvalid", $time);

  m00_axi.mem_model.set_inter_beat_gap_delay_policy(XIL_AXI_MEMORY_DELAY_RANDOM);
  m00_axi.mem_model.set_inter_beat_gap_range(0,10);

  m01_axi.mem_model.set_inter_beat_gap_delay_policy(XIL_AXI_MEMORY_DELAY_RANDOM);
  m01_axi.mem_model.set_inter_beat_gap_range(0,10);

endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
// Check to ensure, following reset the value of the register is 0.
// Check that only the width of the register bits can be written.
task automatic check_register_value(input bit [31:0] addr_in, input integer unsigned register_width, output bit error_found);
  bit [31:0] rddata;
  bit [31:0] mask_data;
  error_found = 0;
  if (register_width < 32) begin
    mask_data = (1 << register_width) - 1;
  end else begin
    mask_data = 32'hffffffff;
  end
  read_register(addr_in, rddata);
  if (rddata != 32'h0) begin
    $error("Initial value mismatch: A:0x%0x : Expected 0x%x -> Got 0x%x", addr_in, 0, rddata);
    error_found = 1;
  end
  blocking_write_register(addr_in, 32'hffffffff);
  read_register(addr_in, rddata);
  if (rddata != mask_data) begin
    $error("Initial value mismatch: A:0x%0x : Expected 0x%x -> Got 0x%x", addr_in, mask_data, rddata);
    error_found = 1;
  end
endtask


/////////////////////////////////////////////////////////////////////////////////////////////////
// For each of the scalar registers, check:
// * reset value
// * correct number bits set on a write
task automatic check_scalar_registers(output bit error_found);
  bit tmp_error_found = 0;
  error_found = 0;
  $display("%t : Checking post reset values of scalar registers", $time);

  ///////////////////////////////////////////////////////////////////////////
  //Check ID 0: nnz_expct (0x010)
  check_register_value(32'h010, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Check ID 1: mat_size (0x018)
  check_register_value(32'h018, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Check ID 2: vec_size (0x020)
  check_register_value(32'h020, 32, tmp_error_found);
  error_found |= tmp_error_found;

endtask

task automatic set_scalar_registers();
  $display("%t : Setting Scalar Registers registers", $time);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 0: nnz_expct (0x010) -> 32'hffffffff (scalar)
  write_register(32'h010, 2);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 1: mat_size (0x018) -> 32'hffffffff (scalar)
  write_register(32'h018, 12072);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 2: vec_size (0x020) -> 32'hffffffff (scalar)
  write_register(32'h020, 128);

endtask

task automatic check_pointer_registers(output bit error_found);
  bit tmp_error_found = 0;
  ///////////////////////////////////////////////////////////////////////////
  //Check the reset states of the pointer registers.
  $display("%t : Checking post reset values of pointer registers", $time);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 3: matrix0 (0x028)
  check_register_value(32'h028, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 3: matrix0 (0x02c)
  check_register_value(32'h02c, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 4: x (0x034)
  check_register_value(32'h034, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 4: x (0x038)
  check_register_value(32'h038, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 5: y (0x040)
  check_register_value(32'h040, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 5: y (0x044)
  check_register_value(32'h044, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 6: matrix1 (0x04c)
  check_register_value(32'h04c, 32, tmp_error_found);
  error_found |= tmp_error_found;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 6: matrix1 (0x050)
  check_register_value(32'h050, 32, tmp_error_found);
  error_found |= tmp_error_found;

endtask

task automatic set_memory_pointers();
  ///////////////////////////////////////////////////////////////////////////
  //Randomly generate memory pointers.
  matrix0_ptr = get_random_ptr();
  x_ptr = 64'h0000FFFFAAAA0000; //get_random_ptr();
  y_ptr = x_ptr + 1024*8;        //8K gap between address spaces
  matrix1_ptr = y_ptr + 1024*8;

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 3: matrix0 (0x028) -> Randomized 4k aligned address (Global memory, lower 32 bits)
  write_register(32'h028, matrix0_ptr[31:0]);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 3: matrix0 (0x02c) -> Randomized 4k aligned address (Global memory, upper 32 bits)
  write_register(32'h02c, matrix0_ptr[63:32]);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 4: x (0x034) -> Randomized 4k aligned address (Global memory, lower 32 bits)
  write_register(32'h034, matrix1_ptr[31:0]);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 4: x (0x038) -> Randomized 4k aligned address (Global memory, upper 32 bits)
  write_register(32'h038, matrix1_ptr[63:32]);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 5: y (0x040) -> Randomized 4k aligned address (Global memory, lower 32 bits)
  write_register(32'h040, x_ptr[31:0]);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 5: y (0x044) -> Randomized 4k aligned address (Global memory, upper 32 bits)
  write_register(32'h044, x_ptr[63:32]);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 6: matrix1 (0x04c) -> Randomized 4k aligned address (Global memory, lower 32 bits)
  write_register(32'h04c, y_ptr[31:0]);

  ///////////////////////////////////////////////////////////////////////////
  //Write ID 6: matrix1 (0x050) -> Randomized 4k aligned address (Global memory, upper 32 bits)
  write_register(32'h050, y_ptr[63:32]);

endtask

task automatic backdoor_fill_memories();

  /////////////////////////////////////////////////////////////////////////////////////////////////
  // Backdoor fill the memory with the content.
  m00_axi_fill_memory(matrix0_ptr, LP_MAX_LENGTH);

  /////////////////////////////////////////////////////////////////////////////////////////////////
  // Backdoor fill the memory with the content.
  m01_axi_fill_memory(x_ptr, matrix1_ptr, LP_MAX_LENGTH);

endtask



bit choose_pressure_type = 0;
bit axis_choose_pressure_type = 0;
bit [0-1:0] axis_tlast_received;

bit [31:0] y_val;
real y_real;
real golden[0:127]; 
real error;
/////////////////////////////////////////////////////////////////////////////////////////////////
// Set up the kernel for operation and set the kernel START bit.
// The task will poll the DONE bit and check the results when complete.
task automatic multiple_iteration(input integer unsigned num_iterations, output bit error_found);
  error_found = 0;

  $display("Starting: multiple_iteration");
  for (integer unsigned iter = 0; iter < num_iterations; iter++) begin

    
    $display("Starting iteration: %d / %d", iter+1, num_iterations);
    slv_no_backpressure_wready();
    slv_no_delay_rvalid();


    set_scalar_registers();
    set_memory_pointers();
    backdoor_fill_memories();
    // Check that Kernel is IDLE before starting.
    poll_idle_register();
    ///////////////////////////////////////////////////////////////////////////
    //Start transfers
    blocking_write_register(KRNL_CTRL_REG_ADDR, CTRL_START_MASK);

    ctrl.wait_drivers_idle();
    ///////////////////////////////////////////////////////////////////////////
    //Wait for interrupt being asserted or poll done register
    poll_done_register();

    ///////////////////////////////////////////////////////////////////////////
    //error_found |= check_kernel_result()   ;

    $display("Finished iteration: %d / %d", iter+1, num_iterations);
 /*   $display("URAM 0 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_0.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    $display("URAM 1 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_1.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    $display("URAM 2 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_2.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    $display("URAM 3 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_3.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    $display("URAM 4 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_4.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    $display("URAM 5 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_5.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    $display("URAM 6 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_6.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    $display("URAM 7 : %p",spmv_tb.inst_dut.spmv_bd_i.ACC.ACC_7.U0.process_U0.bvb_U.process_r_bvb_ram_U.ram);
    */
    
    
    
    //error = 0;
    for (integer unsigned i = 0; i < 128; i++) begin
    //y_val = m01_axi.mem_model.backdoor_memory_read_4byte(y_ptr);
        y_real = $bitstoshortreal(m01_axi.mem_model.backdoor_memory_read_4byte(y_ptr+(i*4)));
    //$display("y_val: %h", y_val);
        //$display("%0.0f", y_real);
        if(y_real != golden[i])
        begin
            error_found = 1;
            $display("Result mismatch at %d index, golden = %0.0f, result = %0.0f", i, y_real, golden[i]);
        end    
        //if(y_real == golden[i])
        //    $display("pass");
        //else
        //    $display("fail");
             
    end
    
    if(error_found == 0)
        $display("TEST SUCCESS!");
    else
        $display("TEST FAIL!");
    

  end
 endtask

/////////////////////////////////////////////////////////////////////////////////////////////////
//Instantiate AXI4 LITE VIP
initial begin : STIMULUS
  #200000;
  start_vips();
  check_scalar_registers(error_found);
  if (error_found == 1) begin
    $display( "Test Failed!");
    $finish();
  end

  check_pointer_registers(error_found);
  if (error_found == 1) begin
    $display( "Test Failed!");
    $finish();
  end
  
  //golden = '{550,550,539,550,517,550,353,538,510,548,457,501,306,452,347,535,506,440,291,484,536,522,428,497,408,503,550,417,541,510,478,444,320,496,511,522,543,544,550,495,317,550,331,250,227,267,332,392,239,67,300,321,239,293,286,536,492,390,308,336,424,459,467,313,260,523,353,507,395,362,498,503,470,494,357,415,490,501,439,456,445,265,400,297,532,540,433,460,376,485,291,533,354,331,335,315,470,438,475,341,403,485,529,456,301,443,477,348,477,310,533,547,550,546,514,548,399,538,550,548,548,548,525,254,0,0,0,0};
  
  golden = '{32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,0,0,0,0};



  multiple_iteration(2, error_found);
  if (error_found == 1) begin
    $display( "Test Failed!");
    $finish();
  end
  else 
    $display( "Test completed successfully");
 
  $finish;
end

endmodule
`default_nettype wire



