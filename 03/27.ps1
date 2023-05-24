function Print {
   param(
        [ValidateScript({if($_ -gt 5){
            $true
            }
            else
            {
                throw "Input is not biger than 5 "
            }
        })]
        [int[]]$Num
        )
      Write-host "$Num" 
}
