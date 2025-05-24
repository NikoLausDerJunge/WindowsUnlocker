@echo off
chcp 1252 > Nul
NET SESSION >nul 2>&1
IF %ERRORLEVEL% EQU 0 (
    goto checking
) ELSE (
    color c
    echo Please run the batch file as administrator
    timeout 3 > NUL
    exit
)
:after
cls
SETLOCAL EnableDelayedExpansion
chcp 1252 > Nul
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
set "DEL=%%a"
)
:checking
echo ...
timeout 2 > NUL
cls
goto home
:home
echo Please first check what version of Windows you have, search for [4mwinver[0m and see if you have [4mHome[0m or [4mPro[0m
echo.  
echo Windows Pro (1)
echo Windows Home (2)
set /p "key=system > "
if %key%==1 goto key-pro
if %key%==2 goto key-home
:key-pro
slmgr /upk
slmgr.vbs /cpky
slmgr /ckms
slmgr.vbs /ckms
slmgr /skms localhost
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms.digiboy.ir
slmgr /ato
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Batch Script', 'Your Windows should be activated if this is not the case then you have entered the wrong version', [System.Windows.Forms.ToolTipIcon]::None)}"
exit
:key-home
slmgr /upk
slmgr.vbs /cpky
slmgr /ckms
slmgr.vbs /ckms
slmgr /skms localhost
slmgr /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99
slmgr /skms kms.digiboy.ir
slmgr /ato
exit