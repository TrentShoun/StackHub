Add-AzureRMEnvironment -Name "AzureStackAdmin" -ArmEndpoint "https://adminmanagement.east.contoso.com" `
      -AzureKeyVaultDnsSuffix adminvault.east.contoso.com `
      -AzureKeyVaultServiceEndpointResourceId https://adminvault.east.contoso.com
# Set your tenant name.
    $AuthEndpoint = (Get-AzureRmEnvironment -Name "AzureStackAdmin").ActiveDirectoryAuthority.TrimEnd('/')
    $AADTenantName = "tenant.onmicrosoft.com"
    $TenantId = (invoke-restmethod "$($AuthEndpoint)/$($AADTenantName)/.well-known/openid-configuration").issuer.TrimEnd('/').Split('/')[-1]

    # After signing in to your environment, Azure Stack Hub cmdlets
    # can be easily targeted at your Azure Stack Hub instance.
    Add-AzureRmAccount -EnvironmentName "AzureStackAdmin" -TenantId $TenantId


#Main
$ctx = Get-AzureRmContext
if (!$ctx)
    {
    Exit
    }
$env = Get-AzureRMEnvironment -Name $ctx.Environment
$AdminUri =$env.ResourceManagerUrl
$SubscriptionId = $ctx.Subscription    
$azProfile = [Microsoft.Azure.Commands.Common.Authentication.Abstractions.AzureRmProfileProvider]::Instance.Profile
$profileClient = [Microsoft.Azure.Commands.ResourceManager.Common.RMProfileClient]::new($azProfile)
$AzureStackToken = ($profileClient.AcquireAccessToken($azProfile.DefaultContext.Tenant.Id)).AccessToken
$ArmLocation =  $AdminUri.Split('.')[1]
