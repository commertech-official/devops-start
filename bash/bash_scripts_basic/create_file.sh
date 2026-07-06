#!/bin/bash

#Function createfile
#If file create - return 0
#If file not create - retern 1
#If file already live - retunt 2

createfile() {
  FILENAME=$1
    if [[ -e "$FILENAME" ]]; then
        return 2   # Файл уже существует
    fi

    touch "$FILENAME" 2>/dev/null
    if [[ $? -eq 0 ]]; then
        return 0   # Файл успешно создан
    else
        return 1   # Ошибка создания (нет прав и т.д.)
    fi
