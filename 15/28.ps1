$DirTree = read-host "Enter path to directory tree"
Get-ChildItem -path $DirTree -recurse | select FullName
