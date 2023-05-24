$servers = @("Ali","Ahmad","Asad") #array of names
$servers | foreach-object {
Write-host $_ -foregroundcolor green
}
