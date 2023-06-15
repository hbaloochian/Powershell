param(
        [ValidateSet('Dir', 'File')]
        [string]$Action = "",
        [string]$Path = "",
        [string]$Pattern = "",
        [string]$Replacement = ""
    )

    try {
	    if ($Pattern -eq ""){
            $Pattern = read-host "Enter search Pattern"
        }
	    if ($Replacement -eq ""){
            $Replacement = read-host "Enter Replacement"
        }
	    if($Path -eq ""){
            $Path = read-host "Enter Files"
        }

        $StopWatch = [system.diagnostics.stopwatch]::startNew()
        if($Action -eq "Dir"){
            $fileList = (get-childItem -path "$Path" -attributes !Directory)
            $StopWatch = [system.diagnostics.stopwatch]::startNew()
            foreach($file in $fileList){
                [System.IO.File]::WriteAllText($file.FullName, ([System.IO.File]::ReadAllText($file.FullName) -replace $Pattern, $Replacement))
	        }
        }else{
            [System.IO.File]::WriteAllText($Path, ([System.IO.File]::ReadAllText($Path) -replace $Pattern, $Replacement))
        }

	    [int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	    Write-host "replaced $Pattern by $Replacement in $Elapsed sec."
	    exit 0 # success
    } catch {
	    Write-host "Error in line $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	    exit 1
    }
