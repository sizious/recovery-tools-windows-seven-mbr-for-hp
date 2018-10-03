@Echo Off
%~d0
CD "%~dp0"

RD /S /Q C:\RecoveryDVD

MD C:\RecoveryDVD\ISO
MD C:\RecoveryDVD\TEMP
MD C:\RecoveryDVD\MOUNT
MD C:\RecoveryDVD\TEMP\Disk1\Recovery
MD C:\RecoveryDVD\TEMP\Disk2\Recovery
MD C:\RecoveryDVD\TEMP\Disk3\Recovery
MD C:\RecoveryDVD\TEMP\Disk4\Recovery
MD C:\RecoveryDVD\TEMP\Disk5\Recovery
MD C:\RecoveryDVD\TEMP\Disk6\Recovery
MD C:\RecoveryDVD\TEMP\Disk7\Recovery
MD C:\RecoveryDVD\TEMP\Disk8\Recovery
MD C:\RecoveryDVD\TEMP\Disk9\Recovery

MD C:\RecoveryDVD\TEMP\Disk1\boot\resources
MD C:\RecoveryDVD\TEMP\Disk1\efi\boot
MD C:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\resources
MD C:\RecoveryDVD\TEMP\Disk1\sources
MD C:\RecoveryDVD\TEMP\Disk1\Recovery
MD C:\RecoveryDVD\TEMP\Disk1\FullRestore


XCOPY C:\Windows\Boot\DVD\PCAT\*.* C:\RecoveryDVD\TEMP\Disk1\boot\
XCOPY C:\Windows\Boot\DVD\PCAT\en-us\*.* C:\RecoveryDVD\TEMP\Disk1\boot\
COPY C:\Windows\Boot\Resources\bootres.dll C:\RecoveryDVD\TEMP\Disk1\boot\resources
COPY C:\Windows\Boot\PCAT\memtest.exe C:\RecoveryDVD\TEMP\Disk1\boot\
COPY C:\Windows\Boot\PCAT\bootmgr C:\RecoveryDVD\TEMP\Disk1\bootmgr

XCOPY C:\Windows\Boot\DVD\EFI C:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\
XCOPY C:\Windows\Boot\DVD\EFI\en-us C:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\
COPY C:\Windows\Boot\Resources\bootres.dll C:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\resources
COPY C:\Windows\Boot\EFI\memtest.efi C:\RecoveryDVD\TEMP\Disk1\efi\microsoft\boot\
COPY C:\Windows\Boot\EFI\bootmgfw.efi C:\RecoveryDVD\TEMP\Disk1\efi\boot\bootx64.efi
COPY C:\Windows\Boot\EFI\bootmgr.efi C:\RecoveryDVD\TEMP\Disk1\bootmgr.efi
EXIT 0