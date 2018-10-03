@Echo Off
IF NOT EXIST "%CD%\CaptureImage\Capture\SettingsRE.txt" EXIT
IF NOT EXIST "%CD%\Files\Windows\SettingsRE.txt" EXIT
IF NOT EXIST "%CD%\FullRestoreImage\FullRestore\SettingsRE.txt" EXIT
IF NOT EXIST "%CD%\SettingsRE.txt" EXIT
IF NOT EXIST "%CD%\Sysprep.xml" EXIT
CLS
TITLE Recovery Tools 4.0.1 Windows 7 MBR for Hewlett-Packard (HP)
TASKKILL /IM SYSPREP.EXE /F

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (SettingsRE.txt) DO SET %%I

ECHO ==============================================
ECHO MOUNTING RECOVERY PARTITION
ECHO ==============================================
ECHO SELECT DISK %DISKID% >C:\Hdd.txt
ECHO SELECT PARTITION %RECOVERYPART% >>C:\Hdd.txt
ECHO ASSIGN LETTER=%RECOVERYLETTER% >>C:\Hdd.txt
DISKPART /S C:\Hdd.txt
DEL C:\Hdd.txt
IF NOT EXIST %RECOVERYLETTER%:\ GOTO ERRORNOREC


ECHO ==============================================
ECHO BACKUP ORIGINAL WINDOWSRE
ECHO ==============================================
ATTRIB -S -R -H C:\Windows\System32\Recovery\*.* /S
IF NOT EXIST C:\WINDOWS\SYSTEM32\RECOVERY\WINRE.WIM GOTO ERRORNOWINRE
IF NOT EXIST C:\Windows\System32\Recovery\Backup MD C:\Windows\System32\Recovery\Backup
IF NOT EXIST C:\Windows\System32\Recovery\Backup\ReAgent.xml COPY C:\Windows\System32\Recovery\ReAgent.xml C:\Windows\System32\Recovery\Backup\ReAgent.xml
IF NOT EXIST C:\Windows\System32\Recovery\Backup\WinRE.Wim COPY C:\Windows\System32\Recovery\WinRE.Wim C:\Windows\System32\Recovery\Backup\WinRE.Wim


ECHO ==============================================
ECHO COPYING WINDOWSRE
ECHO ==============================================
MD %RECOVERYLETTER%:\Capture
MD %RECOVERYLETTER%:\FullRestore
MD %RECOVERYLETTER%:\Recovery\WindowsRE
COPY C:\Windows\System32\Recovery\WinRE.Wim %RECOVERYLETTER%:\Recovery\WindowsRE\WinRE.Wim
COPY C:\Windows\System32\Recovery\WinRE.Wim %RECOVERYLETTER%:\Capture\WinRE.Wim
COPY C:\Windows\System32\Recovery\WinRE.Wim %RECOVERYLETTER%:\FullRestore\WinRE.Wim
COPY C:\Windows\Boot\DVD\PCAT\Boot.Sdi %RECOVERYLETTER%:\Recovery\WindowsRE\Boot.Sdi
COPY C:\Windows\Boot\DVD\PCAT\Boot.Sdi %RECOVERYLETTER%:\Capture\Boot.Sdi
COPY C:\Windows\Boot\DVD\PCAT\Boot.Sdi %RECOVERYLETTER%:\FullRestore\Boot.Sdi
DEL C:\Windows\System32\Recovery\WinRE.Wim

ECHO ==============================================
ECHO MODIFYING CAPTURE IMAGE
ECHO ==============================================
MD %TMP%\WinRE
DISM /Mount-Wim /Index:1 /WimFile:%RECOVERYLETTER%:\Capture\WinRE.Wim /MountDir:%TMP%\WinRE
ATTRIB -S -R -H %TMP%\WinRE\Windows\System32\WINPESHL.INI
DEL %TMP%\WinRE\Windows\System32\WINPESHL.INI
XCOPY /SEVHKY .\CaptureImage\*.* %TMP%\WinRE\
DISM /UnMount-Wim /MountDir:%TMP%\WinRE /commit


