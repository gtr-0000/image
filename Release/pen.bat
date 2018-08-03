@echo off
%1start /b "" "%~dp0cmd.exe" "/c %~fs0 :"&exit
setlocal EnableDelayedExpansion
set image=resize cmd 600 600

set image=pen -1
set image=brush 0 0 255

set image=ellipse 10 10 100 80
set image=polygon 100,100 300,100 500,500 100,300

set image=pen 255 0 0
set image=brush -1
set image=line 0 600 600 0

pause