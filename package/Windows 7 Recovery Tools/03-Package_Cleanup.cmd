@ECHO OFF
CLS
ECHO ===============================================
ECHO Deleting current settings
ECHO ===============================================
DEL /F ".\Installer\CaptureImage\Capture\SettingsRE.txt"
DEL /F ".\Installer\Files\Windows\SettingsRE.txt"
DEL /F ".\Installer\FullRestoreImage\FullRestore\SettingsRE.txt"
DEL /F ".\Installer\SettingsRE.txt"
DEL /F ".\Installer\Sysprep.xml"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\Settings.ini"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\Scripts\SettingsRE.Txt"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\SettingsRE.Txt"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\SettingsRE.Txt"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\ResetPartitions.txt"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\ResetPartitions.txt"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\Settings.ini"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\Settings.ini"
DEL /F ".\Installer\CaptureImage\Capture\imagexAMD64.exe"
DEL /F ".\Installer\CaptureImage\Capture\imagexX86.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexAMD64.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\SCRIPTS\imagexX86.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexAMD64.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREAMD64\Reset\imagexX86.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexAMD64.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\MediaCreator\WINREX86\Reset\imagexX86.exe"
DEL /F ".\Installer\FullRestoreImage\FullRestore\imagexAMD64.exe"
DEL /F ".\Installer\FullRestoreImage\FullRestore\imagexX86.exe"
DEL /F ".\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexAMD64.exe"
DEL /F ".\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\imagexX86.exe"
DEL /F ".\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\SettingsRE.Txt"
DEL /F ".\Installer\WinREAMD64\sources\recovery\Tools\fullrecovery\Settings.ini"
DEL /F ".\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexAMD64.exe"
DEL /F ".\Installer\WinREX86\sources\recovery\Tools\fullrecovery\imagexX86.exe"
DEL /F ".\Installer\WinREX86\sources\recovery\Tools\fullrecovery\SettingsRE.Txt"
DEL /F ".\Installer\WinREX86\sources\recovery\Tools\fullrecovery\Settings.ini"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\ResetPartitions.txt"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\Settings.ini"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Settings\SettingsRE.txt"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexAMD64.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\imagexX86.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexAMD64.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\RecoveryScripts\Scripts\imagexX86.exe"
DEL /F ".\Installer\Files\Windows\System32\RecoveryTools\DvdMediaCreator\Tools\Oscdimg.exe"

REM --- START SiZiOUS PATCH ---
REM DEL ".\Settings\*.*" /q
REM DEL ".\ImageX\*.exe" /S /Q
REM DEL ".\OscdImg\*.exe" /S /Q
del /F ".\Installer\Addons\CreateBootableRecoveryPartition\mbrinst.exe"
del /F ".\Installer\Addons\CreateBootableRecoveryPartition\mbr.ini"
if exist install.zip del install.zip
REM --- END SiZiOUS PATCH ---

ECHO All current settings files deleted.
PAUSE