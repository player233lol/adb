@echo off
@chcp 65001 >nul
start regedit
title Adb manual injection program
echo 关注B站 player233lol

echo ----------------------------------------
echo adb手动注入程序已启动，按下任意键继续
pause >nul
echo 打开路径（HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment）按下任意键继续
pause >nul
echo 正在导入注入文件
:cha
@cls
@set /p lja=存储adb的文件夹路径（即压缩文件中名为“move”的目录，例如：*:\xxx\yyy\zzz\move)：

if exist "%lja%" (  
    mkdir C:\adb
    xcopy "%lja%" "C:\adb" /E /H /C /I /Y && rd "%lja%" /S /Q
    echo 已导入注入文件至cmd
    echo 按下任意键继续
    pause >nul
    goto next
) else (  
    echo 路径错误！
    echo 按下任意键重输
    pause >nul
    goto cha
)

:next
@cls
echo 修改 'Path'
echo 在原字符串后加下列文本
echo ;C:\adb\adb [复制]
echo 完成后，您可以按任何键退出
pause >nul