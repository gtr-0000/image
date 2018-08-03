@echo off
%1start /b "" "%~dp0cmd.exe" /c "%~f0" :&goto:eof
setlocal EnableDelayedExpansion
set image=list list1.txt
set image=text ÄãºÃ 0 600
pause