ECHO ==============================================
ECHO MODIFYING FULL RESTORE IMAGE
ECHO ==============================================
MD %TMP%\WinRE
DISM /Mount-Wim /Index:1 /WimFile:%RECOVERYLETTER%:\FullRestore\WinRE.Wim /MountDir:%TMP%\WinRE
ATTRIB -S -R -H %TMP%\WinRE\Windows\System32\WINPESHL.INI
DEL %TMP%\WinRE\Windows\System32\WINPESHL.INI
XCOPY /SEVHKY .\FullRestoreImage\*.* %TMP%\WinRE\
DISM /UnMount-Wim /MountDir:%TMP%\WinRE /commit

ECHO ==============================================
ECHO MODIFYING RECOVERY TOOLS
ECHO ==============================================
MD %TMP%\WinRE
DISM /Mount-Wim /Index:1 /WimFile:%RECOVERYLETTER%:\Recovery\WindowsRE\WinRE.Wim /MountDir:%TMP%\WinRE
XCOPY /SEVHKY .\WinRE%PROCESSOR_ARCHITECTURE%\*.* %TMP%\WinRE\
DISM /UnMount-Wim /MountDir:%TMP%\WinRE /commit


ECHO ==============================================
ECHO Configuring SetupComplete.Cmd
ECHO ==============================================

set SETUP_SCRIPT_DIR=%SYSTEMROOT%\Setup\Scripts
set SETUP_COMPLETE_FILE=%SETUP_SCRIPT_DIR%\SetupComplete.cmd

if not exist %SETUP_SCRIPT_DIR% md %SETUP_SCRIPT_DIR%

rem Add add-ons
if exist .\Addons xcopy /SEVHKY .\Addons\*.* %SETUP_SCRIPT_DIR%

rem Check if SetupComplete exists or not
if exist %SETUP_COMPLETE_FILE% goto setup_complete_exist
goto setup_complete_not_exist

:setup_complete_exist
set HDD_SHOW_RECOVERY_PARTITION_FILE=%SETUP_SCRIPT_DIR%\recvshow.bin

echo SELECT DISK %DISKID% > %HDD_SHOW_RECOVERY_PARTITION_FILE%
echo SELECT PARTITION %RECOVERYPART% >> %HDD_SHOW_RECOVERY_PARTITION_FILE%
echo ASSIGN LETTER=%RECOVERYLETTER% >> %HDD_SHOW_RECOVERY_PARTITION_FILE%

move %SETUP_COMPLETE_FILE% %SETUP_COMPLETE_FILE%.bak
echo @echo off > %SETUP_COMPLETE_FILE%
echo DISKPART /S %HDD_SHOW_RECOVERY_PARTITION_FILE% >> %SETUP_COMPLETE_FILE%
type %SETUP_COMPLETE_FILE%.bak >> %SETUP_COMPLETE_FILE%
if exist %SETUP_COMPLETE_FILE%.bak del %SETUP_COMPLETE_FILE%.bak
goto setup_complete_finalize

:setup_complete_not_exist
rem Create an empty file if the script doesn't exist
echo. > %SETUP_COMPLETE_FILE%
goto setup_complete_finalize

:setup_complete_finalize
set HDD_HIDE_RECOVERY_PARTITION_FILE=%SETUP_SCRIPT_DIR%\recvhide.bin

echo SELECT DISK %DISKID% > %HDD_HIDE_RECOVERY_PARTITION_FILE%
echo SELECT PARTITION %RECOVERYPART% >> %HDD_HIDE_RECOVERY_PARTITION_FILE%
echo REMOVE >> %HDD_HIDE_RECOVERY_PARTITION_FILE%

echo DISKPART /S %HDD_HIDE_RECOVERY_PARTITION_FILE% >> %SETUP_COMPLETE_FILE%

rem SetupComplete Finished

ECHO ==============================================
ECHO PREPARING HP F11 BOOT IMAGE
ECHO ==============================================

REM Setting up variables
set FINAL_BOOTWIM_DIR=%SETUP_SCRIPT_DIR%\CreateBootableRecoveryPartition
set BOOTWIM=%FINAL_BOOTWIM_DIR%\boot.wim
set MOUNT_DIR=%FINAL_BOOTWIM_DIR%\mount
set WINRE_HP_F11_DIR=sources\recovery\Tools\fullrecovery
set WINRE_SOURCE_DIR=.\WinRE%PROCESSOR_ARCHITECTURE%\%WINRE_HP_F11_DIR%
set WINRE_TARGET_DIR=%MOUNT_DIR%\%WINRE_HP_F11_DIR%

