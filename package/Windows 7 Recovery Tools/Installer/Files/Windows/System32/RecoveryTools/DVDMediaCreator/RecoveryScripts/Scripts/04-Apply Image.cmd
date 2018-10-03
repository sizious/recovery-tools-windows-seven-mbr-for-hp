@Echo Off
CLS

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (X:\Settings\SettingsRE.txt) DO SET %%I

X:\Scripts\Imagex%PROCESSOR_ARCHITECTURE%.EXE /Apply %RECOVERYLETTER%:\Recovery\WindowsRE\Install.wim 1 %WINDOWSLETTER%:\
IF NOT EXIST %WINDOWSLETTER%:\Windows EXIT 1
BCDBOOT %WINDOWSLETTER%:\Windows
%WINDOWSLETTER%:\Windows\System32\Reagentc.exe /SetReImage /Path %RECOVERYLETTER%:\Recovery\WindowsRE /Target %WINDOWSLETTER%:\Windows
%WINDOWSLETTER%:\Windows\System32\Reagentc.exe /SetOsImage /Path %RECOVERYLETTER%:\Recovery\WindowsRE /Target %WINDOWSLETTER%:\Windows  /BootKey %HOTKEY%
EXIT 0