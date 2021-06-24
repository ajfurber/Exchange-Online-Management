$ANumber = Read-Host "Please enter your A-Number with the A Prefix"
$UPN = ($ANumber + "@aylo.net")
Connect-ExchangeOnline -UserPrincipalName $UPN
$MaiboxID = Read-Host "Please enter the Mailbox ID"
$AccessGroupID = ($MaiboxID + "A")
$UserToAdd = Read-Host("Please enter the UserID you wish to grant access to")
$UserDisplayName = Get-Mailbox -Identity $UserToAdd | Format-List DisplayName

Add-DistributionGroupMember -Identity $AccessGroupID -Member $usertoAdd


Write-Host("User " + $UserToAdd + " has been added to Shared Mailbox: " + $MaiboxID)