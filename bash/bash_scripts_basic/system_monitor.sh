#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"

while true; do
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    
    # Загрузка CPU из /proc/loadavg
    loadavg=$(cat /proc/loadavg | awk '{print $1, $2, $3}')
    
    # Память (free)
    mem_free=$(free -b | awk 'NR==2 {print $4}')
    mem_total=$(free -b | awk 'NR==2 {print $2}')
    
    # Диск (df)
    disk_free=$(df -B1 / | awk 'NR==2 {print $4}')
    disk_total=$(df -B1 / | awk 'NR==2 {print $2}')
    
    echo "$timestamp $loadavg $mem_free $mem_total $disk_free $disk_total" >> "$LOG_FILE"
    
    sleep 5
done
