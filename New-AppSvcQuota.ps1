function New-AppSvcQuota
{
    param(
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]    
        [string] $quotaName,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]    
        [ValidatePattern('[0-9]+')]
        [string] $totalAppServicePlansAllowed = 10,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]    
        [ValidatePattern('[0-9]+')]
        [string] $dedicatedAppServicePlansAllowed = 10,
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()] 
        [ValidatePattern('[0-9]+')]
        [string] $sharedAppServicePlansAllowed = 10

    )    

    $ApiVersion = "2018-11-01"

    $uri = "{0}/subscriptions/{1}/providers/Microsoft.web.Admin/locations/{2}/quotas/{3}?api-version={4}" -f $AdminUri, $SubscriptionId, $ArmLocation, $quotaName, $ApiVersion
    $RequestBody = @"
    {
        "name":"$quotaName",
        "location":"$ArmLocation",
        "properties": { 
            "totalAppServicePlansAllowed": $totalAppServicePlansAllowed,
            "dedicatedAppServicePlansAllowed": $dedicatedAppServicePlansAllowed,
            "sharedAppServicePlansAllowed": $sharedAppServicePlansAllowed,
            "designatedSKUs":[]
        }
    }
"@
    $headers = @{ "Authorization" = "Bearer "+ $AzureStackToken }
    $AppSvcQuota = Invoke-RestMethod -Method Put -Uri $uri -Body $RequestBody -ContentType 'application/json' -Headers $headers
    $AppSvcQuota
}
