vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm
vlib questa_lib/msim/xlconstant_v1_1_5
vlib questa_lib/msim/blk_mem_gen_v8_4_2

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm
vmap xlconstant_v1_1_5 questa_lib/msim/xlconstant_v1_1_5
vmap blk_mem_gen_v8_4_2 questa_lib/msim/blk_mem_gen_v8_4_2

vlog -work xil_defaultlib -64 -sv \
"F:/viv/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"F:/viv/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 \
"../../../bd/iF_ARM/ip/iF_ARM_Adder_0_0/sim/iF_ARM_Adder_0_0.v" \
"../../../bd/iF_ARM/ip/iF_ARM_MUX2to1_0_0/sim/iF_ARM_MUX2to1_0_0.v" \
"../../../bd/iF_ARM/ip/iF_ARM_REG_0_0/sim/iF_ARM_REG_0_0.v" \

vlog -work xlconstant_v1_1_5 -64 \
"../../../../ARM.srcs/sources_1/bd/iF_ARM/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/iF_ARM/ip/iF_ARM_xlconstant_0_0/sim/iF_ARM_xlconstant_0_0.v" \

vlog -work blk_mem_gen_v8_4_2 -64 \
"../../../../ARM.srcs/sources_1/bd/iF_ARM/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib -64 \
"../../../bd/iF_ARM/ip/iF_ARM_blk_mem_gen_2_1/sim/iF_ARM_blk_mem_gen_2_1.v" \
"../../../bd/iF_ARM/sim/iF_ARM.v" \

vlog -work xil_defaultlib \
"glbl.v"

