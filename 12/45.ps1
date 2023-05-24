$u = 'test'
$p = '1234567'
Add-Type -AssemblyName System.DirectoryServices.AccountManagement 
$t = [DirectoryServices.AccountManagement.ContextType]::Machine
$a = [DirectoryServices.AccountManagement.PrincipalContext]::new($t)
$a.ValidateCredentials($u,$p)
$a
