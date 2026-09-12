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
Write-Host "The dev tool for lifedustry !" -ForegroundColor blue
Write-Host " "
Write-Host "Starting Lifedustry #############################################" -ForegroundColor DarkYellow
Write-Host '"love ./ --dev" for stating as dev' -ForegroundColor Blue
Write-Host '"love ./ --scene "scene"" for stating to the wanted scene' -ForegroundColor Blue
Write-Host '"love ./" for start normaly' -ForegroundColor Blue
Write-Host ""
Write-Host "Manage version update and push ##################################" -ForegroundColor DarkYellow
Write-Host 'First you need to login to github type "gh auth login"' -ForegroundColor green
Write-Host '"git pull" for pulling the latest version' -ForegroundColor Blue
Write-Host '"git add" ./* for add all file to commit ' -ForegroundColor Blue
Write-Host '"git commit" -m "ur message XD" for save modification' -ForegroundColor Blue
Write-Host '"git push" to send modificatoin' -ForegroundColor Blue
Write-Host ''



if (Test-Path "./Lifedustry") {
	Write-Host 'Lifedustry installed' -ForegroundColor Green
    Set-Location ./Lifedustry
} else {
	Write-Host 'Lifedustry not installed ' -ForegroundColor Red
    Write-Host 'if you are collaborator type "git clone https://github.com/chocolife13/Lifedustry.git" ' -ForegroundColor Red
    Write-Host 'else "gh repo fork chocolife13/Lifedustry --clone" for cloning lifedustry on ur github ' -ForegroundColor Red
   
}

$env:PATH += ";$PWD\Git\cmd"
$env:PATH += ";$PWD\githubcli\bin"
$env:PATH += ";$PWD\love"