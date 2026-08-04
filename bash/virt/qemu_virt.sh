#!/bin/bash

ISO_PATH="/tmp/ubuntu-server.iso"
VM_NAME="devops_task_1"

# Удаление ВМ
virsh --connect qemu:///session destroy $VM_NAME 2>/dev/null
virsh --connect qemu:///session undefine $VM_NAME --remove-all-storage 2>/dev/null
sudo virsh destroy $VM_NAME 2>/dev/null
sudo virsh undefine $VM_NAME --remove-all-storage 2>/dev/null

# Скачивание ISO
if [ ! -f "$ISO_PATH" ] || [ ! -s "$ISO_PATH" ]; then
    echo "Скачиваю Ubuntu Server 22.04 LTS..."
    rm -f "$ISO_PATH"
    wget -O "$ISO_PATH" https://releases.ubuntu.com/jammy/ubuntu-22.04.5-live-server-amd64.iso
fi

# Проверка размера
if [ $(stat -c%s "$ISO_PATH" 2>/dev/null || echo 0) -lt 1000000000 ]; then
    echo "ISO-образ повреждён. Удаляю..."
    rm -f "$ISO_PATH"
    exit 1
fi

# Создание ВМ
sudo virt-install \
    --name "$VM_NAME" \
    --memory 2048 \
    --vcpus 2 \
    --disk size=20 \
    --cdrom "$ISO_PATH" \
    --osinfo ubuntu22.04 \
    --virt-type qemu \
    --graphics vnc
