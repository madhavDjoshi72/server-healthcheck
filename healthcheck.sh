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

# Test general internet connectivity by pinging a reliable external host
check_connectivity() {
    echo "=== Internet Connectivity Test ==="
    if ping -c 2 -W 2 8.8.8.8 > /dev/null 2>&1; then
        echo "Connectivity: OK (reached 8.8.8.8)"
    else
        echo "Connectivity: FAILED"
    fi
}

# List all ports currently listening for connections on this server
check_open_ports() {
    echo "=== Listening Ports ==="
    ss -tuln | grep LISTEN
}


check_disk
check_memory
check_top_processes
check_dns
check_connectivity
check_open_ports
