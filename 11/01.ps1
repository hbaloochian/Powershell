$email = "Ali.asadi@test.ir"
$emsplit = $email.split(".")
Write-Host "Split based on (.)"
$emsplit
$firstname = $emsplit[0]
$lastname = ($emsplit[1] -split "@")
$lastn = $lastname[0]
Write-Host "Firstname is: $firstname"
Write-Host "Lastname is: $lastn"
