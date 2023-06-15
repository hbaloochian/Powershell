$input = @"
Get-ChildItem d:\
Write-Host "test text"
"@
$By = [System.Text.Encoding]::Unicode.GetBytes($input)
$output =[Convert]::ToBase64String($By)
$output
