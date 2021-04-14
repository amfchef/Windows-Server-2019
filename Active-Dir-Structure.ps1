$ParentDomain = "DC=AD,DC=LAB,DC=SE"
$DomainName = "LAB"

# Create Domain OU
New-ADOrganizationalUnit -Name $DomainName -Path $ParentDomain -ProtectedFromAccidentalDeletion $True

# Create Computer Containers
New-ADOrganizationalUnit -Name Computers -Path "OU=$DomainName,$ParentDomain" -ProtectedFromAccidentalDeletion $True

New-ADOrganizationalUnit -Name Clients -Path "OU=Computers,OU=$DomainName,$ParentDomain" -ProtectedFromAccidentalDeletion $True
New-ADOrganizationalUnit -Name New -Path "OU=Computers,OU=$DomainName,$ParentDomain" -ProtectedFromAccidentalDeletion $True
New-ADOrganizationalUnit -Name Servers -Path "OU=Computers,OU=$DomainName,$ParentDomain" -ProtectedFromAccidentalDeletion $True

# Create User Container
New-ADOrganizationalUnit -Name Users -Path $("OU=$DomainName,$ParentDomain") -ProtectedFromAccidentalDeletion $True
New-ADOrganizationalUnit -Name HQ -Path $("OU=Users,OU=$DomainName,$ParentDomain") -ProtectedFromAccidentalDeletion $True
New-ADOrganizationalUnit -Name ResourceGroups -Path $("OU=Users,OU=$DomainName,$ParentDomain") -ProtectedFromAccidentalDeletion $True

# Create Service Account Container
New-ADOrganizationalUnit -Name "ServiceAccounts" -Path "OU=$DomainName,$ParentDomain" -ProtectedFromAccidentalDeletion $True

# Create Security Groups Container
New-ADOrganizationalUnit -Name "SecurityGroups" -Path "OU=$DomainName,$ParentDomain" -ProtectedFromAccidentalDeletion $True

# Create Admins Container
New-ADOrganizationalUnit -Name "Admins" -Path "OU=$DomainName,$ParentDomain" -ProtectedFromAccidentalDeletion $True