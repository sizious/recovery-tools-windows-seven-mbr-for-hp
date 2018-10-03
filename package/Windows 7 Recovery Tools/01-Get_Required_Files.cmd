@echo off
cls

set TITLE=Recovery Tools 4.0.1 Windows 7 MBR for HP - Required Files Checker
title %TITLE%
echo %TITLE%
echo Created by SiZiOUS, 2015
echo sizious.com - sizious (at) gmail (d0t) com - fb.com/sizious - @sizious
echo.
echo Based on the work done by AnarethoS (anarethos.com)
echo ---
echo.

:check_for_admin
net session >nul 2>&1
if %ERRORLEVEL%==0 goto start
goto err_ask_for_admin

:start
set workpath=%~dp0
set workpath=%workpath:~0,-1%

rem Setting required files paths
set mbrinst="%workpath%\MbrInst\mbrinst.exe"
set mbrini="%workpath%\MbrInst\mbr.ini"
set imagex32="%workpath%\ImageX\32bits\imagex.exe"
set imagex64="%workpath%\ImageX\64bits\imagex.exe"
set oscdimg="%workpath%\OscdImg\oscdimg.exe"

:check_for_mbrinst
echo Checking for MBRINST...
echo.
if not exist %mbrinst% goto get_mbrinst
if not exist %mbrini% goto get_mbrinst
goto check_for_imagex

:get_mbrinst
echo Getting MBRINST package from HP website...
echo.
set SOFTPAQ_ID=sp44455
set SOFTPAQ_URL=http://ftp.hp.com/pub/softlib/software11/COL31229/pv-77533-1/%SOFTPAQ_ID%.exe

rem Downloading the SoftPaq
cd %workpath%\tools
wget %SOFTPAQ_URL%
title %TITLE%
if not exist %SOFTPAQ_ID%.exe goto err_mbrinst_not_found

rem SoftPaq was downloaded
set TMP_DIR=_mbr
7za x %SOFTPAQ_ID%.exe -o"%SOFTPAQ_ID%" -y
7za x "%SOFTPAQ_ID%\Source\Win7UpgradeRecovery.exe" -o"%TMP_DIR%" -y
move "%TMP_DIR%\hp\tmp\Files\MBR.DLL" %mbrinst%
move "%TMP_DIR%\hp\tmp\Files\MBR.INI" %mbrini%
patch %mbrini% mbr.diff

rem Cleaning up the useless things
rd /S /Q "%SOFTPAQ_ID%"
rd /S /Q "%TMP_DIR%"
del %SOFTPAQ_ID%.exe
if not exist %mbrinst% goto err_mbrinst_invalid
if not exist %mbrini% goto err_mbrinst_invalid
goto check_for_imagex

:check_for_imagex
echo Checking for ImageX...
echo.
if not exist %imagex32% goto get_imagex
if not exist %imagex64% goto get_imagex
goto check_for_oscdimg

:get_imagex
echo Getting ImageX from your computer...
echo.
set imagex32_src="%ProgramFiles%\Windows AIK\Tools\x86\imagex.exe"
set imagex64_src="%ProgramFiles%\Windows AIK\Tools\amd64\imagex.exe"

rem Checking if Windows AIK is installed
if not exist %imagex32_src% goto err_imagex_not_found
if not exist %imagex64_src% goto err_imagex_not_found

rem Copying the ImageX binaries
copy /B %imagex32_src% %imagex32%
copy /B %imagex64_src% %imagex64%

goto check_for_oscdimg

:check_for_oscdimg
echo Checking for OscdImg...
echo.
if not exist %oscdimg% goto get_oscdimg
goto done

:get_oscdimg
echo Getting OscdImg from your computer...
echo.
set oscdimg_src="%ProgramFiles%\Windows AIK\Tools\x86\oscdimg.exe"

rem Checking if Windows AIK is installed
if not exist %oscdimg_src% goto err_oscdimg_not_found

rem Copying the ImageX binaries
copy /B %oscdimg_src% %oscdimg%

goto done

:err_ask_for_admin
echo Please run this script in Administrator mode.
echo This is needed for some tools used in that script (i.e. 'patch').
echo Don't worry, nothing will be modified on your computer.
goto end

:err_mbrinst_not_found
echo.
echo Unable to download the required SoftPaq from HP website. 
echo Please check your Internet connection and/or firewall!
goto end

:err_mbrinst_invalid
echo.
echo Sorry, the downloaded SoftPaq doesn't contains the required files.
echo Can't continue...
goto end

:err_imagex_not_found
echo.
echo Sorry, ImageX binaries weren't found on your computer.
goto err_download_waik

:err_oscdimg_not_found
echo.
echo Sorry, OscdImg binary wasn't found on your computer.
goto err_download_waik

:err_download_waik
echo.
echo Please download the Windows Automated Installation Kit (AIK) for Windows 7:
echo https://www.microsoft.com/en-us/download/details.aspx?id=5753
echo.
echo Please install it and run this program again.
goto end

:done
echo Everything is OK!
goto end

:end
if not "%workpath%"=="" cd %workpath%
pause
