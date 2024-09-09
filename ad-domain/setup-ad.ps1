# Variables (Change these as per your requirements)
$domainName = "example.com"
$netbiosName = "EXAMPLE"
$safeModePassword = (ConvertTo-SecureString -AsPlainText "P@ssw0rd!" -Force)
$adminPassword = (ConvertTo-SecureString -AsPlainText "P@ssw0rd!" -Force)

# Install the AD DS role
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Configure a new AD forest
Install-ADDSForest `
    -DomainName $domainName `
    -DomainNetbiosName $netbiosName `
    -SafeModeAdministratorPassword $safeModePassword `
    -InstallDNS `
    -CreateDnsDelegation:$false `
    -DatabasePath "C:\Windows\NTDS" `
    -LogPath "C:\Windows\NTDS" `
    -SysvolPath "C:\Windows\SYSVOL" `
    -Force `
    -NoRebootOnCompletion:$true

# Reboot the server to apply changes
Restart-Computer -Force
