@echo off
%1start /b "" "%~dp0cmd.exe" "/c %~fs0 :"&exit
setlocal EnableDelayedExpansion
set image=resize cmd 1000 1000

set image=load bin bin.png
set image=load bin2 bin2.png
set image=target bin
set image=draw bin2 300 0
set image=target cmd
set image=font 0 255 255 50 100
set image=newbuf pen 50 50 255 0 0
set x=0
set y=0
set mouse=

:loop
set image=cls
set image=text "image=!mouse!" 0 600
set image=draw bin 0 0
set image=draw pen !x! !y!

set image=mouse -1
set mouse=!image!
for /f "tokens=1,2,3" %%a in ("!mouse!") do set /a x=%%a,y=%%b
rem set image=debug
goto loop