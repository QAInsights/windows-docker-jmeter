Write-Host "jmeter $args"
$command = '.\jmeter.bat $args'
Invoke-Expression $command
