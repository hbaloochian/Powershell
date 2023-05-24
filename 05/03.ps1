$servers = Get-content d:\servers.txt
foreach ($svr in $servers) {
   Write-host $svr
}
