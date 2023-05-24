function Add-2num {
   param(
         [parameter(Mandatory = $true, Position=0)]
         [ValidateSet(1,2,3)]
         $num1,
         [parameter(Mandatory = $true, Position=1)]
         [ValidateSet(4,5)]
         $num2)
      Write-host ""Position 0  -num1: "$num1 "Position 1  -num2: " $num2" 
}
