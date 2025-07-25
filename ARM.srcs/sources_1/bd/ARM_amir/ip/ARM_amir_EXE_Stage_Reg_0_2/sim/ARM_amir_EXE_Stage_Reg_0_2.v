// (c) Copyright 1995-2025 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:EXE_Stage_Reg:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module ARM_amir_EXE_Stage_Reg_0_2 (
  clk,
  rst,
  en,
  clr,
  WB_EN_in,
  MEM_R_EN_in,
  MEM_W_EN_in,
  Dest_in,
  ALU_Res_in,
  Val_Rm_in,
  WB_EN_out,
  MEM_R_EN_out,
  MEM_W_EN_out,
  Dest_out,
  ALU_Res_out,
  Val_Rm_out
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, PHASE 0.000, CLK_DOMAIN ARM_amir_clk_1, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
input wire rst;
input wire en;
input wire clr;
input wire WB_EN_in;
input wire MEM_R_EN_in;
input wire MEM_W_EN_in;
input wire [3 : 0] Dest_in;
input wire [31 : 0] ALU_Res_in;
input wire [31 : 0] Val_Rm_in;
output wire WB_EN_out;
output wire MEM_R_EN_out;
output wire MEM_W_EN_out;
output wire [3 : 0] Dest_out;
output wire [31 : 0] ALU_Res_out;
output wire [31 : 0] Val_Rm_out;

  EXE_Stage_Reg inst (
    .clk(clk),
    .rst(rst),
    .en(en),
    .clr(clr),
    .WB_EN_in(WB_EN_in),
    .MEM_R_EN_in(MEM_R_EN_in),
    .MEM_W_EN_in(MEM_W_EN_in),
    .Dest_in(Dest_in),
    .ALU_Res_in(ALU_Res_in),
    .Val_Rm_in(Val_Rm_in),
    .WB_EN_out(WB_EN_out),
    .MEM_R_EN_out(MEM_R_EN_out),
    .MEM_W_EN_out(MEM_W_EN_out),
    .Dest_out(Dest_out),
    .ALU_Res_out(ALU_Res_out),
    .Val_Rm_out(Val_Rm_out)
  );
endmodule
