@echo off
@chcp 65001 >nul
start regedit
title Adb manual injection program
echo Follow Bilibili player233lol

echo ----------------------------------------
echo The adb manual injection program has started, press any key to continue
pause >nul
echo Open this path（HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment）Press any key to continue
pause >nul
echo Importing injection files
:cha
@cls
@set /p lja=The folder path where adb is stored (i.e. the directory named 'move' in the compressed file, for example:*:\xxx\yyy\zzz\move)：

if exist "%lja%" (  
    mkdir C:\adb
    xcopy "%lja%" "C:\adb" /E /H /C /I /Y && rd "%lja%" /S /Q
    echo Imported injection file to cmd
    echo Press any key to continue
    pause >nul
    goto next
) else (  
    echo The path is invalid!  
    echo Press any key to re-enter
    pause >nul
    goto cha
)

:next
@cls
echo Modify 'Path'
echo Add after the original string
echo ;C:\adb\adb [copy]
echo After completion, you can press any key to exit
pause >nul