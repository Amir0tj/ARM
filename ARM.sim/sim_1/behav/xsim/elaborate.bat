@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Sun Jun 15 09:14:28 +0330 2025
REM SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto 3c6d0297e70d49d7a32a8ddf702414e6 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L xlconstant_v1_1_5 -L xlconcat_v2_1_1 -L xlslice_v1_0_1 -L dist_mem_gen_v8_0_12 -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot TestBench_behav xil_defaultlib.TestBench xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
