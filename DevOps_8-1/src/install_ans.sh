#!/bin/bash

# Обновление пакетов
sudo apt update -y

# Установка зависимостей
sudo apt install -y software-properties-common

# Добавление репозитория Ansible
sudo add-apt-repository ppa:ansible/ansible -y

# Обновление пакетов после добавления репозитория
sudo apt update -y

# Установка Ansible
sudo apt install -y ansible

# Проверка установки
ansible --version

 ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""
#ssh-copy-id -i ~/.ssh/id_rsa.pub vagrant@192.168.50.13