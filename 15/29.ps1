$DirTree = read-host "Enter the path to the directory tree"
[int]$Count = 0
write-progress "Listing empty files in $DirTree ..."
get-childItem $DirTree -attributes !Directory -recurse | where {$_.Length -eq 0} | foreach-object {
		write-output $_.FullName
		$Count++}
write-output "Found $Count empty file(s)"
