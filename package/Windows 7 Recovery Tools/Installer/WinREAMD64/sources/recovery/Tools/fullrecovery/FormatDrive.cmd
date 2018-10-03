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
ECHO Formatting Drive
ECHO ==================================
FORMAT %WINDOWSLETTER%: /FS:NTFS /Q /FORCE /V:OS
FORMAT %SYSTEMLETTER%: /FS:%BOOTFS% /Q /FORCE /V:SYSTEM

EXIT 0