@Echo Off
%~d0
CD "%~dp0"

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (.\Settings\SettingsRE.txt) DO SET %%I

ECHO SELECT DISK %DISKID% >C:\Mount.Txt
ECHO SELECT PARTITION %RECOVERYPART% >>C:\Mount.Txt
ECHO ASSIGN LETTER %RECOVERYLETTER% >>C:\Mount.Txt
DISKPART /S C:\Mount.Txt
DEL C:\Mount.Txt
IF NOT EXIST %RECOVERYLETTER%:\Recovery\WindowsRE\WinRE.Wim EXIT 1
IF NOT EXIST %RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim EXIT 1
EXIT 0