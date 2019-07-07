@echo off
title Citra - System archive installer
set versionC="V0.3-339136"
sleep 0.2
if not exist "HardwareID.txt" goto HWID-msg

:main
title Citra - System archive installer ^| Main
cls
echo.
echo.
echo.
echo -------------------------------
echo ^|                             ^|
echo ^| [SA] setup System Archives  ^|
echo ^| [UP] Update script file     ^|
echo ^| [V] Script Version          ^|
echo ^| [E] Exit Citra NAND script  ^|
echo ^|                             ^|
echo -------------------------------
echo.

set /p menu="What would you like to do?"
if %menu%==sa goto SA
if %menu%==SA goto SA
if %menu%==UP goto install-update
if %menu%==up goto install-update
if %menu%==v goto ver
if %menu%==V goto ver
if %menu%==E goto close
if %menu%==e goto close
else (
    echo Invalid input. Please try again.
	sleep 0.15
	goto main
)

:close
echo Exiting...
sleep 0.563
exit

:ver
cls
title Citra - System archive installer ^| Version
echo.
echo.
echo Citra NAND script made by ronaldgameking
echo.
echo Running on %versionC%
sleep 1.83
goto main

:install-update
cls
title Citra - System archive installer ^| Update
echo.
echo.
echo WARNING! This may include experimental content
set /p updateb="Are you sure want to update the script? (Y/N)"
if %updateb%==N goto main
if %updateb%==n goto main
title Citra - System archive installer ^| Updating...
echo Downloading update...
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ronaldgameking/citra-nand/master/batch/CIT_NAND_archive.bat', 'CIT_uped.bat')
echo Downloaded update!
title Citra - System archive installer ^| Updated
sleep 2.3
goto main

:SA
cls
echo.
echo.
title Citra - System archive installer ^| Setup SA?
set /p setup-nand="Do you want to setup system archives in Citra? (Y/N)"
if %setup-nand%==N goto main
if %setup-nand%==n goto main
if %setup-nand%==Y goto SA-dl
if %setup-nand%==y goto SA-dl

:SA-dl
cls
title Citra - System archive installer ^| Downloading dependency
echo.
echo.
echo Downloading dependency...
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ronaldgameking/citra-nand/master/require/7zG.exe', '7Z.exe')
echo.
echo Downloaded dependency!
title Citra - System archive installer ^| Downloaded dependency
echo.
sleep 0.3
set /p setup-mode="What type of installation is your Citra, Portable or normal (N/P)"
if %setup-mode%==P goto
if %setup-mode%==p goto
title Citra - System archive installer ^| Downloading NAND
echo Downloading NAND...
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ronaldgameking/citra-nand/master/nand-data/user.zip', 'nand.zip')
echo.
echo Downloaded NAND!
title Citra - System archive installer ^| Downloaded NAND
sleep 0.3
title Citra - System archive installer ^| Extracting NAND
if exist citra-qt.exe goto SA-port
if exist citra.exe goto SA-port
if exist citra-room.exe goto SA-port
echo.
echo Normal mode detected!
echo.
echo Extracting...
7Z.exe x nand.zip -y -o%cd%/extrad
echo.
echo Extracted!
title Citra - System archive installer ^| Extracted NAND
sleep 2.4
exit

:HWID-msg
echo.
echo.
echo Hardware ID not set, this is required to get support!
echo.
echo Generating HardwareID...
sleep 0.4
goto HardwareID

:HardwareID
echo.
set system=
set manufacturer=
set model=
set osname=
set sp=
setlocal ENABLEDELAYEDEXPANSION
set totalMem=
set availableMem=
set usedMem=
title Citra - System archive installer ^| HardwareID generating...
FOR /F "tokens=2 delims='='" %%A in ('wmic OS Get csname /value') do SET system=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Manufacturer /value') do SET manufacturer=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic ComputerSystem Get Model /value') do SET model=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os get Name /value') do SET osname=%%A
FOR /F "tokens=1 delims='|'" %%A in ("%osname%") do SET osname=%%A
FOR /F "tokens=2 delims='='" %%A in ('wmic os get ServicePackMajorVersion /value') do SET sp=%%A
FOR /F "tokens=4" %%a in ('systeminfo ^| findstr Physical') do if defined totalMem (set availableMem=%%a) else (set totalMem=%%a)
set totalMem=%totalMem:,=%
set availableMem=%availableMem:,=%
set /a usedMem=totalMem-availableMem
SET file="HardwareID.txt"
echo -------------------------------------------- >> %file%
echo Details For: %system% >> %file%
echo Manufacturer: %manufacturer% >> %file%
echo Model: %model% >> %file%
echo Operating System: %osname% >> %file%
echo Total Memory: %totalMem% >> %file%
echo Used  Memory: %usedMem% >> %file%
echo Computer Processor: %processor_architecture% >> %file%
echo Service Pack: %sp% >> %file%
echo -------------------------------------------- >> %file%
echo HardwareID succesfully generated!
title Citra - System archive installer ^| HardwareID generated
sleep 0.6
goto main

:SA-port
