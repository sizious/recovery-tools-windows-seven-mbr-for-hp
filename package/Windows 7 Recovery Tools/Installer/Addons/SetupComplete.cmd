set workpath=%~dp0
set workpath=%workpath:~0,-1%
call %workpath%\CreateBootableRecoveryPartition\install.cmd
