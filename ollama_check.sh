#!/bin/bash

echo "===== OLLAMA CHECK ====="
echo

# Check if Ollama service is running
if systemctl is-active --quiet ollama; then
    echo "OK: Ollama service is running."
else
    echo "WARNING: Ollama service is not running."
    echo "Attempting to restart..."
    sudo systemctl restart ollama

    if systemctl is-active --quiet ollama; then
        echo "OK: Ollama restarted successfully."
    else
        echo "ERROR: Ollama failed to restart."
    fi
fi

echo

# Check binding address
echo "Checking bind address..."
if ss -tuln | grep -q "127.0.0.1:11434"; then
    echo "OK: Ollama is bound to 127.0.0.1"
elif ss -tuln | grep -q "0.0.0.0:11434"; then
    echo "WARNING: Ollama is exposed on 0.0.0.0"
else
    echo "WARNING: Ollama port not found."
fi

echo

# Check model directory usage
MODEL_DIR="$HOME/.ollama/models"

if [ -d "$MODEL_DIR" ]; then
    USAGE=$(df -P "$MODEL_DIR" | awk 'NR==2 {gsub("%","",$5); print $5}')
    echo "Model partition usage: ${USAGE}%"

    if [ "$USAGE" -gt 80 ]; then
        echo "WARNING: Disk usage is above 80%."
    fi
else
    echo "WARN: $MODEL_DIR does not exist."
fi

echo

# Last 5 failed SSH login attempts
echo "Last 5 failed SSH login attempts:"
journalctl -u ssh --since "7 days ago" 2>/dev/null | grep "Failed" | tail -5

echo
echo "Check complete."
