function Add-2num {
   param(
         [parameter(Mandatory = $true, Position=0)]
         [ValidateRange(0,10)]
         $num1,
         [parameter(Mandtory = $true, Position=1)]
         [ValidateRange(0,10)]
         $num2)
      Write-host ""Position 0  -num1: "$num1 "Position 1  -num2: " $num2" 
}
