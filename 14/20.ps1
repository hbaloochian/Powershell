$ProcessList = Get-Process | Where-Object {$_.MainWindowTitle -ne ''}
$CameraList = $ProcessList | Where-Object {$_.ProcessName -in @('Skype', 'Zoom', 'GoogleMeet', 'MicrosoftTeams', 'TeamViewer', 'Webex')}
if ($CameraList) {
    Write-Host "Hidden Camera Found: $($CameraList.ProcessName)"
    $CameraList | Select-Object ProcessName, MainWindowTitle, Path
}
