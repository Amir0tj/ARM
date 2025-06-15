-makelib ies_lib/xil_defaultlib -sv \
  "F:/viv/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "F:/viv/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/iF_ARM/ip/iF_ARM_Adder_0_0/sim/iF_ARM_Adder_0_0.v" \
  "../../../bd/iF_ARM/ip/iF_ARM_MUX2to1_0_0/sim/iF_ARM_MUX2to1_0_0.v" \
  "../../../bd/iF_ARM/ip/iF_ARM_REG_0_0/sim/iF_ARM_REG_0_0.v" \
-endlib
-makelib ies_lib/xlconstant_v1_1_5 \
  "../../../../ARM.srcs/sources_1/bd/iF_ARM/ipshared/4649/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/iF_ARM/ip/iF_ARM_xlconstant_0_0/sim/iF_ARM_xlconstant_0_0.v" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../../ARM.srcs/sources_1/bd/iF_ARM/ipshared/37c2/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/iF_ARM/ip/iF_ARM_blk_mem_gen_2_1/sim/iF_ARM_blk_mem_gen_2_1.v" \
  "../../../bd/iF_ARM/sim/iF_ARM.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

