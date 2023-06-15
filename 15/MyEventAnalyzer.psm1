function MyShamsiDate{
    [CmdletBinding()]
    param (
        [DateTime] $GDate = ""
    )
    Class PersianDate{
        [String]$DateTime   
        [String]$Date       
        [Int]$Day        
        [DayName]$DayOfWeek
        [int]$DayOfYear
        [int]$Hour          
        [int]$Millisecond
        [int]$Minute     
        [MonthName]$Month      
        [int]$Second     
        [int64]$Ticks      
        [TimeSpan]$TimeOfDay  
        [int]$Year
        [String]$Age
    }
    Enum MonthName{
        فروردین = 1
        اردیبهشت = 2
        خرداد = 3
        تیر = 4
        مرداد = 5
        شهریور = 6
        مهر = 7
        آبان = 8
        آذر = 9
        دی = 10
        بهمن = 11
        اسفند = 12
    }

    Enum DayName{
        یکشنبه
        دوشنبه
        سشنبه
        چهارشنبه
        پنجشنبه
        جمعه
        شنبه
    }
    $PCal = New-Object System.Globalization.PersianCalendar
    $PDate = New-Object PersianDate
    $dateToUse = $GDate
    $PDate.Day = $PCal.GetDayOfMonth($dateToUse)
    $PDate.DayOfYear = $PCal.GetDayOfYear($dateToUse)
    $PDate.DayOfWeek = $dateToUse.DayOfWeek
    $PDate.TimeOfDay = $dateToUse.TimeOfDay
    $PDate.Month = $PCal.GetMonth($dateToUse)
    $PDate.Year = $PCal.GetYear($dateToUse)
    $PDate.Date = ([String]$PDate.Year + "/" + [String]$PDate.Month.value__ + "/" + [String]$PDate.Day)
    $PDate.DateTime = [string]$PDate.Year + ',' + [string]$PDate.Month + ',' + [string]$PDate.Day 
    return $PDate
}

function Search-LoginAttempts {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [ValidateSet('Logon','Logoff','AdminLogon','FailedLogin')]
        [string]$EventID = '',
        [Parameter(Mandatory=$false)]
        [int]$Days = 1,
        [Parameter(Mandatory=$false)]
        [string]$LogPath = "d:"
    )
    $EventLogFilter = @{
        LogName='Security'
        ID=4634
        StartTime=(Get-Date).AddDays(-$Days)
    }
    switch ($EventID){
        'Logon'       {$EventLogFilter.ID = 4624
                      $Message = "Login Attempts Found"
                      } 
        'Logoff'      {$EventLogFilter.ID = 4634
                      $Message = "Logoff Attempts Found"
                      }
        'AdminLogon'  {$EventLogFilter.ID = 4672
                      $Message = "AdminLogon Attempts Found"
                      }
        'FailedLogin' {$EventLogFilter.ID = 4625
                      $Message = "FailedLogin Attempts Found"
                      }         
    } 

    $Events = Get-WinEvent -FilterHashtable $EventLogFilter
    If ($Events) {
        Write-Output "$Message : $($Events.Count)"
        foreach($E in $Events){
            Add-Member -InputObject $E -Name Pdate -TypeName Pdate -Value "01/01/1400" -MemberType NoteProperty
            $E.Pdate = (MyShamsiDate $E.TimeCreated).date
        }
        $Table = $Events | select Pdate, MachineName, ProcessId, ThreadId, LevelDisplayName, Id, TimeCreated
        $Table |Format-Table
        $Table | Export-Csv -Path "$LogPath\$EventID.log" -NoTypeInformation
        Write-Host "File created: $LogPath\$EventID.log"
    } else {
        Write-Output "No $Message in the Last $Days Days"
    }
}
