#!/bin/bash

#1.1

#for item in /proc/*; do
#    pid=$(basename "$item")
#    if [[ $pid =~ ^[0-9]+$ ]]; then
#        echo "$pid"
#    fi
#done

#1.2

#for item in /proc/*; do
#    pid=$(basename "$item")
#    if [[ $pid =~ ^[0-9]+$ ]]; then
#        if [ -f /proc/"$pid"/exe ]; then
#            name=$(readlink /proc/"$pid"/exe 2>/dev/null)
#            name_file=$(basename "$name")
#            echo "PID: $pid, Name: $name_file"
#        fi
#    fi
#done

#1.3

#for item in /proc/*; do
#    pid=$(basename "$item")
#    if [[ $pid =~ ^[0-9]+$ ]]; then
#        if [ -f /proc/"$pid"/exe ]; then
#            # Имя процесса
#            name=$(readlink /proc/"$pid"/exe 2>/dev/null)
#            name_file=$(basename "$name")
#            
#            echo "----------------------------------------"
#            echo "PID: $pid"
#            echo "NAME: $name_file"
#            echo ""
#            
#            # Параметр 1: status (состояние и память)
#            if [ -f /proc/"$pid"/status ]; then
#                echo "--- /proc/$pid/status ---"
#                grep -E "^(Name|State|VmRSS|VmSize|PPid)" /proc/"$pid"/status 2>/dev/null | head -5
#                echo ""
#            else
#                echo "--- /proc/$pid/status: NOT FOUND ---"
#                echo ""
#            fi
#            
#            # Параметр 2: cmdline (командная строка)
#            if [ -f /proc/"$pid"/cmdline ]; then
#                cmdline=$(cat /proc/"$pid"/cmdline 2>/dev/null | tr '\0' ' ' | sed 's/ *$//')
#                echo "--- /proc/$pid/cmdline ---"
#                echo "$cmdline"
#                echo ""
#            else
#                echo "--- /proc/$pid/cmdline: NOT FOUND ---"
#                echo ""
#            fi
#            
#            # Параметр 3: cwd (текущая рабочая директория)
#            if [ -e /proc/"$pid"/cwd ]; then
#                cwd=$(readlink /proc/"$pid"/cwd 2>/dev/null)
#                echo "--- /proc/$pid/cwd ---"
#                echo "$cwd"
#                echo ""
#            else
#                echo "--- /proc/$pid/cwd: NOT FOUND ---"
#                echo ""
#            fi
#            
#            # Параметр 4: fd (количество открытых дескрипторов)
#            if [ -d /proc/"$pid"/fd ]; then
#                fd_count=$(ls -1 /proc/"$pid"/fd 2>/dev/null | wc -l)
#                echo "--- /proc/$pid/fd ---"
#                echo "Open file descriptors: $fd_count"
#                echo "$(ls -1 /proc/"$pid"/fd 2>/dev/null | head -10 | sed 's/^/  /')"
#                if [ "$fd_count" -gt 10 ]; then
#                    echo "  ... and $(($fd_count - 10)) more"
#                fi
#                echo ""
#            else
#                echo "--- /proc/$pid/fd: NOT FOUND ---"
#                echo ""
#            fi
#            
#        fi
#    fi
#done
#
#echo "========================================="

#1.4

# Цвета для вывода (опционально, для красоты)
GREEN='\033[0;32m'
NC='\033[0m' # No Color

#echo -e "${GREEN}=========================================${NC}"
#echo -e "${GREEN}     Мониторинг процессов (пункт 1.3)    ${NC}"
#echo -e "${GREEN}=========================================${NC}"
#echo ""

# Заголовки таблицы
#printf "%-8s | %-25s | %-15s | %-35s | %-25s | %-5s\n" "PID" "NAME" "STATUS" "CMDLINE" "CWD" "FD"
#printf "%-8s-+-%-25s-+-%-15s-+-%-35s-+-%-25s-+-%-5s\n" "--------" "-------------------------" "---------------" "-----------------------------------" "-------------------------" "-----"
#
#for item in /proc/*; do
#    pid=$(basename "$item")
#    if [[ $pid =~ ^[0-9]+$ ]]; then
#        if [ -f /proc/"$pid"/exe ]; then
#            # Получаем имя процесса через exe
#            name=$(readlink /proc/"$pid"/exe 2>/dev/null)
#            name_file=$(basename "$name")
#            
#            # Параметр 1: STATUS (использование памяти)
#            if [ -f /proc/"$pid"/status ]; then
#                status_pid=$(grep "VmRSS" /proc/"$pid"/status 2>/dev/null | awk '{print $2 " " $3}')
#                if [ -z "$status_pid" ]; then
#                    status_pid="N/A"
#                fi
#            else
#                status_pid="N/A"
#            fi
#            
#            # Параметр 2: CMDLINE (командная строка)
#            if [ -f /proc/"$pid"/cmdline ]; then
#                cmdline_pid=$(cat /proc/"$pid"/cmdline 2>/dev/null | tr '\0' ' ' | sed 's/ *$//')
#                cmdline_pid_short=$(basename "$cmdline_pid" 2>/dev/null | cut -c1-35)
#                if [ -z "$cmdline_pid_short" ]; then
#                    cmdline_pid_short="N/A"
#                fi
#            else
#                cmdline_pid_short="N/A"
#            fi
#            
#            # Параметр 3: CWD (текущая рабочая директория)
#            if [ -e /proc/"$pid"/cwd ]; then
#                cwd_pid=$(readlink /proc/"$pid"/cwd 2>/dev/null)
#                cwd_pid_short=$(echo "$cwd_pid" | cut -c1-25)
#                if [ -z "$cwd_pid_short" ]; then
#                    cwd_pid_short="N/A"
#                fi
#            else
#                cwd_pid_short="N/A"
#            fi
#            
#            # Параметр 4: FD (количество открытых файловых дескрипторов)
#            if [ -d /proc/"$pid"/fd ]; then
#                fd_pid=$(ls -1 /proc/"$pid"/fd 2>/dev/null | wc -l)
#                if [ -z "$fd_pid" ] || [ "$fd_pid" -eq 0 ]; then
#                    fd_pid="0"
#                fi
#            else
#                fd_pid="0"
#            fi
#            
#            # Вывод строки таблицы
#            printf "%-8s | %-25s | %-15s | %-35s | %-25s | %-5s\n" "$pid" "$name_file" "$status_pid" "$cmdline_pid_short" "$cwd_pid_short" "$fd_pid"
#        fi
#    fi
#done
#
#echo ""
#echo -e "${GREEN}=========================================${NC}"
#

#2.1
#
#if [ -f /proc/bus/input/devices ]; then
#    cat /proc/bus/input/devices
#fi

#2.2

while read -r line; do
    if [ -z "$line" ]; then
        if [ -n "$block" ]; then
            name=$(echo "$block" | grep "^N: Name=" | sed 's/^N: Name="\(.*\)"$/\1/')
            handlers=$(echo "$block" | grep "^H: Handlers=" | sed 's/^H: Handlers=\(.*\)$/\1/')
            vendor=$(echo "$block" | grep "^I:" | sed 's/.*Vendor=\([0-9a-fA-F]*\).*/\1/')
            product=$(echo "$block" | grep "^I:" | sed 's/.*Product=\([0-9a-fA-F]*\).*/\1/')
            
            printf "%-34s | %-24s | %-14s | %-14s\n" "$name" "$handlers" "$vendor" "$product"
            block=""
        fi
    else
        block="$block$line"$'\n'
    fi
done < /proc/bus/input/devices
