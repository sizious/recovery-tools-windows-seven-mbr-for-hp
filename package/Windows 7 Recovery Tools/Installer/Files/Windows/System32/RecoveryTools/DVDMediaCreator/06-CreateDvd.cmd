@Echo Off
%~d0
CD "%~dp0"

ECHO =============================
ECHO Creating DVD 1 ISO File
ECHO =============================
IF EXIST C:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\Efisys.bin .\Tools\Oscdimg -m -o -u2 -udfver102 -bootdata:2#p0,e,bC:\RecoveryDVD\TEMP\Disk1\boot\etfsboot.com#pEF,e,bC:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\Efisys.bin -lRecovery1 C:\RecoveryDVD\TEMP\Disk1 C:\RecoveryDVD\TEMP\Disk1.iso
IF NOT EXIST C:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\Efisys.bin .\Tools\Oscdimg -m -o -u2 -udfver102 -bC:\RecoveryDVD\TEMP\Disk1\boot\etfsboot.com -lRecovery1 C:\RecoveryDVD\TEMP\Disk1 C:\RecoveryDVD\TEMP\Disk1.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK1

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK2\Recovery\Install2.Swm GOTO END
ECHO =============================
ECHO Creating DVD 2 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery2 C:\RecoveryDVD\TEMP\Disk2 C:\RecoveryDVD\TEMP\Disk2.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK2

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK3\Recovery\Install3.Swm GOTO END
ECHO =============================
ECHO Creating DVD 3 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery3 C:\RecoveryDVD\TEMP\Disk3 C:\RecoveryDVD\TEMP\Disk3.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK3

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK4\Recovery\Install4.Swm GOTO END
ECHO =============================
ECHO Creating DVD 4 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery4 C:\RecoveryDVD\TEMP\Disk4 C:\RecoveryDVD\TEMP\Disk4.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK4

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK5\Recovery\Install5.Swm GOTO END
ECHO =============================
ECHO Creating DVD 5 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery5 C:\RecoveryDVD\TEMP\Disk5 C:\RecoveryDVD\TEMP\Disk5.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK5

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK6\Recovery\Install6.Swm GOTO END
ECHO =============================
ECHO Creating DVD 6 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery6 C:\RecoveryDVD\TEMP\Disk6 C:\RecoveryDVD\TEMP\Disk6.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK6

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK7\Recovery\Install7.Swm GOTO END
ECHO =============================
ECHO Creating DVD 7 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery7 C:\RecoveryDVD\TEMP\Disk7 C:\RecoveryDVD\TEMP\Disk7.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK7

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK8\Recovery\Install8.Swm GOTO END
ECHO =============================
ECHO Creating DVD 8 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery8 C:\RecoveryDVD\TEMP\Disk8 C:\RecoveryDVD\TEMP\Disk8.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK8

IF NOT EXIST C:\RecoveryDVD\TEMP\DISK9\Recovery\Install9.Swm GOTO END
ECHO =============================
ECHO Creating DVD 9 ISO File
ECHO =============================
.\Tools\Oscdimg -m -o -u2 -udfver102 -lRecovery9 C:\RecoveryDVD\TEMP\Disk9 C:\RecoveryDVD\TEMP\Disk9.iso
RD /S /Q C:\RecoveryDVD\TEMP\DISK9

:END
MOVE C:\RecoveryDVD\TEMP\*.ISO C:\RecoveryDVD\ISO\
RD /S /Q C:\RecoveryDVD\TEMP
IF NOT EXIST C:\RecoveryDVD\ISO\DISK1.ISO EXIT 1
EXIT 0