$results = Get-ChildItem -Path D:\TestResults | Select-String -Pattern “password|admin|service”
Write-Output $results
