@echo off
%1start /b "" "%~dp0cmd.exe" "/c %~fs0 :"&exit
setlocal EnableDelayedExpansion
set image=resize cmd 1000 1000
for /l %%# in () do (
	set image=mouse -1 0,0,500,500 0,500,500,1000 500,0,1000,500 500,500,1000,1000
	title !image!
	for /f "tokens=1,2,3" %%a in ("!image!") do set /a x=%%a,y=%%b,r=%%a/5%%256,b=%%b/5%%256,g=%%c*100%%256
	set image=newbuf pen 50 50 !r! !g! !b!
	set image=draw pen !x! !y!
)