$networkAdapters = Get-NetAdapter
$networkAdapters | Export-Csv -Path C:\TestResults\network_adapters.csv
-NoTypeInformation
