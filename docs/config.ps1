Clear-Host

$ascii = @'
 ____                _           _              
|  _ \  _____   ____| |_   _ ___| |_ _ __ _   _ 
| | | |/ _ \ \ / / _` | | | / __| __| '__| | | |
| |_| |  __/\ V / (_| | |_| \__ \ |_| |  | |_| |
|____/ \___| \_/ \__,_|\__,_|___/\__|_|   \__, |
                                          |___/ 
'@
Write-Host $ascii -ForegroundColor Green
Write-Host "The dev tool for lifedustry !" -ForegroundColor Blue
Write-Host " "
Write-Host "Starting Lifedustry #############################################" -ForegroundColor Red
Write-Host '"love ./ --dev" for stating as dev' -ForegroundColor Magenta
Write-Host '"love ./ --scene "scene"" for stating to the wanted scene' -ForegroundColor Magenta
Write-Host "love ./ for start normaly" -ForegroundColor Magenta
Write-Host ""
Write-Host "Manage version update and push ##################################" -ForegroundColor Red
Write-Host '"git pull" for pulling the latest version' -ForegroundColor Magenta
Write-Host '"git add" ./* for add all file to commit ' -ForegroundColor Magenta
Write-Host '"git commit" -m "ur message XD" for save modification' -ForegroundColor Magenta
Write-Host '"git push" to send modificatoin' -ForegroundColor Magenta
Write-Host ''

if (Test-Path "./Lifedustry") {
	Write-Host 'Lifedustry installed' -ForegroundColor Green
    Set-Location ./Lifedustry
} else {
	Write-Host 'Lifedustry not installed type "git clone https://github.com/chocolife13/Lifedustry.git"' -ForegroundColor Red
}

Set-Alias -Name love -Value ../love/love.exe
Set-Alias -Name git -Value ..\git\cmd\git.exe
