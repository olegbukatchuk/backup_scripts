#!/bin/bash

# Скрипт установки и настройки сервера MySQL
# Автор:  Олег Букатчук
# Версия: 0.2 alpha
# e-mail: oleg@bukatchuk.com

# Подключаем файл c настройками DB Suite
. ./db_suite.conf
<<<<<<< HEAD
=======

# Подключаем FTP и монтируем его в директорию $FTP
curlftpfs -v -o iocharset=UTF-8 ftp://user:password@ftp.domain.ru/ /mnt/ftp


>>>>>>> dev
