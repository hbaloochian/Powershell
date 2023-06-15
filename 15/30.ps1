$DirTree = read-host "Enter the path to the directory tree"
$DirTree = Resolve-Path "$DirTree"
Write-Progress "Listing empty subfolders in $DirTree..."
	[int]$Count = 0
	Get-ChildItem "$DirTree" -attributes Directory -recurse | Where {$_.GetFileSystemInfos().Count -eq 0} | ForEach-Object {
		"📂$($_.FullName)"
		$Count++
	}
write-output "found $Count empty subfolders within directory tree $DirTree"
