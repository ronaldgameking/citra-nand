@echo off
title Citra - System archive installer
set versionC=V0.1-5

:main
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
	sleep 0.1
	goto main
)

:close
echo Exiting...
sleep 0.563
exit

:ver
cls
echo.
echo.
echo Citra NAND script made by ronaldgameking
echo.
echo Running on %versionC%
sleep 1.83
goto main

:install-update
cls
echo.
echo.
set /p updateb="Do you want to update the script? (Y/N)"
if %updateb%==N goto main
if %updateb%==n goto main
echo Downloading update...
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ronaldgameking/citra-nand/master/batch/CIT_NAND_archive.bat', 'CIT_uped.bat')
echo Downloaded update!
timeout 2
goto main

:SA
cls
echo.
echo.
set /p setup-nand="Do you want to setup system archives in Citra? (Y/N)"
if %setup-nand%==N goto main
if %setup-nand%==n goto main
if %setup-nand%==Y goto SA-dl
if %setup-nand%==y goto SA-dl

:SA-dl
cls
echo.
echo.
echo Downloading dependency...
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ronaldgameking/citra-nand/master/nand-data/user.zip', 'nand.zip')
echo Downloaded dependency!
echo.
echo Downloading NAND...
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ronaldgameking/citra-nand/master/nand-data/user.zip', 'nand.zip')
echo.
echo Downloaded NAND!
sleep 0.1
if exist citra-qt.exe goto SA-port
if exist citra.exe goto SA-port
if exist citra-room.exe goto SA-port
echo.
echo Normal mode detected!
echo.
echo Extracting...
7Z.exe e nand.zip %appdata/Roaming/Citra/SCR_d -y
sleep 3
exit

:SA-port
