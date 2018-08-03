@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

cls
echo image基础教程
pause

cls
echo image3是使用经过LordPE修改过的cmd(会加载image.dll)来达到操作命令的效果.
echo 相比exe版本,在高帧率绘图时能够节省不少启动进程时的时间
echo;
echo 此次修改优化了region.hpp的算法(用了list,节省不小篇幅)
echo 原版用的好像是 "二叉树"? (还是只new不delete的),看不懂
echo;
echo 窗口消息返回格式更加简单
echo 顺便加入了resize时buffer窗口会改变大小的功能(原版只有cmd会)
echo;
echo 不改写errorlevel,使用imagepic变量存储mouse后的图元名称
echo 原因参见set /?
echo;
echo 如果命令扩展被启用，有几个动态环境变量可以被扩展，但
echo;
echo 不会出现在 SET 显示的变量列表中。每次变量数值被扩展时，
echo;
echo 这些变量数值都会被动态计算。如果用户用这些名称中任何
echo                             ~~~~~~~~~~~~~~~~~~~~~~~~
echo 一个定义变量，那个定义会替代下面描述的动态定义
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo;
echo 这将意味着如果errorlevel变量被设置,那么用户就无法正常使用 %%errorlevel%% 来获得错误码!
pause

cls
echo 为了在bat中使用image,应该使用带image的cmd
echo 在bat前面加入
echo @echo off
echo set image=size cmd
echo if "%%image%%"=="size cmd" "%%~dp0cmd.exe" /c "%%~f0" %*^&goto:eof
echo;
echo 或者
echo %%1"%%~dp0cmd.exe" /c "%%~f0" :^&goto:eof
echo;
echo 使用时要用set image=***的形式
echo 例如:set image=draw bin 0 0
pause

cls
echo 基本命令:
echo ^<^>必选项 []可选项
echo;
echo 画布类
echo newbuf(buffer) ^<tag^> [w h] [r g b]
echo load ^<tag^> [filename]
echo save ^<tag^> ^<filename^>
echo delbuf(unload) ^<tag^>
echo;
echo 画布大小
echo size ^<tag^>
echo resize ^<tag^> [w h]
echo;
echo 绘图
echo target ^<tag^>
echo draw ^<srctag^> ^<x^> ^<y^> [and^|trans [r g b]^|alpha ^<alpha^>]
echo;
echo 窗口类
echo show ^<tag^>
echo hide ^<tag^>
echo;
pause


cls
echo 最简单的绘图
echo set image=draw bin.png 100 100
set image=draw bin.png 100 100
pause

cls
echo 比较好的方法,使用load到画布tag(支持大多数格式)
echo rem 清理绘图残留
echo set image=cls
set image=cls
echo rem 延时
echo set image=sleep 500
set image=sleep 500
echo set image=load bin bin.png
set image=load bin bin.png
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo 获得,更改画布大小
echo set image=cls
set image=cls
echo set image=size bin
set image=size bin
echo echo 画布大小 %%image%%
echo 画布大小 %image%
set old=%image%
pause

cls
echo 画布变小了
echo set image=resize bin 120 80
set image=resize bin 120 80
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo 画布变回来了
echo set image=cls
set image=cls
echo set image=resize bin %old%
set image=resize bin %old%
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo image不仅能在cmd上绘图,还能在画布上绘图
echo 可以用[tag] command... 的格式
echo [tag] 能够临时改变绘图目标
echo 比方说
echo set image=load bin3 bin3.png
set image=load bin3 bin3.png
echo set image=[bin] draw bin3 0 100
set image=[bin] draw bin3 0 100
echo rem 因为[tag] 只能临时改变绘图目标,所以这一行在cmd上起作用了
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo 用Target可以改变绘图目标
echo set image=target bin
set image=target bin
echo set image=draw bin3 100 50
set image=draw bin3 100 50
echo rem 这一行还在bin上起作用
echo set image=draw bin3 150 100
set image=draw bin3 150 100
echo set image=target cmd
set image=target cmd
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo 试一下在desktop上绘图(整个屏幕)
echo set image=cls
set image=cls
echo set image=[desktop] draw bin 400 400
set image=[desktop] draw bin 400 400
pause

cls
echo save可以保存画布为图片(支持BMP,JPG,PNG,GIF)
echo set image=save bin newbin.jpg
set image=save bin newbin.jpg
pause

cls
echo show和hide可以显示/隐藏窗口
echo set image=hide cmd
echo set image=sleep 1000
echo set image=show cmd
set /p =请按任意键开始. . . <nul
pause>nul
set image=hide cmd
set image=sleep 1000
set image=show cmd
echo;
pause

cls
echo 如果show画布的窗口会怎么样?
echo set image=show bin
set image=show bin
pause

cls
echo 当画布改变时窗口会同步
echo set image=[bin] draw bin3 40 40
set image=[bin] draw bin3 40 40
pause
echo rem 更改画布大小
echo set image=[bin] resize bin 256 256
set image=[bin] resize bin 256 256
pause
echo rem 旋转画布
echo set image=[bin] rotate bin 270
set image=[bin] rotate bin 270
pause

cls
echo hide关闭画布的窗口
echo set image=hide bin
set image=hide bin
pause

cls
echo draw 可以产生一些特殊效果
echo 例如:
echo set image=show bin
set image=show bin
pause
echo rem 白色透明(trans后面可以接r g b颜色,默认白色)
echo set image=[bin] draw bin3 150 50 trans
set image=[bin] draw bin3 150 50 trans
pause
echo rem 透明混合(alpha 0-255)
echo set image=[bin] draw bin3 100 75 alpha 128
set image=[bin] draw bin3 100 75 alpha 128
pause
echo set image=hide bin
set image=hide bin
pause