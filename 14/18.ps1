$RootPath = "C:\"
$MalwareList = @()
Get-ChildItem $RootPath -Recurse | Where-Object {$_.Extension -match "\.exe|\.bat|\.dll"} | ForEach-Object {
    try {
        $FileHash = Get-FileHash $_.FullName -Algorithm SHA256 | Select-Object -ExpandProperty Hash
        $VirusTotalApiKey = "<VirusTotal API Key>"
        $VirusTotalUrl = "https://www.virustotal.com/api/v3/files/$($FileHash)"
        $Headers = @{"x-apikey"="$VirusTotalApiKey"}
        $Response = Invoke-RestMethod -Uri $VirusTotalUrl -Headers $Headers
        If ($Response.data.attributes.last_analysis_stats.malicious -gt 0){
            $Result = [PSCustomObject]@{
                File = $_.FullName
                MalwareType = $Response.data.attributes.last_analysis_results | Where-Object {($_.result -eq 'malicious') -and ($_.category -ne 'unrated')} | Select-Object -ExpandProperty category
                MalwareName = $Response.data.attributes.last_analysis_results | Where-Object {($_.result -eq 'malicious') -and ($_.category -ne 'unrated')} | Select-Object -ExpandProperty name
            }
            $MalwareList += $Result
            Write-Host "$($_.FullName) - $($Result.MalwareName) Detected!"
        }
    } catch {
        Write-Host "$($_.FullName) - $($_.Exception.Message)"
    }
}
If ($MalwareList) {
    Write-Host "Malware Found: $($MalwareList.Count)"
    $MalwareList | Export-CSV -Path C:\Security\Malware.csv -NoTypeInformation
}
