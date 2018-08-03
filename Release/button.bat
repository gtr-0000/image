@echo off
%1start /b "" "%~dp0cmd.exe" /c "%~f0" :&exit
setlocal EnableDelayedExpansion
set image=draw button1.png 500 500
set image=list button.txt init

:act1
set image=list button.txt act1
set image=list button.txt !imagepic!
if "!imagepic!"=="cmd" goto act1
call:act1_!imagepic!
goto act2

:act1_button1
rem to do something
title act1 click button 1
goto:eof

:act1_button2
rem to do something
title act1 click button 2
goto:eof

:act2
set image=list button.txt act2
set image=list button.txt !imagepic!
if "!imagepic!"=="cmd" goto act2

:act3
set image=list button.txt act3
set image=list button.txt !imagepic!
if "!imagepic!"=="cmd" goto act3

set image=text ÑÝÊ¾Íê±Ï 0 200
pause