#!/bin/bash

check_memory() {
    echo "=== Memory Usage ==="
    free -h
}



check_disk() {
    echo "=== Disk Usage ==="
    df -h --output=target,pcent,size,used,avail | grep -E "^/|Mounted"
}

check_disk
check_memory
