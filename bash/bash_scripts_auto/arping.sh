#!/bin/bash
PREFIX=$1
INTERFACE=$2

#trap 'echo "Ping exit (Ctrl-C)"; exit 1' 2

#for SUBNET in {0..255}	
#do
#	for HOST in {1..255}
#	do
#		echo "IP : $PREFIX.$SUBNET.$HOST"
#		arping -c 3 -i $INTERFACE $PREFIX"."$SUBNET"."$HOST 2> /dev/null
#	done
#done

PREFIX=$1
INTERFACE=$2

# Проверка аргументов
if [ -z "$PREFIX" ] || [ -z "$INTERFACE" ]; then
    echo "Usage: $0 <PREFIX> <INTERFACE>"
    echo "Example: $0 192.168 eth0"
    exit 1
fi

# Проверка интерфейса
if ! ip link show "$INTERFACE" > /dev/null 2>&1; then
    echo "Error: Interface '$INTERFACE' not found"
    exit 1
fi

# Обработка Ctrl-C
trap 'echo "Scan interrupted by user"; exit 0' INT

echo "Starting ARP scan on $PREFIX.0.0/16 via $INTERFACE"
echo "Press Ctrl-C to stop"

for SUBNET in {0..255}; do
    for HOST in {1..255}; do
        IP="$PREFIX.$SUBNET.$HOST"
        echo "Scanning: $IP"

        if arping -c 1 -W 1 -i "$INTERFACE" "$IP" 2> /dev/null | grep -q "reply"; then
            echo "✅ $IP is alive"
        fi
    done
done

echo "Scan completed"
