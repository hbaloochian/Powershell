function Add-2num {
   param(
         [parameter(Mandatory)]
         $num1,
         [parameter(Mandatory)]
         $num2)
   $result = $num1 + $num2
   Write-host "$num1 + $num2 = $result" 
}
