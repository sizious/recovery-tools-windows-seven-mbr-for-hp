@Echo Off
X:
CD \
CD RESET
CLS
IF NOT EXIST SettingsRE.txt EXIT 1
IF NOt EXIST ResetPartitions.txt EXIT 1

ECHO ==============================================
ECHO Deleting / Creating partition
ECHO ==============================================
DISKPART /S ResetPartitions.txt

EXIT 0