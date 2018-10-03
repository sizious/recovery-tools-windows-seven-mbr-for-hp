@Echo Off
CLS

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (X:\Settings\SettingsRE.txt) DO SET %%I

ECHO ========================================
ECHO Creating DiskPart Script
ECHO ========================================
TYPE X:\Settings\ResetPartitions.txt >>X:\Settings\ResetHDD.txt
ECHO SELECT DISK %DISKID% >>X:\Settings\ResetHDD.txt
ECHO SELECT PARTITION %RECOVERYPART% >>X:\Settings\ResetHDD.txt
ECHO ASSIGN LETTER=%RECOVERYLETTER% >>X:\Settings\ResetHDD.txt
ECHO SELECT PARTITION %WINDOWSPART% >>X:\Settings\ResetHDD.txt
ECHO ASSIGN LETTER=%WINDOWSLETTER% >>X:\Settings\ResetHDD.txt
ECHO SELECT PARTITION %SYSTEMPART% >>X:\Settings\ResetHDD.txt
ECHO ASSIGN LETTER=%SYSTEMLETTER% >>X:\Settings\ResetHDD.txt
DISKPART /S X:\Settings\ResetHDD.txt

IF NOT EXIST %WINDOWSLETTER%:\ EXIT 1
IF NOT EXIST %SYSTEMLETTER%:\ EXIT 1
IF NOT EXIST %RECOVERYLETTER%:\ EXIT 1
EXIT 0