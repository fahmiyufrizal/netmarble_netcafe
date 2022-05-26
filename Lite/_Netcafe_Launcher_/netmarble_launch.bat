@echo off
title fahmiyufrizal@2022 [github.com/fahmiyufrizal]
REM Netmarble Unload Diskless
REM by fahmiyufrizal@2022
REM Kembangkan script dengan tidak merubah credits ini
REM --------------------------------------------------
REM You can use and edit this script, but dont change the credits
REM Cheers!

:mklink_c
cd ..
RD /S /Q "C:\Program Files\Netmarble\Netmarble Launcher"
mklink /J "C:\Program Files\Netmarble\Netmarble Launcher" "%CD%"
cd _Netcafe_Launcher_

:load_server_registry
%SystemRoot%\System32\reg.exe import _Data_/HKCU_SOFTWARE_NetmarbleNeo.reg
%SystemRoot%\System32\reg.exe import _Data_/HKCU_SOFTWARE_NetmarbleCorp.reg

:load_server_roaming
RD /S /Q "%appdata%\Netmarble Launcher"
mklink /J "%appdata%\Netmarble Launcher" "%~dp0_Data_\Roaming\Netmarble Launcher"

:start
cd ..
start "" "Netmarble Launcher.exe"
exit