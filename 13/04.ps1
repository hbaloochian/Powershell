Get-Process | Where-Object {$_.Path -eq $null} | Format-Table -AutoSize
