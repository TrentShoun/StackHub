# Azure Stack Hub


This repo is intended to help Azure Stack Hub Operators preform tasks in Azure Stack Hub. 

## Authentication 
- Auth_and_set_azurerm is an example of how you can authenticate and set your Azure environment in POWERSHELL.

## App Services
- [Get-AppSVCQuota](https://github.com/TrentShoun/StackHub/blob/main/Get-AppSvcQuota.ps1) is a function to view your App Services (Microsoft.web) quotas
- [New-AppSVCQuota](https://github.com/TrentShoun/StackHub/blob/main/New-AppSvcQuota.ps1) is a function to create your App Services (Microsoft.web) quotas

## SQL Resource Provider 

- [Get-SQLDB](https://github.com/TrentShoun/StackHub/blob/main/Get-SQLDB_Quota.ps1_Quota) is a function to view your SQL Resource Provider quotas
- [New-SQLDB](https://github.com/TrentShoun/StackHub/blob/main/new-SQLDB_Quota.ps1)_Quota is a function to create your SQL Resource Provider quotas

## ASR Failback Script

The [ASR-failback-script](https://github.com/Azure-Samples/Azure-Stack-Hub-Foundation-Core/tree/master/ASR-failback-script) tool help automate the failback process, when using ASR to protect Azure Stack Hub VMs. The process is described in the [Azure Site Recovery failback tool](https://docs.microsoft.com/azure-stack/operator/site-recovery-failback) document.

## Tools

The Azure Stack Hub Operators use a wide range of tooling to manage their infrastructure. The [Tools](http://github.com/Azure-Samples/Azure-Stack-Hub-Foundation-Core/tree/master/Tools) folder provides these as a starting point - from PowerShell scripts, to API calls, ARM templates, Azure integration, and all kinds of automation. This repo is intended to capture some fo these tools and to provide them as example for others, as they are building their tooling as well. 
Most of these scripts are small snippets which can, and should be, included in your own automation. As most of them are generalized scripts, you will need to configure them according to your own environment.


## Core Fountations

The [Azure Stack Hub Foundation Core](https://github.com/Azure-Samples/Azure-Stack-Hub-Foundation-Core) are a set of materials (PowerPoint presentations, workshops, links to videos, and tools) aiming to provide Azure Stack Hub Operators the foundational materials required to ramp-up and understand the basics of operating Azure Stack Hub, as well as accelerate their operational practices. 

