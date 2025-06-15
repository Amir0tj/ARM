
################################################################
# This is a generated script based on design: ARM_amir
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source ARM_amir_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# EXE_Stage_Reg, HazardUnit, ID_Stage_Reg, IF_Stage_Reg, MEM_Stage_Reg, StatusRegister, mux2to1_32bit, ALU, Adder, OR, Val2Generate, ConditionCheck, ControlUnit, Not, Not, OR, OR, RegisterFile, mux2to1_4bit, mux2to1_9bit, Adder, MUX2to1, Not, REG

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z010clg400-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name ARM_amir

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: IF_STAGE
proc create_hier_cell_IF_STAGE { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_IF_STAGE() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I B
  create_bd_pin -dir I -from 31 -to 0 B_Addr
  create_bd_pin -dir I Freeze
  create_bd_pin -dir I -type clk clk_0
  create_bd_pin -dir O -from 31 -to 0 instruction
  create_bd_pin -dir O -from 31 -to 0 pc
  create_bd_pin -dir I -type rst rst_0

  # Create instance: Adder_0, and set properties
  set block_name Adder
  set block_cell_name Adder_0
  if { [catch {set Adder_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Adder_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: MUX2to1_0, and set properties
  set block_name MUX2to1
  set block_cell_name MUX2to1_0
  if { [catch {set MUX2to1_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MUX2to1_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Not_0, and set properties
  set block_name Not
  set block_cell_name Not_0
  if { [catch {set Not_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Not_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: REG_0, and set properties
  set block_name REG
  set block_cell_name REG_0
  if { [catch {set REG_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $REG_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: dist_mem_gen_0, and set properties
  set dist_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:dist_mem_gen:8.0 dist_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.coefficient_file {c:/Users/amiri/OneDrive/Desktop/output.coe} \
   CONFIG.data_width {32} \
   CONFIG.depth {8192} \
   CONFIG.memory_type {rom} \
 ] $dist_mem_gen_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_WIDTH {32} \
 ] $xlconstant_0

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {12} \
   CONFIG.DOUT_WIDTH {13} \
 ] $xlslice_0

  # Create port connections
  connect_bd_net -net Adder_0_out [get_bd_pins pc] [get_bd_pins Adder_0/out] [get_bd_pins MUX2to1_0/in1]
  connect_bd_net -net Freeze_1 [get_bd_pins Freeze] [get_bd_pins Not_0/IN]
  connect_bd_net -net MUX2to1_0_out [get_bd_pins MUX2to1_0/out] [get_bd_pins REG_0/in]
  connect_bd_net -net Not_0_OUT [get_bd_pins Not_0/OUT] [get_bd_pins REG_0/enable]
  connect_bd_net -net REG_0_out [get_bd_pins Adder_0/in2] [get_bd_pins REG_0/out] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net clk_0_1 [get_bd_pins clk_0] [get_bd_pins REG_0/clk]
  connect_bd_net -net dist_mem_gen_0_spo [get_bd_pins instruction] [get_bd_pins dist_mem_gen_0/spo]
  connect_bd_net -net in2_0_1 [get_bd_pins B_Addr] [get_bd_pins MUX2to1_0/in2]
  connect_bd_net -net rst_0_1 [get_bd_pins rst_0] [get_bd_pins REG_0/rst]
  connect_bd_net -net select_0_1 [get_bd_pins B] [get_bd_pins MUX2to1_0/select]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins Adder_0/in1] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins dist_mem_gen_0/a] [get_bd_pins xlslice_0/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: ID_stage
proc create_hier_cell_ID_stage { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_ID_stage() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 B_out
  create_bd_pin -dir O -from 3 -to 0 EXE_CMD_out
  create_bd_pin -dir I Hazard
  create_bd_pin -dir O -from 0 -to 0 MEM_R_EN_out
  create_bd_pin -dir I MEM_W_EN
  create_bd_pin -dir O -from 0 -to 0 MEM_W_EN_out
  create_bd_pin -dir I -from 3 -to 0 Op_code
  create_bd_pin -dir I -from 3 -to 0 RD_in
  create_bd_pin -dir I -from 3 -to 0 RM_in
  create_bd_pin -dir I -from 3 -to 0 RN_in
  create_bd_pin -dir O -from 3 -to 0 Rm_Out
  create_bd_pin -dir I S_in
  create_bd_pin -dir O -from 0 -to 0 S_out
  create_bd_pin -dir O Two_src
  create_bd_pin -dir O -from 31 -to 0 Val_Rm
  create_bd_pin -dir O -from 31 -to 0 Val_Rn
  create_bd_pin -dir I -from 3 -to 0 WB_Dest_in
  create_bd_pin -dir O -from 0 -to 0 WB_EN_out
  create_bd_pin -dir I -from 31 -to 0 WB_Value_in
  create_bd_pin -dir I WB_WB_EN_in
  create_bd_pin -dir I -type clk clk_1
  create_bd_pin -dir I -from 3 -to 0 cond_in
  create_bd_pin -dir I imm
  create_bd_pin -dir I -from 1 -to 0 mode
  create_bd_pin -dir I -type rst rst_1
  create_bd_pin -dir I -from 3 -to 0 status_in

  # Create instance: ConditionCheck_0, and set properties
  set block_name ConditionCheck
  set block_cell_name ConditionCheck_0
  if { [catch {set ConditionCheck_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ConditionCheck_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ControlUnit_0, and set properties
  set block_name ControlUnit
  set block_cell_name ControlUnit_0
  if { [catch {set ControlUnit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ControlUnit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Not_0, and set properties
  set block_name Not
  set block_cell_name Not_0
  if { [catch {set Not_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Not_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Not_1, and set properties
  set block_name Not
  set block_cell_name Not_1
  if { [catch {set Not_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Not_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: OR_0, and set properties
  set block_name OR
  set block_cell_name OR_0
  if { [catch {set OR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $OR_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: OR_1, and set properties
  set block_name OR
  set block_cell_name OR_1
  if { [catch {set OR_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $OR_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: RegisterFile_0, and set properties
  set block_name RegisterFile
  set block_cell_name RegisterFile_0
  if { [catch {set RegisterFile_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $RegisterFile_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: mux2to1_4bit_0, and set properties
  set block_name mux2to1_4bit
  set block_cell_name mux2to1_4bit_0
  if { [catch {set mux2to1_4bit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mux2to1_4bit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: mux2to1_9bit_0, and set properties
  set block_name mux2to1_9bit
  set block_cell_name mux2to1_9bit_0
  if { [catch {set mux2to1_9bit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mux2to1_9bit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {4} \
   CONFIG.NUM_PORTS {6} \
 ] $xlconcat_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {9} \
 ] $xlconstant_0

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {3} \
   CONFIG.DIN_TO {0} \
   CONFIG.DIN_WIDTH {9} \
   CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {4} \
   CONFIG.DIN_TO {4} \
   CONFIG.DIN_WIDTH {9} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {5} \
   CONFIG.DIN_TO {5} \
   CONFIG.DIN_WIDTH {9} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {6} \
   CONFIG.DIN_TO {6} \
   CONFIG.DIN_WIDTH {9} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_3

  # Create instance: xlslice_4, and set properties
  set xlslice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_4 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {7} \
   CONFIG.DIN_TO {7} \
   CONFIG.DIN_WIDTH {9} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {8} \
   CONFIG.DIN_TO {8} \
   CONFIG.DIN_WIDTH {9} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_5

  # Create port connections
  connect_bd_net -net ConditionCheck_0_cond_out [get_bd_pins ConditionCheck_0/cond_out] [get_bd_pins Not_0/IN]
  connect_bd_net -net ControlUnit_0_B [get_bd_pins ControlUnit_0/B] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net ControlUnit_0_Execute_Command [get_bd_pins ControlUnit_0/Execute_Command] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net ControlUnit_0_S_out [get_bd_pins ControlUnit_0/S_out] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net ControlUnit_0_WB_Enable [get_bd_pins ControlUnit_0/WB_Enable] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net ControlUnit_0_mem_read [get_bd_pins ControlUnit_0/mem_read] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net ControlUnit_0_mem_write [get_bd_pins ControlUnit_0/mem_write] [get_bd_pins mux2to1_4bit_0/sel] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net Dest_wb_0_1 [get_bd_pins WB_Dest_in] [get_bd_pins RegisterFile_0/Dest_wb]
  connect_bd_net -net IN_0_1 [get_bd_pins imm] [get_bd_pins Not_1/IN]
  connect_bd_net -net Not_0_OUT [get_bd_pins Not_0/OUT] [get_bd_pins OR_0/a]
  connect_bd_net -net Not_1_OUT [get_bd_pins Not_1/OUT] [get_bd_pins OR_1/a]
  connect_bd_net -net OR_0_y [get_bd_pins OR_0/y] [get_bd_pins mux2to1_9bit_0/sel]
  connect_bd_net -net OR_1_y [get_bd_pins Two_src] [get_bd_pins OR_1/y]
  connect_bd_net -net Op_code_0_1 [get_bd_pins Op_code] [get_bd_pins ControlUnit_0/Op_code]
  connect_bd_net -net RD_in_1 [get_bd_pins RD_in] [get_bd_pins mux2to1_4bit_0/in1]
  connect_bd_net -net RM_in_1 [get_bd_pins RM_in] [get_bd_pins mux2to1_4bit_0/in0]
  connect_bd_net -net RegisterFile_0_reg1 [get_bd_pins Val_Rn] [get_bd_pins RegisterFile_0/reg1]
  connect_bd_net -net RegisterFile_0_reg2 [get_bd_pins Val_Rm] [get_bd_pins RegisterFile_0/reg2]
  connect_bd_net -net Result_WB_0_1 [get_bd_pins WB_Value_in] [get_bd_pins RegisterFile_0/Result_WB]
  connect_bd_net -net S_0_1 [get_bd_pins S_in] [get_bd_pins ControlUnit_0/S]
  connect_bd_net -net b_0_1 [get_bd_pins Hazard] [get_bd_pins OR_0/b]
  connect_bd_net -net b_1_1 [get_bd_pins MEM_W_EN] [get_bd_pins OR_1/b]
  connect_bd_net -net clk_1_1 [get_bd_pins clk_1] [get_bd_pins RegisterFile_0/clk]
  connect_bd_net -net cond_in_0_1 [get_bd_pins cond_in] [get_bd_pins ConditionCheck_0/cond_in]
  connect_bd_net -net mode_0_1 [get_bd_pins mode] [get_bd_pins ControlUnit_0/mode]
  connect_bd_net -net mux2to1_4bit_0_out [get_bd_pins Rm_Out] [get_bd_pins RegisterFile_0/src2] [get_bd_pins mux2to1_4bit_0/out]
  connect_bd_net -net mux2to1_9bit_0_out [get_bd_pins mux2to1_9bit_0/out] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din]
  connect_bd_net -net rst_1_1 [get_bd_pins rst_1] [get_bd_pins RegisterFile_0/rst]
  connect_bd_net -net src1_0_1 [get_bd_pins RN_in] [get_bd_pins RegisterFile_0/src1]
  connect_bd_net -net status_in_0_1 [get_bd_pins status_in] [get_bd_pins ConditionCheck_0/status_in]
  connect_bd_net -net writeBackEn_0_1 [get_bd_pins WB_WB_EN_in] [get_bd_pins RegisterFile_0/writeBackEn]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins mux2to1_9bit_0/in0] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins mux2to1_9bit_0/in1] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins EXE_CMD_out] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins MEM_R_EN_out] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_2_Dout [get_bd_pins WB_EN_out] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net xlslice_3_Dout [get_bd_pins B_out] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_4_Dout [get_bd_pins MEM_W_EN_out] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net xlslice_5_Dout [get_bd_pins S_out] [get_bd_pins xlslice_5/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: EXE_Stage
proc create_hier_cell_EXE_Stage { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_EXE_Stage() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 31 -to 0 ALU_Res_0
  create_bd_pin -dir O -from 31 -to 0 B_Addr
  create_bd_pin -dir I -from 3 -to 0 EXE_CMD_in_1
  create_bd_pin -dir I I_in_0
  create_bd_pin -dir I V_in
  create_bd_pin -dir I -from 31 -to 0 Val1_in_0
  create_bd_pin -dir I -from 31 -to 0 Val_Rm_in_0
  create_bd_pin -dir I a_0
  create_bd_pin -dir I b_0
  create_bd_pin -dir I -from 31 -to 0 in1_0
  create_bd_pin -dir I -from 23 -to 0 in2_1
  create_bd_pin -dir I -from 11 -to 0 shift_operand_in_0
  create_bd_pin -dir O -from 3 -to 0 status_out_0

  # Create instance: ALU_0, and set properties
  set block_name ALU
  set block_cell_name ALU_0
  if { [catch {set ALU_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ALU_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Adder_0, and set properties
  set block_name Adder
  set block_cell_name Adder_0
  if { [catch {set Adder_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Adder_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: OR_0, and set properties
  set block_name OR
  set block_cell_name OR_0
  if { [catch {set OR_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $OR_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Val2Generate_0, and set properties
  set block_name Val2Generate
  set block_cell_name Val2Generate_0
  if { [catch {set Val2Generate_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Val2Generate_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net ALU_0_ALU_Res [get_bd_pins ALU_Res_0] [get_bd_pins ALU_0/ALU_Res]
  connect_bd_net -net ALU_0_status_out [get_bd_pins status_out_0] [get_bd_pins ALU_0/status_out]
  connect_bd_net -net Adder_0_out [get_bd_pins B_Addr] [get_bd_pins Adder_0/out]
  connect_bd_net -net EXE_CMD_in_1_1 [get_bd_pins EXE_CMD_in_1] [get_bd_pins ALU_0/EXE_CMD_in]
  connect_bd_net -net I_in_0_1 [get_bd_pins I_in_0] [get_bd_pins Val2Generate_0/imm]
  connect_bd_net -net OR_0_y [get_bd_pins OR_0/y] [get_bd_pins Val2Generate_0/Out_or]
  connect_bd_net -net Val1_in_0_1 [get_bd_pins Val1_in_0] [get_bd_pins ALU_0/Val1_in]
  connect_bd_net -net Val2Generate_0_Val2 [get_bd_pins ALU_0/Val2_in] [get_bd_pins Val2Generate_0/Val2]
  connect_bd_net -net Val_Rm_in_0_1 [get_bd_pins Val_Rm_in_0] [get_bd_pins Val2Generate_0/Val_Rm]
  connect_bd_net -net a_0_1 [get_bd_pins a_0] [get_bd_pins OR_0/a]
  connect_bd_net -net b_0_2 [get_bd_pins b_0] [get_bd_pins OR_0/b]
  connect_bd_net -net in1_0_1 [get_bd_pins in1_0] [get_bd_pins Adder_0/in1]
  connect_bd_net -net in2_1_1 [get_bd_pins in2_1] [get_bd_pins Adder_0/in2]
  connect_bd_net -net shift_operand_in_0_1 [get_bd_pins shift_operand_in_0] [get_bd_pins Val2Generate_0/Shift_operand]
  connect_bd_net -net status_in_2_1 [get_bd_pins V_in] [get_bd_pins ALU_0/status_in]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set clk_1 [ create_bd_port -dir I -type clk clk_1 ]
  set rst_1 [ create_bd_port -dir I -type rst rst_1 ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $rst_1

  # Create instance: EXE_Stage
  create_hier_cell_EXE_Stage [current_bd_instance .] EXE_Stage

  # Create instance: EXE_Stage_Reg, and set properties
  set block_name EXE_Stage_Reg
  set block_cell_name EXE_Stage_Reg
  if { [catch {set EXE_Stage_Reg [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $EXE_Stage_Reg eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /EXE_Stage_Reg/rst]

  # Create instance: HazardUnit_0, and set properties
  set block_name HazardUnit
  set block_cell_name HazardUnit_0
  if { [catch {set HazardUnit_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $HazardUnit_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ID_Stage_Reg, and set properties
  set block_name ID_Stage_Reg
  set block_cell_name ID_Stage_Reg
  if { [catch {set ID_Stage_Reg [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $ID_Stage_Reg eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /ID_Stage_Reg/rst]

  # Create instance: ID_stage
  create_hier_cell_ID_stage [current_bd_instance .] ID_stage

  # Create instance: IF_STAGE
  create_hier_cell_IF_STAGE [current_bd_instance .] IF_STAGE

  # Create instance: IF_Stage_Reg, and set properties
  set block_name IF_Stage_Reg
  set block_cell_name IF_Stage_Reg
  if { [catch {set IF_Stage_Reg [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $IF_Stage_Reg eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /IF_Stage_Reg/rst]

  # Create instance: MEM_Stage, and set properties
  set MEM_Stage [ create_bd_cell -type ip -vlnv xilinx.com:ip:dist_mem_gen:8.0 MEM_Stage ]
  set_property -dict [ list \
   CONFIG.coefficient_file {c:/Users/amiri/OneDrive/Desktop/output.coe} \
   CONFIG.data_width {32} \
   CONFIG.depth {8192} \
 ] $MEM_Stage

  # Create instance: MEM_Stage_Reg, and set properties
  set block_name MEM_Stage_Reg
  set block_cell_name MEM_Stage_Reg
  if { [catch {set MEM_Stage_Reg [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $MEM_Stage_Reg eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /MEM_Stage_Reg/rst]

  # Create instance: StatusRegister_0, and set properties
  set block_name StatusRegister
  set block_cell_name StatusRegister_0
  if { [catch {set StatusRegister_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $StatusRegister_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] [get_bd_pins /StatusRegister_0/rst]

  # Create instance: mux2to1_32bit, and set properties
  set block_name mux2to1_32bit
  set block_cell_name mux2to1_32bit
  if { [catch {set mux2to1_32bit [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $mux2to1_32bit eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {31} \
   CONFIG.DIN_TO {28} \
   CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_0

  # Create instance: xlslice_1, and set properties
  set xlslice_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_1 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {27} \
   CONFIG.DIN_TO {26} \
   CONFIG.DOUT_WIDTH {2} \
 ] $xlslice_1

  # Create instance: xlslice_2, and set properties
  set xlslice_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_2 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {25} \
   CONFIG.DIN_TO {25} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_2

  # Create instance: xlslice_3, and set properties
  set xlslice_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_3 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {24} \
   CONFIG.DIN_TO {21} \
   CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_3

  # Create instance: xlslice_4, and set properties
  set xlslice_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_4 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {20} \
   CONFIG.DIN_TO {20} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_4

  # Create instance: xlslice_5, and set properties
  set xlslice_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_5 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {19} \
   CONFIG.DIN_TO {16} \
   CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_5

  # Create instance: xlslice_6, and set properties
  set xlslice_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_6 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {15} \
   CONFIG.DIN_TO {12} \
   CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_6

  # Create instance: xlslice_7, and set properties
  set xlslice_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_7 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {11} \
   CONFIG.DOUT_WIDTH {12} \
 ] $xlslice_7

  # Create instance: xlslice_8, and set properties
  set xlslice_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_8 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {3} \
   CONFIG.DIN_TO {0} \
   CONFIG.DIN_WIDTH {12} \
   CONFIG.DOUT_WIDTH {4} \
 ] $xlslice_8

  # Create instance: xlslice_12, and set properties
  set xlslice_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_12 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {23} \
   CONFIG.DOUT_WIDTH {24} \
 ] $xlslice_12

  # Create instance: xlslice_14, and set properties
  set xlslice_14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_14 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {12} \
   CONFIG.DIN_TO {0} \
   CONFIG.DIN_WIDTH {32} \
   CONFIG.DOUT_WIDTH {13} \
 ] $xlslice_14

  # Create instance: xlslice_15, and set properties
  set xlslice_15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_15 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {3} \
   CONFIG.DIN_TO {3} \
   CONFIG.DIN_WIDTH {4} \
   CONFIG.DOUT_WIDTH {1} \
 ] $xlslice_15

  # Create port connections
  connect_bd_net -net EXE_Stage_ALU_Res_0 [get_bd_pins EXE_Stage/ALU_Res_0] [get_bd_pins EXE_Stage_Reg/ALU_Res_in]
  connect_bd_net -net EXE_Stage_B_Addr [get_bd_pins EXE_Stage/B_Addr] [get_bd_pins IF_STAGE/B_Addr]
  connect_bd_net -net EXE_Stage_Reg_0_ALU_Res_out [get_bd_pins EXE_Stage_Reg/ALU_Res_out] [get_bd_pins MEM_Stage_Reg/ALU_Res_in] [get_bd_pins xlslice_14/Din]
  connect_bd_net -net EXE_Stage_Reg_0_Dest_out [get_bd_pins EXE_Stage_Reg/Dest_out] [get_bd_pins HazardUnit_0/MEM_Dest] [get_bd_pins MEM_Stage_Reg/Dest_in]
  connect_bd_net -net EXE_Stage_Reg_0_MEM_R_EN_out [get_bd_pins EXE_Stage_Reg/MEM_R_EN_out] [get_bd_pins MEM_Stage_Reg/MEM_R_EN_in]
  connect_bd_net -net EXE_Stage_Reg_0_Val_Rm_out [get_bd_pins EXE_Stage_Reg/Val_Rm_out] [get_bd_pins MEM_Stage/d]
  connect_bd_net -net EXE_Stage_Reg_MEM_W_EN_out [get_bd_pins EXE_Stage_Reg/MEM_W_EN_out] [get_bd_pins MEM_Stage/we]
  connect_bd_net -net EXE_Stage_Reg_WB_EN_out [get_bd_pins EXE_Stage_Reg/WB_EN_out] [get_bd_pins HazardUnit_0/MEM_WB_EN] [get_bd_pins MEM_Stage_Reg/WB_EN_in]
  connect_bd_net -net EXE_Stage_status_out_0 [get_bd_pins EXE_Stage/status_out_0] [get_bd_pins StatusRegister_0/status_in]
  connect_bd_net -net HazardUnit_0_Hazard_out [get_bd_pins HazardUnit_0/Hazard_out] [get_bd_pins ID_stage/Hazard] [get_bd_pins IF_STAGE/Freeze] [get_bd_pins IF_Stage_Reg/freeze]
  connect_bd_net -net ID_Stage_Reg_0_B_out [get_bd_pins ID_Stage_Reg/B_out] [get_bd_pins ID_Stage_Reg/clr] [get_bd_pins IF_STAGE/B] [get_bd_pins IF_Stage_Reg/flush]
  connect_bd_net -net ID_Stage_Reg_0_EXE_CMD_out [get_bd_pins EXE_Stage/EXE_CMD_in_1] [get_bd_pins ID_Stage_Reg/EXE_CMD_out]
  connect_bd_net -net ID_Stage_Reg_0_I_out [get_bd_pins EXE_Stage/I_in_0] [get_bd_pins ID_Stage_Reg/I_out]
  connect_bd_net -net ID_Stage_Reg_0_Imm24_out [get_bd_pins EXE_Stage/in2_1] [get_bd_pins ID_Stage_Reg/Imm24_out]
  connect_bd_net -net ID_Stage_Reg_0_MEM_R_EN_out [get_bd_pins EXE_Stage/a_0] [get_bd_pins ID_Stage_Reg/MEM_R_EN_out]
  connect_bd_net -net ID_Stage_Reg_0_MEM_W_EN_out [get_bd_pins EXE_Stage/b_0] [get_bd_pins EXE_Stage_Reg/MEM_W_EN_in] [get_bd_pins ID_Stage_Reg/MEM_W_EN_out]
  connect_bd_net -net ID_Stage_Reg_0_PC_out [get_bd_pins EXE_Stage/in1_0] [get_bd_pins ID_Stage_Reg/PC_out]
  connect_bd_net -net ID_Stage_Reg_0_S_out [get_bd_pins ID_Stage_Reg/S_out] [get_bd_pins StatusRegister_0/S_in]
  connect_bd_net -net ID_Stage_Reg_0_Val_Rm_out [get_bd_pins EXE_Stage/Val_Rm_in_0] [get_bd_pins ID_Stage_Reg/Val_Rm_out]
  connect_bd_net -net ID_Stage_Reg_0_Val_Rn_out [get_bd_pins EXE_Stage/Val1_in_0] [get_bd_pins ID_Stage_Reg/Val_Rn_out]
  connect_bd_net -net ID_Stage_Reg_0_shift_operand_out [get_bd_pins EXE_Stage/shift_operand_in_0] [get_bd_pins ID_Stage_Reg/shift_operand_out]
  connect_bd_net -net ID_Stage_Reg_Dest_out [get_bd_pins EXE_Stage_Reg/Dest_in] [get_bd_pins HazardUnit_0/EXE_Dest] [get_bd_pins ID_Stage_Reg/Dest_out]
  connect_bd_net -net ID_Stage_Reg_WB_EN_out [get_bd_pins EXE_Stage_Reg/WB_EN_in] [get_bd_pins HazardUnit_0/EXE_WB_EN] [get_bd_pins ID_Stage_Reg/WB_EN_out]
  connect_bd_net -net ID_Stage_Reg_status_out [get_bd_pins ID_Stage_Reg/status_out] [get_bd_pins xlslice_15/Din]
  connect_bd_net -net ID_stage_B_out [get_bd_pins ID_Stage_Reg/B_in] [get_bd_pins ID_stage/B_out]
  connect_bd_net -net ID_stage_EXE_CMD_out [get_bd_pins ID_Stage_Reg/EXE_CMD_in] [get_bd_pins ID_stage/EXE_CMD_out]
  connect_bd_net -net ID_stage_MEM_R_EN_out [get_bd_pins EXE_Stage_Reg/MEM_R_EN_in] [get_bd_pins ID_Stage_Reg/MEM_R_EN_in] [get_bd_pins ID_stage/MEM_R_EN_out]
  connect_bd_net -net ID_stage_Rm_Out [get_bd_pins HazardUnit_0/src2_in] [get_bd_pins ID_stage/Rm_Out]
  connect_bd_net -net ID_stage_S_out [get_bd_pins ID_Stage_Reg/S_in] [get_bd_pins ID_stage/S_out]
  connect_bd_net -net ID_stage_Two_src [get_bd_pins HazardUnit_0/Two_src] [get_bd_pins ID_stage/Two_src]
  connect_bd_net -net ID_stage_Val_Rm [get_bd_pins EXE_Stage_Reg/Val_Rm_in] [get_bd_pins ID_Stage_Reg/Val_Rm_in] [get_bd_pins ID_stage/Val_Rm]
  connect_bd_net -net ID_stage_Val_Rn [get_bd_pins ID_Stage_Reg/Val_Rn_in] [get_bd_pins ID_stage/Val_Rn]
  connect_bd_net -net ID_stage_WB_EN_out [get_bd_pins ID_Stage_Reg/WB_EN_in] [get_bd_pins ID_stage/WB_EN_out]
  connect_bd_net -net IF_STAGE_instruction [get_bd_pins IF_STAGE/instruction] [get_bd_pins IF_Stage_Reg/Instruction_in]
  connect_bd_net -net IF_STAGE_pc [get_bd_pins IF_STAGE/pc] [get_bd_pins IF_Stage_Reg/PC_in]
  connect_bd_net -net IF_Stage_Reg_0_Instruction [get_bd_pins IF_Stage_Reg/Instruction] [get_bd_pins xlslice_0/Din] [get_bd_pins xlslice_1/Din] [get_bd_pins xlslice_12/Din] [get_bd_pins xlslice_2/Din] [get_bd_pins xlslice_3/Din] [get_bd_pins xlslice_4/Din] [get_bd_pins xlslice_5/Din] [get_bd_pins xlslice_6/Din] [get_bd_pins xlslice_7/Din]
  connect_bd_net -net IF_Stage_Reg_PC [get_bd_pins ID_Stage_Reg/PC_in] [get_bd_pins IF_Stage_Reg/PC]
  connect_bd_net -net MEM_Stage_Reg_0_Dest_out [get_bd_pins ID_stage/WB_Dest_in] [get_bd_pins MEM_Stage_Reg/Dest_out]
  connect_bd_net -net MEM_Stage_Reg_0_MEM_R_EN_out [get_bd_pins MEM_Stage_Reg/MEM_R_EN_out] [get_bd_pins mux2to1_32bit/sel]
  connect_bd_net -net MEM_Stage_Reg_0_WB_EN_out [get_bd_pins ID_stage/WB_WB_EN_in] [get_bd_pins MEM_Stage_Reg/WB_EN_out]
  connect_bd_net -net MEM_Stage_Reg_ALU_Res_out [get_bd_pins MEM_Stage_Reg/ALU_Res_out] [get_bd_pins mux2to1_32bit/in0]
  connect_bd_net -net MEM_Stage_Reg_Data_Mem_out [get_bd_pins MEM_Stage_Reg/Data_Mem_out] [get_bd_pins mux2to1_32bit/in1]
  create_bd_net MEM_W_EN_1
  connect_bd_net -net [get_bd_nets MEM_W_EN_1] [get_bd_pins ID_Stage_Reg/MEM_W_EN_in] [get_bd_pins ID_stage/MEM_W_EN] [get_bd_pins ID_stage/MEM_W_EN_out]
  connect_bd_net -net RD_in_1 [get_bd_pins ID_Stage_Reg/Dest_in] [get_bd_pins ID_stage/RD_in] [get_bd_pins xlslice_6/Dout]
  connect_bd_net -net RM_in_1 [get_bd_pins ID_stage/RM_in] [get_bd_pins xlslice_8/Dout]
  connect_bd_net -net RN_in_1 [get_bd_pins HazardUnit_0/Rn] [get_bd_pins ID_stage/RN_in] [get_bd_pins xlslice_5/Dout]
  connect_bd_net -net S_in_1 [get_bd_pins ID_stage/S_in] [get_bd_pins xlslice_4/Dout]
  connect_bd_net -net StatusRegister_0_status_out [get_bd_pins ID_Stage_Reg/status_in] [get_bd_pins ID_stage/status_in] [get_bd_pins StatusRegister_0/status_out]
  connect_bd_net -net V_in_1 [get_bd_pins EXE_Stage/V_in] [get_bd_pins xlslice_15/Dout]
  connect_bd_net -net WB_Value_in_1 [get_bd_pins ID_stage/WB_Value_in] [get_bd_pins mux2to1_32bit/out]
  connect_bd_net -net clk_1_1 [get_bd_ports clk_1] [get_bd_pins EXE_Stage_Reg/clk] [get_bd_pins ID_Stage_Reg/clk] [get_bd_pins ID_stage/clk_1] [get_bd_pins IF_STAGE/clk_0] [get_bd_pins IF_Stage_Reg/clk] [get_bd_pins MEM_Stage/clk] [get_bd_pins MEM_Stage_Reg/clk] [get_bd_pins StatusRegister_0/clk]
  connect_bd_net -net dist_mem_gen_0_spo [get_bd_pins MEM_Stage/spo] [get_bd_pins MEM_Stage_Reg/Data_Mem_in]
  connect_bd_net -net imm_1 [get_bd_pins ID_Stage_Reg/I_in] [get_bd_pins ID_stage/imm] [get_bd_pins xlslice_2/Dout]
  connect_bd_net -net rst_1_1 [get_bd_ports rst_1] [get_bd_pins EXE_Stage_Reg/rst] [get_bd_pins ID_Stage_Reg/rst] [get_bd_pins ID_stage/rst_1] [get_bd_pins IF_STAGE/rst_0] [get_bd_pins IF_Stage_Reg/rst] [get_bd_pins MEM_Stage_Reg/rst] [get_bd_pins StatusRegister_0/rst]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins EXE_Stage_Reg/en] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins EXE_Stage_Reg/clr] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlslice_0_Dout1 [get_bd_pins ID_stage/cond_in] [get_bd_pins xlslice_0/Dout]
  connect_bd_net -net xlslice_12_Dout [get_bd_pins ID_Stage_Reg/Imm24_in] [get_bd_pins xlslice_12/Dout]
  connect_bd_net -net xlslice_14_Dout [get_bd_pins MEM_Stage/a] [get_bd_pins xlslice_14/Dout]
  connect_bd_net -net xlslice_1_Dout1 [get_bd_pins ID_stage/mode] [get_bd_pins xlslice_1/Dout]
  connect_bd_net -net xlslice_3_Dout1 [get_bd_pins ID_stage/Op_code] [get_bd_pins xlslice_3/Dout]
  connect_bd_net -net xlslice_7_Dout [get_bd_pins ID_Stage_Reg/shift_operand_in] [get_bd_pins xlslice_7/Dout] [get_bd_pins xlslice_8/Din]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


