@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

setlocal EnableDelayedExpansion
set image=load bin bin.png
for /l %%# in () do (
	set /a fps+=1,x=fps%%5,y=fps/5%%5
	set image=draw bin !x! !y!
	if not "!time:~6,2!"=="!start!" (
		set start=!time:~6,2!
		title fps=!fps!
		set fps=0
	)
)