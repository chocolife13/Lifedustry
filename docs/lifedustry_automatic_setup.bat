@echo off
title Lifedustry portable setup win64 edition

echo This script will download Lifedustry and Love2D and somes scripts 
echo in %cd% 
echo if you want to continue press enter else close this windows
pause
cls


echo downloading love2D

for /f "delims=" %%i in ('powershell -NoProfile -Command "(Invoke-RestMethod 'https://api.github.com/repos/love2d/love/releases/latest').assets | Where-Object {$_.name -like '*win64.zip'} | Select-Object -ExpandProperty browser_download_url"') do set URL=%%i
curl -L -o love.zip "%URL%"
powershell -NoProfile -Command "Expand-Archive 'love.zip' '.'"
del love.zip
for /d %%d in (love-*-win64) do ren "%%d" love

 

echo downloading git
for /f "delims=" %%i in ('powershell -NoProfile -Command "(Invoke-RestMethod 'https://api.github.com/repos/git-for-windows/git/releases/latest').assets | Where-Object {$_.name -match 'MinGit.*-64-bit\.zip$'} | Select-Object -ExpandProperty browser_download_url"') do set GIT_URL=%%i
curl -L -o git.zip "%GIT_URL%"
mkdir Git
powershell -NoProfile -Command "Expand-Archive 'git.zip' './Git'"
del git.zip





echo downloading Lifedustry
"./git/cmd/git.exe" clone https://github.com/chocolife13/Lifedustry.git



echo creating scripts
curl -L -o shell.bat "https://raw.githubusercontent.com/chocolife13/Lifedustry/refs/heads/main/docs/shell.bat"
curl -L -o config.ps1 "https://raw.githubusercontent.com/chocolife13/Lifedustry/refs/heads/main/docs/config.ps1"
pause

