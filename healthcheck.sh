#!/bin/bash

# Server Health & Network Diagnostic Tool
# Checks disk, memory, and (soon) network connectivity on this server

# Check disk usage across all mounted filesystems
check_disk() {
    echo "=== Disk Usage ==="
    df -h --output=target,pcent,size,used,avail | grep -E "^/|Mounted"
}

# Check RAM and swap usage
check_memory() {
    echo "=== Memory Usage ==="
    free -h
}

check_disk
check_memory
