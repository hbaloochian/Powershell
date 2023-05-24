function Start-ProgressBar
{
  [CmdletBinding()]
  param
  (
  [Parameter(Mandatory = $true)]
  $Title,
  [Parameter(Mandatory = $true)]
  [int]$Timer
  )
  For ($i = 1; $i -le $Timer; $i++)
   {
     Start-Sleep -Seconds 1;
     Write-Progress -Activity $Title -Status "$i   Seconds" 
   }
 } #Function Start-ProgressBar
