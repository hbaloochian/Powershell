Import-Module D:\SensitiveData\MyConv-base64.psm1
$code = TextCoder @"
Get-Item D:\SensitiveData
Get-ChildItem D:\SensitiveData\
"@
Write-Host "---------------Script To Base64---------------"
Write-Host $code
Write-Host "----------------------------------------------"
Write-Host
$decode = TextDecoder $code
Write-Host "---------------Base64 To String---------------"
Write-Host $decode
Write-Host "----------------------------------------------"
Write-Host
$ScriptBlock = [Scriptblock]::Create($decode)
Write-Host "---------------String To Script---------------"
Write-Host $ScriptBlock
Write-Host "----------------------------------------------"
Write-Host
Invoke-Command -ScriptBlock $ScriptBlock
