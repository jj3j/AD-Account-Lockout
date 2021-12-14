#Declare variables to be used for the Email
$MailSubject= "Notice: User Account locked out"

#Gets the Event Log that contains the most recent lockout event
#$Event = Get-EventLog -LogName Security -InstanceId 4625 -EntryType FailureAudit -Newest 1
$Event2 = Get-EventLog -LogName Security -InstanceId 4740 -Newest 1

#Creates a variable which contains the contents of the lockout event log. This is used for the actual message in the email
$MailBody= $Event2.Message + "`r`n`t" + $Event2.TimeGenerated

$smtp = New-Object Net.Mail.SmtpClient("smtp.server")
$smtp.Send("FROM@mail.com","Recipient@mail.com",$MailSubject,$MailBody)
