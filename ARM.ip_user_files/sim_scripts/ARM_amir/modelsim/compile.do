vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xlconstant_v1_1_5
vlib modelsim_lib/msim/xlconcat_v2_1_1
vlib modelsim_lib/msim/xlslice_v1_0_1
vlib modelsim_lib/msim/dist_mem_gen_v8_0_12

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xlconstant_v1_1_5 modelsim_lib/msim/xlconstant_v1_1_5
vmap xlconcat_v2_1_1 modelsim_lib/msim/xlconcat_v2_1_1
vmap xlslice_v1_0_1 modelsim_lib/msim/xlslice_v1_0_1
vmap dist_mem_gen_v8_0_12 modelsim_lib/msim/dist_mem_gen_v8_0_12

vlog -work xil_defaultlib -64 -incr \
"../../../bd/ARM_amir/ip/ARM_amir_Adder_0_1/sim/ARM_amir_Adder_0_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_MUX2to1_0_1/sim/ARM_amir_MUX2to1_0_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_REG_0_1/sim/ARM_amir_REG_0_1.v" \

vlog -work xlconstant_v1_1_5 -64 -incr \
"../../../../ARM.srcs/sources_1/bd/ARM_amir/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/ARM_amir/ip/ARM_amir_xlconstant_0_1/sim/ARM_amir_xlconstant_0_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_ControlUnit_0_0/sim/ARM_amir_ControlUnit_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_ConditionCheck_0_0/sim/ARM_amir_ConditionCheck_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_OR_0_0/sim/ARM_amir_OR_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_OR_1_0/sim/ARM_amir_OR_1_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_RegisterFile_0_0/sim/ARM_amir_RegisterFile_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlconstant_0_2/sim/ARM_amir_xlconstant_0_2.v" \
"../../../bd/ARM_amir/ip/ARM_amir_mux2to1_9bit_0_0/sim/ARM_amir_mux2to1_9bit_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_mux2to1_4bit_0_0/sim/ARM_amir_mux2to1_4bit_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_Not_0_0/sim/ARM_amir_Not_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_Not_1_0/sim/ARM_amir_Not_1_0.v" \

vlog -work xlconcat_v2_1_1 -64 -incr \
"../../../../ARM.srcs/sources_1/bd/ARM_amir/ipshared/2f66/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/ARM_amir/ip/ARM_amir_xlconcat_0_0/sim/ARM_amir_xlconcat_0_0.v" \

vlog -work xlslice_v1_0_1 -64 -incr \
"../../../../ARM.srcs/sources_1/bd/ARM_amir/ipshared/f3db/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_0_0/sim/ARM_amir_xlslice_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_1_0/sim/ARM_amir_xlslice_1_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_2_0/sim/ARM_amir_xlslice_2_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_3_0/sim/ARM_amir_xlslice_3_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_4_0/sim/ARM_amir_xlslice_4_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_5_0/sim/ARM_amir_xlslice_5_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_0_1/sim/ARM_amir_xlslice_0_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_1_1/sim/ARM_amir_xlslice_1_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_2_1/sim/ARM_amir_xlslice_2_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_IF_Stage_Reg_0_0/sim/ARM_amir_IF_Stage_Reg_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_3_2/sim/ARM_amir_xlslice_3_2.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_4_2/sim/ARM_amir_xlslice_4_2.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_5_2/sim/ARM_amir_xlslice_5_2.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_6_0/sim/ARM_amir_xlslice_6_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_7_0/sim/ARM_amir_xlslice_7_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_8_0/sim/ARM_amir_xlslice_8_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_ID_Stage_Reg_0_5/sim/ARM_amir_ID_Stage_Reg_0_5.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_12_0/sim/ARM_amir_xlslice_12_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_Adder_0_3/sim/ARM_amir_Adder_0_3.v" \
"../../../bd/ARM_amir/ip/ARM_amir_OR_0_1/sim/ARM_amir_OR_0_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_ALU_0_0/sim/ARM_amir_ALU_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_Val2Generate_0_0/sim/ARM_amir_Val2Generate_0_0.v" \

vlog -work dist_mem_gen_v8_0_12 -64 -incr \
"../../../../ARM.srcs/sources_1/bd/ARM_amir/ipshared/d46a/simulation/dist_mem_gen_v8_0.v" \

vlog -work xil_defaultlib -64 -incr \
"../../../bd/ARM_amir/ip/ARM_amir_dist_mem_gen_0_1/sim/ARM_amir_dist_mem_gen_0_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_0_2/sim/ARM_amir_xlslice_0_2.v" \
"../../../bd/ARM_amir/ip/ARM_amir_EXE_Stage_Reg_0_2/sim/ARM_amir_EXE_Stage_Reg_0_2.v" \
"../../../bd/ARM_amir/ip/ARM_amir_dist_mem_gen_0_0/sim/ARM_amir_dist_mem_gen_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_14_0/sim/ARM_amir_xlslice_14_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_MEM_Stage_Reg_0_1/sim/ARM_amir_MEM_Stage_Reg_0_1.v" \
"../../../bd/ARM_amir/ip/ARM_amir_mux2to1_32bit_0_0/sim/ARM_amir_mux2to1_32bit_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_HazardUnit_0_0/sim/ARM_amir_HazardUnit_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_StatusRegister_0_0/sim/ARM_amir_StatusRegister_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlslice_15_0/sim/ARM_amir_xlslice_15_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlconstant_0_0/sim/ARM_amir_xlconstant_0_0.v" \
"../../../bd/ARM_amir/ip/ARM_amir_xlconstant_1_0/sim/ARM_amir_xlconstant_1_0.v" \
"../../../bd/ARM_amir/sim/ARM_amir.v" \
"../../../bd/ARM_amir/ip/ARM_amir_Not_0_1/sim/ARM_amir_Not_0_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

