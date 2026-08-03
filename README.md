# IT 100 Lab Scripts
Course: IT 100 
Semester: Summer of 2026

This repo contains the PowerShell and Bash scripts created for the IT 100 Labs.

Linux bash scripts:
Explaining and listing what these Linux scripts can do.

## sysinfo.sh: This can help display system information including:
- Hostname
- IP address
- CPU information
- OS version 
- Kernel version
- Uptime
- Disk usage
- Memory

## Ollama_Check.sh: This checks the Ollama service, verifies what Bind address it's on, Checks model storage, and displays any failed login attempts. 
- Displays information on whether the Ollama service is running or not. 
- Verifies the bind address of the Ollama service
- Checks the models storage usage
- Displays last failed SSH login attempts.

## Ollama_Health_Check: Performs a health check by verifying and checks status of HEALTH, WARNING, CRITICAL, and reports an overall health status report.
- The Service status
- API response 
- Installed models
- Disk usage 
- Recent Journal Errors

## user_audit.sh: This lists users with login shells, Checks sudo privileges, and flags any non-root accounts with UID 0. 
- Lists users with login shells
- Checks for sudo rights
- Flags UID 0 accounts
- Displays audit results in a readable format
- Helps identify potential user account security issues

## Windows PowerShell Scripts 

This will be the section for the PowerShell scripts and what they do. 

## HealthCheck.ps1: Checks the disk space, CPU usage, Memory, and saves a system health report into a text file.
- Checks disks space
- Monitors CPU usage
- Checks for available memory
-Lists top CPU processes
-Saves a health report into a .txt file


## EventLogParser.ps1: This can collect the recent system errors and also failed logon events together, in one single report.
- Searches for system errors
- Finds any failed logons
- Combines both results into one report.
- Saves output into a txt file

## UserAccountReport.ps1: This lists user accounts, enabled status, last logon, and exports results into a CSV file.
- Lists local users
- Shows account status
- Displays last logon
- Checks for administrator
- Exports results into a CSV file

## AI infrastructure skills  
- Able to install and manage Ollama
- Checking Service status of AI Service
- Verifying the service is securely bound to localhost
- Performing regular health checks on the AI service
- Monitoring installed AI models and the storage usage
- Reviewing service logs for any errors 



## Certifications pursuing
- COMPTIA NETWORK+ 
- COMPTIA SECURITY+
- LINUX+
- Continue building skills for Linux and PowerShell commands



