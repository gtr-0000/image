@echo off
set image=size cmd
if "%image%"=="size cmd" "%~dp0cmd.exe" /c "%~f0"&goto:eof

cls
echo image�����̳�
pause

cls
echo image3��ʹ�þ���LordPE�޸Ĺ���cmd(�����image.dll)���ﵽ���������Ч��.
echo ���exe�汾,�ڸ�֡�ʻ�ͼʱ�ܹ���ʡ������������ʱ��ʱ��
echo;
echo �˴��޸��Ż���region.hpp���㷨(����list,��ʡ��Сƪ��)
echo ԭ���õĺ����� "������"? (����ֻnew��delete��),������
echo;
echo ������Ϣ���ظ�ʽ���Ӽ�
echo ˳�������resizeʱbuffer���ڻ�ı��С�Ĺ���(ԭ��ֻ��cmd��)
echo;
echo ����дerrorlevel,ʹ��imagepic�����洢mouse���ͼԪ����
echo ԭ��μ�set /?
echo;
echo ���������չ�����ã��м�����̬�����������Ա���չ����
echo;
echo ��������� SET ��ʾ�ı����б��С�ÿ�α�����ֵ����չʱ��
echo;
echo ��Щ������ֵ���ᱻ��̬���㡣����û�����Щ�������κ�
echo                             ~~~~~~~~~~~~~~~~~~~~~~~~
echo һ������������Ǹ������������������Ķ�̬����
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo;
echo �⽫��ζ�����errorlevel����������,��ô�û����޷�����ʹ�� %%errorlevel%% ����ô�����!
pause

cls
echo Ϊ����bat��ʹ��image,Ӧ��ʹ�ô�image��cmd
echo ��batǰ�����
echo @echo off
echo set image=size cmd
echo if "%%image%%"=="size cmd" "%%~dp0cmd.exe" /c "%%~f0" %*^&goto:eof
echo;
echo ����
echo %%1"%%~dp0cmd.exe" /c "%%~f0" :^&goto:eof
echo;
echo ʹ��ʱҪ��set image=***����ʽ
echo ����:set image=draw bin 0 0
pause

cls
echo ��������:
echo ^<^>��ѡ�� []��ѡ��
echo;
echo ������
echo newbuf(buffer) ^<tag^> [w h] [r g b]
echo load ^<tag^> [filename]
echo save ^<tag^> ^<filename^>
echo delbuf(unload) ^<tag^>
echo;
echo ������С
echo size ^<tag^>
echo resize ^<tag^> [w h]
echo;
echo ��ͼ
echo target ^<tag^>
echo draw ^<srctag^> ^<x^> ^<y^> [and^|trans [r g b]^|alpha ^<alpha^>]
echo;
echo ������
echo show ^<tag^>
echo hide ^<tag^>
echo;
pause


cls
echo ��򵥵Ļ�ͼ
echo set image=draw bin.png 100 100
set image=draw bin.png 100 100
pause

cls
echo �ȽϺõķ���,ʹ��load������tag(֧�ִ������ʽ)
echo rem �����ͼ����
echo set image=cls
set image=cls
echo rem ��ʱ
echo set image=sleep 500
set image=sleep 500
echo set image=load bin bin.png
set image=load bin bin.png
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo ���,���Ļ�����С
echo set image=cls
set image=cls
echo set image=size bin
set image=size bin
echo echo ������С %%image%%
echo ������С %image%
set old=%image%
pause

cls
echo ������С��
echo set image=resize bin 120 80
set image=resize bin 120 80
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo �����������
echo set image=cls
set image=cls
echo set image=resize bin %old%
set image=resize bin %old%
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo image��������cmd�ϻ�ͼ,�����ڻ����ϻ�ͼ
echo ������[tag] command... �ĸ�ʽ
echo [tag] �ܹ���ʱ�ı��ͼĿ��
echo �ȷ�˵
echo set image=load bin3 bin3.png
set image=load bin3 bin3.png
echo set image=[bin] draw bin3 0 100
set image=[bin] draw bin3 0 100
echo rem ��Ϊ[tag] ֻ����ʱ�ı��ͼĿ��,������һ����cmd����������
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo ��Target���Ըı��ͼĿ��
echo set image=target bin
set image=target bin
echo set image=draw bin3 100 50
set image=draw bin3 100 50
echo rem ��һ�л���bin��������
echo set image=draw bin3 150 100
set image=draw bin3 150 100
echo set image=target cmd
set image=target cmd
echo set image=draw bin 50 150
set image=draw bin 50 150
pause

cls
echo ��һ����desktop�ϻ�ͼ(������Ļ)
echo set image=cls
set image=cls
echo set image=[desktop] draw bin 400 400
set image=[desktop] draw bin 400 400
pause

cls
echo save���Ա��滭��ΪͼƬ(֧��BMP,JPG,PNG,GIF)
echo set image=save bin newbin.jpg
set image=save bin newbin.jpg
pause

cls
echo show��hide������ʾ/���ش���
echo set image=hide cmd
echo set image=sleep 1000
echo set image=show cmd
set /p =�밴�������ʼ. . . <nul
pause>nul
set image=hide cmd
set image=sleep 1000
set image=show cmd
echo;
pause

cls
echo ���show�����Ĵ��ڻ���ô��?
echo set image=show bin
set image=show bin
pause

cls
echo �������ı�ʱ���ڻ�ͬ��
echo set image=[bin] draw bin3 40 40
set image=[bin] draw bin3 40 40
pause
echo rem ���Ļ�����С
echo set image=[bin] resize bin 256 256
set image=[bin] resize bin 256 256
pause
echo rem ��ת����
echo set image=[bin] rotate bin 270
set image=[bin] rotate bin 270
pause

cls
echo hide�رջ����Ĵ���
echo set image=hide bin
set image=hide bin
pause

cls
echo draw ���Բ���һЩ����Ч��
echo ����:
echo set image=show bin
set image=show bin
pause
echo rem ��ɫ͸��(trans������Խ�r g b��ɫ,Ĭ�ϰ�ɫ)
echo set image=[bin] draw bin3 150 50 trans
set image=[bin] draw bin3 150 50 trans
pause
echo rem ͸�����(alpha 0-255)
echo set image=[bin] draw bin3 100 75 alpha 128
set image=[bin] draw bin3 100 75 alpha 128
pause
echo set image=hide bin
set image=hide bin
pause