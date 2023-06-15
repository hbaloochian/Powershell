function Restrict-FileAccess {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [string]$FilePath,
        [Parameter(Mandatory=$true)]
        [string]$GroupName
    (
    $acl = Get-Acl $FilePath
    $System.Security.AccessControl.FileSystemAccessRule($GroupName, "ReadAndExecute", "Allow")
    $acl.SetAccessRule($rule)
    Set-Acl $FilePath $acl
}
