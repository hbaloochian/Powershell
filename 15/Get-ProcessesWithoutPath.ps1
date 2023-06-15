<#
.SYNOPSIS
Gets all running processes without their file paths.

.DESCRIPTION
The Get-ProcessesWithoutPath command retrieves a list of all running processes on the computer, 
without displaying their file paths. If the ShowAll parameter is set to true, it will show all running processes,
otherwise only processes without a path will be displayed.

.PARAMETER ShowAll
If set to True, displays all running processes.
If set to False, displays only processes without a path.

.EXAMPLE
PS C:\> Get-ProcessesWithoutPath -ShowAll $true
This example retrieves a list of all running processes on the computer, including those with and without file paths.

.NOTES
Author: Your Company, Developer: Your name
Date:   April 2023 / Farvardin 1402 
#>

function Get-ProcessesWithoutPath {
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet($true,$false)]
        [bool]$ShowAll = $false
    )

    # Begin block
    Begin {
        Write-Verbose "Preparing to retrieve running processes without their file paths..."
    }

    # Process block
    Process {
        if ($ShowAll) {
            Get-Process | Select-Object -Property ProcessName, Id, Path, Company, FileVersion, ProductVersion
        }
        else {
            Get-Process | Where-Object {$_.Path -eq $null} | Select-Object -Property ProcessName, Id, Company, FileVersion, ProductVersion
        }
    }

    # End block
    End {
        Write-Verbose "All running processes retrieved successfully!"
    }
}
