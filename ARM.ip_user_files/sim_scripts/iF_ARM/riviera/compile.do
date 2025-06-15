vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/xlconstant_v1_1_5
vlib riviera/blk_mem_gen_v8_4_2

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap xlconstant_v1_1_5 riviera/xlconstant_v1_1_5
vmap blk_mem_gen_v8_4_2 riviera/blk_mem_gen_v8_4_2

vlog -work xil_defaultlib  -sv2k12 \
"F:/viv/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"F:/viv/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/iF_ARM/ip/iF_ARM_Adder_0_0/sim/iF_ARM_Adder_0_0.v" \
"../../../bd/iF_ARM/ip/iF_ARM_MUX2to1_0_0/sim/iF_ARM_MUX2to1_0_0.v" \
"../../../bd/iF_ARM/ip/iF_ARM_REG_0_0/sim/iF_ARM_REG_0_0.v" \

vlog -work xlconstant_v1_1_5  -v2k5 \
"../../../../ARM.srcs/sources_1/bd/iF_ARM/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/iF_ARM/ip/iF_ARM_xlconstant_0_0/sim/iF_ARM_xlconstant_0_0.v" \

vlog -work blk_mem_gen_v8_4_2  -v2k5 \
"../../../../ARM.srcs/sources_1/bd/iF_ARM/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../bd/iF_ARM/ip/iF_ARM_blk_mem_gen_2_1/sim/iF_ARM_blk_mem_gen_2_1.v" \
"../../../bd/iF_ARM/sim/iF_ARM.v" \

vlog -work xil_defaultlib \
"glbl.v"

