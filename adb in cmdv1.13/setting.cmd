@echo off
@chcp 65001 >nul
@title setting
@cls
echo Follow Bilibili player233lol

echo ----------------------------------------

echo Adb language configuration selection

echo 1.English

echo 2.简体中文


@set /p CH=select(1/2):

if /I "%CH%"=="1" (
    move ".\language\Adb one click configuration environment program.cmd" .
    goto exita
)
if /I "%CH%"=="2" (
    move ".\language\adb一键配置环境程序.cmd" .
    goto exitb
)


:exita
cls
echo The file has been generated
pause
exit /b 0
:exitb
cls
echo 文件已生成
pause
exit /b 0