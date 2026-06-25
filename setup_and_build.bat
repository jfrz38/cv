@echo off
setlocal

echo Building CV...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0build.ps1"

if errorlevel 1 (
    echo.
    echo ERROR: The CV could not be built.
    exit /b 1
)

echo.
echo OK: build\cv-es.pdf generated.
endlocal
