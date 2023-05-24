function Print {
   param(
        [ValidateCount(1,3)]
        [int[]]$Num
        )
      Write-host "$Num"
}
