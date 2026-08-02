$Report = "C:\Temp\EventLogReport.txt"

"===== EVENT LOG REPORT =====" | Out-File $Report
"Generated: $(Get-Date)" | Out-File $Report -Append
"" | Out-File $Report -Append

"=== System Errors (Last 24 Hours) ===" | Out-File $Report -Append

try {
    Get-WinEvent -FilterHashtable @{
        LogName = "System"
        Level = 2
        StartTime = (Get-Date).AddDays(-1)
    } |
    Select-Object TimeCreated, Id, ProviderName, Message |
    Format-Table -AutoSize |
    Out-String |
    Out-File $Report -Append
}
catch {
    "No System Error events found." | Out-File $Report -Append
}

"" | Out-File $Report -Append

"=== Failed Logons (Event ID 4625 - Last 24 Hours) ===" | Out-File $Report -Append

try {
    Get-WinEvent -FilterHashtable @{
        LogName = "Security"
        Id = 4625
        StartTime = (Get-Date).AddDays(-1)
    } |
    Select-Object TimeCreated, Id, ProviderName, Message |
    Format-Table -AutoSize |
    Out-String |
    Out-File $Report -Append
}
catch {
    "No failed logon events found." | Out-File $Report -Append
}

Write-Host "Event Log Report Complete"
Write-Host "Report saved to $Report"
