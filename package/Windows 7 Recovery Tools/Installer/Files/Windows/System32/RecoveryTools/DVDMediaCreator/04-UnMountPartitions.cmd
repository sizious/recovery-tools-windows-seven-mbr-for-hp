@Echo Off
%~d0
CD "%~dp0"

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (.\Settings\SettingsRE.txt) DO SET %%I

ECHO SELECT DISK %DISKID% >C:\UnMount.Txt
ECHO SELECT VOLUME %RECOVERYLETTER% >>C:\UnMount.Txt
ECHO REMOVE >>C:\UnMount.Txt
DISKPART /S C:\UnMount.Txt
DEL C:\UnMount.Txt
EXIT 0