function MyGet-UserStats {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [switch]$All,
        [Parameter(Mandatory=$false)]
        [switch]$Active,
        [Parameter(Mandatory=$false)]
        [switch]$Inactive )
    
    $users = Get-WmiObject -Class Win32_UserAccount |Select-Object *
    
    if ($All) {
        $usersCount = $users.Count
        Write-Output "Number of all users: $usersCount"
    }
    else {
        $activeUsers = $users | Where-Object { $_.Disabled -eq $false }
                $inactiveUsers = $users | Where-Object { $_.Disabled -eq $true }
        
        if ($Active) {
            $usersCount = $activeUsers.Count
            Write-Output "Number of active users: $usersCount"
        }
        elseif ($Inactive) {
            $usersCount = $inactiveUsers.Count
            Write-Output "Number of inactive users: $usersCount"
        }
    }
    }
