new-item "c:\users\public\share" -itemtype directory
New-SmbShare -Name "sharedir" -Path "C:\users\public\share" -FullAccess "Everyone","Guests","Anonymous Logon"
