Import-Module ExchangeOnlineManagement

$Alias = Read-Host "Please enter the external reference (G123456): "
$ExtMail = Read-Host "Please enter the user's external email: "
$fn = Read-Host "Please enter the user's first name: "
$ln = Read-Host "Please enter the user's last name: "
$IntMail = $Alias + "-ExternalGuest@ext.furb.net"
$DisplayName = ($ln + ", " + $fn + " (External)")

New-MailContact -Name $Alias -DisplayName $DisplayName -Alias $Alias -FirstName $fn -LastName $ln -ExternalEmailAddress $ExtMail -Confirm:$falseGet