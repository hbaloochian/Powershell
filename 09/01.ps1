$from = "donotreply@lab.com"
$to="Ali@test.ir"
$subject = "Error has occured"
$smtpServer="smtp.lab.com"
if ($error)
{
   Send-MailMessage -SmtpServer $smtpserver -From $from -To $to –Subject $subject -Body $error[0].ToString()
$error.clear()
}
