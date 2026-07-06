#!/bin/bash
# ============================================================
# ARP Scanner v3.0 - Unified ARP Scanner
# Объединяет автоматическое определение сети и ручную настройку
# Поддерживает: полная сеть, одна подсеть, один IP
# ============================================================

set -euo pipefail

# Переменные
PREFIX=""
INTERFACE=""
SUBNET=""
HOST=""
AUTO_MODE=false

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ============================================================
# Функция: проверка прав root
# ============================================================
check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}[ERROR]${NC} This script must be run as root!"
        echo "Please run: sudo $0 $*"
        exit 1
    fi
}

# ============================================================
# Функция: проверка валидности IPv4 октета (0-255)
# ============================================================
validate_octet() {
    local octet="$1"
    if [[ "$octet" =~ ^[0-9]+$ ]] && [[ "$octet" -ge 0 ]] && [[ "$octet" -le 255 ]]; then
        return 0
    else
        return 1
    fi
}

# ============================================================
# Функция: проверка существования интерфейса
# ============================================================
validate_interface() {
    local iface="$1"
    if ip link show "$iface" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# ============================================================
# Функция: автоопределение сети по интерфейсу
# ============================================================
auto_detect_network() {
    local iface="$1"
    local ip_info
    local ip cidr network prefix subnet

    # Проверка интерфейса
    if ! validate_interface "$iface"; then
        echo -e "${RED}[ERROR]${NC} Interface '$iface' does not exist."
        echo "Available interfaces:"
        ip link show | grep -E '^[0-9]+:' | awk -F': ' '{print "  - " $2}'
        exit 1
    fi

    # Получение IP и маски
    ip_info=$(ip -4 addr show "$iface" | grep -oP '(?<=inet\s)\d+\.\d+\.\d+\.\d+/\d+' | head -1)

    if [[ -z "$ip_info" ]]; then
        echo -e "${RED}[ERROR]${NC} No IP address assigned to interface '$iface'"
        exit 1
    fi

    # Разделение IP и маски
    ip="${ip_info%/*}"
    cidr="${ip_info#*/}"

    # Проверка, что маска = 24 (для /24 подсети)
    if [[ "$cidr" -ne 24 ]]; then
        echo -e "${YELLOW}[WARNING]${NC} Interface $iface has mask /$cidr, not /24"
        echo "Auto mode works best with /24 networks. Continuing anyway..."
    fi

    # Вычисление сетевого адреса
    if command -v ipcalc &>/dev/null; then
        network=$(ipcalc -n "$ip/$cidr" | grep -oP '(?<=Network:\s)[0-9.]+')
    else
        # fallback: берём первые три октета и заменяем последний на 0
        network="$(echo "$ip" | cut -d. -f1-3).0"
        echo -e "${YELLOW}[WARNING]${NC} ipcalc not found, using fallback network detection"
    fi

    prefix=$(echo "$network" | cut -d. -f1-2)
    subnet=$(echo "$network" | cut -d. -f3)

    echo -e "${GREEN}[AUTO]${NC} Detected:"
    echo "  Interface: $iface"
    echo "  IP: $ip/$cidr"
    echo "  Network: $prefix.$subnet.0/24"

    PREFIX="$prefix"
    SUBNET="$subnet"
}

# ============================================================
# Функция: сканирование одного IP
# ============================================================
scan_ip() {
    local ip="$1"
    echo -e "${YELLOW}[*] Scanning:${NC} $ip"
    if arping -c 2 -W 1 -i "$INTERFACE" "$ip" 2>/dev/null | grep -q "reply"; then
        echo -e "${GREEN}[+] $ip is alive${NC}"
        return 0
    else
        echo -e "${RED}[-] $ip is down${NC}"
        return 1
    fi
}

# ============================================================
# Функция: сканирование подсети (SUBNET фиксирован)
# ============================================================
scan_subnet() {
    local prefix="$1"
    local subnet="$2"
    echo -e "${YELLOW}[*] Scanning subnet:${NC} $prefix.$subnet.0/24"
    for host in {1..254}; do
        scan_ip "$prefix.$subnet.$host"
    done
}

# ============================================================
# Функция: сканирование всей сети (все SUBNET)
# ============================================================
scan_network() {
    local prefix="$1"
    echo -e "${YELLOW}[*] Scanning full network:${NC} $prefix.0.0/16"
    for subnet in {0..255}; do
        for host in {1..254}; do
            scan_ip "$prefix.$subnet.$host"
        done
    done
}

# ============================================================
# Функция: вывод справки
# ============================================================
show_usage() {
    cat << EOF
Usage: $0 [OPTIONS] [INTERFACE]

OPTIONS:
    -p, --prefix PREFIX     First two octets (e.g., 192.168)
    -i, --interface IFACE   Network interface (e.g., eth0)
    -s, --subnet SUBNET     Third octet (0-255) [optional]
    -h, --host HOST         Fourth octet (1-254) [optional]
    -a, --auto              Auto-detect network from interface
    -P, --help              Show this help

MODES:
    1. AUTO mode:      $0 -a eth0
    2. Manual mode:    $0 -p 192.168 -i eth0
    3. With subnet:    $0 -p 192.168 -i eth0 -s 1
    4. Single IP:      $0 -p 192.168 -i eth0 -s 1 -h 10

EXAMPLES:
    $0 -a eth0                              # Auto-detect and scan
    $0 -p 192.168 -i eth0                   # Scan full network
    $0 -p 192.168 -i eth0 -s 1              # Scan only subnet 1
    $0 -p 192.168 -i eth0 -s 1 -h 10        # Scan only IP 192.168.1.10

EOF
}

# ============================================================
# Парсинг аргументов командной строки
# ============================================================
parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -p|--prefix)
                PREFIX="$2"
                shift 2
                ;;
            -i|--interface)
                INTERFACE="$2"
                shift 2
                ;;
            -s|--subnet)
                SUBNET="$2"
                shift 2
                ;;
            -h|--host)
                HOST="$2"
                shift 2
                ;;
            -a|--auto)
                AUTO_MODE=true
                INTERFACE="$2"
                shift 2
                ;;
            -P|--help)
                show_usage
                exit 0
                ;;
            *)
                # Если аргумент не начинается с "-", считаем его интерфейсом
                if [[ "$1" != -* ]]; then
                    INTERFACE="$1"
                    AUTO_MODE=true
                    shift 1
                else
                    echo -e "${RED}[ERROR]${NC} Unknown option: $1"
                    show_usage
                    exit 1
                fi
                ;;
        esac
    done
}

