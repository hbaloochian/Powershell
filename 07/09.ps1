Import-Module vsadmin
$cred = get-auth -userId sukhija@techwizard.cloud –passwordfile "d:\password1.txt"
#getcredentials that you created using Save-EncryptedPassword
$pscredential = $cred[1]
###credentials that can be used for functions that supports ps credentials.
LaunchEOL -Credential $pscredential
$data = Get-EOLMailbox -ResultSize unlimited | Select Name,Wind
owsEmailAddress,IssueWarningQuota, ProhibitSendQuota,ProhibitSe
ndReceiveQuota #fetch the required data from exchange online
$data | Export-Csv "c:\temp\mailboxes.csv" -NoTypeInformation
#export the data in csv format RemoveEOL #disconnect the exchange online session
