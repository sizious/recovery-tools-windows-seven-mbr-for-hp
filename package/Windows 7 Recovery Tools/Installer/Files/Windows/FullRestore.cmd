@Echo Off

C:
CD \
CD WINDOWS
CLS
TITLE Full Windows 7 Restore

ECHO Dummy>C:\AdminCheck.Tag
IF EXIST C:\AdminCheck.Tag GOTO RUN

CLS
ECHO ==============================================
ECHO Please run this tool as an Administrator
ECHO ==============================================
PAUSE
EXIT


:RUN
ECHO ==============================================
ECHO This will restore the computer to factory
ECHO default. All data will be erased.
ECHO In case of MUI image, you will again have
ECHO the choice of the language.
ECHO No data will be preserved in the Windows.Old
ECHO folder. The boot sector will be rewritted
ECHO and the boot loader setting will be
ECHO recreated.
ECHO ==============================================
PAUSE

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (SettingsRE.txt) DO SET %%I

ECHO ==============================================
ECHO Mounting Drive
ECHO ==============================================
ECHO SELECT DISK %DISKID% >C:\Hdd.txt
ECHO SELECT PARTITION %RECOVERYPART% >>C:\Hdd.txt
ECHO ASSIGN LETTER=%RECOVERYLETTER% >>C:\Hdd.txt
DISKPART /S C:\Hdd.txt
DEL C:\Hdd.txt


ECHO ==============================================
ECHO Modifying Boot Loader
ECHO ==============================================
FOR /F "delims={} tokens=2" %%I IN ('BCDEDIT.EXE /create /application OSLOADER /d Restore') DO SET OSGUID=%%I
FOR /F "delims={} tokens=2" %%I IN ('BCDEDIT.EXE /create /device /d Restore') DO SET RAMGUID=%%I
SET OSGUID={%OSGUID%}
SET RAMGUID={%RAMGUID%}
bcdedit /set %OSGUID% device ramdisk=[%RECOVERYLETTER%:]\FullRestore\WinRe.Wim,%RAMGUID%
bcdedit /set %OSGUID% osdevice ramdisk=[%RECOVERYLETTER%:]\FullRestore\WinRe.Wim,%RAMGUID%
bcdedit /set %OSGUID% path \windows\system32\boot\%WINLOAD%
bcdedit /set %OSGUID% locale %LANG%
bcdedit /set %OSGUID% inherit {bootloadersettings}
bcdedit /set %OSGUID% systemroot \windows
bcdedit /set %OSGUID% detecthal Yes
bcdedit /set %OSGUID% winpe Yes
bcdedit /set %OSGUID% ems No
bcdedit /set %RAMGUID% ramdisksdidevice partition=%RECOVERYLETTER%:
bcdedit /set %RAMGUID% ramdisksdipath \FullRestore\BOOT.SDI
bcdedit /set {bootmgr} displayorder %OSGUID% /addlast
bcdedit /set {bootmgr} locale %LANG%
bcdedit /set {current} locale %LANG%
bcdedit /delete {current}

CLS
ECHO ==============================================
ECHO Computer will shut down. On next reboot, it
ECHO will be restored to factory default.
ECHO ==============================================
PAUSE
SHUTDOWN -S -F -T 15