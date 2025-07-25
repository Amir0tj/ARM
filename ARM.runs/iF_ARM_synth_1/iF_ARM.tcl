# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
set_param project.vivado.isBlockSynthRun true
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir E:/ARM/ARM/ARM.cache/wt [current_project]
set_property parent.project_path E:/ARM/ARM/ARM.xpr [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo e:/ARM/ARM/ARM.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib {
  C:/Users/amiri/OneDrive/Desktop/Adder.v
  C:/Users/amiri/OneDrive/Desktop/MUX2to1.v
  C:/Users/amiri/OneDrive/Desktop/REG.v
}
add_files E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM.bd
set_property used_in_implementation false [get_files -all e:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/ip/iF_ARM_blk_mem_gen_2_1/iF_ARM_blk_mem_gen_2_1_ooc.xdc]
set_property used_in_implementation false [get_files -all E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top iF_ARM -part xc7z010clg400-1 -mode out_of_context

rename_ref -prefix_all iF_ARM_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef iF_ARM.dcp
create_report "iF_ARM_synth_1_synth_report_utilization_0" "report_utilization -file iF_ARM_utilization_synth.rpt -pb iF_ARM_utilization_synth.pb"

if { [catch {
  file copy -force E:/ARM/ARM/ARM.runs/iF_ARM_synth_1/iF_ARM.dcp E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if {[file isdir E:/ARM/ARM/ARM.ip_user_files/bd/iF_ARM]} {
  catch { 
    file copy -force E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_stub.v E:/ARM/ARM/ARM.ip_user_files/bd/iF_ARM
  }
}

if {[file isdir E:/ARM/ARM/ARM.ip_user_files/bd/iF_ARM]} {
  catch { 
    file copy -force E:/ARM/ARM/ARM.srcs/sources_1/bd/iF_ARM/iF_ARM_stub.vhdl E:/ARM/ARM/ARM.ip_user_files/bd/iF_ARM
  }
}
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
