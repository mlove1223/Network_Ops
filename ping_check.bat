@echo off
echo ===============================
echo Network Ping Check
echo ===============================
echo.

for %%i in (
    10.109.32.1
    10.109.12.1
    10.101.32.1
    10.101.49.1
    10.103.49.1
    10.15.1.212
    10.6.11.200
    10.174.3.197
    10.174.3.164
    10.174.3.107
    10.174.2.115
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
