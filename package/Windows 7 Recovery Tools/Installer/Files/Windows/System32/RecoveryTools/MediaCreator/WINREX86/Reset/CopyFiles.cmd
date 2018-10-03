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
ECHO Copying files
ECHO ==================================
SET SRC=-1
IF EXIST C:\RecoveryFilesSWM\Install.Swm SET SRC=C
IF EXIST D:\RecoveryFilesSWM\Install.Swm SET SRC=D
IF EXIST E:\RecoveryFilesSWM\Install.Swm SET SRC=E
IF EXIST F:\RecoveryFilesSWM\Install.Swm SET SRC=F
IF EXIST G:\RecoveryFilesSWM\Install.Swm SET SRC=G
IF EXIST H:\RecoveryFilesSWM\Install.Swm SET SRC=H
IF EXIST I:\RecoveryFilesSWM\Install.Swm SET SRC=I
IF EXIST J:\RecoveryFilesSWM\Install.Swm SET SRC=J
IF EXIST K:\RecoveryFilesSWM\Install.Swm SET SRC=K
IF EXIST L:\RecoveryFilesSWM\Install.Swm SET SRC=L
IF EXIST M:\RecoveryFilesSWM\Install.Swm SET SRC=M
IF EXIST N:\RecoveryFilesSWM\Install.Swm SET SRC=N
IF EXIST O:\RecoveryFilesSWM\Install.Swm SET SRC=O
IF EXIST P:\RecoveryFilesSWM\Install.Swm SET SRC=P
IF EXIST Q:\RecoveryFilesSWM\Install.Swm SET SRC=Q
IF EXIST R:\RecoveryFilesSWM\Install.Swm SET SRC=R
IF EXIST S:\RecoveryFilesSWM\Install.Swm SET SRC=S
IF EXIST T:\RecoveryFilesSWM\Install.Swm SET SRC=T
IF EXIST U:\RecoveryFilesSWM\Install.Swm SET SRC=Y
IF EXIST V:\RecoveryFilesSWM\Install.Swm SET SRC=V
IF EXIST W:\RecoveryFilesSWM\Install.Swm SET SRC=W
IF EXIST X:\RecoveryFilesSWM\Install.Swm SET SRC=X
IF EXIST Y:\RecoveryFilesSWM\Install.Swm SET SRC=Y
IF EXIST Z:\RecoveryFilesSWM\Install.Swm SET SRC=Z
IF "%SRC%"=="-1" EXIT 1

XCOPY "%SRC%:\RecoveryFiles\*.*" "%RECOVERYLETTER%:\" /SEVCHKY
ATTRIB -S -R -H "%RECOVERYLETTER%:\*.*" /S
IMAGEX%PROCESSOR_ARCHITECTURE%.EXE /REF "%SRC%:\RecoveryFilesSWM\*.SWM" /EXPORT "%SRC%:\RecoveryFilesSWM\Install.Swm" 1 "%RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim"
IF NOT EXIST %RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim EXIT 1

EXIT 0