# IT 100 Lab Scripts

This repo contains the PowerShell and Bash scripts created for the IT 100 Labs.

These bash scripts contain:

## sysinfo.sh This can help display system information including:
- Hostname
- Ip address
- CPU information
- OS version 
- Kernel version
- Uptime
- disk usage
- Memory

## Ollama_Check.sh
- Displays information on whether the Ollama service is running or not. 
- Verifies the bind address of the Ollama service
- Checks the models storage usage
- Displays last failed SSH login attempts.

## Ollama_Health_Check: Performs a health check by verifying and checks status of HEALTH, WARNING, CRITICAL.
- The Service status
- API response 
- Installed models
- Disk usage 
- Recent Journal Errors

## user_audit: 
- Lists users with login shells
- Checks for sudo rights
- Flags UID 0 accounts
- Displays audit results in a readable format
- Helps identify potential user account security issues

