$filePath = "D:\SensitiveData\ConfidentialFile.txt"
$acl = Get-Acl $filePath
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("OtherGroup", "ReadAndExecute", "Allow")
$acl.SetAccessRule($rule)
Set-Acl $filePath $acl
