@echo off
REM Flash script for PIC32 Ethernet Starter Kit
REM Uses ipecmd to program (releases tool cleanly) then mdb to run the target
REM Usage: flash.bat

set HEX_FILE=C:\Users\rnabo\Desktop\project\PIC32MX795-Ethernet-USB-Stater\PIC32_ETH_Kit.X\dist\default\production\PIC32_ETH_Kit.X.production.hex
set IPECMD=C:\Program Files\Microchip\MPLABX\v6.20\mplab_platform\mplab_ipe\ipecmd.exe
set MDB=C:\Program Files\Microchip\MPLABX\v6.20\mplab_platform\bin\mdb.bat

echo Step 1: Programming with ipecmd...
"%IPECMD%" -TPPKOB -TSBUR103844092 -P32MX795F512L -F"%HEX_FILE%" -M

if %ERRORLEVEL% NEQ 0 (
    echo Programming FAILED!
    exit /b 1
)

echo Step 2: Starting target with mdb...
echo Device PIC32MX795F512L> "%TEMP%\run_target.txt"
echo Hwtool skdepic32>> "%TEMP%\run_target.txt"
echo Run>> "%TEMP%\run_target.txt"
echo Quit>> "%TEMP%\run_target.txt"

type "%TEMP%\run_target.txt" | "%MDB%" 2>&1 | findstr /C:"Running" /C:"Halt" /C:"Error" /C:"connect"

echo Done.
