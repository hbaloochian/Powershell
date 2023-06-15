$DirTree = "d:\"
$DirTree = resolve-path "$DirTree"
write-progress "Listing hidden files in $DirTree ..."
[int]$Count = 0
get-childItem "$DirTree" -attributes Hidden -recurse | foreach-object {
        "$($_.FullName)"
		$Count++
	}
 Write-Host "Directory $DirTree has $Count hidden file(s)"
