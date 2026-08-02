$ReportFolder = "C:\Temp"

if (!(Test-Path $ReportFolder)) {
    New-Item -ItemType Directory -Path $ReportFolder | Out-Null
}

$Date = Get-Date -Format "yyyyMMdd_HHmmss"
$Report = "$ReportFolder\healthcheck_$Date.txt"

"===== SYSTEM HEALTH CHECK =====" | Out-File $Report
"Generated: $(Get-Date)" | Out-File $Report -Append
"" | Out-File $Report -Append

# Disk Space
"=== Disk Space ===" | Out-File $Report -Append
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $FreePercent = [math]::Round(($_.FreeSpace / $_.Size) * 100,2)
    "$($_.DeviceID) - $FreePercent% Free" | Out-File $Report -Append

    if ($FreePercent -lt 20) {
        "WARNING: $($_.DeviceID) below 20% free!" | Out-File $Report -Append
    }
}

"" | Out-File $Report -Append

# CPU Usage
"=== CPU Usage ===" | Out-File $Report -Append

$total = 0
1..30 | ForEach-Object {
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    $total += $cpu
    Start-Sleep -Seconds 1
}

$AverageCPU = [math]::Round($total / 30,2)

"Average CPU Usage: $AverageCPU%" | Out-File $Report -Append

if ($AverageCPU -gt 80) {
    "WARNING: CPU usage above 80%." | Out-File $Report -Append
}

"" | Out-File $Report -Append

# Memory
"=== Memory ===" | Out-File $Report -Append

$os = Get-CimInstance Win32_OperatingSystem
$FreeMemory = [math]::Round($os.FreePhysicalMemory / 1024,2)

"Free Memory: $FreeMemory MB" | Out-File $Report -Append

if ($FreeMemory -lt 500) {
    "WARNING: Less than 500MB free memory." | Out-File $Report -Append
}

"" | Out-File $Report -Append

# Top Processes
"=== Top 5 CPU Processes ===" | Out-File $Report -Append

Get-Process |
Sort-Object CPU -Descending |
Select-Object -First 5 Name,CPU |
Format-Table -AutoSize |
Out-String |
Out-File $Report -Append

Write-Host "Health Check Complete"
Write-Host "Report saved to $Report"
