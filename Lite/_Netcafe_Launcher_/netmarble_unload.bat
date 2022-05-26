@echo off
title fahmiyufrizal@2022 [github.com/fahmiyufrizal]
REM Netmarble Unload Diskless
REM by fahmiyufrizal@2022
REM Kembangkan script dengan tidak merubah credits ini
REM --------------------------------------------------
REM You can use and edit this script, but dont change the credits
REM Cheers!

REM ---------------------------------------------------
REM Hapus script dibawah jika blank karena efek script elevate admin
:init
 setlocal DisableDelayedExpansion
 set cmdInvoke=1
 set winSysFolder=System32
 set "batchPath=%~0"
 for %%k in (%0) do set batchName=%%~nk
 set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
 setlocal EnableDelayedExpansion

:checkPrivileges
  NET FILE 1>NUL 2>NUL
  if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
  if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)

  ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
  ECHO args = "ELEV " >> "%vbsGetPrivileges%"
  ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
  ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
  ECHO Next >> "%vbsGetPrivileges%"

  if '%cmdInvoke%'=='1' goto InvokeCmd 

  ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
  goto ExecElevation

:InvokeCmd
  ECHO args = "/c """ + "!batchPath!" + """ " + args >> "%vbsGetPrivileges%"
  ECHO UAC.ShellExecute "%SystemRoot%\%winSysFolder%\cmd.exe", args, "", "runas", 1 >> "%vbsGetPrivileges%"

:ExecElevation
 "%SystemRoot%\%winSysFolder%\WScript.exe" "%vbsGetPrivileges%" %*
 exit /B

:gotPrivileges
 setlocal & cd /d %~dp0
 if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)
REM ---------------------------------------------------
REM Hapus script diatas jika blank karena efek script elevate admin

echo [+] Log/Error :
echo.

:prepare_data
taskkill /f /im "Netmarble Launcher.exe"|find ":" > nul
cd ..
RD /S /Q "C:\Program Files\Netmarble\Netmarble Launcher"
mklink /J "C:\Program Files\Netmarble\Netmarble Launcher" "%CD%"
cd _Netcafe_Launcher_
mkdir _Data_

:unload_server_roaming
if exist "_Data_\Roaming\Netmarble Launcher" (
    goto unload_server_registry
) else (
    ROBOCOPY "%appdata%\Netmarble Launcher" "%~dp0\_Data_\Roaming\Netmarble Launcher" /E /NFL /NDL /NJH /NJS /nc /ns /np
    RD /S /Q "%appdata%\Netmarble Launcher"
    mklink /J "%appdata%\Netmarble Launcher" "%~dp0_Data_\Roaming\Netmarble Launcher"
)

:unload_server_registry
%SystemRoot%\System32\reg.exe export HKEY_CURRENT_USER\SOFTWARE\NetmarbleNeo _Data_\HKCU_SOFTWARE_NetmarbleNeo.reg /Y
%SystemRoot%\System32\reg.exe export "HKEY_CURRENT_USER\SOFTWARE\Netmarble Corp" _Data_\HKCU_SOFTWARE_NetmarbleCorp.reg /Y

:notice
echo.
echo [+] Jika muncul update versi terus menerus di client, silahkan lakukan unload lagi!
echo [+] If version update is shown at client, please do unload again!
pause>nul
