@Echo Off
X:
CD \
CD sources
CD recovery
CD Tools
CD fullrecovery
CLS
IF NOT EXIST SettingsRE.txt EXIT 1

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (SettingsRE.txt) DO SET %%I

ECHO ==================================
ECHO APPLYING Image
ECHO ==================================
X:\sources\recovery\Tools\fullrecovery\IMAGEX%processor_architecture%.exe /APPLY %RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim 1 %WINDOWSLETTER%:\


ECHO ==================================
ECHO Creating BOOT Environment
ECHO ==================================
%WINDOWSLETTER%:\Windows\System32\BcdBoot.exe %WINDOWSLETTER%:\Windows /l %LANG%
IF NOT ERRORLEVEL 0 (%WINDOWSLETTER%:\Windows\System32\BcdBoot.exe %WINDOWSLETTER%:\Windows /l %LANG% /s %SYSTEMLETTER%:
IF NOT ERRORLEVEL 0 EXIT 1)


ECHO ==================================
ECHO Setting RE Settings
ECHO ==================================
ATTRIB -S -R -H %RECOVERYLETTER%:\*.* /S
%WINDOWSLETTER%:\Windows\System32\ReAgentc.exe /SetReImage /Target %WINDOWSLETTER%:\Windows /Path %RECOVERYLETTER%:\Recovery\WindowsRE /BootKey %HOTKEY%
%WINDOWSLETTER%:\Windows\System32\ReAgentc.exe /SetOsImage /Target %WINDOWSLETTER%:\Windows /Path %RECOVERYLETTER%:\Recovery\WindowsRE


EXIT 0