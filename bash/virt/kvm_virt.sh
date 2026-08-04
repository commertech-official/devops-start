#!/bin/bash

VM_NAME="devops_task_2"
ISO_PATH="/tmp/ubuntu-server.iso"

# Удаление старой ВМ (если есть)
sudo virsh destroy $VM_NAME 2>/dev/null
sudo virsh undefine $VM_NAME --remove-all-storage 2>/dev/null

# Скачивание ISO (если нет)
if [ ! -f "$ISO_PATH" ] || [ ! -s "$ISO_PATH" ]; then
    echo "Скачиваю Ubuntu Server 22.04 LTS..."
    rm -f "$ISO_PATH"
    wget -O "$ISO_PATH" https://releases.ubuntu.com/jammy/ubuntu-22.04.5-live-server-amd64.iso
fi

# Создание ВМ с KVM
sudo virt-install \
    --name "$VM_NAME" \
    --memory 2048 \
    --vcpus 2 \
    --disk size=20 \
    --cdrom "$ISO_PATH" \
    --osinfo ubuntu22.04 \
    --virt-type kvm \
    --graphics vnc
