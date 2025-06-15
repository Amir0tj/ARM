onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib iF_ARM_opt

do {wave.do}

view wave
view structure
view signals

do {iF_ARM.udo}

run -all

quit -force
