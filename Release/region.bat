@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

setlocal enabledelayedexpansion
set image=resize cmd 500 500
set image=newbuf red 200 200 128 0 0
set image=newbuf green 100 100 0 128 0
set image=newbuf blue 50 50 0 0 128
set image=newbuf purple 150 150 128 0 128

set image=target purple
set image=draw green 0 0
set image=draw blue 100 0
set image=draw red 75 25
set image=target cmd

set image=cls
pause
set image=draw red 100 100
set image=debug
pause
set image=draw green 150 150
set image=debug
pause
set image=draw blue 175 225
set image=debug
pause
set image=draw purple 300 300
set image=debug
echo 请点击鼠标. . . 
for /l %%# in () do (
	set image=mouse -1
	title 你点击了!imagepic!
)
