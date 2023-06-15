$input = “text to be encoded”
$By = [System.Text.Encoding]::Unicode.GetBytes($input)
$output =[Convert]::ToBase64String($By)
$output
