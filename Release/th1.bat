@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

set msg=hello th2
set image=setvar msg
for /l %%# in () do (
	for /l %%c in (0,1,255) do (
		set image=buffer buf 100 100 0 0 %%c
		set image=draw buf 0 0
		set image=sleep 10
	)
)