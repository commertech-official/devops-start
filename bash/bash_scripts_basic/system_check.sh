#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"

# Функция для получения последних N строк за указанное количество минут
get_recent_lines() {
    local minutes=$1
    local cutoff=$(date -d "-$minutes minutes" "+%Y-%m-%d %H:%M:%S" 2>/dev/null)
    if [ -z "$cutoff" ]; then
        # fallback для macOS или других систем
        cutoff=$(date -v-"$minutes"M "+%Y-%m-%d %H:%M:%S" 2>/dev/null)
    fi
    awk -v cutoff="$cutoff" '$0 >= cutoff' "$LOG_FILE" 2>/dev/null
}

# 1. Проверка loadavg1 < 1 в течение последних 2 минут
check_load() {
    local lines=$(get_recent_lines 2)
    local failed=$(echo "$lines" | awk '$4 >= 1 {print; exit}')
    if [ -n "$failed" ]; then
        echo "❌ Условие не выполнено: loadavg1 >= 1 в течение последних 2 минут"
        return 1
    fi
    echo "✅ loadavg1 < 1 в течение последних 2 минут"
    return 0
}

# 2. Проверка memfree / memtotal < 60% (т.е. использование < 60%)
check_memory() {
    local lines=$(get_recent_lines 3)
    if [ -z "$lines" ]; then
        echo "⚠️ Нет данных за последние 3 минуты"
        return 1
    fi
    local failed=$(echo "$lines" | awk '
        $8 > 0 {
            mem_used_percent = (($8 - $7) / $8) * 100
            if (mem_used_percent >= 60) {
                print $0
                exit
            }
        }
    ')
    if [ -n "$failed" ]; then
        echo "❌ Условие не выполнено: использование памяти >= 60% в течение последних 3 минут"
        return 1
    fi
    echo "✅ Использование памяти < 60% в течение последних 3 минут"
    return 0
}

# 3. Проверка diskfree / disktotal < 60% (т.е. использование < 60%)
check_disk() {
    local lines=$(get_recent_lines 5)
    if [ -z "$lines" ]; then
        echo "⚠️ Нет данных за последние 5 минут"
        return 1
    fi
    local failed=$(echo "$lines" | awk '
        $10 > 0 {
            disk_used_percent = (($10 - $9) / $10) * 100
            if (disk_used_percent >= 60) {
                print $0
                exit
            }
        }
    ')
    if [ -n "$failed" ]; then
        echo "❌ Условие не выполнено: использование диска >= 60% в течение последних 5 минут"
        return 1
    fi
    echo "✅ Использование диска < 60% в течение последних 5 минут"
    return 0
}

# Запуск проверок
load_ok=0
memory_ok=0
disk_ok=0

check_load
load_ok=$?

check_memory
memory_ok=$?

check_disk
disk_ok=$?

# Итоговый код возврата
if [ $load_ok -eq 0 ] && [ $memory_ok -eq 0 ] && [ $disk_ok -eq 0 ]; then
    echo "✅ Все условия выполняются"
    exit 0
else
    echo "⚠️ Одно или несколько условий не выполняются"
    exit 1
fi
