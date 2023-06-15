$SearchPattern = "d:\"
	$Items = get-childItem -path "$SearchPattern"
	foreach ($Item in $Items) {
		$Name = $Item.Name
		if ($Name[0] -eq '.') { continue } # hidden file/dir
		if ($Item.Mode -like "d*") { $Icon = "📂" 
		} elseif ($Name -like "*.iso") { $Icon = "📀"
		} elseif ($Name -like "*.mp3") { $Icon = "🎵"
		} elseif ($Name -like "*.epub") { $Icon = "📓"
		} elseif ($Name -like "*.csv") { $Icon = "📊"
		} elseif ($Name -like "*.gif") { $Icon = "🎨"
		} elseif ($Name -like "*.jpg") { $Icon = "🎨"
		} elseif ($Name -like "*.mkv") { $Icon = "🎬"
		} else { $Icon = "📄" }
		new-object PSObject -Property @{ Name = "$Icon$Name" } 
	}
