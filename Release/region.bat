@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

setlocal enabledelayedexpansion
set image=resize cmd 500 500
set image=newbuf r 200 200 128 0 0
set image=newbuf g 100 100 0 128 0
set image=newbuf b 50 50 0 0 128
set image=cls
pause
set image=draw r 100 100
set image=debug
pause
set image=draw g 150 150
set image=debug
pause
set image=draw b 175 225
set image=debug
echo Çëµã»÷Êó±ê. . . 
for /l %%# in () do (
	set image=mouse -1
	title !image!
)
