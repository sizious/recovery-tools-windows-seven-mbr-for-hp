@Echo Off
CLS
IF "%1"=="" EXIT 1


ECHO =======================
ECHO Mounting WinRE
ECHO =======================
RD /S /Q "%TMP%\Mount"
MD "%TMP%\Mount"
DISM /Mount-Wim /WimFile:%1\sources\boot.wim /index:1 /mountdir:"%tmp%\mount"

ECHO =======================
ECHO Copying files
ECHO =======================
ATTRIB -S -R -H "%tmp%\mount\windows\system32\WINPESHL.INI"
XCOPY "%CD%\..\WINRE%PROCESSOR_ARCHITECTURE%\*.*" "%tmp%\mount\" /SEVCHKY

ECHO =======================
ECHO UnMounting WinRE
ECHO =======================
DISM /UnMount-Wim /mountdir:"%tmp%\mount" /commit

REM EXIT 0