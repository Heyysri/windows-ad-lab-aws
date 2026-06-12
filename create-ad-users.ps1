# Create Organizational Unit
New-ADOrganizationalUnit -Name "LabUsers" -Path "DC=lab,DC=local"

# Define users
$users = @("alice","bob","charlie","diana","edward","fiona","george","hannah","ivan","julia")

# Create each user
foreach ($user in $users) {
    New-ADUser `
        -Name $user `
        -GivenName $user `
        -SamAccountName $user `
        -UserPrincipalName "$user@lab.local" `
        -Path "OU=LabUsers,DC=lab,DC=local" `
        -AccountPassword (ConvertTo-SecureString "Welcome@123" -AsPlainText -Force) `
        -Enabled $true
    Write-Host "Created user: $user"
}