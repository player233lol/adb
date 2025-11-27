@echo off
@chcp 65001 >nul
@title adb注入工具
echo 关注B站player233lol

echo ----------------------------------------
:ch
set "path_str=%PATH%"
if "%path_str%:~1024,1!" neq "" (

    echo adb无法注入（PATH 变量长度超过 1024 字符）

    echo 手动注入程序已生成

    move ".\language\运行我.cmd" .
    pause >nul
    exit /b 0
) else (
    goto start
)
:start
@cls

echo adb环境配置选择

echo 1.使用默认路径（C:\adb\adb）

echo 2.使用自定义路径（*:\xxx\yyy\zzz）

@set /p CH=选择(1/2):

if /I "%CH%"=="1" (
    goto cha
)
if /I "%CH%"=="2" (
    goto chb
)
if /l "%CH%"=="" (
    goto ch
)
echo 无效选择
goto ch

:cha
@cls
@set /p lja=存放adb的文件夹路径(即压缩包中名称为move文件夹的目录,示例：*:\xxx\yyy\zzz\move)：

if exist "%lja%" (  
    mkdir C:\adb
    xcopy "%lja%" "C:\adb" /E /H /C /I /Y && rd "%lja%" /S /Q
    setx PATH "%PATH%;C:\adb\adb"
    echo 已注入adb至cmd
    echo 按下任意键退出
    pause >nul
    exit /b 0
) else (  
    echo 路径无效！  
    echo 按下任意键重输
    pause >nul
    goto cha
)
:chb
@cls
@set /p lja=存放adb的文件夹路径(即压缩包中名称为move文件夹的目录,示例：*:\xxx\yyy\zzz\move)：
if exist "%lja%" (  
    goto next
) else (  
    echo 路径无效！  
    echo 按下任意键重输
    pause >nul
    goto chb
)
:next
cls
echo 存放adb的文件夹路径(即压缩包中名称为move文件夹的目录,示例：*:\xxx\yyy\zzz\move)：%lja%
@set /p ljb=存放adb的环境配置文件夹路径：
if exist "%ljb%" (  
    xcopy "%lja%" "%ljb%" /E /H /C /I /Y && rd "%lja%" /S /Q
    setx PATH "%PATH%;%ljb%\adb"
    echo 已注入adb至cmd
    echo 按下任意键退出
    pause >nul
    exit /b 0
) else (  
    echo 路径无效！  
    echo 按下任意键重输
    pause >nul
    goto next
)