REM Doing some checks before starting
if exist %BOOTWIM% del %BOOTWIM%
if not exist %FINAL_BOOTWIM_DIR% md %FINAL_BOOTWIM_DIR%
if not exist %MOUNT_DIR% md %MOUNT_DIR%

rem Copy the WinRE.wim file
copy /B %SYSTEMROOT%\System32\Recovery\Backup\WinRE.wim %MOUNT_DIR%\..\
if exist %MOUNT_DIR%\..\WinRE.wim ren %MOUNT_DIR%\..\WinRE.wim boot.wim
attrib -s -h -r -a %BOOTWIM%

rem Mount the boot.wim file
dism /MOUNT-WIM /WimFile:%BOOTWIM% /Index:1 /MountDir:%MOUNT_DIR%

rem Setting up the WINPESHL.INI file
set WINPESHL=%MOUNT_DIR%\Windows\System32\WINPESHL.INI
attrib -s -h -r -a %WINPESHL%
echo [LaunchApp] > %WINPESHL%
echo AppPath=%%SYSTEMDRIVE%%\%WINRE_HP_F11_DIR%\RecoveryRE%PROCESSOR_ARCHITECTURE%.exe >> %WINPESHL%

rem Alter the boot.wim content
if not exist %WINRE_TARGET_DIR% md %WINRE_TARGET_DIR%
xcopy /SEVHKY %WINRE_SOURCE_DIR%\*.* %WINRE_TARGET_DIR%

rem Unmount and commit changes on the boot.wim
dism /UNMOUNT-WIM /MountDir:%MOUNT_DIR% /Commit
if exist %MOUNT_DIR% rd /S /Q %MOUNT_DIR%

ECHO ==============================================
ECHO SYSPREPING THE COMPUTER
ECHO ==============================================
XCOPY .\Files\*.* /SEVHKY C:\
START /WAIT C:\Windows\System32\Sysprep\SysPrep.exe /generalize /oobe /quit /unattend:SysPrep.Xml
START /WAIT CreateShortcut "C:\Windows\System32\RecoveryTools\Recovery%PROCESSOR_ARCHITECTURE%.EXE" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Recovery Tools.lnk"


ECHO ==============================================
ECHO ADDING CAPTURE IMAGE
ECHO ==============================================
FOR /F "delims={} tokens=2" %%I IN ('BCDEDIT.EXE /create /application OSLOADER /d Capture') DO SET OSGUID=%%I
FOR /F "delims={} tokens=2" %%I IN ('BCDEDIT.EXE /create /device /d Capture') DO SET RAMGUID=%%I
SET OSGUID={%OSGUID%}
SET RAMGUID={%RAMGUID%}
bcdedit /set %OSGUID% device ramdisk=[%RECOVERYLETTER%:]\Capture\WinRe.Wim,%RAMGUID%
bcdedit /set %OSGUID% osdevice ramdisk=[%RECOVERYLETTER%:]\Capture\WinRe.Wim,%RAMGUID%
bcdedit /set %OSGUID% path \windows\system32\boot\%WINLOAD%
bcdedit /set %OSGUID% locale %LANG%
bcdedit /set %OSGUID% inherit {bootloadersettings}
bcdedit /set %OSGUID% systemroot \windows
bcdedit /set %OSGUID% detecthal Yes
bcdedit /set %OSGUID% winpe Yes
bcdedit /set %OSGUID% ems No
bcdedit /set %RAMGUID% ramdisksdidevice partition=%RECOVERYLETTER%:
bcdedit /set %RAMGUID% ramdisksdipath \Capture\BOOT.SDI
bcdedit /set {bootmgr} displayorder %OSGUID% /addlast
bcdedit /set {bootmgr} locale %LANG%
bcdedit /set {current} locale %LANG%
bcdedit /delete {current}


ECHO ==============================================
ECHO Rebooting the computer
ECHO ==============================================
SHUTDOWN -R -F -T 15
GOTO QUIT


:ERRORNOREC
CLS
ECHO *********************************
ECHO Recovery partition not found.
ECHO *********************************
ECHO Check settings and try again.
ECHO *********************************
PAUSE
GOTO QUIT


:ERRORNOWINRE
CLS
ECHO *********************************
ECHO WinRE.wim not found.
ECHO *********************************
ECHO Check settings and try again.
ECHO Be sure to be in AUDIT mode.
ECHO Be sure to use original Windows
ECHO media.
ECHO *********************************
PAUSE
GOTO QUIT

:QUIT
EXIT