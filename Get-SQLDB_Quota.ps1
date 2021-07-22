function Get-SQLDBQuota
{
    param(
        [parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]    
        [string] $quotaName
    )    

    $ApiVersion = "2017-08-28"

    $uri = "{0}/subscriptions/{1}/providers/Microsoft.SQLAdapter.admin/locations/{2}/quotas/{3}?api-version={4}" -f $AdminUri, $SubscriptionId, $ArmLocation, $quotaName, $ApiVersion

    $headers = @{ "Authorization" = "Bearer "+ $AzureStackToken }
    $ehQuota = Invoke-RestMethod -Method Get -Uri $uri -Body $RequestBody -ContentType 'application/json' -Headers $headers
    if ($ehQuota | gm -Name Value)
        {$ehQuota.Value}
    else
        {$ehQuota}
}