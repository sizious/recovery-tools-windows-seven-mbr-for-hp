@Echo Off
%~d0
CD "%~dp0"

ECHO ==========================================
ECHO Copying BOOT WIM file
ECHO ==========================================
DEL C:\RecoveryDVD\TEMP\DISK1\SOURCES\BOOT.WIM
COPY C:\RecoveryDVD\TEMP\DISK1\RECOVERY\WINRE.WIM C:\RecoveryDVD\TEMP\DISK1\SOURCES\BOOT.WIM

ECHO ==========================================
ECHO Mounting BOOT file
ECHO ==========================================
DISM /MOUNT-WIM /WimFile:C:\RecoveryDVD\TEMP\DISK1\SOURCES\BOOT.WIM /Index:1 /MountDir:C:\RecoveryDVD\MOUNT

ECHO ==========================================
ECHO Copying scripts
ECHO ==========================================
ATTRIB -S -R -H C:\RecoveryDVD\MOUNT\WINDOWS\SYSTEM32\WINPESHL.INI
XCOPY /SEVHKY .\RecoveryScripts\*.* C:\RecoveryDVD\MOUNT\
XCOPY /SEVHKY .\Settings\*.* C:\RecoveryDVD\MOUNT\Settings\
REN C:\RecoveryDVD\MOUNT\Scripts\RecoveryDVD%PROCESSOR_ARCHITECTURE%.exe RecoveryDVD.exe
ECHO Install.Wim>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK2\Recovery\Install2.swm ECHO Install2.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK3\Recovery\Install3.swm ECHO Install3.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK4\Recovery\Install4.swm ECHO Install4.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK5\Recovery\Install5.swm ECHO Install5.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK6\Recovery\Install6.swm ECHO Install6.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK7\Recovery\Install7.swm ECHO Install7.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK8\Recovery\Install8.swm ECHO Install8.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag
IF EXIST C:\RecoveryDVD\TEMP\DISK9\Recovery\Install9.swm ECHO Install9.swm>C:\RecoveryDVD\MOUNT\Settings\Dvd.Tag

ECHO ==========================================
ECHO UnMounting BOOT file
ECHO ==========================================
DISM /UNMOUNT-WIM /MountDir:C:\RecoveryDVD\MOUNT /Commit

EXIT 0