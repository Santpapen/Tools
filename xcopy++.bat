@echo off
REM Program for copy and create directory by final number
set A=0
for /L %%A in (1,1,3) do (
REM Rename <test> to specific folder name.
xcopy <test> <test>%%A /E /H /O /K /i 

)
