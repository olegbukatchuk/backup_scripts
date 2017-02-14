#!/bin/bash

# Скрипт синхронизации файлов бекапа с удаленным хранилищем.
# Автор:  Олег Букатчук
# Версия: 1.9
# e-mail: oleg@bukatchuk.com

# Подключаем конфиг
source "../config.sh"

# Ставим утилиту sshfs
sudo apt-get install sshfs

# Подключаем FTP и монтируем его в локальную директорию.
sudo sshfs -o allow_root db_suite@ip_addr:${FTP_STORAGE} ${FTP_MOUNT_DIR}

# Синхронизируем директории
sudo rsync -zavP ${STORAGE} ${FTP_STORAGE}

# Удаляем архивы старше 7 дней...
sudo find ${FTP_STORAGE} -type f -mtime +7 -exec rm -f {} \;
