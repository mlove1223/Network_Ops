@echo off
echo ===============================
echo Network Ping Check
echo ===============================
echo.

for %%i in (
    10.x.x.x
    10.x.x.x
    10.x.x.x
) do (
    echo Pinging %%i...
    ping -n 2 %%i > nul
    if errorlevel 1 (
        echo ❌ %%i FAILED
    ) else (
        echo ✅ %%i SUCCESS
    )
    echo.
)

pause
