$RootPath = "D:\"
$AccessList = @()
Get-ChildItem $RootPath -Recurse | ForEach-Object {
    try {
        $Access = Get-Acl $_.FullName | Select-Object -ExpandProperty Access
        $AccessList += $Access | Where-Object {$_.IdentityReference -notmatch "^NT AUTHORITY\\(Authenticated Users|SYSTEM)" -and $_.FileSystemRights -ne 'ReadAndExecute'}
    } catch {
        Write-Host "$($_.FullName) - $($_.Exception.Message)"
    }
}
If ($AccessList) {
    Write-Host "Unauthorized Access Found: $($AccessList.Count)"
    $AccessList | Select-Object IdentityReference, FileSystemRights, AccessControlType, IsInherited, InheritanceFlags, PropagationFlags, Path | Export-CSV -Path D:\SensitiveData\UnauthorizedAccess.csv -NoTypeInformation
}
