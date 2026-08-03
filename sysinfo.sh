#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)
REPORT=~/sysinfo_$DATE.txt

{
echo "===== SYSTEM INFORMATION ====="
echo "Generated: $(date)"
echo

echo "Hostname:"
hostname
echo

echo "IP Address:"
hostname -I
echo

echo "OS Version:"
cat /etc/os-release | grep PRETTY_NAME
echo

echo "Kernel Version:"
uname -r
echo

echo "Uptime:"
uptime -p
echo

echo "Disk Usage:"
df -h

echo
echo "Filesystems above 80%:"
df -h | awk 'NR==1 || $5+0 > 80'
echo

echo "Memory:"
free -h
echo

echo "CPU Model:"
lscpu | grep "Model name"

} | tee "$REPORT"

echo
echo "Report saved to $REPORT"
