@Echo Off
CLS

ECHO ==============================================
ECHO Finding DVD
ECHO ==============================================
SET SRC=-1
FOR /D %%I in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO (
IF EXIST %%I:\Recovery\Install.WIM SET SRC=%%I
IF EXIST %%I:\Recovery\Install*.SWM SET SRC=%%I
)
IF "%SRC%"=="-1" EXIT 1

ECHO ==============================================
ECHO Loading Settings
ECHO ==============================================
FOR /F "delims=; tokens=1" %%I in (X:\Settings\SettingsRE.txt) DO SET %%I
FOR /F "delims=; tokens=1" %%I in (X:\Settings\DVD.Tag) DO SET LASTIMG=%%I

ECHO ==============================================
ECHO Copying DVD Files
ECHO ==============================================
MD %WINDOWSLETTER%:\TempRecovery
MD %WINDOWSLETTER%:\TempRecovery\Recovery
MD %WINDOWSLETTER%:\TempRecovery\FullRestore
ROBOCOPY "%SRC%:\Recovery" "%WINDOWSLETTER%:\TempRecovery\Recovery" *.* /W:1 /R:5
ROBOCOPY "%SRC%:\FullRestore" "%WINDOWSLETTER%:\TempRecovery\FullRestore" *.* /W:1 /R:5
ATTRIB -S -R -H %WINDOWSLETTER%:\TempRecovery\*.* /S

ECHO ==============================================
ECHO Validating for all files
ECHO ==============================================
IF /I "%LASTIMG%"=="Install.Wim" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.Wim EXIT 0
IF /I "%LASTIMG%"=="Install2.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM EXIT 0
IF /I "%LASTIMG%"=="Install3.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install3.SWM EXIT 0
IF /I "%LASTIMG%"=="Install4.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install3.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install4.SWM EXIT 0
IF /I "%LASTIMG%"=="Install5.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install3.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install4.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install5.SWM EXIT 0
IF /I "%LASTIMG%"=="Install6.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install3.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install4.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install5.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install6.SWM EXIT 0
IF /I "%LASTIMG%"=="Install7.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install3.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install4.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install5.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install6.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install7.SWM EXIT 0
IF /I "%LASTIMG%"=="Install8.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install3.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install4.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install5.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install6.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install7.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install8.SWM EXIT 0
IF /I "%LASTIMG%"=="Install9.Swm" IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install2.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install3.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install4.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install5.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install6.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install7.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install8.SWM IF EXIST %WINDOWSLETTER%:\TempRecovery\Recovery\Install9.SWM EXIT 0
CLS
ECHO "Next disk needed!"
ECHO "Please run this script again."
EXIT 2

