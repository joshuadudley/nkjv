@echo off
setlocal EnableExtensions
title REFinder Compact Menu Installer
cd /d "%~dp0"

echo ===============================================================
echo   REFinder Suite Compact Menu - Full Package Installer
echo ===============================================================
echo.

set "SCRIPT=%~dp0Implement_REFinder_Compact_Menu.ps1"
if not exist "%SCRIPT%" (
    echo ERROR: Implement_REFinder_Compact_Menu.ps1 was not found.
    echo Extract the complete implementation ZIP before running this file.
    echo.
    pause
    exit /b 1
)

powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT%"
set "EXIT_CODE=%ERRORLEVEL%"

echo.
if not "%EXIT_CODE%"=="0" (
    echo ===============================================================
    echo INSTALLATION FAILED - EXIT CODE %EXIT_CODE%
    echo ===============================================================
    echo Review the messages above and the generated JSON report.
    pause
    exit /b %EXIT_CODE%
)

echo ===============================================================
echo INSTALLATION COMPLETE
echo ===============================================================
echo.
echo The original ZIP was not overwritten.
echo The new full package is in this folder:
echo   REFinder_Suite_Compact_Menu_Implemented_True_Full_Package.zip
echo.
pause
exit /b 0
