@echo off
cls

rem Create Bootable Recovery Partition Windows 7 MBR for HP
rem Created by SiZiOUS, Ver. 20151013
rem sizious.com - sizious (at) gmail (d0t) com - fb.com/sizious - @sizious

rem Initialize the script
set SAVEDPATH=%CD%
set WORKPATH=%~dp0
set WORKPATH=%WORKPATH:~0,-1%
set LOG=%WORKPATH%\install.log
set PROGRAM_NAME=CreateBootableRecoveryPartition
echo %DATE% %TIME%: %PROGRAM_NAME% Start > %LOG%
cd %WORKPATH%

rem Reading configuration
echo %DATE% %TIME%: Reading the configuration >> %LOG%
for /F "delims=; tokens=1" %%I in (%SYSTEMROOT%\SettingsRE.txt) do set %%I

rem Checking the recovery drive existence
echo %DATE% %TIME%: Checking the recovery drive existence >> %LOG%
if not exist %RECOVERYLETTER%:\ goto err_no_recovery

rem Tagging the recovery partition with HP tools
echo %DATE% %TIME%: Tagging the recovery partition with HP tools >> %LOG%
hptag %RECOVERYLETTER%
mbrinst /ini mbr.ini /q

rem Remove attributes on Boot Files
echo %DATE% %TIME%: Copying boot files >> %LOG%
if exist %RECOVERYLETTER%:\boot attrib -s -h -r -a %RECOVERYLETTER%:\boot
if exist %RECOVERYLETTER%:\sources attrib -s -h -r -a %RECOVERYLETTER%:\sources
if exist %RECOVERYLETTER%:\bootmgr attrib -s -h -r -a %RECOVERYLETTER%:\bootmgr

rem Copy PCAT boot files (MBR)
xcopy /Y %SYSTEMROOT%\Boot\Fonts\*.* %RECOVERYLETTER%:\boot\fonts\
xcopy /Y %SYSTEMROOT%\Boot\DVD\PCAT\*.* %RECOVERYLETTER%:\boot\
if exist %SYSTEMROOT%\Boot\DVD\PCAT\%LANG%\ xcopy /Y %SYSTEMROOT%\Boot\DVD\PCAT\%LANG%\*.* %RECOVERYLETTER%:\boot\
if not exist %SYSTEMROOT%\Boot\DVD\PCAT\%LANG%\ xcopy /Y %SYSTEMROOT%\Boot\DVD\PCAT\en-us\*.* %RECOVERYLETTER%:\boot\
if exist %SYSTEMROOT%\Boot\Resources\ (
	if not exist %RECOVERYLETTER%:\boot\resources\ md %RECOVERYLETTER%:\boot\resources\
	copy /Y %SYSTEMROOT%\Boot\Resources\bootres.dll %RECOVERYLETTER%:\boot\resources\
)
copy /Y %SYSTEMROOT%\Boot\PCAT\memtest.exe %RECOVERYLETTER%:\boot\
copy /Y %SYSTEMROOT%\Boot\PCAT\bootmgr %RECOVERYLETTER%:\bootmgr
if exist %SYSTEMROOT%\Boot\PCAT\%LANG% xcopy /Y %SYSTEMROOT%\Boot\PCAT\%LANG%\*.* %RECOVERYLETTER%:\boot\%LANG%\
bcdedit /store %RECOVERYLETTER%:\boot\bcd /set {bootmgr} locale %LANG%
bcdedit /store %RECOVERYLETTER%:\boot\bcd /set {default} locale %LANG%

rem Checking boot.wim
if not exist %RECOVERYLETTER%:\sources md %RECOVERYLETTER%:\sources
copy /B %WORKPATH%\boot.wim %RECOVERYLETTER%:\sources\

rem Protecting files
echo %DATE% %TIME%: Protecting files >> %LOG%
attrib +s +h +r +a %RECOVERYLETTER%:\boot
attrib +s +h +r +a %RECOVERYLETTER%:\sources
attrib +s +h +r +a %RECOVERYLETTER%:\bootmgr
goto end

:err_no_recovery
echo %DATE% %TIME%: No recovery drive was found. >> %LOG%
goto end

rem Finished!
:end
echo %DATE% %TIME%: %PROGRAM_NAME% End >> %LOG%
cd %SAVEDPATH%
