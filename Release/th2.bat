@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

for /l %%# in () do (
	for /l %%c in (0,1,255) do (
		set image=getvar msg
		call title msg from th1:"%%msg%%"
		set image=buffer buf 100 100 %%c 0 0
		set image=draw buf 100 0
		set image=sleep 20
	)
)