# ============================================================
# Основная логика
# ============================================================
main() {
    # Проверка прав
    check_root

    # Парсинг аргументов
    parse_args "$@"

    # === РЕЖИМ АВТООПРЕДЕЛЕНИЯ ===
    if [[ "$AUTO_MODE" == true ]]; then
        if [[ -z "$INTERFACE" ]]; then
            echo -e "${RED}[ERROR]${NC} Interface is required for auto mode"
            echo "Usage: $0 -a <interface>"
            echo "Example: $0 -a eth0"
            exit 1
        fi
        auto_detect_network "$INTERFACE"
        echo ""
        scan_subnet "$PREFIX" "$SUBNET"
        echo -e "${GREEN}[+] Scan completed.${NC}"
        exit 0
    fi

    # === РУЧНОЙ РЕЖИМ ===
    # Проверка обязательных параметров
    if [[ -z "$PREFIX" ]]; then
        echo -e "${RED}[ERROR]${NC} --prefix is required (or use -a for auto mode)"
        show_usage
        exit 1
    fi

    if [[ -z "$INTERFACE" ]]; then
        echo -e "${RED}[ERROR]${NC} --interface is required (or use -a for auto mode)"
        show_usage
        exit 1
    fi

    # Проверка формата PREFIX (должен быть вида XXX.XXX)
    if [[ ! "$PREFIX" =~ ^[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        echo -e "${RED}[ERROR]${NC} Invalid PREFIX format. Expected: XXX.XXX (e.g., 192.168)"
        exit 1
    fi

    # Проверка октетов PREFIX
    PREFIX1="${PREFIX%.*}"
    PREFIX2="${PREFIX#*.}"
    if ! validate_octet "$PREFIX1" || ! validate_octet "$PREFIX2"; then
        echo -e "${RED}[ERROR]${NC} Invalid octets in PREFIX. Each octet must be 0-255."
        exit 1
    fi

    # Проверка интерфейса
    if ! validate_interface "$INTERFACE"; then
        echo -e "${RED}[ERROR]${NC} Interface '$INTERFACE' does not exist."
        echo "Available interfaces:"
        ip link show | grep -E '^[0-9]+:' | awk -F': ' '{print "  - " $2}'
        exit 1
    fi

    # Проверка SUBNET (если задан)
    if [[ -n "$SUBNET" ]]; then
        if ! validate_octet "$SUBNET"; then
            echo -e "${RED}[ERROR]${NC} Invalid SUBNET. Must be 0-255."
            exit 1
        fi
    fi

    # Проверка HOST (если задан)
    if [[ -n "$HOST" ]]; then
        if ! validate_octet "$HOST" || [[ "$HOST" -eq 0 ]]; then
            echo -e "${RED}[ERROR]${NC} Invalid HOST. Must be 1-254."
            exit 1
        fi
    fi

    # === ОСНОВНАЯ ЛОГИКА СКАНИРОВАНИЯ ===
    echo -e "${GREEN}[+] Starting ARP scan...${NC}"
    echo -e "${GREEN}[+] Prefix:${NC} $PREFIX"
    echo -e "${GREEN}[+] Interface:${NC} $INTERFACE"

    if [[ -n "$SUBNET" ]]; then
        echo -e "${GREEN}[+] Subnet:${NC} $SUBNET"
    fi

    if [[ -n "$HOST" ]]; then
        echo -e "${GREEN}[+] Host:${NC} $HOST"
    fi

    echo ""

    # Сценарий 1: Заданы PREFIX, INTERFACE, SUBNET, HOST → сканируем один IP
    if [[ -n "$SUBNET" ]] && [[ -n "$HOST" ]]; then
        scan_ip "$PREFIX.$SUBNET.$HOST"

    # Сценарий 2: Заданы PREFIX, INTERFACE, SUBNET → сканируем подсеть
    elif [[ -n "$SUBNET" ]]; then
        scan_subnet "$PREFIX" "$SUBNET"

    # Сценарий 3: Заданы только PREFIX и INTERFACE → сканируем всю сеть
    else
        scan_network "$PREFIX"
    fi

    echo -e "${GREEN}[+] Scan completed.${NC}"
}

# ============================================================
# Запуск основной функции
# ============================================================
main "$@"
