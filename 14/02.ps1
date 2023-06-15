Get-WmiObject -Class Win32_UserAccount | Where-Object {$_.Disabled -eq $false} | Select-Object Name, AccountType, Domain, Lockout, PasswordExpires