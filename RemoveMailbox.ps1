Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline
$MailboxID = Read-Host "Enter the Mailbox to remove"
Remove-Mailbox -Identity $MailboxID
Remove-DistributionGroup -Identity ($MailboxID+"A")