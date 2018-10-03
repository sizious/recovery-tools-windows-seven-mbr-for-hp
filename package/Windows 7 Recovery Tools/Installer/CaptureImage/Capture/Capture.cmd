@Echo Off

X:
CD \
CD CAPTURE
CLS
TITLE Windows 7 Capture
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
ECHO CAPTURING Image
ECHO ==================================
X:
CD \
CD CAPTURE
IMAGEX%processor_architecture%.exe /CAPTURE %WINDOWSLETTER%:\ %RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim "Windows 7"


ECHO ==================================
ECHO Deleting BOOT Environment
ECHO ==================================
RD /S /Q %RECOVERYLETTER%:\CAPTURE
FORMAT %SYSTEMLETTER%: /FS:%BOOTFS% /Q /V:SYSTEM /FORCE
%WINDOWSLETTER%:\Windows\System32\BcdBoot.exe %WINDOWSLETTER%:\Windows /l %LANG%
IF NOT ERRORLEVEL 0 (%WINDOWSLETTER%:\Windows\System32\BcdBoot.exe %WINDOWSLETTER%:\Windows /l %LANG% /s %SYSTEMLETTER%:
IF NOT ERRORLEVEL 0 EXIT 1)


ECHO ==================================
ECHO Setting RE Settings
ECHO ==================================
%WINDOWSLETTER%:\Windows\System32\ReAgentc.exe /SetReImage /Target %WINDOWSLETTER%:\Windows /Path %RECOVERYLETTER%:\Recovery\WindowsRE /BootKey %HOTKEY%
%WINDOWSLETTER%:\Windows\System32\ReAgentc.exe /SetOsImage /Target %WINDOWSLETTER%:\Windows /Path %RECOVERYLETTER%:\Recovery\WindowsRE


CLS
ECHO ==================================
ECHO Capture done.
ECHO Computer ready for end-user.
ECHO If you want to try it before
ECHO don't forget to run the
ECHO "FullRestore.Cmd" script from
ECHO the Windows directory to restore
ECHO the factory image for the user.
ECHO ==================================
PAUSE
WPEUTIL SHUTDOWN
