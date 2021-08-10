#Run Once - create secure password file
read-host -assecurestring | convertfrom-securestring | out-file c:\temp\cred.txt 


Add-AzureRMEnvironment -Name "AzureStack" -ArmEndpoint https://management.local.azurestack.external
$AuthEndpoint = (Get-AzureRMEnvironment -Name "AzureStack").ActiveDirectoryAuthority.TrimEnd('/')
$AADTenantName = "tenant.onmicrosoft.com"
$TenantId = (invoke-restmethod "$($AuthEndpoint)/$($AADTenantName)/.well-known/openid-configuration").issuer.TrimEnd('/').Split('/')[-1]

$userId = "user@yourtenant.onmicrosoft.com"
$password = get-content -Path "c:\temp\cred.txt" | ConvertTo-SecureString

#Set the powershell credential object
$cred = New-Object -TypeName System.Management.Automation.PSCredential($userId ,$password)

#log On To Azure Account
Connect-AzureRmAccount -EnvironmentName "AzureStack" -TenantId $TenantId -Credential $cred 
