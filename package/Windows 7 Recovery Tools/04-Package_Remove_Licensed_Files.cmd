@echo off
cls
DEL ".\ImageX\*.exe" /S /Q
DEL ".\OscdImg\*.exe" /S /Q
DEL ".\MbrInst\*.*" /S /Q
echo.
echo Licensed files were removed.
echo You can get them by running the "01-Get_Required_Files.cmd" script again.
pause
