Get-ChildItem HKLM:\SOFTWARE | ForEach-Object {
    $acl = Get-Acl $_.PSPath
    $denied = $acl.Access | Where-Object { $_.AccessControlType -eq 'Deny' }
    if ($denied) {
        Write-Host "Permissions Denied for $($_.Name):"
        $denied | Format-List
    }
}
