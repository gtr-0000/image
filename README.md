﻿###### 关于本文档

作者: bbaa - Te Studio

gtr-0000 (github.com)

文档修改时间：2018-8-3

# image基础文件说明
--------

### cmd.exe
修改版CMD用于启动系统cmd并加载Image.dll[x64支持]

见[https://github.com/gtr-0000/init](https://github.com/gtr-0000/init/)

### init.dll
加载同目录下的所有dll

### image.dll
image3模块核心

# Github项目地址
--------

[https://github.com/Byaidu/image](https://github.com/Byaidu/image/)

|

|____[https://github.com/gtr-0000/image](https://github.com/gtr-0000/image/)


# 基本教程
--------

### 1 开始使用

**Image的命令由修改版cmd.exe和image.dll解释，所以在bat的第一行添加代码，把bat交给修改版cmd.exe解释。代码的内容为:**

```
@%1 "%~dp0cmd.exe /c "%~dp0" rem&goto :eof
```

### 2 绘图示例

[简单示例](Release/help_basic.bat)

### 3 鼠标示例

[鼠标示例](Release/mouse.bat)

### 4 窗口示例

[窗口示例](Release/window.bat)

### 5 按钮示例

[按钮示例](Release/button.bat)

# 调用方法
--------

### 1 基础调用

通过命令 Set image=&lt;Command&gt; \[argv1 argv2 \... \...

例如: Set image=load Pic1 example.bmp

### 2 复古调用

新建image.bat, 内容:

```
set image=%*
```

即可通过普通的调用第三方的方式来调用:

image \[argv1 argv2 \... \...

**注意: 不建议使用, 因为此方法会影响效率**


# 基础命令
--------

### 0 help
显示帮助

### 1 buffer/*newBuf*

**用法: buffer &lt;tag&gt; \[width height\] \[r g b\]**

    tag 画布名称

    width,height 画布大小,默认为当前绘图目标(target)的大小

    r,g,b 背景颜色的RGB值,默认为白色(255,255,255)

作用:新建名为&lt;tag&gt;画布,并初始化画布上的图元

### 2 load

**用法: load &lt;tag&gt; &lt;file&gt;**

    tag 画布标签名称

    file 文件路径(支持中文)

作用:新建名为&lt;tag&gt;的画布,并将名为&lt;file&gt;的文件绘制到画布上,并初始化画布上的图元

注意:image没有容错处理,因此必须保证&lt;file&gt;存在且有效!

### 3 save

**用法: save &lt;tag&gt; &lt;file&gt;**

    tag 画布名称

    file 文件路径(支持BMP,JPG,PNG,GIF)

作用保存画布&lt;tag&gt;的内容到文件&lt;file&gt;

### 4 unload/*delBuf*

**用法: unload &lt;tag&gt;**

    tag 画布名称

作用：删除画布&lt;tag&gt;并释放内存

### 5 info/*size*

**用法: info &lt;tag&gt;**

    tag 画布名称

作用:获取画布tag的大小到变量image

例如:

```
set image=info cmd
echo cmd大小:%image%
for /f "tokens=1,2" %%X in ("%image%") do echo 宽%%X 高%%Y
```

### 6 resize

**用法: resize &lt;tag&gt; &lt;width&gt; &lt;height&gt;**

    tag 画布名称

    width 宽

    height 高

作用:将画布tag缩放到width\*height的大小,如果绘图目标为cmd,则会同时将控制台设置为最适合绘图的状态

### 7 target

**用法: target &lt;tag&gt;**

    tag 画布名称

作用:设置名为&lt;tag&gt;的画布为当前画图目标


### 8 draw

**用法: draw &lt;tag&gt; &lt;x&gt; &lt;y&gt; \[trans \[r g b\] \| alpha &lt;a&gt;\]**

    tag 画布名称

    x,y 绘图位置XY

    r,g,b 指定透明色

    a 指定透明度

作用: 将画布tag绘制到当前绘图目标的x,y位置上,
若指定了trans，则以r,g,b为透明色(默认为白色),
若指定了alpha，则以a为透明度绘制

### 9 getpix

**语法：getpix &lt;tag&gt; &lt;x&gt; &lt;y&gt;**

作用: 将当前绘图目标上x,y位置的rgb值存储到变量image

```
set image=target cmd
set image=getpix 10 10
echo RGB:%image%
for /f "tokens=1,2,3" %%X in ("%image%") do echo R=%%X G=%%Y B=%%Z
```

### 10 setpix

**用法: setpix tag &lt;x&gt; &lt;y&gt; &lt;r&gt; &lt;g&gt; &lt;b&gt;**

作用: 设置当前绘图目标上x,y位置的rgb值

### 11 pen

**用法: pen &lt;R&gt; &lt;G&gt; &lt;B&gt; &lt;WIDTH&gt;**

**用法: pen -1**

作用: 设置绘制边线颜色和粗细(仅对当前画布有效)

-1表示不绘制边线

### 12 brush

**用法: brush &lt;R&gt; &lt;G&gt; &lt;B&gt;**

**用法: brush -1**

作用: 设置绘制内部颜色(仅对当前画布有效)

-1表示不绘制内部

### 13 line

**用法: line &lt;起点x&gt; &lt;起点y&gt; &lt;终点X&gt; &lt;终点Y&gt;**

作用: 画线(颜色用pen命令设置)

### 14 ellipse

**用法: ellipse &lt;左上角X&gt; &lt;左上角Y&gt; &lt;右下角X&gt; &lt;右下角Y&gt;**

作用: 画椭圆(背景色用brush命令设置)

### 15 polygon

**用法: polygon &lt;x1,y1&gt; &lt;x2,y2&gt; \[x3,y3 \x4,y4 \... \...**

作用: 画多边形

### 16 font

**用法: font \[r\] \[g\] \[b\] \[width\] \[height\] 0 0 \[字体粗细(400)\]
\[斜体(0)\] \[下划线(0)\] \[删除线(0)\] \[字体名\]**

作用: 设置当前绘图目标所用字体的rgb值和大小(仅对当前画布有效)

注:   括号内容为默认值

如果只设置高度，宽度设为0时即按照字体比例自动调整宽度

### 17 text

**用法: text &lt;string&gt; &lt;x&gt; &lt;y&gt;**

    string 内容

作用: 在当前绘图目标的x,y的位置上输出字符串string

### 18 cls

作用: 清空画布cmd的内容,并重设图元

### 19 export

作用: 将画布cmd的句柄存储到变量image

### 20 import

**用法: import &lt;tag&gt; &lt;handle&gt;**

    tag 画布名称

    handle 通过export命令得到的cmd句柄

作用: 通过句柄将另一个控制台的画布cmd映射到此控制台的tag画布

### 21 sleep

**用法: sleep &lt;time&gt;**

    time 毫秒

作用: 延时time毫秒

### 22 list

**用法: list &lt;file&gt; \[labal\]**

    label 标签名称

作用: 执行image指令脚本file, 若指定了label则会直接跳转到脚本中的标签label

### 23 exit

作用: 只能在image脚本中使用. 退出当前image指令脚本

### 24 union

**用法: union &lt;tag&gt;**

作用: 重置画布tag中的图元

### 25 debug

作用: 以线框形式绘制图元索引树, 用于查看画布上的各个图元的位置

### 26 mouse

**用法: mouse &lt;time&gt; \[region1\] \[region2\] \...**

**用法: mouse get**

    time 等待时间(毫秒)

作用:  

捕获鼠标坐标及事件，坐标以像素为单位，时间以毫秒为单位

若用`mouse get'则会直接返回鼠标坐标

若time&lt;0, 不设置时间限制

当发生点击事件时会将鼠标坐标x,y以及坐标在画布cmd上所在图元tag的tag存储到变量image, 并将图元tag的tag单独再存储到变量imagepic

若时间超过限制, image会返回"-1 -1"

若指定了region，那么返回的的就不是图元tag的tag而是region的序号，如果鼠标坐标不在任何一个指定的region中，则返回序号0

region应以如下的形式给出：x1,y1,x2,y2

### 27 key

**用法: key &lt;time&gt; \[keycode1\] \[keycode2\] \...**

**用法: key check &lt;keycode&gt;**

**用法: key list**

    time 等待时间(毫秒)

作用:  

捕获键盘按键，类似choice

key list列举当前按下的按键的虚拟键码列表

key check获得虚拟键码为&lt;keycode&gt;的按键是否被按下

其他情况

若time&lt;0, 不设置时间限制

当键盘按钮按下时会把按下按键的keycode保存到变量image

若指定了keycode1, keycode2 \...，那么返回的的就是keycode的序号，类似choice

若时间超过限制, image会返回"-1"

### 28 show

**用法: show &lt;tag&gt; [/T &lt;title&gt;] [/I &lt;icon&gt;]**

将画布tag显示在一个窗口，当画布更新时窗口内容也会自动更新

title 窗口标题(可选)

icon 窗口图标

### 29 hide

**用法: hide &lt;tag&gt;**

隐藏\关闭名为tag的画布的窗口

### 30 getmsg

**用法: getmsg &lt;tag&gt; \[VarName\]**

作用: 获取未获取过的窗口事件数据并设置到\[VarName\](默认为&lt;tag&gt;.wm)

如果画布&lt;tag&gt;没有窗口则设置" Close"到\[VarName\]

\[VarName\]的值是一个以空格开头的字符串，以点为参数分割符，当同时有多个事件触发时将会以空格为分割添加第二个事件数据

事件列表

|事件名称  |事件格式                                    |例子                     |意思           |
|-
|KeyDown   |事件名.按键名.虚拟键码                      |KeyDown.VK\_A.65         |键盘"A"按键按下|
|KeyUp     |                                            |KeyUp.VK\_A.65           |键盘"A"按键松开|
|MouseDown |事件名.按键名.X坐标.Y坐标(相对窗口).图元名称|MouseDown.Left.20.20.pic1|鼠标左键按下   |
|MouseUp   |                                            |MouseUp.Left.20.20.pic1  |鼠标左键松开   |
|MouseWheel|事件名.位移.X坐标.Y坐标(相对屏幕)           |MouseWheel.120.300.231   |鼠标滚轮滚动   |
|MouseMove |事件名.X坐标.Y坐标(相对窗口).图元名称       |MouseMove.2.2.pic1       |鼠标移动       |
|Close     |无                                          |Close                    |窗口被关闭     |

### 31 picatom/*picquery*

**用法: picatom &lt;tag&gt; &lt;x&gt; &lt;y&gt;**

获取画布tag 点x y处的图元名称到变量image

### 32 tick

**用法: tick \[NewTime\]

获取计时器的值(单位:毫秒)

或者重设计时器的值(单位:毫秒)

例如:

```
set image=tick 0
ping -n 127.1 1
set image=tick
echo 经过了 !image! 毫秒
```

### 33 cmd

*此命令不支持. 请直接操作命令行.*

### 34 thread

*此命令不支持. 请使用start /b "" "&lt;file&gt;".*

# 特性
--------

在命令前加 **\[Tag\]** 可以修改本条命令的绘图目标, 例如

```
set image=\[cmd\] draw bin.bmp 0 0
```
# 特殊画布
--------

|cmd    |CMD窗口|
|-
|desktop|桌面   |


图元：方便判断碰撞箱的的一种介质
