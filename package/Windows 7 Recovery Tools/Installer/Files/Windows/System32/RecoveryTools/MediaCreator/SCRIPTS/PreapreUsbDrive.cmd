@Echo Off
CLS
IF "%1"=="" EXIT 1
IF NOT EXIST "%CD%\..\USB" EXIT 1

ECHO =====================================
ECHO Preparing drive
ECHO =====================================
ECHO select volume %1>"%tmp%\Diskpart.txt"
ECHO clean>>"%tmp%\Diskpart.txt"
ECHO create partition primary>>"%tmp%\Diskpart.txt"
ECHO format fs=fat32 quick label="Recovery">>"%tmp%\Diskpart.txt"
ECHO active>>"%tmp%\Diskpart.txt"
ECHO assign letter %1>>"%tmp%\Diskpart.txt"
DISKPART /s "%tmp%\Diskpart.txt"

ECHO =====================================
ECHO Copying base files
ECHO =====================================
XCOPY /SEVCHK "%CD%\..\USB\*.*" "%1\"
ATTRIB -S -R -H "%1\*.*" /S

COPY /Y C:\Windows\Boot\DVD\PCAT\boot.sdi "%1\boot\boot.sdi"
COPY /Y C:\Windows\Boot\DVD\EFI\boot.sdi "%1\efi\microsoft\boot\boot.sdi"
COPY /Y C:\Windows\Boot\EFI\bootmgr.efi "%1\bootmgr.efi"
COPY /Y C:\Windows\Boot\EFI\bootmgfw.efi "%1\efi\boot\bootx64.efi"
COPY /Y C:\Windows\Boot\EFI\memtest.efi "%1\boot\memtest.efi"
COPY /Y C:\Windows\Boot\PCAT\bootmgr "%1\bootmgr"
COPY /Y C:\Windows\Boot\PCAT\memtest.exe "%1\boot\memtest.exe"
COPY /Y C:\Windows\Boot\Fonts\*.ttf "%1\boot\fonts\"
COPY /Y C:\Windows\Boot\Fonts\*.ttf "%1\efi\microsoft\boot\fonts\"


EXIT 0