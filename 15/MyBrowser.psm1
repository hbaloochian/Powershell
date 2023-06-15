function Get-DefaultBrowser{
# Param([parameter(Mandatory=$true)][alias("Computer")]$ComputerName)
$ComputerName = hostname 
$Registry = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $ComputerName)

$RegistryKey = $Registry.OpenSubKey("SOFTWARE\\Classes\\http\\shell\\open\\command")
#Get (Default) Value
$Value = $RegistryKey.GetValue("")
return $Value
}

function Get-BrowserData {

    [CmdletBinding()]
    param (	
    [Parameter (Position=1,Mandatory = $True)]
    [string]$Browser,    
    [Parameter (Position=1,Mandatory = $True)]
    [string]$DataType 
    ) 

    $Regex = '(http|https)://([\w-]+\.)+[\w-]+(/[\w- ./?%&=]*)*?'

    if ($Browser -eq 'chrome'  -and $DataType -eq 'history')  {$Path = "$Env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\History"}
    elseif ($Browser -eq 'chrome'  -and $DataType -eq 'bookmarks' )  {$Path = "$Env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Bookmarks"}
    elseif ($Browser -eq 'edge'    -and $DataType -eq 'history')  {$Path = "$Env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default\History"}
    elseif ($Browser -eq 'edge'    -and $DataType -eq 'bookmarks')  {$Path = "$env:USERPROFILE\AppData\Local\Microsoft\Edge\User Data\Default\Bookmarks"}
    elseif ($Browser -eq 'firefox' -and $DataType -eq 'history')  {$Path = "$Env:USERPROFILE\AppData\Roaming\Mozilla\Firefox\Profiles\*.default-release\places.sqlite"}
    
    if (Test-Path $Path){
        $Value = Get-Content -Path $Path | Select-String -AllMatches $regex |% {($_.Matches).Value} |Sort -Unique
        $Value | ForEach-Object {
            $Key = $_
            if ($Key -match $Search){
                New-Object -TypeName PSObject -Property @{
                    User = $env:UserName
                    Browser = $Browser
                    DataType = $DataType
                    Data = $_
                }
            }
        } 
     }
     else {
        Write-Output "Cannot find path $Path"
     }
}
