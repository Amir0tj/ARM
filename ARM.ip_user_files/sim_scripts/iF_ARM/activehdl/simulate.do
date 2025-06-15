onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+iF_ARM -L xil_defaultlib -L xpm -L xlconstant_v1_1_5 -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.iF_ARM xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {iF_ARM.udo}

run -all

endsim

quit -force
