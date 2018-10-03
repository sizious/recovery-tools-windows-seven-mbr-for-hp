@Echo OFF
CLS
IF NOT EXIST SettingsRE.txt EXIT 1

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (SettingsRE.txt) DO SET %%I


ECHO ==================================
ECHO Mounting Drive
ECHO ==================================
ECHO SELECT DISK %DISKID% >"%TMP%\Hdd.txt"
ECHO SELECT PARTITION %RECOVERYPART% >>"%TMP%\Hdd.txt"
ECHO REMOVE >>"%TMP%\Hdd.txt"
DISKPART /S "%TMP%\Hdd.txt"


EXIT 0