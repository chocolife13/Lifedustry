@echo off
title Lifedustry portable setup win64 edition

echo This script will download Lifedustry and Love2D and somes scripts 
echo in this script folder in %cd% 
echo if you want to continue press enter else close this windows
pause
cls



echo ⚡ love2D downloading...
echo ⌛ Lifedustry
echo ⌛ Scriptes
echo #######################################

for /f "delims=" %%i in ('powershell -NoProfile -Command "(Invoke-RestMethod 'https://api.github.com/repos/love2d/love/releases/latest').assets | Where-Object {$_.name -like '*win64.zip'} | Select-Object -ExpandProperty browser_download_url"') do set URL=%%i
curl -L -o love.zip "%URL%"
powershell -NoProfile -Command "Expand-Archive 'love.zip' '.'"
del love.zip
for /d %%d in (love-*-win64) do ren "%%d" love
cls
 







echo ✅ love2D downloaded
echo ⚡ Lifedustry downloading..
echo ⌛ Scriptes
echo #######################################

curl -L -o Lifedustry.zip https://github.com/chocolife13/Lifedustry/archive/refs/heads/main.zip
powershell -NoProfile -Command "Expand-Archive 'Lifedustry.zip' '.'"
del Lifedustry.zip
if exist Lifedustry-main ren Lifedustry-main Lifedustry
cls




echo ✅ love 2D downloaded
echo ✅ Lifedustry downloaded
echo ⚡ Scriptes downloading...
echo #######################################


echo start ./love/love.exe ./Lifedustry/ > run.bat
echo start ./love/love.exe ./Lifedustry/ --dev > run_dev.bat
cls

echo ✅ love2D downloaded
echo ✅ Lifedustry downloaded
echo ✅ Scriptes downloaded
echo #######################################
echo Finish
pause


