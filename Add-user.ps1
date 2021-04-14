# Add user to a group
Add-ADGroupMember -Identity Marketing -Members amfchef
# Add new user
New-ADUser `
-DisplayName "amfchef" `
-Name "Jakob " `
-GivenName "Jakob" `
-Surname "Johansson" `
-SamAccountName "amfchef" `
-UserPrincipalName "amchef@gmail.com" `
-AccountPassword(Read-Host -AsSecureString "Input Password") `
-Enabled $true `
-ChangePasswordAtLogon $true

Add-ADGroupMember -Identity developer -Members jakob


# Add user script from ADAC
# This script was provided when I added "Jakob Johansson" in "Active Directory developer team":

New-ADUser -DisplayName:"Jakob Johansson" -GivenName:"Jakob" -Name:"Jakob Johansson" -Path:"OU=Users,OU=Stockholm,DC=LAB2,DC=LOCAL" -SamAccountName:"amfchef" -Server:"LAB2-DC1.LAB2.LOCAL" -Surname:"Johansson" -Type:"user"

Set-ADAccountPassword -Identity:"CN=Jakob Johansson,OU=Users,OU=Stockholm,DC=LAB2,DC=LOCAL" -NewPassword:"System.Security.SecureString" -Reset:$true -Server:"LAB2-DC1.LAB2.LOCAL"

Enable-ADAccount -Identity:"CN=Jakob Johansson,OU=Users,OU=Stockholm,DC=LAB2,DC=LOCAL" -Server:"LAB2-DC1.LAB2.LOCAL"

Add-ADPrincipalGroupMembership -Identity:"CN=Jakob Johansson,OU=Users,OU=Stockholm,DC=LAB2,DC=LOCAL" -MemberOf:"CN=developer,CN=Users,DC=LAB2,DC=LOCAL" -Server:"LAB2-DC1.LAB2.LOCAL"

Set-ADAccountControl -AccountNotDelegated:$false -AllowReversiblePasswordEncryption:$false -CannotChangePassword:$false -DoesNotRequirePreAuth:$false -Identity:"CN=Jakob Johansson,OU=Users,OU=Stockholm,DC=LAB2,DC=LOCAL" -PasswordNeverExpires:$false -Server:"LAB2-DC1.LAB2.LOCAL" -UseDESKeyOnly:$false

Set-ADUser -ChangePasswordAtLogon:$true -Identity:"CN=Jakob Johansson,OU=Users,OU=Stockholm,DC=LAB2,DC=LOCAL" -Server:"LAB2-DC1.LAB2.LOCAL" -SmartcardLogonRequired:$false
