@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

set image=load bin bin.png
for /l %%# in () do (
	set image=rotate bin 30
	set image=draw bin 0 0
	set image=sleep 50
)