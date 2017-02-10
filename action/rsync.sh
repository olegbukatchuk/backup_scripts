#!/bin/bash

# Скрипт синхронизации файлов бекапа с удаленным хранилищем.
# Автор:  Олег Букатчук
# Версия: 1.9
# e-mail: oleg@bukatchuk.com

# Подключаем FTP и монтируем его в директорию $FTP
 curlftpfs -v -o iocharset=UTF-8 ftp://user:password@ftp.domain.ru/ /mnt/ftp

# Синхронизируем директории
rsync -rltvvv --password-file=/root/secret . rsync://user@host::dest
