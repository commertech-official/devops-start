#!/bin/bash

user_dir="/home/aleshkin_da"
work_dir="$user_dir/devops_netology/bash_scripts_auto/work_files"
history_file="$work_dir/proc_history.log"
log_file="$work_dir/proc_monitor.log"
current_pids="$work_dir/current_pids.log"

if [ ! -d "$work_dir" ]; then
    # echo "creating directory: "$work_dir""
    mkdir -p "$work_dir"
# else
    # echo "directory not create: "$work_dir""	
fi

if [ ! -f "$history_file" ]; then
    touch "$history_file"
fi

if [ ! -f "$log_file" ]; then
    touch "$log_file"
fi

if [ ! -f "$current_pids" ]; then
    touch "$current_pids"
fi

# getting current list PID
ls -1 /proc | grep -E '^[0-9]+$' > "$current_pids"

# search new PID (absent in history)
new_pids=$(grep -v -F -f "$history_file" "$current_pids")

# if has new process
if [ -n "$new_pids" ]; then
    echo "-----------------------------" >> "$log_file"
    echo "Start: $(date '+%Y-%m-%d %H:%M:%S')" >> "$log_file"
    echo "New processes:" >> "$log_file"
    printf "%-8s | %-25s | %-15s | %-35s | %-25s | %-5s\n" "PID" "NAME" "STATUS" "CMDLINE" "CWD" "FD" >> "$log_file"

    # go only new PID
    for pid in $new_pids; do
        if [ -f /proc/"$pid"/exe ]; then
            name=$(readlink /proc/"$pid"/exe 2>/dev/null)
            name_file=$(basename "$name")

            # status pars
            if [ -f /proc/"$pid"/status ]; then
                status_pid=$(grep "VmRSS" /proc/"$pid"/status)
            else
                status_pid="N/A"
            fi

            # cmdline pars
            if [ -f /proc/"$pid"/cmdline ]; then
                cmdline_pid=$(cat /proc/"$pid"/cmdline | tr '\0' ' ')
                cmdline_pid_short=$(basename "$cmdline_pid" | cut -c1-35)
            else
                cmdline_pid_short="N/A"
            fi

            # cwd pars
            if [ -e /proc/"$pid"/cwd ]; then
                cwd_pid=$(readlink /proc/"$pid"/cwd 2>/dev/null)
                cwd_pid_short=$(echo "$cwd_pid" | cut -c1-25)
            else
                cwd_pid_short="N/A"
            fi

            # fd pars
            if [ -d /proc/"$pid"/fd ]; then
                fd_pid=$(ls -1 /proc/"$pid"/fd 2>/dev/null | wc -l)
            else
                fd_pid="0"
            fi

            # write in log
            printf "%-8s | %-25s | %-15s | %-35s | %-25s | %-5s\n" "$pid" "$name_file" "$status_pid" "$cmdline_pid_short" "$cwd_pid_short" "$fd_pid" >> "$log_file"
        fi
    done
fi

# refresh history
cat "$current_pids" >> "$history_file"

# for item in /proc/*; do	
# done
