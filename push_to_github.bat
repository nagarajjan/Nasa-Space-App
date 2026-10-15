@echo off
title Push AEGIS-NEO to GitHub
echo ======================================================================
echo   Pushing AEGIS-NEO to https://github.com/nagarajjan/Nasa-Space-App
echo ======================================================================
cd /d "%~dp0"
git push -u origin main
echo.
if %ERRORLEVEL% EQU 0 (
    echo ======================================================================
    echo   [SUCCESS] AEGIS-NEO is now live on GitHub!
    echo   Visit: https://github.com/nagarajjan/Nasa-Space-App
    echo ======================================================================
) else (
    echo [!] Push encountered an issue. Please verify your GitHub credentials.
)
pause
