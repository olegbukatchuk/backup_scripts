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
sudo sshfs -o allow_root db_suite@188.40.108.7:${FTP_CONNECT} ${FTP_MOUNT_DIR}

# Синхронизируем директории
sudo rsync -zavP /data/backup/postgresql/ /data/ftp/db/postgresql/ssmp/artek

# Удаляем архивы старше 7 дней...
sudo find /data/ftp/db/postgresql/ssmp/artek -type f -mtime +7 -exec rm -f {} \;
