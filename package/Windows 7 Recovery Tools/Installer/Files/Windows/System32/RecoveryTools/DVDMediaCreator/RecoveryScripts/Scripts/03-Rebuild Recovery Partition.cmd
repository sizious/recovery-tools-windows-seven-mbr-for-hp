@Echo Off
CLS

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (X:\Settings\SettingsRE.txt) DO SET %%I

MD %RECOVERYLETTER%:\Recovery
MD %RECOVERYLETTER%:\Recovery\WindowsRE
MD %RECOVERYLETTER%:\FullRestore

IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.swm X:\Scripts\IMAGEX%PROCESSOR_ARCHITECTURE%.EXE /REF %WINDOWSLETTER%:\TempRecovery\Recovery\*.SWM /Export %WINDOWSLETTER%:\TempRecovery\Recovery\Install.swm 1 %RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim "Windows"
IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.Wim XCOPY /VHK %WINDOWSLETTER%:\TempRecovery\Recovery\Install.Wim %RECOVERYLETTER%:\Recovery\WindowsRE\

COPY %WINDOWSLETTER%:\TempRecovery\Recovery\WinRE.WIM %RECOVERYLETTER%:\Recovery\WindowsRE\WinRE.WIM
COPY %WINDOWSLETTER%:\TempRecovery\Recovery\Boot.sdi %RECOVERYLETTER%:\Recovery\WindowsRE\Boot.Sdi
COPY %WINDOWSLETTER%:\TempRecovery\FullRestore\WinRE.WIM %RECOVERYLETTER%:\FullRestore\WinRE.WIM
COPY %WINDOWSLETTER%:\TempRecovery\FullRestore\Boot.sdi %RECOVERYLETTER%:\FullRestore\Boot.Sdi

ATTRIB -S -R -H %RECOVERYLETTER%:\*.* /S

IF NOT EXIST %RECOVERYLETTER%:\Recovery\WindowsRE\Install.Wim EXIT 1
IF NOT EXIST %RECOVERYLETTER%:\Recovery\WindowsRE\WinRE.Wim EXIT 1
RD /S /Q %WINDOWSLETTER%:\TempRecovery
EXIT 0