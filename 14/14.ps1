$Services = Get-Service | Where-Object {$_.Name -notlike "WMPNetworkSvc*" -and $_.Name -ne "TrustedInstaller" -and $_.Status -ne 'Running'} | Select-Object Name, DisplayName, Status
if ($Services) {
    Write-Host "Stopped Services Found: $($Services.Count)"
    $Services
}
