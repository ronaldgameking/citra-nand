@echo off
title Citra - System archive installer

:main
cls
echo.
echo.
echo.
echo ------------------------------
echo ^| [SA] setup System Archives ^|
echo ^| [UP] Update script file    ^|
echo ^| [E] Exit Citra NAND script ^|
echo ------------------------------
echo.

set /p menu="What would you like to do?"
if %menu%==sa goto SA
if %menu%==SA goto SA
if %menu%==UP goto install-update
if %menu%==up goto install-update
if %menu%==E goto close
if %menu%==e goto close
else (
    echo Invalid input. Please try again.
	goto :main
)

:close
echo Exiting...
sleep 0.563
exit

:install-update
set /p updateb="Do you want to update the script? (Y/N)"
if %updateb%==N goto main
if %updateb%==n goto main
echo Downloading update...
goto update-dl

:SA
set /p setup-nand="Do you want to setup system archives in Citra? (Y/N)"
if %setup-nand%==N goto main
if %setup-nand%==n goto main
if %setup-nand%==Y goto main
if %setup-nand%==y goto main

:update-dl
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/ronaldgameking/citra-nand/master/batch/CIT_NAND_archive.bat?token=AFFP7MMMJSHXIZGKGI3TVLK5DZH26', 'CIT_uped.bat')
echo Downloaded update!
copy %cd%\NET_ex.bmp %cd%\xjhfkea.bmp
