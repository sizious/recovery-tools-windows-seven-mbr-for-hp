@Echo Off

CLS
TITLE Windows 7 Reinstall
X:
CD \
CD FullRestore

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (SettingsRE.txt) DO SET %%I


ECHO ==================================
ECHO Mounting Drive
ECHO ==================================
ECHO SELECT DISK %DISKID% >X:\Hdd.txt
ECHO SELECT PARTITION %RECOVERYPART% >>X:\Hdd.txt
ECHO ASSIGN LETTER=%RECOVERYLETTER% >>X:\Hdd.txt
ECHO SELECT PARTITION %SYSTEMPART% >>X:\Hdd.txt
ECHO ASSIGN LETTER=%SYSTEMLETTER% >>X:\Hdd.txt
ECHO SELECT PARTITION %WINDOWSPART% >>X:\Hdd.txt
ECHO ASSIGN LETTER=%WINDOWSLETTER% >>X:\Hdd.txt
DISKPART /S X:\Hdd.txt


ECHO ==================================
ECHO APPLYING Image
ECHO ==================================
FORMAT %WINDOWSLETTER%: /FS:NTFS /Q /V:Systäme /FORCE
X:\FullRestore\IMAGEX%processor_architecture%.exe /APPLY %RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim 1 %WINDOWSLETTER%:\


ECHO ==================================
ECHO Deleting BOOT Environment
ECHO ==================================
FORMAT %SYSTEMLETTER%: /FS:%BOOTFS% /Q /V:SYSTEM /FORCE
%WINDOWSLETTER%:\Windows\System32\BcdBoot.exe %WINDOWSLETTER%:\Windows /l %LANG%
IF NOT ERRORLEVEL 0 (%WINDOWSLETTER%:\Windows\System32\BcdBoot.exe %WINDOWSLETTER%:\Windows /l %LANG% /s %SYSTEMLETTER%:
IF NOT ERRORLEVEL 0 EXIT 1)


ECHO ==================================
ECHO Setting RE Settings
ECHO ==================================
ATTRIB -S -R -H %RECOVERYLETTER%:\*.* /S
%WINDOWSLETTER%:\Windows\System32\ReAgentc.exe /SetReImage /Target %WINDOWSLETTER%:\Windows /Path %RECOVERYLETTER%:\Recovery\WindowsRE /BootKey %HOTKEY%
%WINDOWSLETTER%:\Windows\System32\ReAgentc.exe /SetOsImage /Target %WINDOWSLETTER%:\Windows /Path %RECOVERYLETTER%:\Recovery\WindowsRE


CLS
ECHO ==================================
ECHO Computer has be reimaged.
ECHO The computer will be shut down.
ECHO On next reboot, OOBE will start.
ECHO The computer is ready for the
ECHO end user now.
ECHO ==================================
PAUSE
WPEUTIL SHUTDOWN
