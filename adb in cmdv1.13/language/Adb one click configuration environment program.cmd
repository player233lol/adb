@echo off
@chcp 65001 >nul
@title Adb environment configuration tool
echo Follow Bilibili player233lol

echo ----------------------------------------
:ch
set "path_str=%PATH%"
if "%path_str%:~1024,1!" neq "" (
    echo Adb cannot be injected (PATH variable length exceeds 1024 characters)
    echo manual injection program has been generated
    move ".\language\runme.cmd" .
    pause >nul
    exit /b 0
) else (
    goto start
)
@cls

echo Adb environment configuration selection

echo 1. Use the default path (C: \ adb \ adb)

echo 2. Use custom path (*: \ xxx \ yyy \ zzz)

@set /p CH=Select (1/2):

if /I "%CH%"=="1" (
    goto cha
)
if /I "%CH%"=="2" (
    goto chb
)
if /l "%CH%"=="" (
    goto ch
)
echo Invalid selection
goto ch

:cha
@cls
@set /p lja=The folder path where adb is stored (i.e. the directory named 'move' in the compressed file, for example: *: \ xxx \ yyy \ zzz \ move):

if exist "%lja%" (  
    mkdir C:\adb
    xcopy "%lja%" "C:\adb" /E /H /C /I /Y && rd "%lja%" /S /Q
    setx PATH "%PATH%;C:\adb\adb"
    echo Injected adb to cmd
    echo Press any key to exit
    pause >nul
    exit /b 0
) else (  
    echo invalid path 
    echo Press any key to re-enter
    pause >nul
    goto cha
)
:chb
@cls
@set /p lja=The folder path where adb is stored (i.e. the directory named 'move' in the compressed file, for example: *: \ xxx \ yyy \ zzz \ move):
if exist "%lja%" (  
    goto next
) else (  
    echo invalid path  
    echo Press any key to re-enter
    pause >nul
    goto chb
)
:next
cls
echo The folder path where adb is stored (i.e. the directory named 'move' in the compressed file, example: *: \ xxx \ yyy \ zzz \ move):%lja%
@set /p ljb=Path to the environment configuration folder for storing adb:
if exist "%ljb%" (  
    xcopy "%lja%" "%ljb%" /E /H /C /I /Y && rd "%lja%" /S /Q
    setx PATH "%PATH%;%ljb%\adb"
    echo Injected adb to cmd
    echo Press any key to exit
    pause >nul
    exit /b 0
) else (  
    echo invalid path
    echo Press any key to re-enter
    pause >nul
    goto next
)