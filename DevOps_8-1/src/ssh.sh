#!/bin/bash

# Путь к файлу конфигурации ssh
SSHD_CONFIG="/etc/ssh/sshd_config"

# Строка для поиска
SEARCH_STRING="PasswordAuthentication"

# Проверяем, существует ли строка с PasswordAuthentication
if grep -q "^$SEARCH_STRING" "$SSHD_CONFIG"; then
    # Закомментируем строку с PasswordAuthentication
    sudo sed -i "s/^$SEARCH_STRING/#&/" "$SSHD_CONFIG"
    echo "Строка с '$SEARCH_STRING' была закомментирована в $SSHD_CONFIG"
else
    echo "Строка с '$SEARCH_STRING' не найдена в $SSHD_CONFIG"
fi

# Перезапускаем ssh-сервис для применения изменений
sudo systemctl restart sshd

echo "SSH-сервис перезапущен."
