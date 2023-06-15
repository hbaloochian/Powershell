$message = "Hello, World!"
$rsa = New-Object System.Security.Cryptography.RSACryptoServiceProvider -ArgumentList 2048
$encodedMessage = [System.Text.Encoding]::UTF8.GetBytes($message)
$encryptedMessage = $rsa.Encrypt($encodedMessage,$false)
$decryptedMessage = $rsa.Decrypt($encryptedMessage,$false)
$decodedMessage = [System.Text.Encoding]::UTF8.GetString($decryptedMessage)
