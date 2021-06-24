Import-Module ExchangeOnlineManagement
$Date = Get-Date -Format "dd/MM/yy"
$DLName = Read-Host "Please enter the Distribution List Display Name: "
$DLName = $DLName + " (ayloNet)"
$DLMail = Read-Host "Please enter the localpart address that you wish to be used for this email account"
$DLMail = $DLMail + "@aylo.net"
$DLAlias = Read-Host "Please enter the Alias for this mailbox in the format DL12345"

New-DistributionGroup -Name $DLAlias -DisplayName $DLName -Alias $DLAlias -PrimarySmtpAddress $DLMail -Notes ("Security Group Created on " + $Date) -type security

Write-Host("Created Distribution List " + $DLName + " (" + $DLAlias + ") with email address " + $DLMail + ".")