$data = import-csv .\samplecsv.csv # .\ means current directory
foreach ($i in $data) {
   Write-host $i.user -foregroundcolor green #printing column user
   Write-host $i.email -foregroundcolor yellow #printing column email
   Write-host $i.title -foregroundcolor magenta #printing column title
}
