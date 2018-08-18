@echo off
%1start /b "" "%~dp0cmd.exe" /v:on /c "%~f0" :&goto:eof

set image=buffer black 128 32 0 0 0
set image=font 0 255 255 0 32

set image=tick 0
for /l %%a in () do (
	set image=draw black 0 0
	set image=tick
	set /a ms=!image!,s=ms/1000,ms-=s*1000,ms+=1000
	set image=text !s!.!ms:~-3! 0 0
	set image=sleep 1
)