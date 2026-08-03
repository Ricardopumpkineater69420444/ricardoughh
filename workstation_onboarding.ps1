# Script A - Workstation Onboarding

Write-Host "Starting workstation onboarding..."

# Rename computer
Rename-Computer -NewName "SVUSD-PC01" -Force

# Set DNS servers
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses ("8.8.8.8","1.1.1.1")

# Enable Windows Firewall
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True

# Disable unnecessary services
Stop-Service -Name "Fax" -Force -ErrorAction SilentlyContinue
Set-Service -Name "Fax" -StartupType Disabled

Stop-Service -Name "MapsBroker" -Force -ErrorAction SilentlyContinue
Set-Service -Name "MapsBroker" -StartupType Disabled

Stop-Service -Name "XblGameSave" -Force -ErrorAction SilentlyContinue
Set-Service -Name "XblGameSave" -StartupType Disabled

# Create completion report
$Report = @"
=========================================
Workstation Onboarding Report
=========================================
Computer Name: SVUSD-PC01
DNS Servers: 8.8.8.8, 1.1.1.1
Windows Firewall: Enabled

Disabled Services:
- Fax
- MapsBroker
- XblGameSave

Completed: $(Get-Date)
=========================================
"@

$Report | Out-File "C:\Temp\OnboardingReport.txt"

Write-Host "Onboarding complete."
Write-Host "Report saved to C:\Temp\OnboardingReport.txt"
