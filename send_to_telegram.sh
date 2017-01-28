#!/bin/bash

# Скрипт отправки сообщений в Telegram
# Автор:  Олег Букатчук
# Версия: 0.3
# e-mail: oleg@bukatchuk.com

# Подключаем файл c настройками DB Suite
. ./db_suite.conf

# 
function show_usage {
  echo "Usage $0 [message]"
  exit
}

# 
if [ $# -lt 1 ]
  then
    show_usage
fi

# Отправляем сообщение
telegram-cli -W -e "msg $to $1"
