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

# Show the top 5 processes by CPU usage
check_top_processes() {
    echo "=== Top 5 CPU-Consuming Processes ==="
    ps aux --sort=-%cpu | head -6
}

# Test whether DNS resolution is working by resolving a known domain
check_dns() {
    echo "=== DNS Resolution Test ==="
    if nslookup github.com > /dev/null 2>&1; then
        echo "DNS resolution: OK (github.com resolved successfully)"
    else
        echo "DNS resolution: FAILED"
    fi
}

check_disk
check_memory
check_top_processes
check_dns
