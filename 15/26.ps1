$Days = 10
$DirTree = "d:\"
$cutOffDate = (Get-Date).AddDays(-$Days)
Get-ChildItem -path $DirTree -recurse | Where-Object {$_.LastAccessTime -le $cutOffDate} | select fullname
