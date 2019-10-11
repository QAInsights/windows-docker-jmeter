Write-Host "Execution Started in non gui mode with the following arguments: $args"
$command = -join(".\jmeter ","$args")
Invoke-Expression $command
Write-Host "Execution has been completed. Please check your host machine for the results."
