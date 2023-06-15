function MyGet-DuplicateFiles {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        $Path = $ENV:USERPROFILE
    )

    begin{
        $DateScanned = Get-Date -Format "yyyy-MM-dd_hh.mm.ss.ff"     
        Write-Information -InformationAction Continue -MessageData ("Started {0} at {1}" -f $MyInvocation.MyCommand.Name, $DateScanned)
        Write-Output "---------------------------------------------------------------"
        Write-Output "                      Duplicate File(s)"

        $Stopwatch = New-Object System.Diagnostics.Stopwatch
        $Stopwatch.Start()

        $Total = 0
    }

    process{
        $FileArray = Get-ChildItem $Path -Recurse -File | Sort-Object CreationTime

        $counter = 0
        Foreach ($File in $FileArray){

            $counter++
            Write-Progress -Activity 'Calculating Hashes' -CurrentOperation $File.FullName -PercentComplete (($counter / $FileArray.count) * 100)
            $File | Add-Member -MemberType NoteProperty -Name "Hash" -Value (Get-FileHash $File.FullName).Hash
            $File | Add-Member -MemberType NoteProperty -Name "Status" -Value "Duplicate"
        }

        $GroupArray = $FileArray | Group-Object -Property Hash

        ForEach ($Group in $GroupArray){
           $Group.Group[0].Status = "Original"
        }
        $ReportArray = $GroupArray.Group
        $ReportArray = $GroupArray.Group | Where-Object {$_.Status -eq "Duplicate"}
        $Total = $Total + $FileArray.Count
        $ReportArray
    }

    end{
        $elapsed = $stopwatch.Elapsed
        Write-Output "---------------------------------------------------------------"
        Write-Output ("Total Files Scanned: {0} `t Total time elapsed: {1}" -f $total, $elapsed)
        Write-Output "---------------------------------------------------------------"
    }
}
