$EventLogFilter = @{
    LogName='Security'
    ID=4663
    StartTime=(Get-Date).AddDays(-7)
}
$Events = Get-WinEvent -FilterHashtable $EventLogFilter
If ($Events) {
    $AccessList = @()
    $Events | ForEach-Object {
        $Message = $_.Properties[8].Value
        $MatchingString = "(?i)(write|modify)"
        $Matches = [regex]::Matches($Message, $MatchingString)
        $Matches | ForEach-Object {
            $Result = [PSCustomObject]@{
                TimeCreated = $_.Groups[1].Value
                User = $_.Groups[2].Value
                ObjectPath = $_.Groups[3].Value
                Access = $_.Groups[4].Value
            }
            $AccessList += $Result
        }
    }
    If ($AccessList) {
        Write-Host "Unauthorized Access Found: $($AccessList.Count)"
        $AccessList | Export-CSV -Path C:\Security\UnauthorizedAccess.log -NoTypeInformation
    }
}
