#!/bin/bash

# Скрипт отправки сообщений в Telegram
# Автор:  Олег Букатчук
# Версия: 0.5
# e-mail: oleg@bukatchuk.com

# Подключаем файл c настройками DB Suite
. ../db_suite.conf

# Функция telegram-cli
function show_usage {
  echo "Usage $0 [message]"
  exit
}

# Условие отправки сообщения
if [ $# -lt 1 ]
  then
    show_usage
fi

# Отправляем сообщение
telegram-cli -W -e "msg $to $1"
