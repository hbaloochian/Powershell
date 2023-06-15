$EventLogFilter = @{
    LogName='Security'
    ID=4624
    StartTime=(Get-Date).AddDays(-7)
}
$Events = Get-WinEvent -FilterHashtable $EventLogFilter
If ($Events) {
    Write-Host "Failed Login Attempts Found: $($Events.Count)"
    $Events | Select-Object TimeCreated, Id, LevelDisplayName, Message | Export-CSV -Path D:\SensitiveData\FailedLoginAttempts.csv -NoTypeInformation
}
