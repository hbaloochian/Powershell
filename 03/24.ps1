function Print {
   param(
        [ValidatePattern("\w{4-6}\d{2}")]
        [string]$UserName
        )
      Write-host "$UserName" 
}
