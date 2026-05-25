<#
.SYNOPSIS
    Windows can be configured to automatically sign the user back in after a Windows Update restart. 
    Disabling this prevents credential caching for that purpose and ensures the user is aware of the restart. 
    This is a Medium severity finding.

.NOTES
    Author          : Sunny Cannon
    LinkedIn        : linkedin.com/in/sunnycannon/
    GitHub          : github.com/TheSunnyDev
    Date Created    : 2026-05-24
    Last Modified   : 2026-05-25
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000325
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-CC-000325/

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN11-CC-000325.ps1 
#>

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" `
  -Name "DisableAutomaticRestartSignOn" -Type DWord -Value 1
