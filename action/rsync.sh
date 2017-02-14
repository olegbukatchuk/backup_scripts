#!/bin/bash

# Скрипт синхронизации файлов бекапа с удаленным хранилищем.
# Автор:  Олег Букатчук
# Версия: 1.9
# e-mail: oleg@bukatchuk.com

# Подключаем конфиг
source "../config.sh"

# Ставим утилиту sshfs
sudo apt-get install sshfs

# Монтируем в ${FTP_MOUNT_DIR}

allow_other

# Подключаем FTP и монтируем его в локальную директорию.
 curlftpfs -v -o iocharset=UTF-8 ${FTP_CONNECT} ${FTP_MOUNT_DIR}

# Синхронизируем директории
rsync -rltvvv --password-file=/root/secret . rsync://user@host::dest
