@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

set image=list %0 script
pause
goto :eof

:script
sleep 500
save desktop screen.png
target desktop
buffer backup
target backup
draw desktop 0 0
target desktop
buffer black 3000 3000 0 0 0
draw black 0 0
sleep 300
draw backup 0 0
exit