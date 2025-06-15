onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ARM_amir -L xil_defaultlib -L xlconstant_v1_1_5 -L xlconcat_v2_1_1 -L xlslice_v1_0_1 -L dist_mem_gen_v8_0_12 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ARM_amir xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ARM_amir.udo}

run -all

endsim

quit -force
