Import-Module ExchangeOnlineManagement 
$MailboxName = Read-Host "Please enter the display name for the maibox"
$MaiboxAllias = Read-Host "Please enter the mailbox alias in the format M123456"
$LocalPart = Read-Host "Please enter the LocalPart for the email address"
$MailboxSMTP = ($LocalPart + "@aylo.net")
$MailboxName = $MailboxName + " (ayloNet)"
$AccessGroupName = "AN_MAIL_" + $MaiboxAllias
$AccessGroupAlias = $MaiboxAllias + "A"
$AccessGroupMail = ("MaiboxAccessGroup-" + $MaiboxAllias + "@aylo.net")
$Notes = ("This is a security group to control access to the Shared Maibox " + $MailboxName + " (" + $MaiboxAllias + "). All users within this group will be granted full Read and Send access on the afformentioned mailbox.")

# Add Distribution Group for Access

New-DistributionGroup -Name $AccessGroupName -DisplayName $AccessGroupName -Notes $Notes -Alias $AccessGroupAlias -PrimarySMTPAddress $AccessGroupMail -Type Security -MemberJoinRestriction Closed -MemberDepartRestriction Closed

# Add Mailbox
New-Mailbox -Shared -Name $MailboxName -DisplayName $MailboxName -Alias $MaiboxAllias -PrimarySMTPAddress $MailboxSMTP
Set-User -Identity $MaiboxAllias -Company "ayloNet" -Notes ("Shared Mailbox. Access controlled by: " + $AccessGroupName) -Office "Shared Maibox" -Department "Internal Information Systems" -CountryOrRegion "United Kingdom"

# Add Permission to Group

Add-MailboxPermission -Identity $MaiboxAllias -User $AccessGroupAlias -AccessRights FullAccess -InheritanceType All
Add-RecipientPermission -Identity $MaiboxAllias -Trustee $AccessGroupAlias -AccessRights SendAs

