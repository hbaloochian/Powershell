Get-ADGroup -Filter * | Where-Object {$_.Name -notlike "Domain*" -and $_.Name -notlike "Enterprise*" -and $_.Name -notlike "Cert Publishers"} | Get-ADGroupMember -Recursive | Get-ADUser -Properties DisplayName, Department, Description, company, enabled, PasswordNeverExpires, PasswordExpired | Select-Object Name, Enabled, Company, Department, Description, PasswordExpired, PasswordNeverExpires | Export-CSV -Path C:\Security\Users.csv -NoTypeInformation