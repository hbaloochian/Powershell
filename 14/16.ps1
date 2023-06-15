Get-Acl HKLM:\SOFTWARE | Format-List
Get-ChildItem HKLM:\SOFTWARE | ForEach-Object { Get-Acl $_.PSPath } | Format-List
