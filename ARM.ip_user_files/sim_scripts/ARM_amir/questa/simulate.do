onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ARM_amir_opt

do {wave.do}

view wave
view structure
view signals

do {ARM_amir.udo}

run -all

quit -force
