@Echo OFF
CLS
IF "%1"=="" EXIT 1
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
ECHO ASSIGN LETTER=%RECOVERYLETTER% >>"%TMP%\Hdd.txt"
DISKPART /S "%TMP%\Hdd.txt"


ECHO ==================================
ECHO Copying files
ECHO ==================================
MD "%1\RecoveryFiles"
MD "%1\RecoveryFiles\FullRestore"
MD "%1\RecoveryFiles\Recovery"
MD "%1\RecoveryFiles\Recovery\WindowsRE"
MD "%1\RecoveryFilesSWM"
REAGENTC /DISABLE
ATTRIB -S -R -H "%RECOVERYLETTER%:\*.*" /S
COPY %RECOVERYLETTER%:\FullRestore\WinRE.Wim"" "%1\RecoveryFiles\FullRestore\WinRe.Wim"
COPY "%RECOVERYLETTER%:\FullRestore\Boot.Sdi" "%1\RecoveryFiles\FullRestore\Boot.Sdi"
COPY "%RECOVERYLETTER%:\Recovery\WindowsRE\WinRe.Wim" "%1\RecoveryFiles\Recovery\WindowsRE\WinRe.Wim"
COPY "%RECOVERYLETTER%:\FullRestore\Boot.Sdi" "%1\RecoveryFiles\Recovery\WindowsRE\Boot.Sdi"
COPY "%RECOVERYLETTER%:\Recovery\WindowsRE\WinRe.Wim" "%1\sources\boot.wim"
REAGENTC /ENABLE
IMAGEX%PROCESSOR_ARCHITECTURE%.EXE /SPLIT %RECOVERYLETTER%:\Recovery\WindowsRE\Install.WIM %1\RecoveryFilesSWM\Install.Swm 1000


ECHO ==================================
ECHO UnMounting Drive
ECHO ==================================
ECHO SELECT DISK %DISKID% >"%TMP%\Hdd.txt"
ECHO SELECT PARTITION %RECOVERYPART% >>"%TMP%\Hdd.txt"
ECHO REMOVE >>"%TMP%\Hdd.txt"
DISKPART /S "%TMP%\Hdd.txt"

IF NOT EXIST %1\RecoveryFilesSWM\Install.Swm EXIT 1
EXIT 0