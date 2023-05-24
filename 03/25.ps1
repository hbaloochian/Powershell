function Print {
   param(
        [ValidateLength(0,15)]
        [String]$PhoneNumber
        )
      Write-host "$PhoneNumber" 
}
