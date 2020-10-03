#Store a Keyvault in a variable 
$kv = 'kv-10032020f'

#Create a KeyVault
New-AzKeyVault `
     -VaultName $kv `
     -ResourceGroupName "DRtempResourceGroup"`
     -Location 'East US'

#Grant permissions through Access Policy
Set-AzKeyVaultAccessPolicy `
     -VaultName $kv `
     -ObjectId 6e54a180-997d-455a-9521-cbfa66a9cd83 `
     -PermissionsToSecrets get,set,delete,list `
     -PermissionsToKeys create,import,delete,list `
     -PermissionsToCertificates get, list, delete, create, import, update

#Create the value of the secret
$secretvalue = ConvertTo-SecureString 'I Have Super Secret !!' -AsPlainText -Force

#Add a secret to the KeyVault 
$secret = Set-AzKeyVaultSecret `
    -VaultName $kv `
    -Name 'kv-10032020secret' `
    -SecretValue $secretvalue
