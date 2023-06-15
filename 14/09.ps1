ForEach ($Computer in $OnlineComputers){
    $Session = New-Object -ComObject Microsoft.Update.Session 
    $Searcher = $Session.CreateUpdateSearcher
    Try {
        $Result = $Searcher.Search("IsInstalled=0 and Type='Software'")
        If ($Result.Updates.Count -gt 0){
            Write-Host "Patch not found on computer $($Computer.Name)"
        }
 } Catch {
        Write-Host "Error occurred while checking patches on $($Computer.Name) "
    }
}
