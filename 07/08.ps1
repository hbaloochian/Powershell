$pwd = $cred[0] ### credentials that can be used inside csom /api calls.
$pscredential = $cred[1]
###credentials that can be used for functions that supports ps credentials.
يا
$cred = get-auth -userId Ali@test.ir -password "encryptedpassword"
$pwd = $cred[0] ### credentials that can be used inside csom /api calls.
$pscredential = $cred[1]
###credentials that can be used for functions that supports ps credentials.
