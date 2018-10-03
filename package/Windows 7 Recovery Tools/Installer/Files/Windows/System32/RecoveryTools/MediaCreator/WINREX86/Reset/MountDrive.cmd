@Echo Off
X:
CD \
CD RESET
CLS
IF NOT EXIST SettingsRE.txt EXIT 1
IF NOt EXIST ResetPartitions.txt EXIT 1

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

EXIT 0