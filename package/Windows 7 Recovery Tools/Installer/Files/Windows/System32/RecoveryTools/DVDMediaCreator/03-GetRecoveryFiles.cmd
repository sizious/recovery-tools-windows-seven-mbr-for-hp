@Echo Off
%~d0
CD "%~dp0"

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (.\Settings\SettingsRE.txt) DO SET %%I

XCOPY /SEVHK %RECOVERYLETTER%:\Recovery\WindowsRE\WinRE.Wim C:\RecoveryDVD\TEMP\DISK1\RECOVERY\
XCOPY /SEVHK %RECOVERYLETTER%:\Recovery\WindowsRE\Boot.Sdi C:\RecoveryDVD\TEMP\DISK1\RECOVERY\
XCOPY /SEVHK %RECOVERYLETTER%:\FullRestore\WinRE.wim C:\RecoveryDVD\TEMP\DISK1\FULLRESTORE\
XCOPY /SEVHK %RECOVERYLETTER%:\FullRestore\Boot.Sdi C:\RecoveryDVD\TEMP\DISK1\FULLRESTORE\
ATTRIB -S -R -H C:\RecoveryDVD\TEMP\*.* /S

"%CD%\Tools\Imagex%PROCESSOR_ARCHITECTURE%.EXE" /SPLIT %RECOVERYLETTER%:\Recovery\WindowsRE\Install.WIM C:\RecoveryDVD\TEMP\DISK1\RECOVERY\Install.SWM 3000
IF NOT EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install.swm XCOPY /VHK %RECOVERYLETTER%:\Recovery\WindowsRE\Install.WIM C:\RecoveryDVD\TEMP\DISK1\RECOVERY\

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install.swm IF NOT EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install.Wim EXIT 1
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install2.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install2.swm C:\RecoveryDVD\TEMP\DISK2\Recovery\
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install3.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install3.swm C:\RecoveryDVD\TEMP\DISK3\Recovery\
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install4.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install4.swm C:\RecoveryDVD\TEMP\DISK4\Recovery\
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install5.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install5.swm C:\RecoveryDVD\TEMP\DISK5\Recovery\
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install6.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install6.swm C:\RecoveryDVD\TEMP\DISK6\Recovery\
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install7.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install7.swm C:\RecoveryDVD\TEMP\DISK7\Recovery\
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install8.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install8.swm C:\RecoveryDVD\TEMP\DISK8\Recovery\
IF EXIST C:\RecoveryDVD\TEMP\DISK1\Recovery\Install9.swm MOVE C:\RecoveryDVD\TEMP\DISK1\Recovery\Install9.swm C:\RecoveryDVD\TEMP\DISK9\Recovery\
EXIT 0
