@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

setlocal EnableDelayedExpansion

set image=buffer box 300 240 0 0 255
set image=load bg window.png
set image=[cmd] draw bg 0 0
set image=[box] draw bg 0 0
pause
set image=show box
pause
set image=[box] draw bg 100 100 alpha 64
pause
set image=resize box 600 480

rem set image=hide cmd
set image=target box
set image=pen 0 255 0
set image=brush -1

set box.wm= 
set x=0
set y=0
:loop
if not "!box.wm!"==" " (
	set wm=!box.wm!
	set box.wm= 
	for %%a in (!wm!) do (
		ECHO %%a
		for /f "tokens=1,2,3 delims=." %%b in ("%%a") do (
			if "%%b"=="MouseMove" (
				set image=line !x! !y! %%c %%d
				set x=%%c
				set y=%%d	
			)
			if "%%b"=="MouseDown" (
				if "%%c"=="Left" set image=pen 0 0 255
				if "%%c"=="Right" set image=pen 255 0 0
			)
			if "%%b"=="MouseUp" set image=pen 0 255 0

			if "%%b"=="Close" goto :eof
		)
	)
)
::缓解CPU
set image=sleep 16
goto loop
pause