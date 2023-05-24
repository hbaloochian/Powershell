Get-Mailbox -ResultSize unlimited | Select Name,identity, WindowsEmailAddress,Database,ProhibitSendQuota,ProhibitSendReceiveQuota,IssueWarningQuota | export-csv c:\mailboxes.csv -notypeinfo
