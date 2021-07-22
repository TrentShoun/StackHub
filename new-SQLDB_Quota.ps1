function New-SQLDBQuota
{
    param(
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]    
        [string] $quotaName,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]    
        [ValidatePattern('[0-9]+')]
        [string] $resourceCount = 10,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]    
        [ValidatePattern('[0-9]+')]
        [string] $totalResourceSizeMB = 2097152



    )    

    $ApiVersion = "2017-08-28"

    $uri = "{0}/subscriptions/{1}/providers/Microsoft.SQLAdapter.Admin/locations/{2}/quotas/{3}?api-version={4}" -f $AdminUri, $SubscriptionId, $ArmLocation, $quotaName, $ApiVersion
    $RequestBody = @"
    {
        id: "/subscriptions/$SubscriptionId/providers/Microsoft.SQLAdapter.Admin/locations/$ArmLocation/quotas/$quotaName",
        name: "$quotaName",        
        "properties": { 
            "resourceCount": $resourceCount,
            "totalResourceSizeMB": $totalResourceSizeMB
        }
    }
"@ 

    $headers = @{ "Authorization" = "Bearer "+ $AzureStackToken }
    $SQLDBQuota = Invoke-RestMethod -Method Put -Uri $uri -Body $RequestBody -ContentType 'application/json' -Headers $headers
    $SQLDBQuota
}
