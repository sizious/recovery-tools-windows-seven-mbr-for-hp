@ECHO OFF
CD SETTINGS
CLS
ECHO ===============================================
ECHO Deleting current settings
ECHO ===============================================
DEL /F "%CD%\..\Installer\CaptureImage\Capture\SettingsRE.txt"
DEL /F "%CD%\..\Installer\Files\Windows\SettingsRE.txt"
DEL /F "%CD%\..\Installer\FullRestoreImage\FullRestore\SettingsRE.txt"
DEL /F "%CD%\..\Installer\SettingsRE.txt"
DEL /F "%CD%\..\Installer\Sysprep.xml"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\Settings.ini"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\Scripts\SettingsRE.Txt"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\SettingsRE.Txt"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\SettingsRE.Txt"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\ResetPartitions.txt"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\ResetPartitions.txt"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\Settings.ini"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\Settings.ini"
DEL /F "%CD%\..\Installer\CaptureImage\Capture\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\CaptureImage\Capture\imagexX86.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexX86.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexX86.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexX86.exe"
DEL /F "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexX86.exe"
DEL /F "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexX86.exe"
DEL /F "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\SettingsRE.Txt"
DEL /F "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\Settings.ini"
DEL /F "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexX86.exe"
DEL /F "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\SettingsRE.Txt"
DEL /F "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\Settings.ini"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\ResetPartitions.txt"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\Settings.ini"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\SettingsRE.txt"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexX86.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexAMD64.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexX86.exe"
DEL /F "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DVDMediaCreator\Tools\OscdImg.exe"
ECHO All current settings files deleted.

ECHO ===============================================
ECHO Verifying current settings
ECHO ===============================================
IF EXIST "%CD%\..\Installer\CaptureImage\Capture\SettingsRE.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\SettingsRE.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\FullRestoreImage\FullRestore\SettingsRE.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\SettingsRE.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Sysprep.xml" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\Settings.ini" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\Scripts\SettingsRE.Txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\SettingsRE.Txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\SettingsRE.Txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\ResetPartitions.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\ResetPartitions.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\Settings.ini" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\Settings.ini" GOTO ERROR
IF EXIST "%CD%\..\Installer\CaptureImage\Capture\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\CaptureImage\Capture\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\SettingsRE.Txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\Settings.ini" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\SettingsRE.Txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\Settings.ini" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\ResetPartitions.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\Settings.ini" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\SettingsRE.txt" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexAMD64.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexX86.exe" GOTO ERROR
IF EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DVDMediaCreator\Tools\OscdImg.exe" GOTO ERROR
ECHO All current settings files deleted and validated.

ECHO ===============================================
ECHO Copying new settings
ECHO ===============================================
COPY /Y SettingsRE.txt "%CD%\..\Installer\CaptureImage\Capture\SettingsRE.txt"
COPY /Y SettingsRE.txt "%CD%\..\Installer\Files\Windows\SettingsRE.txt"
COPY /Y SettingsRE.txt "%CD%\..\Installer\FullRestoreImage\FullRestore\SettingsRE.txt"
COPY /Y SettingsRE.txt "%CD%\..\Installer\SettingsRE.txt"
COPY /Y Sysprep.xml "%CD%\..\Installer\Sysprep.xml"
COPY /Y SettingsRE.txt "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\Scripts\SettingsRE.Txt"
COPY /Y SettingsRE.txt "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\SettingsRE.Txt"
COPY /Y SettingsRE.txt "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\SettingsRE.Txt"
COPY /Y Settings.ini "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\Settings.ini"
COPY /Y ResetPartitions.txt "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\ResetPartitions.txt"
COPY /Y ResetPartitions.txt "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\ResetPartitions.txt"
COPY /Y Settings.ini "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\Mediacreator\WINREAMD64\Reset\Settings.ini"
COPY /Y Settings.ini "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\Settings.ini"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\CaptureImage\Capture\imagexX86.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexX86.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexX86.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexX86.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexX86.exe"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\CaptureImage\Capture\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexX86.exe"
COPY /Y SettingsRE.txt "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\SettingsRE.Txt"
COPY /Y Settings.ini "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\Settings.ini"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexX86.exe"
COPY /Y SettingsRE.txt "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\SettingsRE.Txt"
COPY /Y Settings.ini "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\Settings.ini"
COPY /Y ResetPartitions.txt "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\ResetPartitions.txt"
COPY /Y Settings.ini "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\Settings.ini"
COPY /Y SettingsRE.txt "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\SettingsRE.txt"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexX86.exe"
COPY /Y "%CD%\..\ImageX\64bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexAMD64.exe"
COPY /Y "%CD%\..\ImageX\32bits\Imagex.ExE" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexX86.exe"
COPY /Y "%CD%\..\OscdImg\OscdImg.exe" "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DVDMediaCreator\Tools\OscdImg.exe"
ECHO New settings file copied.

ECHO ===============================================
ECHO Verifying current settings
ECHO ===============================================
IF NOT EXIST "%CD%\..\Installer\CaptureImage\Capture\SettingsRE.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\SettingsRE.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\FullRestoreImage\FullRestore\SettingsRE.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\SettingsRE.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Sysprep.xml" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\Settings.ini" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\Scripts\SettingsRE.Txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\SettingsRE.Txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\SettingsRE.Txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\ResetPartitions.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\ResetPartitions.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\Settings.ini" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\Settings.ini" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\CaptureImage\Capture\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\CaptureImage\Capture\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\FullRestoreImage\FullRestore\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\SettingsRE.Txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\Settings.ini" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\SettingsRE.Txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\WinREX86\sources\recovery\Tools\fullrecovery\Settings.ini" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\ResetPartitions.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\Settings.ini" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\SettingsRE.txt" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexAMD64.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexX86.exe" GOTO ERROR
IF NOT EXIST "%CD%\..\Installer\Files\Windows\System32\RecoveryTools\DVDMediaCreator\Tools\OscdImg.exe" GOTO ERROR
ECHO New settings file copied and validated.

REM --- START SiZiOUS PATCH ---
set workpath=%~dp0
set workpath=%workpath:~0,-1%

set mbrinst_src="%workpath%\MbrInst\mbrinst.exe"
set mbrini_src="%workpath%\MbrInst\mbr.ini"
if not exist %mbrinst_src% goto error
if not exist %mbrini_src% goto error

set mbrinst_dest="%workpath%\Installer\Addons\CreateBootableRecoveryPartition\mbrinst.exe"
set mbrini_dest="%workpath%\Installer\Addons\CreateBootableRecoveryPartition\mbr.ini"

if not exist %mbrinst_dest% copy /B %mbrinst_src% %mbrinst_dest%
if not exist %mbrini_dest% copy /B %mbrini_src% %mbrini_dest%

"%workpath%\tools\7za" a "%CD%\..\install.zip" "%CD%\..\Installer\*" -mx=9
REM --- END SiZiOUS PATCH ---

ECHO.
ECHO Everything is OK!
GOTO QUIT

:ERROR
ECHO ===============================================
ECHO Error
ECHO ===============================================
ECHO An error occured while updating the settings.
ECHO Please be sure to run this script from a
ECHO writable source where your credentials allow
ECHO you to write.
ECHO ===============================================
ECHO Be sure you have copied the required files to
ECHO their respective folder. You need:
ECHO - OscdImg.exe (32bits)
ECHO - Imagex.exe (32bits)
ECHO - Imagex.exe (64bits)
echo - For HP F11: MBRINST.EXE (32bits) and MBR.INI
ECHO Please read the documentation for more details
ECHO ===============================================
ECHO Script unusable.
GOTO QUIT

:QUIT
PAUSE